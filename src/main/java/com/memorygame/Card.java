package com.memorygame;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Card {
    private String imageUrl;
    private int id;          // Unique identifier for matching pairs
    private boolean revealed; // If card is currently face-up
    private boolean found;   // If card is part of a matched pair

    public Card(String imageUrl, int id) {
        this.imageUrl = imageUrl;
        this.id = id;
        this.revealed = false;
        this.found = false;
    }

    // Generate a shuffled deck of 16 cards (8 pairs)
    public static List<Card> generateShuffledCards() {
        List<Card> cards = new ArrayList<>();
        String[] imageUrls = {
        	    // Animals
        		 "https://images.unsplash.com/photo-1543852786-1cf6624b9987?w=300&auto=format", // Cat
        		    "https://images.unsplash.com/photo-1561037404-61cd46aa615b?w=300&auto=format", // Dog
        		    "https://images.unsplash.com/photo-1555169062-013468b47731?w=300&auto=format", // Owl
        		    "https://images.unsplash.com/photo-1559253664-ca249d4608c6?w=300&auto=format", // Fox
        		    
        		    // Nature
        		    "https://images.unsplash.com/photo-1429087969512-1e85aab2683d?w=300&auto=format", // Tree
        		    "https://images.unsplash.com/photo-1502082553048-f009c37129b9?w=300&auto=format", // Flower
        		    "https://images.unsplash.com/photo-1414609245224-afa02bfb3fda?w=300&auto=format", // Waterfall
        		    "https://images.unsplash.com/photo-1465146344425-f00d5f5c8f07?w=300&auto=format", // Landscape
        	};
        // Create pairs
        for (int i = 0; i < imageUrls.length; i++) {
            cards.add(new Card(imageUrls[i], i));
            cards.add(new Card(imageUrls[i], i)); // Matching pair
        }

        Collections.shuffle(cards);
        return cards;
    }

    // Getters and Setters
    public String getImageUrl() {
        return imageUrl;
    }

    public int getId() {
        return id;
    }

    public boolean isRevealed() {
        return revealed;
    }

    public void setRevealed(boolean revealed) {
        this.revealed = revealed;
    }

    public boolean isFound() {
        return found;
    }

    public void setFound(boolean found) {
        this.found = found;
    }

    // Helper method to show card state
    @Override
    public String toString() {
        return String.format("Card{id=%d, revealed=%s, found=%s, image=%s}",
                id, revealed, found, imageUrl.substring(0, 20) + "...");
    }
}