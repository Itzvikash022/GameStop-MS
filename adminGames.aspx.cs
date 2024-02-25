using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Caching;

namespace GameStop_MS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        public static int gameId;
        protected void Page_Load(object sender, EventArgs e)
        {
            //gdGamesList.DataBind();
        }

        public void fnConnect()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(conStr);

                if(conn.State != ConnectionState.Open)
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
        protected void gdGamesList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectRow")
            {
                int gameId = Convert.ToInt32(e.CommandArgument);
                Session["gameId"] = gameId;
                Response.Redirect("~/adminGameForm.aspx");
            }

            if(e.CommandName == "DeleteRow")
            {
                gameId = Convert.ToInt32(e.CommandArgument);
                fnDelete();
            }
        }

        protected void fnDelete()
        {
            try
            {
                fnConnect();
                string qry = "DELETE FROM tblGames WHERE GameId = @gameId";

                cmd = new SqlCommand(qry,conn);
                cmd.Parameters.AddWithValue("gameId", gameId);
                int res = cmd.ExecuteNonQuery();
                if(res>0) 
                {
                    lblStatus.Text = "Game Data Deleted";
                }
                else
                {
                    lblStatus.Text = "Game Data failed to Delete";
                }
                gdGamesList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text= ex.ToString();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminGameForm.aspx");
        }

    }
}