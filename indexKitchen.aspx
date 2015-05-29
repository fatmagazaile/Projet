<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcMeublatexApp.Models.Produit>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index_kitchen
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div align="center">
    <h2>kitchen</h2>

    <table>
        <tr>
        <th></th>
            <th>
                Référence
            </th>
            <th>
                Categorie
            </th>
            <th>
                Quantité en stock
            </th>
            <th>
                Quantité vendu
            </th>
            <th>
                Prix
            </th>
            <th>
                Image
            </th>
            <th>Reserver</th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
        <td><%= Html.ActionLink("Details", "Details_prod","Admin", new { id=item.Id_prod })%></td>
            <td>
                <%: item.Id_prod %>
            </td>
            <td>
                <%: item.categorie %>
            </td>
            <td>
                <%: item.qtit_stock %>
            </td>
            <td>
                <%: item.qtit_vendu %>
            </td>
            <td>
                <%: item.Prix %>
            </td>
            <td>
               <%= Html.ActionLink("Getimage", "GetImage","Admin", new { id = item.Id_prod })%>
            </td>
            <td><%= Html.ActionLink("Reserver", "PasserCommande", "Admin", new { id = item.Id_prod },null)%></td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("List of Bedroom", "Index_Bedroom") %> |
        <%: Html.ActionLink("List of Shild's Bedroom", "Index_Bedroomshild") %> |
        <%: Html.ActionLink("List of Livingroom", "Index_Livingroom") %> |
        <%: Html.ActionLink("List of Bathroom", "Index_Bathroom") %> |
        <%: Html.ActionLink("List of Sejourn", "Index_Sejour") %> |
    </p>
    </div>
</asp:Content>

