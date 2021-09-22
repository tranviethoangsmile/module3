package model;

import java.sql.Date;

public class Deposits {
    int id;
    int id_cus_send;
    Date time;
    float money;

    public Deposits() {
    }

    public Deposits(int id, int id_cus_send, Date time, float money) {
        this.id = id;
        this.id_cus_send = id_cus_send;
        this.time = time;
        this.money = money;
    }

    public Deposits(Date time, float money, int id_custome) {
        this.id_cus_send = id_custome;
        this.time = time;
        this.money = money;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_cus_send() {
        return id_cus_send;
    }

    public void setId_cus_send(int id_cus_send) {
        this.id_cus_send = id_cus_send;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }
}
