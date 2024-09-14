using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Codehelper
{
    public partial class ViewBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("~/Login.aspx");

            }

            if (!IsPostBack)
            {
                LoadBlogs();
            }
        }

        private void LoadBlogs()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Codehelper"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                int userId = -1;
                if (Session["Email"] != null)
                {
                    string email = Session["Email"].ToString();

                    using (SqlCommand userCmd = new SqlCommand("SELECT Id FROM [User] WHERE Email = @Email", con))
                    {
                        userCmd.Parameters.AddWithValue("@Email", email);
                        using (SqlDataReader rdr = userCmd.ExecuteReader())
                        {
                            if (rdr.Read())
                            {
                                userId = (int)rdr["Id"];
                            }
                        }
                    }
                }

                using (SqlCommand cmd = new SqlCommand("SELECT b.Id, b.Title, b.Description, b.Date, b.UserId, u.Username FROM [Blog] b JOIN [User] u ON b.UserId = u.Id ORDER BY b.Date DESC", con))
                {
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        string blogCardHtml = "";
                        while (rd.Read())
                        {
                            int id = (int)rd["Id"];
                            string title = (string)rd["Title"];
                            string description = (string)rd["Description"];
                            DateTime date = (DateTime)rd["Date"];
                            string username = (string)rd["Username"];
                            int blogUserId = (int)rd["UserId"];

                            blogCardHtml += $@"
                                <div class='twitter-card'>
                                    <div class='header flex items-center mb-4'>
                                      
                                        <div>
                                            <div class='username text-lg font-bold'>{username}</div>
                                            <div class='date text-gray-500'>{date.ToShortDateString()}</div>
                                        </div>
                                    </div>
                                    <div class='content text-gray-700'>
                                        <strong>Title:-{title}</strong><br />
                                        <p>Description:-{description}</p>
                                    </div>
                                    <div class='flex space-x-4 mt-4'>";

                    
                            if (userId == blogUserId)
                            {
                                blogCardHtml += $@"
                                    <form method='post' action='ViewBlog.aspx' onsubmit='return confirmDelete()'>
                                        <input type='hidden' name='blogId' value='{id}' />
                                        <button type='submit' name='action' value='Edit' class='editbtn bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded'>Edit</button>
                                        <button type='submit' name='action' value='Delete' class='deletebtn bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded'>Delete</button>
                                    </form>";
                            }

                            blogCardHtml += @"
                                    </div>
                                </div>";
                        }
                        blogContainer.InnerHtml = blogCardHtml;
                    }
                }
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string action = Request.Form["action"];
                if (!string.IsNullOrEmpty(action))
                {
                    int blogId = int.Parse(Request.Form["blogId"]);

                    if (action == "Edit")
                    {
                        Response.Redirect("/EditBlog.aspx?id=" + blogId);
                    }
                    else if (action == "Delete")
                    {
                        DeleteBlog(blogId);
                        Response.Redirect(Request.RawUrl);
                    }
                }
            }
        }

        private void DeleteBlog(int id)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Codehelper"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM [Blog] WHERE Id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
