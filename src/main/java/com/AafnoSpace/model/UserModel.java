package com.AafnoSpace.model;

import java.util.Date;

public class UserModel {
	private int UserId;
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private String password;
    private String address;
    private String phoneNo;
    private String role;
    private String status;
    
    //Getter and setter
    public int getuserId() { return UserId; }
    public void setuserId(int UserId) { this.UserId = UserId; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getUserName() { return username; }
    public void setUserName(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getaddress() { return address; }
    public void setaddress(String address) { this.address = address; }
    
    public String getPhoneNo() { return phoneNo; }
    public void setNumber(String phoneNo) { this.phoneNo = phoneNo; }  
    
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}

