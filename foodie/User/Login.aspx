<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="foodie.User.Login" %>
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

    <section class="book_section layout_padding">

        <div class="container">

            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                </div>
                <h2>Login</h2>
            </div>
            <div class="row">

                <div class="col-md-6">
                    <div class="form_container">
                        <img id="userLogin" src="../images/login.jpg" alt="" class="img-thumbnail" />
                    </div>
                </div>

                    <div class="col-md-6">
                 <div class="form_container">
                     <div>
                         <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                         ErrorMessage="Username cannot be blank" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic"
                             SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator>
                         <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                         
                     </div>
                     <div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                 ErrorMessage="Password cannot be blank" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"
                         SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                    
                            </div>
                      </div>
                        <div class="btn-box">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success rounded-pill pl-5  pr-5 
                                text-white" OnClick="btnLogin_Click" />
                        </div>
                        <span class="pl-4 text-info">New user? <a href="Registration.aspx" CssClass="badge badge-info">Register Here...</a></span>
                </div>

            </div>
        </div>

    </section>

</asp:Content>
