<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcMeublatexApp.Models.image>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Upload
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Upload</h2>
    <div id="UploadSection">        
                <% using (Html.BeginForm("Upload", "Admin", FormMethod.Post, new { @enctype = "multipart/form-data", id="profileuploadfile" }))
                   { %>
                   <input style="cursor:pointer;" type="file" name="file" id="file" /><br />
                   <input type="submit" style="cursor:pointer;margin-top:30px" id="upload" value="Upload" />
                   <% }
                %>    
     </div>


</asp:Content>
