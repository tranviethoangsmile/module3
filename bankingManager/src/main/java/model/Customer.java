package model;

public class Customer {
    private int id;
    private String name;
    private String birthDay;
    private String address;
    private float balance;

    public Customer() {
    }

    public Customer(String name, String birthDay, String address) {
        this.name = name;
        this.birthDay = birthDay;
        this.address = address;
    }

    public Customer(int id, String name, String birthDay, String address, float balance) {
        this.id = id;
        this.name = name;
        this.birthDay = birthDay;
        this.address = address;
        this.balance = balance;
    }

    public Customer(String name, String birthday, String address, Float balance) {
        this.name = name;
        this.birthDay = birthDay;
        this.address = address;
        this.balance = balance;
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

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }
}
