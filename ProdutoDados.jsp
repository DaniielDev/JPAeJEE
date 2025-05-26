<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cadastroee.model.Produto"%>
<%
    Produto prod = (Produto) request.getAttribute("produto");
    String acao = (prod == null) ? "incluir" : "alterar";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dados do Produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container">
    <h1><%= (acao.equals("incluir") ? "Incluir" : "Alterar") %> Produto</h1>

    <form action="ServletProdutoFC" method="post" class="form">
        <input type="hidden" name="acao" value="<%= acao %>"/>
        <%
            if (acao.equals("alterar")) {
        %>
            <input type="hidden" name="id" value="<%= prod.getId() %>"/>
        <%
            }
        %>

        <div class="mb-3">
            <label class="form-label">Nome:</label>
            <input type="text" name="nome" class="form-control" value="<%= (prod != null) ? prod.getNome() : "" %>"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Quantidade:</label>
            <input type="number" name="quantidade" class="form-control" value="<%= (prod != null) ? prod.getQuantidade() : "" %>"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Preço de Venda:</label>
            <input type="text" name="precoVenda" class="form-control" value="<%= (prod != null) ? prod.getPrecoVenda() : "" %>"/>
        </div>

        <button type="submit" class="btn btn-primary">
            <%= (acao.equals("incluir") ? "Incluir" : "Alterar") %>
        </button>
    </form>
</body>
</html>
