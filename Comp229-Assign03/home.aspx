<%@ Page Title="" Language="C#" MasterPageFile="~/Global.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Comp229_Assign03.home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <img src="image/BannerPic.png" />
    <h3 class="margin" >Welcome to Min gI College</h3>
    <h3 class="margin" >You can add your information and add the courses with edit</h3>
&nbsp;
    
            <button class="btn btn-default" onclick="window.location.href='Course.aspx'" type="button">
                Delete Course </button>
    <button class="btn btn-default" type="button" onclick="window.location.href='Update.aspx'" type="button">
        Add Student
    </button>
&nbsp;<asp:GridView ID="GridView1"  CssClass="GridPosition" autogenerateselectbutton="True"  onselectedindexchanged="GridView1_SelectedIndexChanged" 
             runat="server"  AutoGenerateColumns="False"  Height="173px" HorizontalAlign="Center" Width="600px" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" >
                
            <AlternatingRowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True"  />
                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                <asp:BoundField DataField="FirstMidName" HeaderText="Name" />

            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        
            
        
       <div class="divider"></div>
    


</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
    </style>
</asp:Content>


