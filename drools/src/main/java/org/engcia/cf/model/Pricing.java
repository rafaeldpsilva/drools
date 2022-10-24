package org.engcia.cf.model;

public class Pricing {
    private Double energyPrice;

    public Pricing(Double energyPrice) {
        this.energyPrice = energyPrice;
    }

    public Double getEnergyPrice() {
        return energyPrice;
    }

    public void setEnergyPrice(Double energyPrice) {
        this.energyPrice = energyPrice;
    }
}
