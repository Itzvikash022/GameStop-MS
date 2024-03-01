using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStop_MS
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter sda = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Session["gameId"] != null)
                {
                    //Response.Write(Session["gameId"]);
                    fnPopulate();
                }
            }
            
        }

        public void fnConnectDb()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(conStr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    //Response.Write("Connected");
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
        
        protected void fnPopulate()
        {
            fnConnectDb();
            string qry = "SELECT * FROM tblGames WHERE GameId = @gid";
            cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("gid", Session["gameId"]);
            SqlDataReader dr = cmd.ExecuteReader();

            if(dr.Read())
            {
                txtGameName.Text = dr["GameName"].ToString();
                txtPublisher.Text = dr["Publisher"].ToString();
                txtReleaseDate.Text = dr["ReleaseDate"].ToString();
                ddlGenre.SelectedValue = dr["Genre"].ToString();
                txtVersion.Text = dr["Version"].ToString();
                txtPrice.Text = dr["Price"].ToString();
                txtQty.Text = dr["Avlb_qty"].ToString();
                txtDescription.Text = dr["Description"].ToString();
            }
            conn.Close();
        }

        protected void fnInsert()
        {
            try
            {
                fnConnectDb();
                string img = "~/Uploads/" + fileCoverImage.FileName;
                string qry = "INSERT INTO tblGames(GameName, Genre, Description, Avlb_qty, ImageUrl, Date, Price, ReleaseDate, Version, Publisher) VALUES(@name, @genre, @desc, @qty, @url, @date, @price, @release, @ver, @pub)";
                cmd = new SqlCommand(qry, conn);

                cmd.Parameters.AddWithValue("name", txtGameName.Text);
                cmd.Parameters.AddWithValue("genre", ddlGenre.SelectedValue);
                cmd.Parameters.AddWithValue("desc", txtDescription.Text);
                cmd.Parameters.AddWithValue("qty", txtQty.Text);
                cmd.Parameters.AddWithValue("price", txtPrice.Text);
                cmd.Parameters.AddWithValue("url", img);
                cmd.Parameters.AddWithValue("date", DateTime.Now.ToString("MM-dd-yyyy"));
                cmd.Parameters.AddWithValue("ver", txtVersion.Text);
                cmd.Parameters.AddWithValue("release", txtReleaseDate.Text);
                cmd.Parameters.AddWithValue("pub", txtPublisher.Text);

                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblStatus.Text = "New Game Added.";
                }
                else
                {
                    lblStatus.Text = "Failed to Add a New Game.";
                }
                fileCoverImage.SaveAs(Server.MapPath(img));

                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text =  ex.ToString();
            }
        }

        protected void fnUpdate()
        {
            try
            {
                fnConnectDb();
                string qry = "UPDATE tblGames SET GameName = @name, Genre = @genre, Description = @desc, Avlb_qty = @qty, Price = @price, Version = @ver, Publisher = @pub, ReleaseDate = @release  WHERE GameId = @game_id";
                cmd = new SqlCommand(qry, conn);

                cmd.Parameters.AddWithValue("name", txtGameName.Text);
                cmd.Parameters.AddWithValue("genre", ddlGenre.SelectedValue);
                cmd.Parameters.AddWithValue("desc", txtDescription.Text);
                cmd.Parameters.AddWithValue("qty", txtQty.Text);
                cmd.Parameters.AddWithValue("price", txtPrice.Text);
                cmd.Parameters.AddWithValue("ver", txtVersion.Text);
                cmd.Parameters.AddWithValue("release", txtReleaseDate.Text);
                cmd.Parameters.AddWithValue("pub", txtPublisher.Text);
                cmd.Parameters.AddWithValue("game_id", Session["gameId"]);

                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblStatus.Text = "Game Updated.";
                    //Session["gameId"] = null;
                }
                else
                {
                    lblStatus.Text = "Failed to Update the Game.";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            fnInsert();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtDescription.Text = string.Empty;
            txtQty.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtVersion.Text = string.Empty;
           // txtReleaseDate.Text = string.Empty;
            txtPublisher.Text = string.Empty;
            ddlGenre.ClearSelection();
            txtGameName.Text = string.Empty;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            fnUpdate();
            fnPopulate();
        }
    }
}