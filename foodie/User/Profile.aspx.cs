using System;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodie.User
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    // Call the method to fetch user details
                    GetUserDetails();
                }
            }
        }

        // Method to fetch user details from the database
        private void GetUserDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                // Open connection and execute the command
                con.Open();
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);

                // Check if we have data to bind to the repeater
                if (dt.Rows.Count == 1)
                {
                    // Bind user data to session
                    Session["name"] = dt.Rows[0]["Name"].ToString();
                    Session["email"] = dt.Rows[0]["Email"].ToString(); // Ensure case matches the database column name
                    Session["imageUrl"] = dt.Rows[0]["ImageUrl"].ToString();
                    Session["CreatedDate"] = dt.Rows[0]["CreatedDate"].ToString();

                    // Bind the data to the Repeater control
                    rUserProfile.DataSource = dt;
                    rUserProfile.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Log or display the error for troubleshooting
                Response.Write("<script>alert('Error fetching user details: " + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}
