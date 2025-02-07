﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="foodie.User.Registration" %>
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
        var imgCategory = document.getElementById('<%= imgUser.ClientID %>');
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

    <section class="book_section layout_padding">
  <div class="container">
    <div class="heading_container">
      <div class="align-self-end">
        <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
      </div>
      <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form_container">

                <div>
                   
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is Required" ForeColor="Red"
                        ControlToValidate="txtName" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name Must Contain Characters Only"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"
                        ControlToValidate="txtName"></asp:RegularExpressionValidator>
                     <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name"
                        ToolTip="Full Name"></asp:TextBox>
                </div>

                <div>
                
                 <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is Required" ForeColor="Red"
                      ControlToValidate="txtUsername" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                         <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"
                         ToolTip="Username"></asp:TextBox>
                    </div>

                <div>
                 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is Required" ForeColor="Red"
                  ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>  
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"
                     ToolTip="Email" TextMode="Email"></asp:TextBox>
                     </div>

                    <div>
                   
                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Mobile Number is Required" ForeColor="Red"
                        ControlToValidate="txtMobile" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Mobile Number Must Contain 10 Digits Only"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$"
                        ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                         <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"
                             ToolTip="Mobile Number" TextMode="Number"></asp:TextBox>
                </div>

            </div>
        </div>




         <div class="col-md-6">
     <div class="form_container">
           <div>
      <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is Required" ForeColor="Red"
          ControlToValidate="txtAddress" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Full Address"
      ToolTip="Address" TextMode="MultiLine"></asp:TextBox>
      
  </div>

  <div>
  
   <asp:RequiredFieldValidator ID="rfvPostCode" runat="server" ErrorMessage="Post/Zip Code is Required" ForeColor="Red"
        ControlToValidate="txtPostCode" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator ID="revPostCode" runat="server" ErrorMessage="Post/Zip Code Must be of 6 Digits Only"
     ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{6}$"
     ControlToValidate="txtPostCode"></asp:RegularExpressionValidator>
     <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Enter Post/Zip Code"
    ToolTip="Post/Zip Code" TextMode="Number"></asp:TextBox>
      </div>

  <div>
   <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image" onchange="ImagePreview(this);" />   
       </div>

                  <div>
      
      <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is Required" ForeColor="Red"
          ControlToValidate="txtPassword" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                      <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password"
             ToolTip="Password" TextMode="Password"></asp:TextBox>
      
  </div>
     </div>
 </div>
        <div class="row pl-4">
  <div class="btn_box">
    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
        OnClick="btnRegister_Click"
        />
    <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
               Text="Already registered? <a href='Login.aspx' class='badge badge-info'>Login here..</a>"/>
  </div>
</div>

<div class="row p-5">
  <div style="align-items:center">
    <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
  </div>
</div>

    </div>
  </div>
</section>

</asp:Content>
