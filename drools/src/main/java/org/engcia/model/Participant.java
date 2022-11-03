package org.engcia.model;

import java.util.List;

public class Participant {

    private String id;
    private double production;
    private double consumption;
    private ParticipantType participantType;
    private List<Device> devices;

    public Participant(String id, double production, List<Device> devices) {
        this.id = id;
        this.production = production;
        this.devices = devices;

        this.consumption = 0;
        for (Device device: devices) {
            if(device.isOn()){
                this.consumption+=device.getConsumption();
            }
        }

        if(production>0 && consumption>0){
            this.participantType=ParticipantType.PROSUMER;
        } else if( production > 0 && consumption ==0){
            this.participantType=ParticipantType.PRODUCER;
        } else  if( production ==0 && consumption>0){
            this.participantType=ParticipantType.CONSUMER;
        }
    }

    public String getId() {
        return id;
    }

    public double getProduction() {
        return production;
    }

    public double getConsumption() {
        return consumption;
    }

    public ParticipantType getParticipantType() {
        return participantType;
    }

    public List<Device> getDevices() {
        return devices;
    }

    public void setProduction(double production) {
        this.production = production;
    }

    public void setConsumption(double consumption) {
        this.consumption = consumption;
    }

    public void setDevices(List<Device> devices) {
        this.devices = devices;
    }

    public double getRatio(){
        return this.production/this.consumption;
    }


}
