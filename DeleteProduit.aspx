<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcMeublatexApp.Models.Produit>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete_produit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete_produit</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Id_prod</div>
        <div class="display-field"><%: Model.Id_prod %></div>
        
        <div class="display-label">Libelle_prod</div>
        <div class="display-field"><%: Model.categorie %></div>
        
        <div class="display-label">qtit_stock</div>
        <div class="display-field"><%: Model.qtit_stock %></div>
        
        <div class="display-label">qtit_vendu</div>
        <div class="display-field"><%: Model.qtit_vendu %></div>
        
        <div class="display-label">Prix</div>
        <div class="display-field"><%: Model.Prix %></div>
        
        
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

