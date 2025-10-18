package model;

import java.util.Date;



public class ImportReceipt {
    private int id;
    private double totalPrice;
    private Date Date;
    private ImportedProduct[] listImportedProduct;
    private Supplier supplier;
    private WarehouseStaff warehouseStaff;    
    public ImportReceipt() {
    }
    public ImportReceipt(int id, double totalPrice, Date Date, ImportedProduct[] listImportedProduct, Supplier supplier, WarehouseStaff warehouseStaff) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.Date = Date;
        this.listImportedProduct = listImportedProduct;
        this.supplier = supplier;
        this.warehouseStaff = warehouseStaff;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    public Date getDate() {
        return Date;
    }
    public void setDate(Date date) {
        Date = date;
    }
    public ImportedProduct[] getListImportedProduct() {
        return listImportedProduct;
    }
    public void setListImportedProduct(ImportedProduct[] listImportedProduct) {
        this.listImportedProduct = listImportedProduct;
    }
    public Supplier getSupplier() {
        return supplier;
    }
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }
    public WarehouseStaff getWarehouseStaff() {
        return warehouseStaff;
    }
    public void setWarehouseStaff(WarehouseStaff warehouseStaff) {
        this.warehouseStaff = warehouseStaff;
    }

    
}
