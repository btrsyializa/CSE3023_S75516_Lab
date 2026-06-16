package com.lab.bean;
import java.io.Serializable;

public class SubjectBean implements Serializable {
    private int id;
    private String matric_no; // Exact match to registered_subjects 'matric_no'
    private String subject_code;
    private String subject_name;

    public SubjectBean() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getMatric_no() { return matric_no; }
    public void setMatric_no(String matric_no) { this.matric_no = matric_no; }

    public String getSubject_code() { return subject_code; }
    public void setSubject_code(String subject_code) { this.subject_code = subject_code; }

    public String getSubject_name() { return subject_name; }
    public void setSubject_name(String subject_name) { this.subject_name = subject_name; }
}