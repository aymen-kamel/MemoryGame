<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Game Over</title>
</head>
<body>
    <h1>Game Over</h1>
    <p>Merci d’avoir joué !</p>

    <% Boolean win = (Boolean) session.getAttribute("win");
       if (win != null && win) { %>
        <p style="color: green; font-weight: bold;">🎉 Great job! You won!</p>
    <% } else { %>
        <p style="color: red;">⏰ Time's up! Better luck next time!</p>
    <% } %>

    <form action="MemoryGameServlet" method="get">
        <input type="hidden" name="action" value="start" />
        <button type="submit">Rejouer</button>
    </form>
</body>
</html>
