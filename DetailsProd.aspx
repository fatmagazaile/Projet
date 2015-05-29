<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcMeublatexApp.Models.Produit>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details_prod
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details_prod</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Id_prod</div>
        <div class="display-field"><%: Model.Id_prod %></div>
        
        <div class="display-label">categorie</div>
        <div class="display-field"><%: Model.categorie %></div>
        
        <div class="display-label">qtit_stock</div>
        <div class="display-field"><%: Model.qtit_stock %></div>
        
        <div class="display-label">qtit_vendu</div>
        <div class="display-field"><%: Model.qtit_vendu %></div>
        
        <div class="display-label">Prix</div>
        <div class="display-field"><%: Model.Prix %></div>
        
        <div class="display-label">id_img</div>
        <div class="display-field"><%: Model.id_img %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit_produit", new { id=Model.Id_prod }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

