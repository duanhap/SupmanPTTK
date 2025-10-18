package model;

import java.util.Date;

public class Customer extends Member{
    private String type;
    private Cart cart;
    public Customer() {
    }
    public Customer(String id, String userName, String passWord, String name, java.util.Date birthOfDay, String email, String phone, String address, String type) {
        super(id, userName, passWord, name, birthOfDay, email, phone, address);
        this.type = type;
    }
    public Customer(Member member, String type) {
        super(member.getId(), member.getUserName(), member.getPassWord(), member.getName(), member.getBirthOfDay(), member.getEmail(), member.getPhone(), member.getAddress());
        this.type = type;
    }
    public Customer(Member member, String type, Cart cart) {
        super(member.getId(), member.getUserName(), member.getPassWord(), member.getName(), member.getBirthOfDay(), member.getEmail(), member.getPhone(), member.getAddress());
        this.type = type;
        this.cart = cart;
    }
    public Customer(String name,String email,String password, Date birthOfDay, String phone , String type){
        super(name,email,password,birthOfDay,phone);
        this.type = type;
             
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public Cart getCart() {
        return cart;
    }
    public void setCart(Cart cart) {
        this.cart = cart;
    }

 
    
}
