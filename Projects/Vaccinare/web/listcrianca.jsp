<%@page import="java.util.ArrayList"%>
<%@page import="br.ifrs.vaccinare.model.Crianca"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!-- Verifica as condi��es de acesso ao sistema -->
<!-- include_once './inc/acesso.inc.php'; -->
<!-- Cabe�alho da P�gina -->
<c:import url="inc/cabecalho.inc.jsp">
    <c:param name="pageName" value="Listagem" />
</c:import>
<%
if (request.getSession().getAttribute("idSession") == null) {
        String mensagem = "<div class='alert alert-warning'>"
                + "�rea restrita para usu�rios. Por favor insira suas credenciais."
                + "</div>";
        request.setAttribute("mensagem", mensagem);
        RequestDispatcher view = request.getRequestDispatcher("login.jsp");
        view.forward(request, response);
    }
%>
<!-- Conte�do da P�gina -->
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 class="panel-title text-center">Gest�o de Crian�as</h2>
        </div>
        <div class="panel-body">
            <!-- Mensagens vindas dos Controllers -->
            <c:out value="${mensagem}" escapeXml="false"/>
            <!-- Formul�rio de pesquisa -->
            <form action="CriancaController" method="post" class="form-horizontal">
                <div class="input-group">
                    <input class="form-control border-secondary py-2" type="search" id="nome_pesquisa" name="nome_pesquisa" placeholder="Pesquisar...">
                    <input class="form-control border-secondary py-2" type="hidden" id="pesquisou" name="pesquisou" value="${pesquisou}">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit" id="pesquisar" name="pesquisar" value="nome">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>              
                <br>
            </form>
            <!-- Listagem -->
            <table class="table table-striped table-bordered table-condensed table-hover text-center">
                <thead class="thead-dark text-center">
                    <tr>
                        <th>Nome</th>
                        <th>Sexo</th>
                        <th>Idade</th>
                        <th>A��o</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="crianca" items="${criancas}">
                        <tr>
                            <td>${crianca.nome}</td>
                            <td width='15%'>${crianca.sexo}</td>
                            <td width='15%'>${crianca.idade} anos</td>
                            <td width='15%'><a class='text-dark' href='CriancaController?acao=abrirEdicao&id=${crianca.id}'><i class='fa fa-edit'> </i>Alterar</a> | <a class='text-dark' href='#' onclick='excluir(${crianca.id});'><i class='fa fa-trash' ></i>Excluir</a></td>
                        </tr>                            
                    </c:forEach>

                </tbody>
            </table>                    

        </div>
    </div>
</div>    
<script>
    if (document.getElementById("pesquisou").value != 'S') {
        document.getElementById("pesquisar").click();
    }
    function excluir(id) {
        if (confirm("Voc� realmente deseja excluir este registro?") == true) {
            window.location.href = "CriancaController?acao=excluir&id=" + id;
        }
    }
</script>    

<!-- Rodap� da P�gina -->
<jsp:include page="inc/rodape.inc.jsp" />
