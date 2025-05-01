<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memory Game - Accueil</title>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Urbanist:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Urban Style for the homepage */
        body.index-page {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            font-family: 'Urbanist', 'Bebas Neue', Arial, sans-serif;
            overflow: hidden;
        }

        /* Graffiti-style background pattern */
        body.index-page::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 10% 20%, rgba(255, 0, 100, 0.05) 0%, transparent 20%),
                radial-gradient(circle at 90% 80%, rgba(0, 200, 255, 0.05) 0%, transparent 20%),
                radial-gradient(circle at 30% 60%, rgba(255, 255, 0, 0.05) 0%, transparent 20%);
            z-index: 0;
        }

        .container {
            text-align: center;
            background: rgba(10, 10, 20, 0.9);
            padding: 40px 50px;
            border-radius: 5px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
            position: relative;
            z-index: 1;
            border-left: 3px solid #ff3366;
            border-right: 3px solid #00ccff;
            transform: skewX(-2deg);
            max-width: 80%;
        }

        .container h1 {
            color: #fff;
            font-size: 2.5rem;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 2px 2px 0px #ff3366, 
                        -2px -2px 0px #00ccff;
            transform: skewX(2deg);
        }

        form {
            transform: skewX(2deg);
        }

        .start-button {
            background: linear-gradient(45deg, #ff3366 0%, #00ccff 100%);
            color: white;
            border: none;
            padding: 16px 40px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 0;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            border-bottom: 3px solid #fff;
            font-family: 'Bebas Neue', sans-serif;
        }

        .start-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            background: linear-gradient(45deg, #00ccff 0%, #ff3366 100%);
        }

        .start-button:active {
            transform: translateY(1px);
        }

        /* Urban decoration elements */
        .container::after {
            content: "×";
            position: absolute;
            color: rgba(255, 255, 255, 0.1);
            font-size: 10rem;
            right: 20px;
            top: -30px;
            z-index: -1;
            font-weight: bold;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 30px;
                max-width: 90%;
            }
            
            .container h1 {
                font-size: 1.8rem;
            }
            
            .start-button {
                padding: 12px 30px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body class="index-page">
    <div class="container">
        <h1>Bienvenue dans le Memory Game 🎴</h1>
        <form action="servlet/InitServlet" method="get">
            <button type="submit" class="start-button">Commencer le Jeu</button>
        </form>
    </div>
</body>
</html>