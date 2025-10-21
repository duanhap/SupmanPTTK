package model;

public class WarehouseStaff extends Staff {
    private double salary;
    public WarehouseStaff() {
    }
   public WarehouseStaff(Staff staff, double salary) {
       super(staff.getId(), staff.getUserName(), staff.getPassWord(), staff.getName(), staff.getBirthOfDay(), staff.getEmail(), staff.getPhone(), staff.getAddress(), staff.getPosition());
         this.salary = salary;
    }
    public WarehouseStaff(String id, String userName, String passWord, String name, java.util.Date birthOfDay, String email, String phone, String address, String position, double salary) {
        super(id, userName, passWord, name, birthOfDay, email, phone, address, position);
        this.salary = salary;
    }
    public WarehouseStaff(Staff staff){
         super(staff.getId(), staff.getUserName(), staff.getPassWord(), staff.getName(), staff.getBirthOfDay(), staff.getEmail(), staff.getPhone(), staff.getAddress(), staff.getPosition());
    }

    public double getSalary() {
        return salary;
    }
    public void setSalary(double salary) {
        this.salary = salary;
    }
    
}
