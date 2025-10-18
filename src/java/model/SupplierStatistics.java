package model;

public class SupplierStatistics extends Supplier {
    private double supplyValue;
    private int numberOfTransactions;
    public SupplierStatistics() {
    }
    public SupplierStatistics(int id, String name, String phone, String address, String email, double supplyValue, int numberOfTransactions) {
        super(id, name, phone, address, email);
        this.supplyValue = supplyValue;
        this.numberOfTransactions = numberOfTransactions;
    }
    public SupplierStatistics(Supplier supplier, double supplyValue, int numberOfTransactions) {
        super(supplier.getId(), supplier.getName(), supplier.getPhone(), supplier.getAddress(), supplier.getEmail());
        this.supplyValue = supplyValue;
        this.numberOfTransactions = numberOfTransactions;
    }
    public double getSupplyValue() {
        return supplyValue;
    }
    public void setSupplyValue(double supplyValue) {
        this.supplyValue = supplyValue;
    }
    public int getNumberOfTransactions() {
        return numberOfTransactions;
    }
    public void setNumberOfTransactions(int numberOfTransactions) {
        this.numberOfTransactions = numberOfTransactions;
    }

}
