import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", urlPatterns = "/custom-list")
public class customerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                List<Customer> customerList = new ArrayList<>();
                customerList.add(new Customer("kh1", "hoang", "mail@gmail.com","09009009","hue"));
                customerList.add(new Customer("kh1", "hoang", "mail@gmail.com","09009009","hue"));
                customerList.add(new Customer("kh1", "hoang", "mail@gmail.com","09009009","hue"));
                request.setAttribute("customerList", customerList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
                dispatcher.forward(request, response);
    }
}
