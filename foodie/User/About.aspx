<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="foodie.User.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- about section -->

  <section class="about_section layout_padding">
    <div class="container  ">

      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="../TemplateFiles/images/about-img.png" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                F.A's Restaurant
              </h2>
            </div>
            <p>
             At F.A's, we are your trusted partner for all your food supply needs, offering a wide range of high-quality products, from fresh produce and dairy to premium meats and pantry staples. We work closely with farmers and distributors to ensure top-notch ingredients at competitive prices. Our mission is to provide reliable service with a focus on quality, sustainability, and customer satisfaction. Whether you're running a restaurant, cafe, or catering business, our dedicated team is here to support you with timely deliveries, personalized service, and expert advice. Let us help you create exceptional culinary experiences!
            </p>
            <a href="">
              Read More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->



</asp:Content>
