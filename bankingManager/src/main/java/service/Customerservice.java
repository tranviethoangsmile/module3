package service;

import model.Customer;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface Customerservice {
   public List <Customer> findAll ();
   public void insertCustomer(Customer customer) throws SQLException;
   public Customer selectCustomer(int id) throws SQLException;
   public boolean deleteCustomer(int id) throws SQLException;
   public boolean updateCustomer(Customer customer) throws SQLException;
   public void deposits (int id_customer,float money) throws SQLException;
   public void transfer (int id_cus_tras,float money,int id_cus_rec) throws SQLException;
   public void withdraws (int id_customer,float money) throws SQLException;
   public List <Customer> search (String valueSearch) throws SQLException;

}
