using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Student : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Comp229Assign03ConnectionString"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            
            int StudentID = Convert.ToInt32(Request.QueryString["Name"]);

            
            SqlCommand comm = new SqlCommand("SELECT a.StudentID, a.LastName, a.FirstMidName, b.CourseID, b.Title, b.Credits FROM Students a JOIN Enrollments e on(a.StudentID = e.StudentID) JOIN Courses b ON(e.CourseID = b.CourseID) where a.StudentID = @StudentID", conn);
            comm.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            comm.Parameters["@StudentID"].Value = StudentID;
            conn.Open();
            SqlDataReader reader = comm.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            reader.Close();
            conn.Close();


        }

        protected void Delete()
        {
            SqlCommand DEnrollment = new SqlCommand("DELETE FROM Enrollments WHERE StudentID=@StudentID", conn);
            SqlCommand DStudent = new SqlCommand("DELETE FROM Students WHERE StudentID=@StudentID", conn);

            DEnrollment.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            DEnrollment.Parameters["@StudentID"].Value = Convert.ToInt32(Request.QueryString["Name"]);


            DStudent.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            DStudent.Parameters["@StudentID"].Value = Convert.ToInt32(Request.QueryString["Name"]);
            
            conn.Open();
            DEnrollment.ExecuteNonQuery();
            DStudent.ExecuteNonQuery();
            Response.Redirect("home.aspx");
            conn.Close();
            
        }
        protected void Update(string lastName, string firstMidName)
        {
            SqlCommand upd = new SqlCommand("UPDATE Students SET FirstMidName=@FirstMidName, LastName=@LastName WHERE StudentID=@StudentID", conn);

            upd.Parameters.Add("@FirstMidName", System.Data.SqlDbType.VarChar);
            upd.Parameters["@FirstMidName"].Value = firstMidName;
            
            upd.Parameters.Add("@LastName", System.Data.SqlDbType.VarChar);
            upd.Parameters["@LastName"].Value = lastName;
         
            upd.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            upd.Parameters["@StudentID"].Value = Convert.ToInt32(Request.QueryString["Name"]);


                conn.Open();
                upd.ExecuteNonQuery();
                Response.Redirect("home.aspx");
                conn.Close();
            
        }


        
        protected void StudentGridView_RowCancelingEdit(Object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Response.Redirect("Student.aspx");

        }
        protected void StudentGridView_RowEditing(Object sender, GridViewEditEventArgs e)
        {
            
            GridView1.EditIndex = e.NewEditIndex;
            Response.Redirect("Student.aspx");

        }
        protected void Student_GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string lastName = ((TextBox)(row.Cells[2].Controls[0])).Text;
            string firstMidName = ((TextBox)(row.Cells[3].Controls[0])).Text;
            Update(lastName, firstMidName);

            GridView1.EditIndex = -1;
            

        }
        protected void Student_GridView_RowUpdated(Object sender, GridViewUpdatedEventArgs e)
        {
            Response.Redirect("Student.aspx");
        }
        protected void student_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Delete();
        }

    }
}