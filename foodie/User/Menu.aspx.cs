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

        //public string LowerCase(object obj)
        //{
        //    return obj.ToString().ToLower();
        //}

    }
}