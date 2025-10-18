package model;

public class Staff extends Member{
    private String position;
    public Staff() {
    }
    public Staff(String id, String userName, String passWord, String name, java.util.Date birthOfDay, String email, String phone, String address, String position) {
        super(id, userName, passWord, name, birthOfDay, email, phone, address);
        this.position = position;
    }
    public Staff(Member member, String position) {
        super(member.getId(), member.getUserName(), member.getPassWord(), member.getName(), member.getBirthOfDay(), member.getEmail(), member.getPhone(), member.getAddress());
        this.position = position;
    }

    public String getPosition() {
        return position;
    }
    public void setPosition(String position) {
        this.position = position;
    }
    
}
