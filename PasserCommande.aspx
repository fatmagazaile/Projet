<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcMeublatexApp.Models.Commande>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	PasserCommande
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>PasserCommande</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Id_cmd) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Id_cmd) %>
                <%: Html.ValidationMessageFor(model => model.Id_cmd) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Libelle_cmd) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Libelle_cmd) %>
                <%: Html.ValidationMessageFor(model => model.Libelle_cmd) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.qtit) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.qtit) %>
                <%: Html.ValidationMessageFor(model => model.qtit) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Id_prod) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Id_prod) %>
                <%: Html.ValidationMessageFor(model => model.Id_prod) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Prix_total) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Prix_total) %>
                <%: Html.ValidationMessageFor(model => model.Prix_total) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("List of commande", "Listcmd") %>
    </div>

</asp:Content>

