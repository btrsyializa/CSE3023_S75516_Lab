package com.lab.model;

import java.sql.Date;
import java.sql.Time;

public class TimeSlot {
    private String slotId;
    private String stationId;
    private Date slotDate;
    private Time startTime;
    private Time endTime;
    private int isAvailable;

    // Getters and Setters
    public String getSlotId() { return slotId; }
    public void setSlotId(String slotId) { this.slotId = slotId; }

    public String getStationId() { return stationId; }
    public void setStationId(String stationId) { this.stationId = stationId; }

    public Date getSlotDate() { return slotDate; }
    public void setSlotDate(Date slotDate) { this.slotDate = slotDate; }

    public Time getStartTime() { return startTime; }
    public void setStartTime(Time startTime) { this.startTime = startTime; }

    public Time getEndTime() { return endTime; }
    public void setEndTime(Time endTime) { this.endTime = endTime; }

    public int getIsAvailable() { return isAvailable; }
    public void setIsAvailable(int isAvailable) { this.isAvailable = isAvailable; }
}