using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Course : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Comp229Assign03ConnectionString"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {

            SqlCommand comm = new SqlCommand("select  e.CourseID, e.EnrollmentID, e.StudentID, c.Title, e.Grade, s.FirstMidName from Enrollments e JOIN Students s on(e.StudentID = s.StudentID) JOIN Courses c on( e.CourseID=c.CourseID ) order by c.CourseID", conn);
            
            conn.Open();
            SqlDataReader reader = comm.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            reader.Close();
            conn.Close();
           
        }

        

        protected void DeleteEnroll(string enrolmentID)
        {
            
            SqlCommand DEnrollment = new SqlCommand("delete from Enrollments WHERE EnrollmentID=@EnrollmentID", conn);

            DEnrollment.Parameters.Add("@EnrollmentID", System.Data.SqlDbType.Int);
            DEnrollment.Parameters["@EnrollmentID"].Value = Convert.ToInt32(enrolmentID);
            
            conn.Open();
            DEnrollment.ExecuteNonQuery();
            conn.Close();
            
        }

        protected void course_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string enroll = row.Cells[1].Text;
            DeleteEnroll(enroll);
        }
    }
}