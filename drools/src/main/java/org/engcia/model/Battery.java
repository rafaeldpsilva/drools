package org.engcia.model;

public class Battery {

    private double currentCharge;
    private double minimalCharge;
    private double threshold;

    public Battery(double currentCharge, double minimalCharge) {
        this.currentCharge = currentCharge;
        this.minimalCharge = minimalCharge;
    }
    public Battery(double currentCharge, double minimalCharge, double threshold) {
        this.currentCharge = currentCharge;
        this.minimalCharge = minimalCharge;
        this.threshold = threshold;
    }

    public double getCurrentCharge() {
        return currentCharge;
    }

    public void setCurrentCharge(double currentCharge) {
        this.currentCharge = currentCharge;
    }

    public double getMinimalCharge() {
        return minimalCharge;
    }

    public void setMinimalCharge(double minimalCharge) {
        this.minimalCharge = minimalCharge;
    }

    public double getThreshold() {
        return this.threshold;
    }

    public void setThreshold(double threshold) {
        this.threshold = threshold;
    }

    public boolean isSufficientlyCharged(){
        return this.currentCharge >= this.threshold;
    }
}
