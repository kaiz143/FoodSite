using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using foodie.Admin;

namespace foodie.User
{
    public partial class Menu : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getCatogeries();
                getProducts();
            }
        }


        private void getCatogeries()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Category_Crud", con);

            cmd.Parameters.AddWithValue("@Action", "ACTIVECAT");
           cmd.CommandType = CommandType.StoredProcedure;

           sda = new SqlDataAdapter(cmd);
           dt = new DataTable();

           sda.Fill(dt);
           rCategory.DataSource = dt;
           rCategory.DataBind();
        }


        private void getProducts()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Product_Crud", con);

            cmd.Parameters.AddWithValue("@Action", "ACTIVEPROD");
            cmd.CommandType = CommandType.StoredProcedure;

            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();

            sda.Fill(dt);
            rProducts.DataSource = dt;
            rProducts.DataBind();
        }

        protected void rProducts_ItemCommand()
        {

        }

        protected void rCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           
        }

        protected void rProducts_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (Session["UserId"] != null)
            {
                bool isCartItemUpdated = false;
                int i = isItemExistInCart(Convert.ToInt32(e.CommandArgument));
                if(i == 0)
                {

                    //ADDING NEW ITEM IN CART
                    con = new SqlConnection(Connection.GetConnectionString());
                    cmd = new SqlCommand("Cart_Crud", con);

                    cmd.Parameters.AddWithValue("@Action", "INSERT");
                    cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                    cmd.Parameters.AddWithValue("@Quantity", 1);
                    cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);

                    cmd.CommandType = CommandType.StoredProcedure;

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch(Exception ex)
                    {

                        Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
                    }
                    finally
                    {
                        con.Close();
                    }

                }
                else
                {
                    //Adding Existing items intob Cart 
                    Utils utils = new Utils();
                    isCartItemUpdated = utils.updateCartQuantity(i + 1, Convert.ToInt32(e.CommandArgument),
                        Convert.ToInt32(Session["UserId"]));

                    lblMsg.Visible = true;
                    lblMsg.Text = "Item Added Successfully in your Cart !";
                    lblMsg.CssClass = "alert alert-success";
                    Response.AddHeader("REFRESH", "1;URL=Cart.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        int isItemExistInCart(int productId)
        {

            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", con);

            cmd.Parameters.AddWithValue("@Action", "GETBYID");
            cmd.Parameters.AddWithValue("@ProductId", productId);
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
            cmd.CommandType = CommandType.StoredProcedure;

            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();

            sda.Fill(dt);

            int Quantity = 0;
            if (dt.Rows.Count > 0)
            {
                Quantity = Convert.ToInt32(dt.Rows[0]["Quantity"]);
            }
            return Quantity;
        }

        //public string LowerCase(object obj)
        //{
        //    return obj.ToString().ToLower();
        //}

    }
}