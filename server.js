const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const session = require('express-session');
const bcrypt = require('bcrypt');


const app = express();
const port = 3000;

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public'))); // Serve static files
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(session({
    secret: 'your-secret-key',
    resave: false,
    saveUninitialized: true,
}));

// Database connection
const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "123456",
    //database: "culture"
});

connection.connect((err) => {
    if (err) throw err;
    console.log('MySQL Connected...');
});

// Middleware เพื่อทำให้ข้อมูล user เข้าถึงได้ในทุก view
app.use((req, res, next) => {
    res.locals.user = req.session.user || null; // ถ้าไม่มีผู้ใช้ในเซสชั่น ให้กำหนดเป็น null
    next();
});

// Middleware ตรวจสอบการล็อกอิน
function isAuthenticated(req, res, next) {
    if (req.session.user) {
        next(); // ถ้า user อยู่ในเซสชั่น ให้ทำงานต่อไป
    } else {
        res.redirect('/login'); // ถ้าไม่ได้อยู่ในเซสชั่น ให้ไปหน้า login
    }
}

// Routes

app.get('/', (req, res) => {
    res.render('home');
});

// ตัวอย่างเส้นทางหน้าแรก (Home)
app.get('/', (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login'); // ถ้ายังไม่ได้ล็อกอิน, ให้ไปหน้าเข้าสู่ระบบ
    }
    res.render('home', { user: req.session.user });
});

// แสดงประเพณีตามภูมิภาค
// แสดงข้อมูลวัฒนธรรมและประเพณีสำหรับภาคใต้ในหน้าแรก
app.get('/zone', (req, res) => {
    const query = 'SELECT * FROM CulturalTraditions';

    connection.query(query, (err, results) => {
        if (err) {
            console.error("Error fetching data:", err);
            return res.status(500).send("Error fetching data");
        }

        // แยกข้อมูลตามภูมิภาค
        const traditionsByRegion = {
            south: results.filter(tradition => tradition.region === 'south'),
            central: results.filter(tradition => tradition.region === 'central'),
            eastern: results.filter(tradition => tradition.region === 'east'),
            northern: results.filter(tradition => tradition.region === 'north')
        };

        // ส่งข้อมูลของทุกภาคไปที่ zone/index.ejs
        res.render('zone/index', { traditionsByRegion });
    });
});

// ตัวอย่างเส้นทางสำหรับภาคกลาง ภาคอีสาน และภาคเหนือ
app.get('/zone/:region', (req, res) => {
    const { region } = req.params;
    const regionName = {
        central: "ภาคกลาง",
        eastern: "ภาคอีสาน",
        northern: "ภาคเหนือ",
        southern: "ภาคใต้"
    }[region] || "ภูมิภาคอื่น"; // ให้ชื่อภาษาไทยสำหรับภูมิภาค

    const query = 'SELECT * FROM CulturalTraditions WHERE region = ?';

    connection.query(query, [region], (err, results) => {
        if (err) {
            console.error("Error fetching data:", err);
            return res.status(500).send("Error fetching data");
        }
        res.render('zone/index', { traditions: results, region: regionName });
    });
});

app.get('/zone/:region/details/:id', (req, res) => {
    const { id } = req.params;
    const query = 'SELECT * FROM CulturalTraditions WHERE id = ?';

    connection.query(query, [id], (err, result) => {
        if (err) {
            console.error("Error fetching details:", err);
            return res.status(500).send("Error fetching details");
        }
        if (result.length > 0) {
            res.render('zone/details', { tradition: result[0] });
        } else {
            res.status(404).send('Tradition not found');
        }
    });
});

// เส้นทางเพิ่มข้อมูลประเพณีใหม่
app.get('/zone/:region/add', isAuthenticated, (req, res) => {
    const { region } = req.params;
    const regionMap = {
        south: "ภาคใต้",
        central: "ภาคกลาง",
        eastern: "ภาคอีสาน",
        north: "ภาคเหนือ"
    };
    const regionThai = regionMap[region] || "ภูมิภาคอื่น";
    
    res.render('zone/add-tradition', { region: regionThai });
});

// เพิ่มข้อมูลประเพณีใหม่พร้อมภูมิภาคที่เลือก
app.post('/zone/add', isAuthenticated, (req, res) => {
    const { region, name, description, details, image_url } = req.body;
    const query = 'INSERT INTO CulturalTraditions (region, name, description, details, image_url) VALUES (?, ?, ?, ?, ?)';

    connection.query(query, [region, name, description, details, image_url], (err) => {
        if (err) {
            console.error("Error adding data:", err);
            return res.status(500).send("Error adding data");
        }
        // ย้อนกลับไปยังหน้า `/zone/{region}` หลังจากบันทึกข้อมูลสำเร็จ
        res.redirect(`/zone/${region}`);
    });
});

