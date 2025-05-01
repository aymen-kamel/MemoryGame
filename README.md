# MemoryGame
# 🧠 Memory Game - Java Web Application

[![Java](https://img.shields.io/badge/Java-17+-orange)](https://java.com)
[![Servlet](https://img.shields.io/badge/Jakarta_Servlet-5.0-blue)](https://jakarta.ee/specifications/servlet/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

<div align="center">
  <img src="https://i.imgur.com/JQh6WYl.png" width="400" alt="Game Screenshot">
</div>

## 🌟 Features / Fonctionnalités
- **Dynamic card grid** (Grille de cartes dynamique)
- **Flip animations** (Animations de retournement)
- **Session-based game state** (État sauvegardé en session)
- **Responsive design** (Adapté mobile/desktop)

## 🛠 Technologies / Technologies
| Component       | Technologie          |
|----------------|---------------------|
| Backend        | Java Servlets       |
| Frontend       | JSP + CSS3 Animations |
| State Management | HTTP Sessions      |
| Build Tool     | Maven               |

## 🚀 Setup / Installation
1. **Requirements**:
   - Java 17+
   - Apache Tomcat 10+
   - Maven 3.8+

2. **Run locally**:
```bash
mvn tomcat7:run
JetxDeMemoireJEE/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── memorygame/
│       │           ├── controllers/
│       │           │   ├── GameServlet.java
│       │           │   └── InitServlet.java
│       │           └── models/
│       │               └── Card.java
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── web.xml
│           │   └── lib/
│           ├── assets/
│           │   ├── css/
│           │   │   └── memory.css
│           │   └── img/
│           │       ├── card_1.png ... card_8.png
│           │       └── back.png
│           ├── game/
│           │   ├── board.jsp
│           │   └── end.jsp
│           └── index.jsp
└── pom.xml
