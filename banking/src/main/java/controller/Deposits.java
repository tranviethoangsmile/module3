package controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DatabaseMetaData;

public class Deposits {
    private static DatabaseMetaData JDBCUtil;

    public static void main(String args[]){
        Connection conn = null;
        CallableStatement callableStatement = null;
        String proc = "{call sp_add_Deposits (?,?)}";
        try{
            //get connection
            conn = JDBCUtil.getConnection();

            //create callableStatement
            callableStatement = conn.prepareCall(proc);

            callableStatement.setInt(1, 8);
            callableStatement.setInt(3, 50000);

            //execute query
            callableStatement.execute();

            //close connection
            callableStatement.close();
            conn.close();

            System.out.println("Records inserted successfully.");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
