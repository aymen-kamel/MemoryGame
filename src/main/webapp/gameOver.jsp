<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Game Over</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f0f0f, #1f1f1f);
            color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background: #2c2c2c;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.05);
            max-width: 400px;
            width: 90%;
        }

        h1 {
            font-size: 2.5em;
            color: #ffcc00;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2em;
            margin: 15px 0;
        }

        .success {
            color: #00ff88;
            font-weight: bold;
        }

        .fail {
            color: #ff5555;
        }

        button {
            margin-top: 20px;
            padding: 12px 24px;
            background-color: #ffcc00;
            border: none;
            border-radius: 8px;
            color: #000;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #e6b800;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>🎮 Game Over</h1>
    <p>Merci d’avoir joué !</p>

    <% Boolean win = (Boolean) session.getAttribute("win");
       if (win != null && win) { %>
        <p class="success">⏰ Time's up! Better luck next time!</p>
    <% } else { %>
        <p class="fail">⏰ Time's up! Better luck next time!</p>
    <% } %>

    <form action="MemoryGameServlet" method="get">
        <input type="hidden" name="action" value="start" />
        <button type="submit">🔁 Rejouer</button>
    </form>
</div>
</body>
</html>
