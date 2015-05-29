<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcMeublatexApp.Models.Client>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Identifiant
            </th>
            <th>
                Nom
            </th>
            <th>
                Prenom
            </th>
            <th>
                E_mail
            </th>
            <th>
                Référence
            </th>
            <th>
                Commande
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.Id_clt }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.Id_clt })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.Id_clt })%>
            </td>
            <td>
                <%: item.Id_clt %>
            </td>
            <td>
                <%: item.Nom_clt %>
            </td>
            <td>
                <%: item.Prenom_clt %>
            </td>
            <td>
                <%: item.E_mail %>
            </td>
            <td>
                <%: item.Id_cmd %>
            </td>
            <td><%= Html.ActionLink("Commande", "Listcommande", new { id = item.Id_clt })%></td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create","Client") %>
    </p>
    <p>
        <%= Html.ActionLink("List of Product", "Index_produit") %>
    </p>

</asp:Content>

