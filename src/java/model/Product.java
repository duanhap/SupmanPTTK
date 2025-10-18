package model;

public class Product {
    private int id;
    private String name;
    private String description;
    private String unit;
    private int inventoryQuantity;
    private String type;
    private double standardPrice;

    public Product() {
    }
    public Product(int id, String name, String description, String unit, int inventoryQuantity, String type, double standardPrice) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.unit = unit;
        this.inventoryQuantity = inventoryQuantity;
        this.type = type;
        this.standardPrice = standardPrice;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getUnit() {
        return unit;
    }
    public void setUnit(String unit) {
        this.unit = unit;
    }
    public int getInventoryQuantity() {
        return inventoryQuantity;
    }
    public void setInventoryQuantity(int inventoryQuantity) {
        this.inventoryQuantity = inventoryQuantity;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public double getStandardPrice() {
        return standardPrice;
    }
    public void setStandardPrice(double standardPrice) {
        this.standardPrice = standardPrice;
    }
    
    
}
