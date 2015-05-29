<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcMeublatexApp.Models.Produit>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div align="center">
    <h2>Product</h2>

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
                La quantité en stock
            </th>
            <th>
                La quantité vendu
            </th>
            <th>
                Prix
            </th>
            <th> Image</th>
            
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
            <td><%= Html.ActionLink("GetImage", "GetImage", "Admin", new {id=item.Id_prod },null)%></td>
            
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("List of Bedroom", "Index_Bedroom") %> |
        <%: Html.ActionLink("List of Shild's Bedroom", "Index_Bedroomshild") %> |
        <%: Html.ActionLink("List of Kitchen", "Index_kitchen") %> |
        <%: Html.ActionLink("List of Livingroom", "Index_Livingroom") %> |
        <%: Html.ActionLink("List of Bathroom", "Index_Bathroom") %> |
        <%: Html.ActionLink("List of Sejourn", "Index_Sejour") %> |
    </p>
    </div>

</asp:Content>

