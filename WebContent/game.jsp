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
    <link rel="stylesheet" href="style.css">
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
        <% for (int i = 0; i < cards.size(); i++) { %>
            <form method="post" action="<%= request.getContextPath() %>/test">
                <input type="hidden" name="cardIndex" value="<%= i %>"/>
                <button type="submit" class="card-button">
                    <% if (cards.get(i).isRevealed() || cards.get(i).isFound()) { %>
                        <img src="<%= request.getContextPath() %>/<%= cards.get(i).getImage() %>" alt="Card <%= cards.get(i).getId() %>" />
                    <% } else { %>
                        <img src="<%= request.getContextPath() %>/images/back.png" alt="Card Back" />
                    <% } %>
                </button>
            </form>
        <% } %>
    </div>
    <div class="stats">
        <p>Pairs found: <%= session.getAttribute("foundPairs") %> / 8</p>
    </div>
</body>
<% String message = (String) session.getAttribute("message");
   if (message != null) { %>
   <div style="color: green; font-weight: bold; font-size: 20px;">
       <%= message %>
   </div>
<% session.removeAttribute("message"); } %>

</html>
