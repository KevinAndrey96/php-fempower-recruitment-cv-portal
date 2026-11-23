# Turnkey Employability & Recruitment Web Portal Template (php-fempower-recruitment-cv-portal)

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
- **Dual Connection Resolver**: Object-oriented PDO abstraction layer (`lib/PDO.php`) combined with legacy DAO helpers (`assets/include/DAO_usuarios.php`, `credenciales.php`), fully bound to environment variables.
- **Turnkey Database Seed**: Complete relational database schema (`BD.sql`) pre-loaded with lookup tables, catalogs, initial role configurations, and pre-seeded demo accounts.

---

## 🏗️ Architecture & Component Topology

```
+-------------------------------------------------------------+
|                     Client Browser                          |
+-------------------------------------------------------------+
              | HTTP (Port 8090)           | HTTP (Port 8091)
              v                            v
+-----------------------------+   +---------------------------+
| Apache Web Server (PHP 8.1) |   |        phpMyAdmin         |
| - Resume & CV Builders      |   |   (Web Database Manager)  |
| - Vacancy Board & Matching  |   +---------------------------+
| - DAO Layer (PDO & MySQLi)  |                |
+-----------------------------+                |
              | TCP (Port 3306)                |
              +-----------------+--------------+
                                |
                                v
+-------------------------------------------------------------+
|              Database Service (MariaDB 10.11)               |
| - Schema: puav_app                                          |
| - Auto-seeded tables: usuarios, vacantes, codigos, oferentes|
+-------------------------------------------------------------+
```

---

## 🚀 Quick Start with Docker Compose

Run the employability portal locally in seconds:

### 1. Clone the Repository
```bash
git clone git@github.com-personal:KevinAndrey96/php-fempower-recruitment-cv-portal.git
cd php-fempower-recruitment-cv-portal
```

### 2. Configure Environment (Optional)
```bash
cp .env.example .env
```

### 3. Launch the Stack
```bash
docker compose up -d
```

### 4. Access the Application
| Service | URL | Default Credentials | Description |
| :--- | :--- | :--- | :--- |
| **Portal Principal** | [http://localhost:8090](http://localhost:8090) | N/A | Acceso al portal y login |
| **Cuenta Empresa (Demandante)** | [http://localhost:8090/index.php](http://localhost:8090/index.php) | `empresa` / `admin123` (Seleccionar: Empresa) | Publicación y gestión de vacantes |
| **Cuenta Candidata (Oferente)** | [http://localhost:8090/index.php](http://localhost:8090/index.php) | `candidata` / `admin123` (Seleccionar: Persona) | Hoja de vida, experiencia y estudios |
| **Cuenta Administrador** | [http://localhost:8090/index.php](http://localhost:8090/index.php) | `admin` / `admin123` | Supervisión general del sistema |
| **phpMyAdmin** | [http://localhost:8091](http://localhost:8091) | User: `puav_user` / `puav_password` | Gestor de base de datos web |

---

## 💻 Manual Deployment (LAMP / cPanel / Shared Hosting)

1. Upload all repository files to your server web root (`public_html/` or `/var/www/html/`).
2. Create a MySQL database and user in your control panel.
3. Import the included database backup `BD.sql`.
4. Configure database settings in `lib/PDO.php`, `assets/include/credenciales.php`, and `assets/include/funciones_fempower.php` or export environment variables:
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
