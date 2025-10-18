package model;

import java.util.Date;


public class Member {
    private String id;
    private String userName;
    private String passWord;
    private String name;
    private Date birthOfDay;
    private String email;
    private String phone;
    private String address;

    public Member() {
    }
    public Member(String id, String userName, String passWord, String name, Date birthOfDay, String email, String phone, String address) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.name = name;
        this.birthOfDay = birthOfDay;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }
    public Member(String name,String email,String password, Date birthOfDay, String phone){
        this.name = name;
        this.email = email;
        this.passWord = password;
        this.birthOfDay = birthOfDay;
        this.phone = phone;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassWord() {
        return passWord;
    }
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Date getBirthOfDay() {
        return birthOfDay;
    }
    public void setBirthOfDay(Date birthOfDay) {
        this.birthOfDay = birthOfDay;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    
}
