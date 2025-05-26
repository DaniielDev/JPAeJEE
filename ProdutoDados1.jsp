<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cadastroee.model.Produto"%>
<%
    Produto produto = (Produto) request.getAttribute("produto");
    boolean alterando = (produto != null);
    String acao = alterando ? "alterar" : "incluir";
%>
<html>
<head><title><%= alterando ? "Alterar" : "Incluir" %> Produto</title></head>
<body>
    <h1><%= alterando ? "Alterar" : "Incluir" %> Produto</h1>
    <form action="ServletProdutoFC" method="post">
        <input type="hidden" name="acao" value="<%= acao %>">
        <% if (alterando) { %>
            <input type="hidden" name="id" value="<%= produto.getId() %>">
        <% } %>
        Descrição: <input type="text" name="descricao" value="<%= alterando ? produto.getDescricao() : "" %>"><br>
        Preço Venda: <input type="text" name="precoVenda" value="<%= alterando ? produto.getPrecoVenda() : "" %>"><br>
        <input type="submit" value="<%= alterando ? "Salvar Alterações" : "Cadastrar Produto" %>">
    </form>
</body>
</html>
