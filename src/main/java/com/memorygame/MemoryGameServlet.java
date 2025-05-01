package com.memorygame;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

@WebServlet("/MemoryGameServlet")
public class MemoryGameServlet extends HttpServlet {
    private static final long GAME_DURATION = 120000; // 2 minutes en millisecondes
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        System.out.println("hello");

        if ("hide".equals(action)) {
            List<Card> cards = (List<Card>) session.getAttribute("cards");
            if (cards != null) {
                for (Card card : cards) {
                    if (!card.isFound()) {
                        card.setRevealed(false);
                    }
                }
                session.setAttribute("cards", cards);
            }
            session.removeAttribute("hideCards");
        } else if ("start".equals(action)) {
            // Initialisation du jeu
            List<Card> cards = Card.generateShuffledCards();
            session.setAttribute("cards", cards);
            session.setAttribute("foundPairs", 0);
            session.setAttribute("gameStarted", true);
            session.setAttribute("gameOver", false);
            
            // Démarrer le timer
            Timer timer = new Timer();
            timer.schedule(new TimerTask() {
                @Override
                public void run() {
                    session.setAttribute("gameOver", true);
                    timer.cancel();
                }
            }, GAME_DURATION);
        }
        request.getRequestDispatcher("/game.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Vérifier si le jeu est terminé
        if (session.getAttribute("gameOver") != null && (boolean) session.getAttribute("gameOver")) {
            request.getRequestDispatcher("/gameOver.jsp").forward(request, response);
            return;
        }
        
        // Vérifier que les cartes existent
        List<Card> cards = (List<Card>) session.getAttribute("cards");
        if (cards == null) {
            // Si pas de cartes, redémarrer le jeu
            response.sendRedirect(request.getContextPath() + "/MemoryGameServlet?action=start");
            return;
        }
        
        try {
            int index = Integer.parseInt(request.getParameter("cardIndex"));
            Integer firstCardIndex = (Integer) session.getAttribute("firstCardIndex");
            
            if (firstCardIndex == null) {
                session.setAttribute("firstCardIndex", index);
                cards.get(index).setRevealed(true);
            } else {
                int secondCardIndex = index;
                cards.get(secondCardIndex).setRevealed(true);

                if (cards.get(firstCardIndex).getId() == cards.get(secondCardIndex).getId()) {
                    cards.get(firstCardIndex).setFound(true);
                    cards.get(secondCardIndex).setFound(true);
                    int foundPairs = (int) session.getAttribute("foundPairs") + 1;
                    session.setAttribute("foundPairs", foundPairs);
                    
                    // Vérifier si toutes les paires ont été trouvées
                    if (foundPairs == cards.size() / 2) {
                        session.setAttribute("gameOver", true);
                        session.setAttribute("win", true);

                        // ✅ Show message when score is 8 (8 pairs)
                        if (foundPairs == 8) {
                            session.setAttribute("message", "🎉 Great job! You found all pairs!");
                        }
                    }

                } else {
                    session.setAttribute("hideCards", true);
                }
                session.removeAttribute("firstCardIndex");
            }

            session.setAttribute("cards", cards);
        } catch (NumberFormatException | IndexOutOfBoundsException e) {
            // Gestion des erreurs
            session.setAttribute("error", "Invalid card selection");
        }
        
        request.getRequestDispatcher("/game.jsp").forward(request, response);
    }
}