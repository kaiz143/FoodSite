<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="foodie.Admin.Category" %>
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
    <script>
  function ImagePreview(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        var imgCategory = document.getElementById('<%= imgCategory.ClientID %>');
                if (imgCategory) {
                    imgCategory.src = e.target.result;
                    imgCategory.width = 1100;
                    imgCategory.height = 1200;
                }
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
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
                        <!-- Category Form -->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5>Category</h5>
                                </div>
                                <div class="card-block">
                                    <div class="form-group">
                                        <label>Category Names</label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Category Name" required></asp:TextBox>
                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                    </div>
                                    <div class="form-group">
                                        <label>Category Images</label>
                                        <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                                    </div>
                                    <div class="form-check">
                                        <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive" CssClass="form-check-input" />
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
                                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnClear_Click" />
                                    </div>
                                    <div>
                                        <asp:Image ID="imgCategory" runat="server" CssClass="img-thumbnail" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Category List -->
                        <div class="col-md-6 mobile-inputs">
                            <div class="card">
                                <div class="card-header">
                                    <h5>Category List</h5>
                                </div>
                                <div class="card-block">
                                    <div class="table-responsive">
                                        <asp:Repeater ID="rCategory" runat="server" OnItemCommand="rCategory_ItemCommand" OnItemDataBound="rCategory_ItemDataBound">
                                            <HeaderTemplate>
                                                <table class="table data-table-export table-hover nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th class="table-plus">Name</th>
                                                            <th>Image</th>
                                                            <th>IsActive</th>
                                                            <th>CreatedDate</th>
                                                            <th class="datatable-nosort">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="table-plus"><%# Eval("Name") %></td>
                                                    <td>
                                                        <img alt="" width="40px" src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" />
                                                    </td>
                                                    <td>
                                                         <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>' />
                                                       </td>
                                                    <td><%# Eval("CreatedDate") %></td>
                                                    <td>
                                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" CommandName="edit" CommandArgument='<%# Eval("CategoryId") %>'>
                                                         <i class="ti-pencil"></i>
                                                            </asp:LinkButton>

                                                         <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete" CssClass="badge bg-danger" CommandArgument='<%# Eval("CategoryId") %>' OnClientClick="return confirm('Do you want to delete this category?');">
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
