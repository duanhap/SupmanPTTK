package model;

public class SoldProduct  extends Product{
    private int salesQuantity;
    private double price;
    public SoldProduct() {
    }
    public SoldProduct(int id, String name, String description, String unit, int inventoryQuantity, String type, double standardPrice, int salesQuantity, double price) {
        super(id, name, description, unit, inventoryQuantity, type, standardPrice);
        this.salesQuantity = salesQuantity;
        this.price = price;
    }
    public SoldProduct(Product product, int salesQuantity, double price) {
        super(product.getId(), product.getName(), product.getDescription(), product.getUnit(), product.getInventoryQuantity(), product.getType(), product.getStandardPrice());
        this.salesQuantity = salesQuantity;
        this.price = price;
    }
    public int getSalesQuantity() {
        return salesQuantity;
    }
    public void setSalesQuantity(int salesQuantity) {
        this.salesQuantity = salesQuantity;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    
}
