package org.engcia.model;

import java.util.Objects;

public class Device {

    private String name;

    private double consumption;

    private boolean essential;

    private boolean state; //turned on/off


    public Device(String name, double consumption, boolean essential, boolean state) {
        this.name = name;
        this.consumption = consumption;
        this.essential = essential;
        this.state = state;
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

    public boolean isEssential() {
        return essential;
    }

    public void setEssential(boolean essential) {
        this.essential = essential;
    }


    public boolean isOn() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Device{" +
                "name='" + name + '\'' +
                ", consumption=" + consumption +
                ", essential=" + essential +
                ", state=" + state +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Device device = (Device) o;
        return Double.compare(device.consumption, consumption) == 0 && essential == device.essential && state == device.state && Objects.equals(name, device.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, consumption, essential, state);
    }
}
