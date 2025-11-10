package model;

public class ImportedProduct extends Product{
    private int ImportedProductID;
    private int importQuantity;
    private double importPrice;
    public ImportedProduct() {
    }
    public ImportedProduct(Product product, int importQuantity, double importPrice) {
        super(product.getId(), product.getName(), product.getDescription(), product.getUnit(), product.getInventoryQuantity(),product.getType(),  product.getStandardPrice());
        this.importQuantity = importQuantity;
        this.importPrice = importPrice;
    }
    public int getImportQuantity() {
        return importQuantity;
    }
    public void setImportQuantity(int importQuantity) {
        this.importQuantity = importQuantity;
    }
    public double getImportPrice() {
        return importPrice;
    }
    public void setImportPrice(double importPrice) {
        this.importPrice = importPrice;
    }

    public int getImportedProductID() {
        return ImportedProductID;
    }

    public void setImportedProductID(int ImportedProductID) {
        this.ImportedProductID = ImportedProductID;
    }
    
    
}
