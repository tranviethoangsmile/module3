package controller;

import model.Customer;
import model.Deposits;
import service.CustomerserviceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create" :
                    createForm(request,response);
                    break;
                case "edit" :
                    showEditForm(request,response);
                    break;
                case "delete" :
                    deleteCustomer(request,response);
                    break;
                case "withdraws":
                    formWithDraws (request,response);
                    break;
                case "deposits" :
                    formDeposits (request,response);
                    break;
                case "transfer":
                    formTransfer(request,response);
                    break;
                case "search":
                    showFormSearch(request,response);
                    break;
                default:
                    showListCustomer(request,response);
                    break;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/search.jsp");
        requestDispatcher.forward(request,response);
    }

    private void formWithDraws(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/withDraws.jsp");
        requestDispatcher.forward(request,response);
    }

    private void formTransfer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/transfer.jsp");
        requestDispatcher.forward(request,response);
    }

    private void formDeposits(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/deposits.jsp");
        requestDispatcher.forward(request,response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CustomerserviceImpl customerservice = new CustomerserviceImpl();
        customerservice.deleteCustomer(id);
        showListCustomer(request,response);

    }

    private void createForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/create.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Customer customer = new Customer();
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        customer.setName(name);
        customer.setBirthDay(birthday);
        customer.setAddress(address);
        CustomerserviceImpl customerservice = new CustomerserviceImpl();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/create.jsp");
        customerservice.insertCustomer(customer);
        request.setAttribute("mess","Create customer success");
        requestDispatcher.forward(request,response);

    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerserviceImpl customerservice = new CustomerserviceImpl();
        List <Customer> customerList = customerservice.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list.jsp");
        request.setAttribute("customerList",customerList);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create" :
                    showCreateForm(request,response);
                    break;
                case "edit" :
                    updateCustomer(request,response);
                    break;
                case "withdraws":
                    showFormWithDraws(request,response);
                    break;
                case "deposits" :
                    showFormDeposits(request,response);
                    break;
                case "transfer":
                    showFormTrasfer(request,response);
                    break;
                case "search":
                    formSearch(request,response);
                    break;
                default:
                    showListCustomer(request,response);
                    break;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void formSearch(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List <Customer> searchList = new ArrayList<>();
        CustomerserviceImpl customerservice = new CustomerserviceImpl();
        String searchValue = request.getParameter("search");
        searchList = customerservice.search(searchValue);
        request.setAttribute("searchList",searchList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/showSearchList.jsp");
        dispatcher.forward(request,response);
    }

    private void showFormWithDraws(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        float money = Float.parseFloat(request.getParameter("money"));
        int id_customer = Integer.parseInt(request.getParameter("id_cus"));
        CustomerserviceImpl customerservice = new CustomerserviceImpl();
        customerservice.withdraws(id_customer,money);
        showListCustomer(request,response);
    }

    private void showFormTrasfer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id_cus_trans = Integer.parseInt(request.getParameter("id_cus_trans"));
        float money = Float.parseFloat(request.getParameter("money"));
        int id_cus_rec = Integer.parseInt(request.getParameter("id_cus_rec"));
        CustomerserviceImpl customerservice = new CustomerserviceImpl();
        customerservice.transfer(id_cus_trans,money,id_cus_rec);
        showListCustomer(request,response);
    }

    private void showFormDeposits(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        float money = Float.parseFloat(request.getParameter("money"));
        int id_customer = Integer.parseInt(request.getParameter("id_cus"));
        CustomerserviceImpl customerservice = new CustomerserviceImpl();
        customerservice.deposits(id_customer,money);
        showListCustomer(request,response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Customer customer = new Customer();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        float balance = Float.parseFloat(request.getParameter("balance"));
        customer.setBalance(balance);
        customer.setAddress(address);
        customer.setBirthDay(birthday);
        customer.setName(name);
        customer.setId(id);
        CustomerserviceImpl customerservice = new CustomerserviceImpl();
        customerservice.updateCustomer(customer);
        showEditForm(request,response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        CustomerserviceImpl customerservice = new CustomerserviceImpl();
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        Customer customer = customerservice.selectCustomer(id);
        request.setAttribute("customer",customer);
        dispatcher.forward(request,response);
    }
}
