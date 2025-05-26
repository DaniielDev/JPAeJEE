package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletProdutoFC", urlPatterns = {"/ServletProdutoFC"})
public class ServletProdutoFC extends HttpServlet {

    @EJB
    private ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        String destino = "ProdutoLista.jsp";

        if ("formIncluir".equals(acao) || "formAlterar".equals(acao)) {
            destino = "ProdutoDados.jsp";
            if ("formAlterar".equals(acao)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Produto p = facade.find(id);
                request.setAttribute("produto", p);
            }
        } else if ("listar".equals(acao)) {
            List<Produto> produtos = facade.findAll();
            request.setAttribute("lista", produtos);
        } else if ("excluir".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Produto p = facade.find(id);
            facade.remove(p);
            request.setAttribute("lista", facade.findAll());
        } else if ("alterar".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Produto p = facade.find(id);
            p.setDescricao(request.getParameter("descricao"));
            p.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
            facade.edit(p);
            request.setAttribute("lista", facade.findAll());
        } else if ("incluir".equals(acao)) {
            Produto p = new Produto();
            p.setDescricao(request.getParameter("descricao"));
            p.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
            facade.create(p);
            request.setAttribute("lista", facade.findAll());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
