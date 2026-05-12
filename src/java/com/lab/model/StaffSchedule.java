package com.lab.model;

import java.sql.Date; // Gunakan java.sql.Date supaya ngam dengan rs.getDate()

public class StaffSchedule {

    // Variables ikut sebiji column dalam SQL
    private String scheduleId;
    private String advisorId;
    private String ajkId;
    private Date shiftDate;
    private String dutyRole;
    private int isAssigned; // TINYINT(1) mapped to int (0 atau 1)
    
    // Additional variables untuk display kat UI (Bila kau buat JOIN nanti)
    private String ajkName;
    private String advisorName;

    // Default Constructor
    public StaffSchedule() {}

    // Constructor with parameters
    public StaffSchedule(String scheduleId, String advisorId, String ajkId, 
                         Date shiftDate, String dutyRole, int isAssigned) {
        this.scheduleId = scheduleId;
        this.advisorId = advisorId;
        this.ajkId = ajkId;
        this.shiftDate = shiftDate;
        this.dutyRole = dutyRole;
        this.isAssigned = isAssigned;
    }

    // Getters and Setters
    public String getScheduleId() { return scheduleId; }
    public void setScheduleId(String scheduleId) { this.scheduleId = scheduleId; }

    public String getAdvisorId() { return advisorId; }
    public void setAdvisorId(String advisorId) { this.advisorId = advisorId; }

    public String getAjkId() { return ajkId; }
    public void setAjkId(String ajkId) { this.ajkId = ajkId; }

    public Date getShiftDate() { return shiftDate; }
    public void setShiftDate(Date shiftDate) { this.shiftDate = shiftDate; }

    public String getDutyRole() { return dutyRole; }
    public void setDutyRole(String dutyRole) { this.dutyRole = dutyRole; }

    public int getIsAssigned() { return isAssigned; }
    public void setIsAssigned(int isAssigned) { this.isAssigned = isAssigned; }

    // Helper fields untuk join table
    public String getAjkName() { return ajkName; }
    public void setAjkName(String ajkName) { this.ajkName = ajkName; }

    public String getAdvisorName() { return advisorName; }
    public void setAdvisorName(String advisorName) { this.advisorName = advisorName; }
    
    // Method extra untuk senang check status kat JSP
    public String getStatusText() {
        return (isAssigned == 1) ? "Assigned" : "Pending";
    }
}