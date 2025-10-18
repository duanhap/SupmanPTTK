package model;

public class ProductStatistics extends Product{
    private int numberOfPurchases;
    private double revenue;
    public ProductStatistics() {
    }
    public ProductStatistics(int id, String name, String description, String unit, int inventoryQuantity, String type, double standardPrice, int numberOfPurchases, double revenue) {
        super(id, name, description, unit, inventoryQuantity, type, standardPrice);
        this.numberOfPurchases = numberOfPurchases;
        this.revenue = revenue;
    }
    public ProductStatistics(Product product, int numberOfPurchases, double revenue) {
        super(product.getId(), product.getName(), product.getDescription(), product.getUnit(), product.getInventoryQuantity(), product.getType(), product.getStandardPrice());
        this.numberOfPurchases = numberOfPurchases;
        this.revenue = revenue;
    }
    public int getNumberOfPurchases() {
        return numberOfPurchases;
    }
    public void setNumberOfPurchases(int numberOfPurchases) {
        this.numberOfPurchases = numberOfPurchases;
    }
    public double getRevenue() {
        return revenue;
    }
    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
    

}
