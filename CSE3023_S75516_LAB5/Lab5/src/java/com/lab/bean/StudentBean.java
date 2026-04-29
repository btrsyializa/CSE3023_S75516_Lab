/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.bean;

/**
 * Name: Nurbatrisyia Aliza binti Alias
 * Program: SMSK(SE)
 * Course: CSE3023
 * Lab: IBH12
 * Date: 29/04/2026
 */

public class StudentBean {
    
    private String name;
    private String matricNo;
    
    // Empty default constructor (Compulsort for JavaBeans)
    public StudentBean(){
    }
    
    public String getName(){
        return name;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getMatricNo(){
        return matricNo;
    }
    
    public void setMatricNo(String matricNo){
        this.matricNo = matricNo;
    }
}