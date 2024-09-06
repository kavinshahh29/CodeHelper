using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Codehelper
{
    public partial class Signup : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void signup_submit(object sender, EventArgs e)
        {
            

            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Codehelper"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select username from [User] where username=@Username OR email=@Email";
            cmd.Parameters.AddWithValue("@Username", nametextbox.Text);
            cmd.Parameters.AddWithValue("@Email", emailtextbox.Text);
            SqlDataReader reader = cmd.ExecuteReader();
           
            if (reader.HasRows)
            {
                Response.Write("User Already Exist!!!!!!!!!!!!!!!!!!!!!!");
                con.Close();

            }
            else
            {
                con.Close();
                con.Open();

                cmd.CommandText = "Insert into [User] (Username,Email,Password) values (@Usernamee,@Emaill,@Password)";
                cmd.Parameters.AddWithValue("@Usernamee", nametextbox.Text);
                cmd.Parameters.AddWithValue("@Emaill", emailtextbox.Text);
                cmd.Parameters.AddWithValue("@Password", passtextbox.Text);
                cmd.ExecuteNonQuery();
                con.Close();
               
                Response.Redirect("/Login.aspx");

            }

            

        }
    }
}