package model;

public class Cart {
    private int id;
    private SoldProduct[] listSoldProduct;

    public Cart(int id, SoldProduct[] listSoldProduct) {
        this.id = id;
        this.listSoldProduct = listSoldProduct;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SoldProduct[] getListSoldProduct() {
        return listSoldProduct;
    }

    public void setListSoldProduct(SoldProduct[] listSoldProduct) {
        this.listSoldProduct = listSoldProduct;
    }
}
