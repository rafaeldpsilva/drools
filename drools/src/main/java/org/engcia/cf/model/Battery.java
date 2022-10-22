package org.engcia.cf.model;

public class Battery {

    private double charge;

    public Battery(double charge) {
        this.charge = charge;
    }

    public double getCharge(){
        return this.charge;
    }

    public boolean isSufficientlyCharged(){
        return this.charge >= 0.7;
    }
}
