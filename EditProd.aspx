<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcMeublatexApp.Models.Produit>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit_produit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit_produit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Id_prod) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Id_prod) %>
                <%: Html.ValidationMessageFor(model => model.Id_prod) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.categorie %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.categorie) %>
                <%: Html.ValidationMessageFor(model => model.categorie) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.qtit_stock) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.qtit_stock) %>
                <%: Html.ValidationMessageFor(model => model.qtit_stock) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.qtit_vendu) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.qtit_vendu) %>
                <%: Html.ValidationMessageFor(model => model.qtit_vendu) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Prix) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Prix) %>
                <%: Html.ValidationMessageFor(model => model.Prix) %>
            </div>
            
            
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

