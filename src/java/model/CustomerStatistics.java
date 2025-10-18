package model;

public class CustomerStatistics extends Member{
    private double purchaseValue;
    private int numberOfPurchases;
    public CustomerStatistics() {
    }
    public CustomerStatistics(String id, String userName, String passWord, String name, java.util.Date birthOfDay, String email, String phone, String address, double purchaseValue, int numberOfPurchases) {
        super(id, userName, passWord, name, birthOfDay, email, phone, address);
        this.purchaseValue = purchaseValue;
        this.numberOfPurchases = numberOfPurchases;
    }
    public CustomerStatistics(Customer customer, double purchaseValue, int numberOfPurchases) {
        super(customer.getId(), customer.getUserName(), customer.getPassWord(), customer.getName(), customer.getBirthOfDay(), customer.getEmail(), customer.getPhone(), customer.getAddress());
        this.purchaseValue = purchaseValue;
        this.numberOfPurchases = numberOfPurchases;
    }
    public double getPurchaseValue() {
        return purchaseValue;
    }
    public void setPurchaseValue(double purchaseValue) {
        this.purchaseValue = purchaseValue;
    }
    public int getNumberOfPurchases() {
        return numberOfPurchases;
    }
    public void setNumberOfPurchases(int numberOfPurchases) {
        this.numberOfPurchases = numberOfPurchases;
    }


    
}
