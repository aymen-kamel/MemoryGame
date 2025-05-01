<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.memorygame.Card" %>
<%
    List<Card> cards = (List<Card>) session.getAttribute("cards");
    boolean hideCards = session.getAttribute("hideCards") != null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Memory Game</title>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Urbanist:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Urban Game Style */
        body {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
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
            text-shadow: 2px 2px 0 #ff3366, 
                        -2px -2px 0 #00ccff;
            margin-bottom: 30px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            max-width: 600px;
            margin: 0 auto;
        }

        .card-button {
            background: none;
            border: none;
            padding: 0;
            cursor: pointer;
            perspective: 1000px;
            width: 100%;
            aspect-ratio: 1/1;
            transition: transform 0.3s ease;
        }

        .card-button:hover {
            transform: translateY(-5px);
        }

        .card-button img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
            border: 2px solid rgba(255,255,255,0.1);
            transition: all 0.3s ease;
        }

        .card-button:hover img {
            box-shadow: 0 8px 15px rgba(0,0,0,0.4);
            border-color: rgba(255,255,255,0.3);
        }

        .stats {
            margin-top: 30px;
            background: rgba(0,0,0,0.3);
            padding: 15px 30px;
            border-radius: 5px;
            font-size: 1.2rem;
            text-align: center;
            border-left: 3px solid #ff3366;
            border-right: 3px solid #00ccff;
        }

        .stats p {
            margin: 0;
            font-weight: bold;
            letter-spacing: 1px;
        }

        /* Urban decoration elements */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 30%, rgba(255, 0, 100, 0.05) 0%, transparent 20%),
                radial-gradient(circle at 80% 70%, rgba(0, 200, 255, 0.05) 0%, transparent 20%);
            pointer-events: none;
            z-index: -1;
        }

        /* Flip animation for cards */
        @keyframes flipIn {
            0% { transform: rotateY(90deg); }
            100% { transform: rotateY(0deg); }
        }

        /* Card back design */
        .card-back {
            background: linear-gradient(45deg, #333, #555);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card-back::before {
            content: "?";
            color: white;
            font-size: 2rem;
            font-weight: bold;
            text-shadow: 0 0 10px rgba(0,200,255,0.5);
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .grid {
                grid-template-columns: repeat(3, 1fr);
                gap: 10px;
            }
            
            h1 {
                font-size: 2rem;
            }
        }

        @media (max-width: 400px) {
            .grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
    <script>
        function hideCards() {
            setTimeout(function() {
                window.location.href = '<%= request.getContextPath() %>/test?action=hide';
            }, 1000);
        }
        
        <% if (hideCards) { %>
            hideCards();
        <% } %>
    </script>
</head>
<body>
    <h1>Memory Game</h1>
    <div class="grid">
        <!-- Card 1 - Graffiti Art -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="0"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1547354141-c3c1f1c47d0e?w=300&auto=format" alt="Graffiti Art">
            </button>
        </form>
        
        <!-- Card 2 - Skateboard -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="1"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1572776685600-aca8c3456337?w=300&auto=format" alt="Skateboard">
            </button>
        </form>
        
        <!-- Card 3 - Urban Landscape -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="2"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=300&auto=format" alt="Cityscape">
            </button>
        </form>
        
        <!-- Card 4 - Street Fashion -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="3"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1483181957632-8bda974cbc91?w=300&auto=format" alt="Street Fashion">
            </button>
        </form>
        
        <!-- Card 5 - Basketball -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="4"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1546519638-68e109498ffc?w=300&auto=format" alt="Basketball">
            </button>
        </form>
        
        <!-- Card 6 - Headphones -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="5"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=300&auto=format" alt="Headphones">
            </button>
        </form>
        
        <!-- Card 7 - Train Tracks -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="6"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1519817650390-64a93db51149?w=300&auto=format" alt="Train Tracks">
            </button>
        </form>
        
        <!-- Card 8 - Spray Can -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="7"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1619441207978-3d326c46e2c9?w=300&auto=format" alt="Spray Can">
            </button>
        </form>
        
        <!-- Duplicate cards for matching pairs -->
        <!-- Graffiti Art -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="8"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1547354141-c3c1f1c47d0e?w=300&auto=format" alt="Graffiti Art">
            </button>
        </form>
        
        <!-- Skateboard -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="9"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1572776685600-aca8c3456337?w=300&auto=format" alt="Skateboard">
            </button>
        </form>
        
        <!-- Urban Landscape -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="10"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=300&auto=format" alt="Cityscape">
            </button>
        </form>
        
        <!-- Street Fashion -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="11"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1483181957632-8bda974cbc91?w=300&auto=format" alt="Street Fashion">
            </button>
        </form>
        
        <!-- Basketball -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="12"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1546519638-68e109498ffc?w=300&auto=format" alt="Basketball">
            </button>
        </form>
        
        <!-- Headphones -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="13"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=300&auto=format" alt="Headphones">
            </button>
        </form>
        
        <!-- Train Tracks -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="14"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1519817650390-64a93db51149?w=300&auto=format" alt="Train Tracks">
            </button>
        </form>
        
        <!-- Spray Can -->
        <form method="post" action="<%= request.getContextPath() %>/test">
            <input type="hidden" name="cardIndex" value="15"/>
            <button type="submit" class="card-button">
                <img src="https://images.unsplash.com/photo-1619441207978-3d326c46e2c9?w=300&auto=format" alt="Spray Can">
            </button>
        </form>
    </div>
    <div class="stats">
        <p>Pairs found: <%= session.getAttribute("foundPairs") %> / 8</p>
    </div>
</body>
</html>
