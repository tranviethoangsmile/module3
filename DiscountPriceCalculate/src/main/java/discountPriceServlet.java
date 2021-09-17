import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "discountPriceServlet", urlPatterns = "/display-discount")
public class discountPriceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int discount = Integer.parseInt(request.getParameter("discountPrice"));
        double discountAmount = price * discount * 0.01;
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1> Product Name: "+name+"</h1>");
        writer.println("<h1> Product Price: "+price+"</h1>");
        writer.println("<h1> Discount : "+discount+"</h1>");
        writer.println("---------------------------------");
        writer.println("<h1> discountAmount: "+discountAmount+"</h1>");
        writer.println("</html>");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
