<%@ Page Title="" Language="C#" MasterPageFile="~/Global.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Comp229_Assign03.home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
        
        <label padding-top: 50px;">
            <br />
            <br />            Student List</label>
        &nbsp;<asp:GridView ID="GridView1"  autogenerateselectbutton="True"  onselectedindexchanged="GridView1_SelectedIndexChanged" 
             runat="server" AutoGenerateColumns="False"  Height="173px" HorizontalAlign="Center" Width="600px" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" >
                
            <AlternatingRowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True"  />
                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                <asp:BoundField DataField="FirstMidName" HeaderText="FirstMidName" />

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
    <div class="container margin" >
         <h3 class="margin" >Enter New Student Details</h3>
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-3">
                    <asp:Label ID="FName" runat="server" Text="Label">First Name :</asp:Label>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox ID="BoxFName" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FirstNameRequiredVal" runat="server" ErrorMessage="Fill out" ValidationGroup="InsertValidation" ControlToValidate="BoxFName" ForeColor="Red">*Must be filled out</asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-3"></div>
            </div>

            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-3">
                    <asp:Label ID="LName" runat="server" Text="Label" >Last Name :</asp:Label>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox ID="BoxLName" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="LastNameRequiredVal" runat="server" ErrorMessage="Fill out" ValidationGroup="InsertValidation" ControlToValidate="BoxLName" ForeColor="Red">*Must be filled out</asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-3"></div>
            </div>

            <div class="row " style="margin-top:2%">
                
                <div class="col-sm-4"></div>
                <div class="col-sm-2">
                     <asp:Button ID="Button1" runat="server" Text="Add Student"  CssClass="btn btn-default btn-lg bg-2" OnClick="btnDone_Click" ValidationGroup="InsertValidation" />

                </div>
            </div>
        </div>

		<div class="divider"></div>

</asp:Content>
