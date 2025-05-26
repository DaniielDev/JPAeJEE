<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>
<html>
<head><title>Lista de Produtos</title></head>
<body>
    <h1>Produtos Cadastrados</h1>
    <a href="ServletProdutoFC?acao=formIncluir">Incluir Novo Produto</a>
    <table border="1">
        <tr><th>ID</th><th>Descrição</th><th>Preço</th><th>Ações</th></tr>
        <%
            List<Produto> lista = (List<Produto>) request.getAttribute("lista");
            if (lista != null) {
                for (Produto p : lista) {
        %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getDescricao() %></td>
                <td>R$ <%= p.getPrecoVenda() %></td>
                <td>
                    <a href="ServletProdutoFC?acao=formAlterar&id=<%= p.getId() %>">Alterar</a> |
                    <a href="ServletProdutoFC?acao=excluir&id=<%= p.getId() %>">Excluir</a>
                </td>
            </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
