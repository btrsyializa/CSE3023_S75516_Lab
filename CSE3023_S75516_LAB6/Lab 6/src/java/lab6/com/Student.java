/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab6.com;

/**
 * Name: Nurbatrisyia Aliza binti Alias
 * Program: SMSK(SE)
 * Course: CSE3023
 * Lab: IBH12
 * Date: 12/05/2026
 */

import java.util.regex.*;

public class Student {

    private String stuno;
    private String name;
    private String program;

    // Getter and Setter for Name
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for Program
    public String getProgram() {
        return program;
    }
    public void setProgram(String program) {
        this.program = program;
    }

    // Getter and Setter for Student No (with Regex Validation)
    public String getStuno() {
        // Regex: Starts with 1 or more Capital Letters, followed by 1 or more Numbers
        Pattern pt = Pattern.compile("^[A-Z]+[0-9]+$");
        Matcher mt = pt.matcher(stuno);
        boolean bl = mt.matches();
        
        if (bl) {
            return stuno;
        } else {
            // This exception will trigger errorStudent.jsp
            throw new IllegalArgumentException("Invalid Student No format! It must start with capital letters followed by numbers (E.g., UK88888).");
        }
    }
    public void setStuno(String stuno) {
        this.stuno = stuno;
    }
    
}