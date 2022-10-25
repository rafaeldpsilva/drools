package org.engcia.model;

public class Conclusion extends Fact{
    public static final String CHARGE_BATTERY = "Charge Battery";
    public static final String SELL_TO_COMMUNITY = "Sell to the community market";
    public static final String SEND_GRID = "Send to the grid";
    public static final String USE_BATTERY = "Use Battery's Energy";
    public static final String BUY_EXTERNAL = "Buy from external market";
    public static final String SELL_EXTERNAL = "Sell to the external market";
    public static final String BALANCE_R = "Balance R";

    private String description;

    public Conclusion(String description) {
        super();
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public String toString() {
        return "Decision: " + description;
    }
}
