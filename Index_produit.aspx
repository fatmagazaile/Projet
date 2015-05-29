<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcMeublatexApp.Models.Produit>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index_produit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div align="">
    <h2>Product</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id_prod
            </th>
            <th>
               Categorie
            </th>
            <th>
                qtit_stock
            </th>
            <th>
                qtit_vendu
            </th>
            <th>
                Prix
            </th>
            <th>
                Image
            </th>
            <th>
                Upload
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit_produit", new { id=item.Id_prod }) %> |
                <%: Html.ActionLink("Details", "Details_prod", new { id=item.Id_prod })%> |
                <%: Html.ActionLink("Delete", "Delete_produit", new { id=item.Id_prod })%>
            </td>
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
                <%: Html.ActionLink("GetImage", "GetImage", new { id = item.Id_prod })%>
            </td>
            <td>
                <%: Html.ActionLink("Upload", "Upload", new { id = item.Id_prod })%>
            </td>
        </tr>
    
    <% } %>

    </table>
    </div>

    <p>
        <%= Html.ActionLink("Create New Product", "Create_prod","Produit") %>
    </p>

</asp:Content>

