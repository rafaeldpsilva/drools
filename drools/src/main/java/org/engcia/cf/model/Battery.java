package org.engcia.cf.model;

public class Battery {

    private double currentCharge;
    private double minimalCharge;
    private double securityCharge;

    public Battery(double currentCharge, double minimalCharge, double securityCharge) {
        this.currentCharge = currentCharge;
        this.minimalCharge = minimalCharge;
        this.securityCharge = securityCharge;
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

    public double getSecurityCharge() {
        return securityCharge;
    }

    public void setSecurityCharge(double securityCharge) {
        this.securityCharge = securityCharge;
    }

    public boolean isSufficientlyCharged(){
        return this.currentCharge >= 0.7;
    }
}
