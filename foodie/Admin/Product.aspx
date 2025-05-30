﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="foodie.Admin.Product" %>
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

  function ImagePreview(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        var imgCategory = document.getElementById('<%= imgProduct.ClientID %>');
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
                     <div class="col-md-6 mobile-inputs">
                         <div class="card">
                             <div class="card-header">
                                 <h5>Product</h5>
                             </div>
                             <div class="card-block">
                                 <div class="form-group">
                                     <label>Product Names</label>
                                     <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Product Name" >
                                     </asp:TextBox>
                                      <asp:RequiredFieldValidator runat="server" ErrorMessage="Name Is Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                          ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                     <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                 </div>

                                 <div class="form-group">
                                    <label>Product Description</label>
                                     <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Product Description" TextMode="MultiLine" >
                                      </asp:TextBox>
                                       <asp:RequiredFieldValidator runat="server" ErrorMessage="Description Is Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                        ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                                    </div>

                                     <div class="form-group">
                                          <label>Product Price(₹)</label>
                                              <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Product Price" >
                                              </asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Price Is Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                            ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Price Must be in decimal"
                                              ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                            ControlToValidate="txtPrice" ValidationExpression="^\d{0,8}\.\d{1,4}?$"></asp:RegularExpressionValidator>
                                          </div>

                                            <div class="form-group">
                                         <label>Product Quantity</label>
                                             <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="Enter Product Quantity" >
                                             </asp:TextBox>
                                       <asp:RequiredFieldValidator runat="server" ErrorMessage="Quantity Is Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                           ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Quantity Should Not be in Negative"
                                             ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                           ControlToValidate="txtQuantity" ValidationExpression="^([1-9]\d*|0)$"></asp:RegularExpressionValidator>
                                         </div>

                                 <div class="form-group">
                                     <label>Product Images</label>
                                     <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                                 </div>

                                 <div class="form-group">
                                     <label>Product Category</label>
                                     <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1"
                                         DataTextField="Name" DataValueField="CategoryId" AppendDataBoundItems="true">
                                         <asp:ListItem Value="0">Select Category</asp:ListItem>
                                     </asp:DropDownList>
                                         <asp:RequiredFieldValidator runat="server" ErrorMessage="Category Is Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                          ControlToValidate="ddlCategories" InitialValue="0"></asp:RequiredFieldValidator> 
                                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [CategoryId], [Name] FROM [Catergories]"></asp:SqlDataSource>
                                             </div>

                                 <div class="form-check">
                                     <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive" CssClass="form-check-input" />
                                 </div>
                                 <div class="form-group">
                                     <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
                                     &nbsp;
                                     <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnClear_Click" />
                                 </div>
                                 <div>
                                     <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" />
                                 </div>
                             </div>
                         </div>
                     </div>

                     <!-- Category List -->
                     <div class="col-md-6">
                         <div class="card">
                             <div class="card-header">
                                 <h5>Category List</h5>
                             </div>
                             <div class="card-block">
                                 <div class="table-responsive">
                                     <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand" OnItemDataBound="rProduct_ItemDataBound">
                                         <HeaderTemplate>
                                             <table class="table data-table-export table-hover nowrap">
                                                 <thead>
                                                     <tr>
                                                         <th class="table-plus">Name</th>
                                                         <th>Image</th>
                                                         <th>Price(₹)</th>
                                                         <th>Qty</th>
                                                         <th>Category</th>
                                                         <th>IsActive</th>
                                                         <th>Description</th>
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
                                                 <td><%# Eval("Price") %></td>
                                                 <td>
                                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>' />
                                                  </td>
                                                 <td><%# Eval("CategoryName") %></td>
                                                 <td>
                                                      <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>' />
                                                    </td>
                                                 <td><%# Eval("Description") %></td>
                                                 <td><%# Eval("CreatedDate") %></td>
                                                 <td>
                                                     <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" CommandName="edit" CausesValidation="false" CommandArgument='<%# Eval("ProductId") %>'>
                                                      <i class="ti-pencil"></i>
                                                         </asp:LinkButton>

                                                      <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete" CssClass="badge bg-danger" CausesValidation="false" CommandArgument='<%# Eval("ProductId") %>' OnClientClick="return confirm('Do you want to delete this Product  ?');">
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
