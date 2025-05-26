package cadastro;
package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class cadastro {
    public static void main(String[] args) {
        
    }

    public class ServletProduto extends HttpServlet {

    @EJB
    private ProdutoFacadeLocal facade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Produto> produtos = facade.findAll();

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><head><title>Lista de Produtos</title></head><body>");
            out.println("<h1>Produtos Cadastrados</h1><ul>");
            for (Produto p : produtos) {
                out.println("<li>" + p.getId() + " - " + p.getDescricao() + " - R$ " + p.getPrecoVenda() + "</li>");
            }
            out.println("</ul></body></html>");
        }
    }
}
}
