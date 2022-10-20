package org.engcia.cf.model;

public class Participant {

    public String id;

    public double consumption;

    public double production;

    public Participant(String id, double consumption, double production){
        this.id = id;
        this.consumption = consumption;
        this.production = production;
    }

    public double getRatio(){
        return this.production/this.consumption;
    }

}
