package org.engcia.cf.model;

public class Weather {
    private Double temperatureC;
    private Double solarRadiationWattsM2;
    private Double windSpeedKMH;

    public Weather(Double temperatureC, Double solarRadiationWattsM2, Double windSpeedKMH) {
        this.temperatureC = temperatureC;
        this.solarRadiationWattsM2 = solarRadiationWattsM2;
        this.windSpeedKMH = windSpeedKMH;
    }

    public Double getTemperatureC() {
        return temperatureC;
    }

    public void setTemperatureC(Double temperatureC) {
        this.temperatureC = temperatureC;
    }

    public Double getSolarRadiationWattsM2() {
        return solarRadiationWattsM2;
    }

    public void setSolarRadiationWattsM2(Double solarRadiationWattsM2) {
        this.solarRadiationWattsM2 = solarRadiationWattsM2;
    }

    public Double getWindSpeedKMH() {
        return windSpeedKMH;
    }

    public void setWindSpeedKMH(Double windSpeedKMH) {
        this.windSpeedKMH = windSpeedKMH;
    }
}
