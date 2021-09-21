package DAO;

import model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO{
    private static String jdbcURL = "jdbc:mysql://localhost:3306/banking?useSSL=false";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "29061993";

    private static final String INSERT_USERS_SQL = "INSERT INTO customer" + "  (id, name, birthday, address, balance) VALUES " +
            " (?, ?, ?,?,?);";

    private static final String SELECT_USER_BY_ID = "select id,name,birthday,address,balance from banking.customer where id =?;";
    private static final String SELECT_ALL_USERS = "SELECT * FROM banking.customer;";
    private static final String DELETE_USERS_SQL = "delete from customer where id = ?;";
    private static final String UPDATE_USERS_SQL = "update customer set name= ?, birthday =?, address = ?, balance = ? where id = ?;";
    public CustomerDAO () {
    }

    protected  Connection getConnection() {
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
    public void insertCustomer(Customer customer) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3,customer.getBirthDay());
            preparedStatement.setString(4, customer.getAddress());
            preparedStatement.setFloat(5, customer.getBalance());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id_cus = rs.getInt("id");
                String name = rs.getString("name");
                String birthday = rs.getString("birthday");
                String address = rs.getString("address");
                Float balance = rs.getFloat("balance");
                customer = new Customer(id_cus, name, birthday, address,balance);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }

@Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customer = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id_cus = rs.getInt("id");
                String name = rs.getString("name");
                String birthday = rs.getString("birthday");
                String address = rs.getString("address");
                Float balance = rs.getFloat("balance");
                customer.add(new Customer(id_cus,name,birthday,address,balance));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);)
        {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }


    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setInt(5, customer.getId());
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getBirthDay());
            statement.setString(3, customer.getAddress());
            statement.setFloat(4, customer.getBalance());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }


    private static void printSQLException(SQLException ex) {
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



}
