package com.lab.model;

public class Station {
    
    // Field asal dari table gaming_station
    private String stationId;
    private String pricingId;
    private String stationName;
    private String specifications;
    private String status;
    
    // Field tambahan hasil JOIN dengan table pricing
    private String stationType; 
    private double basePricePerHour;
    private double happyHour;

    // Default Constructor
    public Station() {}

    // Constructor dengan parameters (Optional, tapi bagus ada)
    public Station(String stationId, String pricingId, String stationName, 
                         String specifications, String status) {
        this.stationId = stationId;
        this.pricingId = pricingId;
        this.stationName = stationName;
        this.specifications = specifications;
        this.status = status;
    }

    // Getters & Setters untuk table gaming_station
    public String getStationId() { return stationId; }
    public void setStationId(String stationId) { this.stationId = stationId; }

    public String getPricingId() { return pricingId; }
    public void setPricingId(String pricingId) { this.pricingId = pricingId; }

    public String getStationName() { return stationName; }
    public void setStationName(String stationName) { this.stationName = stationName; }

    public String getSpecifications() { return specifications; }
    public void setSpecifications(String specifications) { this.specifications = specifications; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    // Getters & Setters untuk data Pricing (JOIN)
    public String getStationType() { return stationType; }
    public void setStationType(String stationType) { this.stationType = stationType; }

    public double getBasePricePerHour() { return basePricePerHour; }
    public void setBasePricePerHour(double basePricePerHour) { this.basePricePerHour = basePricePerHour; }

    public double getHappyHour() { return happyHour; }
    public void setHappyHour(double happyHour) { this.happyHour = happyHour; }

    // Business Logic: Kira harga selepas diskaun/multiplier
    public double getEffectivePrice() {
        return this.basePricePerHour * this.happyHour;
    }
}