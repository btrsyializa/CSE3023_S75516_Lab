/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.model;

/**
 * Name: Nurbatrisyia Aliza binti Alias
 * Program: SMSK(SE)
 * Course: CSE3023
 * Lab: MP1
 * Date: 16/06/2026
 */
public class SessionBean {
    private int sessionId;
    private String studentName;
    private String branchLocation;
    private String lessonType;
    private String status;

    public SessionBean() {
    }
    
    public SessionBean(int sessionId, String studentName, String branchLocation, String lessonType, String status) {
        this.sessionId = sessionId;
        this.studentName = studentName;
        this.branchLocation = branchLocation;
        this.lessonType = lessonType;
        this.status = status;
    }
    
    //getters
    public int getSessionId() {
        return sessionId;
    }
    public String getStudentName() {
        return studentName;
    }
    public String getBranchLocation() {
        return branchLocation;
    }
    public String getLessonType() {
        return lessonType;
    }
    public String getStatus() {
        return status;
    }
    
    //setters
    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    public void setBranchLocation(String branchLocation) {
        this.branchLocation = branchLocation;
    }
    public void setLessonType (String lessonType) {
        this.lessonType = lessonType;
    }
    public void setStatus (String status) {
        this.status = status;
    }
}