<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcMeublatexApp.ClientCommande>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Listcmd
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Listcmd</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id_client
            </th>
            <th>
                Nom
            </th>
            <th>
                Prenom
            </th>
        </tr>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
                <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ })%> |
                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%>
            </td>
             <td>
                <%: item.Id_clt %>
            </td>
            <td>
                <%: item.Id_cmd %>
            </td>
            <td>
                <%: item.prix_total %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New Commande", "PasserCommande") %>
    </p>

</asp:Content>

