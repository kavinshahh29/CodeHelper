using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Codehelper
{
    public partial class EditBlog : System.Web.UI.Page
    {
        protected int blogId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

           
            if (!int.TryParse(Request.QueryString["id"], out blogId))
            {
                Response.Redirect("~/ViewBlog.aspx");
            }

            if (!IsPostBack)
            {
                
                LoadBlogDetails();
            }
        }

        private void LoadBlogDetails()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Codehelper"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT Title, Description FROM [Blog] WHERE Id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", blogId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtTitle.Text = reader["Title"].ToString();
                            txtDescription.Text = reader["Description"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string newTitle = txtTitle.Text.Trim();
            string newDescription = txtDescription.Text.Trim();

            string connectionString = WebConfigurationManager.ConnectionStrings["Codehelper"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE [Blog] SET Title = @Title, Description = @Description WHERE Id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Title", newTitle);
                    cmd.Parameters.AddWithValue("@Description", newDescription);
                    cmd.Parameters.AddWithValue("@Id", blogId);

                    cmd.ExecuteNonQuery();
                }
            }
         
            Response.Redirect("~/ViewBlog.aspx");
        }
    }
}
