package com.lab.bean;
import java.io.Serializable;

public class StudentBean implements Serializable {
    private int id;
    private String matricNo; // Exact match to column 'matricNo'
    private String password;
    private String fullname;

    public StudentBean() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getMatricNo() { return matricNo; }
    public void setMatricNo(String matricNo) { this.matricNo = matricNo; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

    }