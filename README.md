# Turnkey Employability & Recruitment Web Portal Template

[![PHP](https://img.shields.io/badge/PHP-8.1%20%7C%208.2-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net)
[![MariaDB](https://img.shields.io/badge/MariaDB-10.11-003545?style=for-the-badge&logo=mariadb&logoColor=white)](https://mariadb.org)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-Responsive-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com)
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

A complete, production-proven turnkey recruitment and employability portal template engineered for **job placement agencies**, **human resource departments**, **vocational training institutes**, and **specialized talent hubs**. Featuring modular candidate profile builders, educational and work history tracking, job vacancy posting, and applicant evaluation tools.

---

## 🌟 Key Highlights & Template Features

- **Candidate Resume Builder**:
  - Personal identification and demographic data entry (`completarD.php`, `editarD.php`).
  - Educational history and degrees with certificate upload handling (`AddEdu.php`, `crudedu.php`).
  - Work experience timeline with employer references and job titles (`AddExp.php`, `crudexp.php`).
  - Professional reference verification logs (`AddRef.php`, `crudref.php`).
- **Employer Vacancy & Recruitment Board**:
  - Vacancy creation engine with salary ranges, requirements, and job locations (`AddVac.php`, `rVacante.php`).
  - Applicant review stream and status evaluation (`eVacante.php`, `EditVac.php`).
- **Dual Connection Resolver**: Object-oriented PDO abstraction layer (`lib/PDO.php`) combined with legacy procedural helpers (`assets/include/funciones_fempower.php`), fully bound to environment variables.
- **Turnkey Database Seed**: Complete relational database schema (`BD.sql`) pre-loaded with lookup tables, catalogs, and initial role configurations.

---

## 🏗️ Architecture & Component Topology

```
+-------------------------------------------------------------+
|                     Client Browser                          |
+-------------------------------------------------------------+
                              | HTTP (Port 8089)
                              v
+-------------------------------------------------------------+
|                 Apache Web Server (PHP 8.1)                 |
|  - Candidate Resume & Experience Hub (AddEdu, AddExp)       |
|  - Recruiter Vacancy Board (AddVac, eVacante)               |
|  - Data Access Layer (lib/PDO.php & funciones_fempower.php) |
+-------------------------------------------------------------+
                              | TCP / MySQL protocol
                              v
+-------------------------------------------------------------+
|              Database Service (MariaDB 10.11)               |
|  - Schema: puav_app                                         |
|  - Auto-initialization from BD.sql on container startup     |
+-------------------------------------------------------------+
```

---

## 🚀 Quick Start with Docker Compose

Run the employability portal locally in seconds:

### 1. Clone the Repository
```bash
git clone git@github.com-personal:KevinAndrey96/puav-fempower.git
cd puav-fempower
```

### 2. Launch the Stack
```bash
docker compose up -d
```

### 3. Access the Application
- **Portal URL**: [http://localhost:8089](http://localhost:8089)
- **Registration**: [http://localhost:8089/registro.php](http://localhost:8089/registro.php)
- **Login**: [http://localhost:8089/index.php](http://localhost:8089/index.php)

---

## 💻 Manual Deployment (LAMP / cPanel / Shared Hosting)

1. Upload all repository files to your server web root (`public_html/` or `/var/www/html/`).
2. Create a MySQL database and user in your control panel.
3. Import the included database backup `BD.sql`.
4. Configure database settings in `lib/PDO.php` and `assets/include/funciones_fempower.php` or export environment variables:
   ```ini
   DB_HOST="localhost"
   DB_NAME="puav_app"
   DB_USER="your_db_user"
   DB_PASSWORD="your_db_password"
   ```
5. Test candidate registration and vacancy creation flows.

---

## 🛡️ License

Maintained for developer portfolio demonstration and production turnkey website deployment.
