<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcMeublatexApp.Models.Client>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Id_clt) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Id_clt) %>
                <%: Html.ValidationMessageFor(model => model.Id_clt) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nom_clt) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nom_clt) %>
                <%: Html.ValidationMessageFor(model => model.Nom_clt) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Prenom_clt) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Prenom_clt) %>
                <%: Html.ValidationMessageFor(model => model.Prenom_clt) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.E_mail) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.E_mail) %>
                <%: Html.ValidationMessageFor(model => model.E_mail) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Id_cmd) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Id_cmd) %>
                <%: Html.ValidationMessageFor(model => model.Id_cmd) %>
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

