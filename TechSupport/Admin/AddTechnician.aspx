<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="AddTechnician.aspx.cs" Inherits="TechSupport.Admin.AddNewMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 58px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <hr />
    <p>

    </p>
    <div style="width: 293px; margin-left: auto; margin-right: auto;">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
       <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
           <WizardSteps>
               <asp:CreateUserWizardStep runat="server" >
                   <ContentTemplate>
                       <table>
                           <tr>
                               <td align="center" colspan="2" class="auto-style2"><strong>Sign Up for a new Technician account</strong></td>
                           </tr>
                           <tr>
                               <td align="right">
                                   <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                           <tr>
                               <td align="right">
                                   <asp:Label ID="LabelName" runat="server" AssociatedControlID="Name">Name</asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="NameRequired" runat="server" ControlToValidate="Name" ErrorMessage="Name is required." ToolTip="Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                            <tr>
                               <td align="right">
                                   <asp:Label ID="LabelPhone" runat="server" AssociatedControlID="Phone">Phone</asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="Phone" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ControlToValidate="Phone" ErrorMessage="Phone is required." ToolTip="Phone is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                            <tr>
                               <td align="right">
                                   <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               </td>
                           </tr>

                            <tr>
                               <td align="right">
                                   <asp:Label ID="TechType" runat="server" AssociatedControlID="Email">Tech Type:</asp:Label>
                               </td>
                               <td>
                                   <asp:DropDownList ID="TextBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TypeName" DataValueField="TypeName"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT [TypeName] FROM [TechTypes]"></asp:SqlDataSource>
                                 <%--  <asp:RequiredFieldValidator ID="TechTypeRequired" runat="server" ControlToValidate="TechType" ErrorMessage="TechType is required." ToolTip="TechType is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>--%>
                               </td>
                           </tr>
                           
                           <tr>
                               <td align="right">
                                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" InsertCommand="INSERT INTO Technicians(TechID, Name, Email, Phone, TypeID) VALUES (@TechID, @Name, @Email,@Phone, @TypeID)" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT Technicians.TechID AS Expr1, Technicians.Email AS Expr2, Technicians.Name AS Expr3, Technicians.*, TechTypes.* FROM Technicians INNER JOIN TechTypes ON Technicians.TypeID = TechTypes.TypeID">
                                       <InsertParameters>
                                           <asp:ControlParameter ControlID="UserName" Name="TechID" PropertyName="Text" />
                                           <asp:ControlParameter ControlID="Name" Name="Name" PropertyName="Text" />
                                           <asp:ControlParameter ControlID="Email" Name="Email" PropertyName="Text" />
                                           <asp:ControlParameter ControlID="Phone" Name="Phone" PropertyName="Text" />
                                           <asp:ControlParameter ControlID="TechType" Name="TypeID" PropertyName="Text" />
                                       </InsertParameters>
                                   </asp:SqlDataSource>
                               </td>
                               <td>&nbsp;</td>
                           </tr>
                           <tr>
                               <td align="right">
                                   <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                           <tr>
                               <td align="right">
                                   <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                          
                           <tr>
                               <td align="right">&nbsp;</td>
                               <td>&nbsp;</td>
                           </tr>
                          
                           <tr>
                               <td align="right">
                                   <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                           <tr>
                               <td align="right">
                                   <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                           <tr>
                               <td align="center" colspan="2">
                                   <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                               </td>
                           </tr>
                           <tr>
                               <td align="center" colspan="2" style="color:Red;">
                                   <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                               </td>
                           </tr>
                           <tr>
                               <td align="center" colspan="2" style="color: Red;">&nbsp;</td>
                           </tr>
                       </table>
                   </ContentTemplate>
                   <CustomNavigationTemplate>
                       <table border="0" cellspacing="5" style="width:100%;height:100%;">
                           <tr align="center">
                               <td align="center" colspan="0">
                                   <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Create User" ValidationGroup="CreateUserWizard1" />
                               </td>
                           </tr>
                       </table>
                   </CustomNavigationTemplate>
               </asp:CreateUserWizardStep>
               <asp:CompleteWizardStep runat="server" >
                   <ContentTemplate>
                       <table>
                           <tr>
                               <td align="center" colspan="2">Complete</td>
                           </tr>
                           <tr>
                               <td>Your account has been successfully created.</td>
                           </tr>
                           <tr>
                               <td align="center" colspan="2">
                                   <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" />
                               </td>
                           </tr>
                       </table>
                   </ContentTemplate>
               </asp:CompleteWizardStep>
           </WizardSteps>
       </asp:CreateUserWizard>
    </div>          
   
</asp:Content>
