using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GameStop_MS
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter sda = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void fnConnect()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(conStr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    Response.Write("Connected");
                }
                else
                {
                    Response.Write("Connection Failed");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }
        
        protected void fnInsert()
        {
            try
            {
                fnConnect();
                string img = "~/Uploads/" + FileCoverImage.FileName;
                string qry = "INSERT INTO tblGames(GameName, Genre, Description, Avlb_qty, ImageUrl, Date, Price) VALUES(@name, @genre, @desc, @qty, @url, @date, @price)";
                cmd = new SqlCommand(qry, conn);

                cmd.Parameters.AddWithValue("name", txtGameName.Text);
                cmd.Parameters.AddWithValue("genre", ddlGenre.SelectedValue);
                cmd.Parameters.AddWithValue("desc", txtDescription.Text);
                cmd.Parameters.AddWithValue("qty", txtQty.Text);
                cmd.Parameters.AddWithValue("price", txtPrice.Text);
                cmd.Parameters.AddWithValue("url", img);
                cmd.Parameters.AddWithValue("date", DateTime.Now.ToString("MM-dd-yyyy"));
                int res = cmd.ExecuteNonQuery();
                if(res>0)
                {
                    Response.Write("Inserted");
                }
                else
                {
                    Response.Write("Failed");
                }
                FileCoverImage.SaveAs(Server.MapPath(img));

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            fnInsert();
        }
    }
}