// แก้ไขข้อมูลประเพณี
app.get('/zone/:region/edit/:id', isAuthenticated, (req, res) => {
    const { region, id } = req.params;
    const query = 'SELECT * FROM CulturalTraditions WHERE id = ?';

    connection.query(query, [id], (err, result) => {
        if (err) {
            console.error("Error fetching data:", err);
            return res.status(500).send("Error fetching data");
        }
        res.render('zone/edit-tradition', { tradition: result[0], region });
    });
});

app.post('/zone/:region/edit/:id', isAuthenticated, (req, res) => {
    const { region, id } = req.params;
    const { name, description, details, image_url } = req.body;
    const query = 'UPDATE CulturalTraditions SET name = ?, description = ?, details = ?, image_url = ? WHERE id = ?';

    connection.query(query, [name, description, details, image_url, id], (err) => {
        if (err) {
            console.error("Error updating data:", err);
            return res.status(500).send("Error updating data");
        }
        res.redirect(`/zone/${region}`);
    });
});

// ลบข้อมูลประเพณี
app.post('/zone/:region/delete/:id', isAuthenticated, (req, res) => {
    const { region, id } = req.params;
    const query = 'DELETE FROM CulturalTraditions WHERE id = ?';

    connection.query(query, [id], (err) => {
        if (err) {
            console.error("Error deleting data:", err);
            return res.status(500).send("Error deleting data");
        }
        res.redirect(`/zone/${region}`);
    });
});

// เส้นทางสำหรับการแสดงหน้าเข้าสู่ระบบ
app.get('/login', (req, res) => {
    res.render('login'); // แสดงไฟล์ login.ejs
});

// เส้นทางสำหรับการแสดงหน้าเข้าสู่ระบบ
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    const sql = 'SELECT * FROM users WHERE email = ?';
    connection.query(sql, [email], async (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send('เกิดข้อผิดพลาดในระบบ');
        }

        if (results.length > 0) {
            const user = results[0];

            // ตรวจสอบรหัสผ่านที่กรอกกับรหัสผ่านที่ถูกแฮชในฐานข้อมูล
            const passwordMatch = await bcrypt.compare(password, user.password);
            if (passwordMatch) {
                req.session.user = user; // กำหนดผู้ใช้เข้าสู่ session
                res.redirect('/'); // ไปหน้าแรกหลังจากล็อกอินสำเร็จ
            } else {
                res.render('login', { error: 'รหัสผ่านไม่ถูกต้อง' });
            }
        } else {
            res.render('login', { error: 'ไม่พบผู้ใช้นี้' });
        }
    });
});

// เส้นทางสำหรับการแสดงหน้าสมัครสมาชิก
app.get('/register', (req, res) => {
    res.render('register'); // แสดงไฟล์ register.ejs
});

// เส้นทางสำหรับการสมัครสมาชิก
app.post('/register', async (req, res) => {
    const { username, lastname,password, email, phone } = req.body;

    // ตรวจสอบว่าผู้ใช้มีอยู่แล้วหรือไม่
    const checkUserQuery = 'SELECT * FROM users WHERE username = ? OR email = ?';
    connection.query(checkUserQuery, [username, email], async (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send('เกิดข้อผิดพลาดในระบบ');
        }

        if (results.length > 0) {
            return res.status(400).send('ชื่อผู้ใช้หรืออีเมลนี้มีอยู่แล้ว');
        }

        // เข้ารหัสรหัสผ่านด้วย bcrypt
        const hashedPassword = await bcrypt.hash(password, 10);

        // บันทึกผู้ใช้ใหม่ลงในฐานข้อมูล
        const insertUserQuery = 'INSERT INTO users (username,lastname, password, email, phone) VALUES (?, ?, ?, ?, ?)';
        connection.query(insertUserQuery, [username, lastname, hashedPassword, email, phone], (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).send('เกิดข้อผิดพลาดในการสมัครสมาชิก');
            }
            res.redirect('/login'); // ไปยังหน้าเข้าสู่ระบบหลังจากสมัครเสร็จ
        });
    });
});

// เส้นทางสำหรับการออกจากระบบ
app.post('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            console.error(err);
            return res.status(500).send('เกิดข้อผิดพลาดในการออกจากระบบ');
        }
        res.redirect('/'); // ไปยังหน้าเข้าสู่ระบบหลังจากออกจากระบบ
    });
});

// เส้นทางแสดงฟอร์มติดต่อเรา
app.get('/contact', (req, res) => {
    const successMessage = req.session.successMessage;
    req.session.successMessage = null; // ล้างข้อความหลังแสดง
    res.render('contact', { contactTypes: ['--ประเภทการติดต่อ--', 'ทั่วไป', 'คำถามเกี่ยวกับบริการ', 'ความคิดเห็น'], successMessage });
});

