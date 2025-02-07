<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="foodie.Admin.Users" %>
<%@ Import Namespace="foodie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script>
    // For disappearing alert messages
    window.onload = function () {
        var seconds = 5;
        setTimeout(function () {
            var lblMsg = document.getElementById('<%= lblMsg.ClientID %>');
      if (lblMsg) {
        lblMsg.style.display = "none";
      }
    }, seconds * 1000);
  };
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="pcoded-inner-content pt-0">
     <div class="align-align-self-end">
         <asp:Label ID="lblMsg" runat="server" visible="false"></asp:Label>
     </div>
     <div class="main-body">
         <div class="page-wrapper">
             <div class="page-body">
                 <div class="row">
            
                     <!-- Category List -->
                     <div class="col-12 mobile-inputs">
                         <div class="card">
                             <div class="card-header">
                                 <h5>Category List</h5>
                             </div>
                             <div class="card-block">
                                 <div class="table-responsive">
                                     <asp:Repeater ID="rUsers" runat="server" OnItemCommand="rUser_ItemCommand" OnItemDataBound="rUser_ItemDataBound">
                                         <HeaderTemplate>
                                             <table class="table data-table-export table-hover nowrap">
                                                 <thead>
                                                     <tr>
                                                         <th class="table-plus">SrNo</th>
                                                         <th>Full Name</th>
                                                         <th>Username</th>
                                                          <th>Email</th>
                                                         <th>Joined Date</th>
                                                         <th class="datatable-nosort">Delete</th>
                                                     </tr>
                                                 </thead>
                                                 <tbody>
                                         </HeaderTemplate>
                                         <ItemTemplate>
                                             <tr>
                                                 <td class="table-plus"><%# Eval("SrNo") %></td>
                                                 <td><%# Eval("Name") %></td>
                                                 <td><%# Eval("Username") %></td>
                                                 <td><%# Eval("Email") %></td>
                                                 <td><%# Eval("CreatedDate") %></td>
                                                 <td>
                                                     <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete" CssClass="badge bg-danger" 
                                                         CommandArgument='<%# Eval("UserId") %>' OnClientClick="return confirm('Do you want to delete this User?');">
                                                         <i class="ti-trash"></i>
                                                         </asp:LinkButton>
                                                 </td>
                                             </tr>
                                         </ItemTemplate>
                                         <FooterTemplate>
                                             </tbody>
                                             </table>
                                         </FooterTemplate>
                                     </asp:Repeater>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>

</asp:Content>
