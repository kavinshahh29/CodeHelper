using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Codehelper
{
    public partial class Login : System.Web.UI.Page { 


        SqlConnection con = new SqlConnection();
         protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_submit(object sender, EventArgs e)
        {
            try
            {
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["Codehelper"].ConnectionString;
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.Connection = con;
                cmd.CommandText = "select Email, Password from [User] where Email=@Email and Password=@Password";
                cmd.Parameters.AddWithValue("@Email", emailtextbox.Text);
                cmd.Parameters.AddWithValue("@Password", passtextbox.Text);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    Session["Email"] = emailtextbox.Text;
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                   
                    string script = "showToast('Invalid Credentials', 'error');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ShowToast", script, true);
                }
            }
            catch (Exception ex)
            {
                
                string script = $"showToast('{ex.Message}', 'error');";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowToast", script, true);
            }
            finally
            {
                con.Close();
            }



        }

        }
    }



