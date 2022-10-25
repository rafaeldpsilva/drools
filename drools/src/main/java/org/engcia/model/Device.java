package org.engcia.cf.model;

public class Device {
    private String name;
    private double consumption;


    public Device(String name, double consumption) {
        this.name = name;
        this.consumption = consumption;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getConsumption() {
        return consumption;
    }

    public void setConsumption(double consumption) {
        this.consumption = consumption;
    }
}
