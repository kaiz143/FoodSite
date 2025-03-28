<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="foodie.User.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="alig-self-end">
                    <asp:Label ID="lblMsg" runat="server" visible="false"></asp:Label>
                </div>
                 <h2>Your Shopping Cart
 </h2> 
            </div>
        </div>
    </section>

</asp:Content>