// เส้นทางสำหรับบันทึกข้อมูลจากฟอร์มติดต่อเรา
app.post('/contact', (req, res) => {
    const { contactType, fullname, email, phone, message } = req.body;
    const query = 'INSERT INTO ContactMessages (contactType, fullname, email, phone, message) VALUES (?, ?, ?, ?, ?)';

    connection.query(query, [contactType, fullname, email, phone, message], (err, result) => {
        if (err) {
            console.error("Error inserting contact message:", err);
            return res.status(500).json({ success: false, message: "Error sending message" });
        }
        req.session.successMessage = 'ส่งความคิดเห็นสำเร็จ';
        res.redirect('/contact');
    });
});


// เส้นทางสำหรับแสดงรายการสถานที่ทั้งหมด
app.get('/locations', (req, res) => {
    const query = 'SELECT * FROM AncientRemains';
    
    connection.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching locations:', err);
            return res.status(500).send('Error fetching locations');
        }
        res.render('locations/locations', { locations: results });
    });
});

// เส้นทางแสดงฟอร์มเพิ่มสถานที่ใหม่
app.get('/locations/add-location', isAuthenticated, (req, res) => {
    console.log("Accessed /locations/add-location");
    res.render('locations/add-location');
});


// เส้นทางสำหรับบันทึกข้อมูลจากฟอร์ม
app.post('/locations/add-location', isAuthenticated, (req, res) => {
    const { name, description, image_url, location } = req.body;
    const query = 'INSERT INTO AncientRemains (name, description, image_url, location) VALUES (?, ?, ?, ?)';

    connection.query(query, [name, description, image_url, location], (err, result) => {
        if (err) {
            console.error("Error inserting data:", err);
            return res.status(500).json({ success: false, message: "Error adding location" });
        }
        res.redirect('/locations');
    });
});


// เส้นทางแสดงรายละเอียดของสถานที่ตาม id
app.get('/locations/:id',(req, res) => {
    const arId = parseInt(req.params.id, 10);

    // ตรวจสอบว่า id เป็นตัวเลข
    if (isNaN(arId)) {
        return res.status(404).send('Ancient Remain not found');
    }

    const query = 'SELECT * FROM AncientRemains WHERE id = ?';
    connection.query(query, [arId], (err, result) => {
        if (err) {
            console.error('Error fetching data:', err);
            return res.status(500).send('Error fetching data');
        }

        if (result.length > 0) {
            res.render('locations/AncientRemains', { arId: result[0] });
        } else {
            res.status(404).send('Ancient Remain not found');
        }
    });
});

// ฟอร์มสำหรับแก้ไขสถานที่
app.get('/locations/edit/:id', isAuthenticated, (req, res) => {
    const locationId = req.params.id;
    const query = 'SELECT * FROM AncientRemains WHERE id = ?';

    connection.query(query, [locationId], (err, result) => {
        if (err) {
            console.error("Error fetching data:", err);
            return res.status(500).send('Error fetching data');
        }
        if (result.length > 0) {
            res.render('locations/AncientRemains', { location: result[0] });
        } else {
            res.status(404).send('Location not found');
        }
    });
});


app.post('/locations/edit/:id', isAuthenticated, (req, res) => {
    const locationId = req.params.id;
    const { name, description, image_url, location } = req.body;
    const query = 'UPDATE AncientRemains SET name = ?, description = ?, image_url = ?, location = ? WHERE id = ?';

    connection.query(query, [name, description, image_url, location, locationId], (err, result) => {
        if (err) {
            console.error("Error updating data:", err);
            return res.status(500).json({ success: false, message: "Error updating location" });
        }
        res.redirect(`/locations/${locationId}`);
    });
});



// การลบสถานที่โดยใช้ id
app.post('/locations/delete/:id', isAuthenticated, (req, res) => {
    const locationId = req.params.id;
    const query = 'DELETE FROM AncientRemains WHERE id = ?';

    connection.query(query, [locationId], (err, result) => {
        if (err) {
            console.error("Error deleting data:", err);
            return res.status(500).json({ success: false, message: "Error deleting location" });
        }
        res.redirect('/locations');
    });
});



app.post('/api/insert', (req, res) => {
    const { firstname, lastname } = req.body;
    const query = "INSERT INTO users(firstname, lastname) VALUES(?,?)";
    connection.query(query, [firstname, lastname], (err, result) => {
        if (err) {
            console.error("Error inserting data: ", err);
            res.status(500).json({ error: "Internal Server Error" });
            return;
        }
        res.json(result);
    });
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
