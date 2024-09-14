using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Codehelper
{
    public partial class Home : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("~/Login.aspx");
               
            }

          





        }
        protected async void btn_click(object sender, EventArgs e)
        {
            string username = Usernamefield.Value;
            if (!string.IsNullOrEmpty(username))
            {
                var userRating = await GetUserRating(username);
                if (userRating != null)
                {
                    var problems = await GetProblemsWithinRatingRange(userRating.Value - 200, userRating.Value + 200);
                    DisplayProblems(problems);
                }
                else
                {
                    Literal1.Text = "User not found or an error occurred.";
                }
            }
        }

        private async Task<int?> GetUserRating(string username)
        {
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    string url = $"https://codeforces.com/api/user.info?handles={username}";
                    HttpResponseMessage response = await client.GetAsync(url);
                    if (response.IsSuccessStatusCode)
                    {
                        dynamic result = await response.Content.ReadAsAsync<dynamic>();
                        if (result.status == "OK")
                        {
                            return result.result[0].rating;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                
                Literal1.Text = $"Error fetching user rating: {ex.Message}";
            }
            return null;
        }

        private async Task<IEnumerable<dynamic>> GetProblemsWithinRatingRange(int minRating, int maxRating)
        {
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    string url = $"https://codeforces.com/api/problemset.problems";
                    HttpResponseMessage response = await client.GetAsync(url);
                    if (response.IsSuccessStatusCode)
                    {
                        dynamic result = await response.Content.ReadAsAsync<dynamic>();
                        if (result.status == "OK")
                        {
                            var problems = result.result.problems;
                            return ((IEnumerable<dynamic>)problems).Where(p => p.rating >= minRating && p.rating <= maxRating);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
               
                Literal1.Text = $"Error fetching problems: {ex.Message}";
            }
            return null;
        }

        private void DisplayProblems(IEnumerable<dynamic> problems)
        {
            if (problems != null)
            {
                string html = "<ul class='list-disc list-inside'>";
                foreach (var problem in problems)
                {
                    string problemUrl = $"https://codeforces.com/contest/{problem.contestId}/problem/{problem.index}";
                    html += $"<li><a href='{problemUrl}' target='_blank' class='text-blue-500 hover:underline'>{problem.name} (Rating: {problem.rating})</a></li>";
                }
                html += "</ul>";
                Literal1.Text = html;
            }
            else
            {
                Literal1.Text = "No problems found in the specified rating range.";
            }
        }

        protected void DisplayProblems_Click(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            if (clickedButton != null)
            {
                string[] range = clickedButton.CommandArgument.Split('-');
                int minRating = int.Parse(range[0]);
                int maxRating = int.Parse(range[1]);



                var problems = GetProblemsWithinRatingRange(minRating, maxRating).Result;
                DisplayProblems(problems);
            }
        }
        protected void ratedproblem(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            string commandArgument = clickedButton.CommandArgument;

        
            string[] range = commandArgument.Split('-');
            int minRating = int.Parse(range[0]);
            int maxRating = int.Parse(range[1]);
            var problems = GetProblemsWithinRatingRange(minRating, maxRating).Result;
            DisplayProblems(problems);
        }

        protected void blogbtn_click(object sender, EventArgs e)
        {
           
                Response.Redirect("/CreateBlog.aspx");




        }

        protected void viewblogbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ViewBlog.aspx");
        }
    }
}