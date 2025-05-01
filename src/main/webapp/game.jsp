<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.memorygame.Card" %>
<%
    List<Card> cards = (List<Card>) session.getAttribute("cards");
    Integer foundPairs = (Integer) session.getAttribute("foundPairs");
    boolean hideCards = session.getAttribute("hideCards") != null;
    boolean gameOver = session.getAttribute("gameOver") != null && (Boolean) session.getAttribute("gameOver");
    boolean win = session.getAttribute("win") != null && (Boolean) session.getAttribute("win");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Memory Game</title>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Urbanist:wght@400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #ff3366;
            --secondary: #00ccff;
            --dark: #16213e;
            --darker: #1a1a2e;
        }
        
        body {
            background: linear-gradient(135deg, var(--darker) 0%, var(--dark) 100%);
            font-family: 'Urbanist', sans-serif;
            color: white;
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 3rem;
            letter-spacing: 3px;
            text-transform: uppercase;
            color: white;
            text-shadow: 2px 2px 0 var(--primary), 
                        -2px -2px 0 var(--secondary);
            margin-bottom: 10px;
        }

        .game-container {
            position: relative;
            width: 100%;
            max-width: 800px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin: 0 auto;
        }

        .card {
            aspect-ratio: 1/1;
            perspective: 1000px;
            cursor: pointer;
        }

        .card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            transition: transform 0.6s;
            transform-style: preserve-3d;
        }

        .card.flipped .card-inner {
            transform: rotateY(180deg);
        }

        .card.matched {
            opacity: 0.6;
            cursor: default;
        }

        .card-face {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            overflow: hidden;
        }

        .card-front {
            transform: rotateY(180deg);
            background: white;
        }

        .card-front img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .card-back {
            background: linear-gradient(45deg, #333, #555);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2.5rem;
            color: white;
            font-weight: bold;
            border: 3px solid rgba(255,255,255,0.1);
        }

        .card-back::before {
            content: "?";
            text-shadow: 0 0 10px rgba(0,200,255,0.5);
        }

        .stats {
            margin: 20px 0;
            background: rgba(0,0,0,0.3);
            padding: 15px 30px;
            border-radius: 5px;
            font-size: 1.2rem;
            text-align: center;
            border-left: 3px solid var(--primary);
            border-right: 3px solid var(--secondary);
        }

        .stats p {
            margin: 0;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .game-over {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.8);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            z-index: 100;
            animation: fadeIn 0.5s;
        }

        .game-over h2 {
            font-size: 3rem;
            color: var(--primary);
            margin-bottom: 20px;
            text-shadow: 0 0 10px rgba(255,255,255,0.3);
        }

        .game-over p {
            font-size: 1.5rem;
            margin-bottom: 30px;
        }

        .btn {
            padding: 12px 30px;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            border: none;
            border-radius: 30px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            font-size: 1.1rem;
            transition: transform 0.3s;
        }

        .btn:hover {
            transform: translateY(-3px);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @media (max-width: 768px) {
            .grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 480px) {
            .grid {
                grid-template-columns: repeat(2, 1fr);
            }
            
            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <h1>Memory Game</h1>
    
    <div class="stats">
        <p>Pairs Found: <%= foundPairs != null ? foundPairs : 0 %> / 8</p>
    </div>
    
    <div class="game-container">
        <div class="grid">
            <% if (cards != null) { 
                for (int i = 0; i < cards.size(); i++) { 
                    Card card = cards.get(i);
                    boolean isRevealed = card.isRevealed();
                    boolean isMatched = card.isFound();
            %>
                <div class="card <%= isRevealed ? "flipped" : "" %> <%= isMatched ? "matched" : "" %>" 
                     onclick="handleCardClick(<%= i %>, <%= isMatched %>)">
                    <div class="card-inner">
                        <div class="card-face card-back"></div>
                        <div class="card-face card-front">
                            <img src="<%= card.getImageUrl() %>" alt="Card image">
                        </div>
                    </div>
                </div>
            <% } 
               } else { %>
                <p>No cards loaded. <a href="MemoryGameServlet?action=start">Start Game</a></p>
            <% } %>
        </div>
    </div>

    <% if (gameOver) { %>
        <div class="game-over">
            <h2><%= win ? "You Win!" : "Time's Up!" %></h2>
            <p>You found <%= foundPairs %> out of 8 pairs</p>
            <button class="btn" onclick="restartGame()">Play Again</button>
        </div>
    <% } %>

    <script>
        function handleCardClick(index, isMatched) {
            if (isMatched) return;
            
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = 'MemoryGameServlet';
            
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'cardIndex';
            input.value = index;
            
            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        }
        
        function restartGame() {
            window.location.href = 'MemoryGameServlet?action=start';
        }
        
        <% if (hideCards) { %>
            setTimeout(() => {
                window.location.href = 'MemoryGameServlet?action=hide';
            }, 1000);
        <% } %>
    </script>
</body>
</html>