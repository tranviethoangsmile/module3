package service;

import model.Customer;
import model.WithDraws;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerserviceImpl implements Customerservice {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/banking?useSSL=false";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "29061993";

    final static String SELECT_ALL_CUSTOMER = "SELECT * FROM banking.customer;";
    final static String SELECT_CUSTOMER_ID = "SELECT name,birthday,address,balance FROM banking.customer WHERE id = ?;";
    final static String INSERT_CUSTOMER = "INSERT INTO customer (name,birthday,address)\n" +
            "VALUES (?,?,?);";
    final static String UPDATE_CUSTOMER = "update customer set name= ?, birthday =?, address = ?, balance = ? where id = ?;";
    final static String DELETE_CUSTOMER = "DELETE FROM customer WHERE id = ?";
    final static String DEPOSITS = "call sp_add_Deposits (?,?)";
    final static String TRANSFER = "call sp_Transfers (?,?,?);";
    final static String WITHDRAWS = "call sp_Withdraws (?,?)";
    final static String SEARCH = "SELECT * FROM customer WHERE name LIKE ? OR address LIKE ? ";


    public CustomerserviceImpl () {

    }
    protected static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public List<Customer> findAll() {
        List <Customer> customerList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);)
        {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id_cus = rs.getInt("id");
                String name = rs.getString("name");
                String birthday = rs.getString("birthDay");
                String address = rs.getString("address");
                Float balance = rs.getFloat("balance");
                customerList.add(new Customer(id_cus, name, birthday, address, balance));
            }
        }
        catch (SQLException throwables)
        {
            throwables.printStackTrace();
        }

        return customerList;
    }

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);)
        {

            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getBirthDay());
            preparedStatement.setString(3,customer.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        }
        catch (SQLException throwables)
        {
            throwables.printStackTrace();
        }

    }

    @Override
    public Customer selectCustomer(int id) throws SQLException {
        Customer customer = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_ID);)
        {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String birthday = rs.getString("birthday");
                String address = rs.getString("address");
                Float balance = rs.getFloat("balance");
                customer = new Customer(name, birthday, address, balance);
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        boolean delete = true;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);)
        {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1,id);
            delete = preparedStatement.executeUpdate() > 0;
        }
        catch (SQLException e) {
            printSQLException(e);
        }
        return delete;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean sussecs = true;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);)
        {
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getBirthDay());
            preparedStatement.setString(3,customer.getAddress());
            preparedStatement.setFloat(4,customer.getBalance());
            preparedStatement.setInt(5,customer.getId());
            sussecs = preparedStatement.executeUpdate() > 0;
        }
        catch (SQLException e) {
            printSQLException(e);
        }
        return sussecs;
    }

    @Override
    public void deposits(int id_customer, float money) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DEPOSITS);)
        {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1,id_customer);
            preparedStatement.setFloat(2,money);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            printSQLException(e);
        }
    }

    @Override
    public void transfer(int id_cus_trans, float money, int id_cus_rec) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(TRANSFER);)
        {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1,id_cus_trans);
            preparedStatement.setFloat(2,money);
            preparedStatement.setInt(3,id_cus_rec);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            printSQLException(e);
        }
    }

    @Override
    public void withdraws(int id_customer, float money) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(WITHDRAWS);)
        {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1,id_customer);
            preparedStatement.setFloat(2,money);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            printSQLException(e);
        }
    }

    @Override
    public List<Customer> search(String valueSearch) throws SQLException {
        List <Customer> searchList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);)
        {
            String sql = "%" + valueSearch + "%";
            preparedStatement.setString(1,sql);
            preparedStatement.setString(2,sql);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id_cus = rs.getInt("id");
                String name = rs.getString("name");
                String birthday = rs.getString("birthDay");
                String address = rs.getString("address");
                Float balance = rs.getFloat("balance");
                searchList.add(new Customer(id_cus, name, birthday, address, balance));
            }

        }
        catch (SQLException throwables)
        {
            throwables.printStackTrace();
        }
        return searchList;
    }
}
