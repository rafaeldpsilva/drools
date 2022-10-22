package org.engcia.cf.model;

public class Participant {

    private String id;

    private double consumption;

    private double production;

    public Participant(String id, double consumption, double production){
        this.id = id;
        this.consumption = consumption;
        this.production = production;
    }

    public double getRatio(){
        return this.production/this.consumption;
    }

    public String getId() {
        return id;
    }

    public double getConsumption() {
        return consumption;
    }

    public double getProduction() {
        return production;
    }
}
