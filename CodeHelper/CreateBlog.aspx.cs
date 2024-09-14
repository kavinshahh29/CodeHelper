using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Codehelper
{
    public partial class CreateBlog : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("~/Login.aspx");

            }

        }

        protected void createbtn_Click(object sender, EventArgs e)
        {
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Codehelper"].ConnectionString;

            if (Session["Email"] != null)
            {
                string email = Session["Email"].ToString();
                SqlCommand cmd = new SqlCommand("SELECT Id FROM [User] WHERE Email = @Email", con);
                cmd.Parameters.AddWithValue("@Email", email);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                con.Open();
                adapter.Fill(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    int userId = Convert.ToInt32(dt.Rows[0]["Id"]);

                    cmd = new SqlCommand("Insert into [Blog] (Description, Title, Date, UserId) values (@Description, @Title, @Date, @userid)", con);
                    cmd.Parameters.AddWithValue("@Description", desctextbox.Text);
                    cmd.Parameters.AddWithValue("@Title", titletextbox.Text);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Today);
                    cmd.Parameters.AddWithValue("@userid", userId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("/ViewBlog.aspx");
                }
                else
                {
                    Response.Write("User not found.");
                }
            }
        }
    }
}
