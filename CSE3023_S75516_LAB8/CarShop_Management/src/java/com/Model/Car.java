/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 * Name: Nurbatrisyia Aliza binti Alias
 * Program: SMSK(SE)
 * Course: CSE3023
 * Lab: MP1
 * Date: 02/06/2026
 */

public class Car {
    protected int carId;
    protected String brand;
    protected String model;
    protected int cylinder;
    protected double price;

    public Car() {}

    public Car(String brand, String model, int cylinder, double price) {
        this.brand = brand;
        this.model = model;
        this.cylinder = cylinder;
        this.price = price;
    }

    public Car(int carId, String brand, String model, int cylinder, double price) {
        this.carId = carId;
        this.brand = brand;
        this.model = model;
        this.cylinder = cylinder;
        this.price = price;
    }

    public int getCarId() { return carId; }
    public void setCarId(int carId) { this.carId = carId; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    public int getCylinder() { return cylinder; }
    public void setCylinder(int cylinder) { this.cylinder = cylinder; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}