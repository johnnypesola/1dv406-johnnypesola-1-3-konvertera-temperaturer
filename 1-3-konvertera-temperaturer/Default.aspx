<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_1_3_konvertera_temperaturer.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>1-3-konvertera-temperaturer</title>

    <%: Styles.Render("~/Content/styles") %>
    <%: Scripts.Render("~/Content/javascript") %>

</head>
<body>
    <form id="form1" runat="server" defaultbutton="SubmitButton">
    <div>
        <h1>Konvertera temperaturer</h1>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error-message" />
        
        <div>
            <asp:Label ID="StartTempLabel" runat="server" Text="Starttemperatur" /><br />
            <asp:TextBox ID="StartTempTextbox" runat="server" />

            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Starttemperaturen måste vara ett heltal" Type="Integer" ControlToValidate="StartTempTextbox" Operator="DataTypeCheck" Display="None"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fyll i en starttemperatur" ControlToValidate="StartTempTextbox"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:Label ID="EndTempLabel" runat="server" Text="Sluttemperatur" /><br />
            <asp:TextBox ID="EndTempTextbox" runat="server" />
            
            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Sluttemperaturen måste vara ett heltal" ControlToValidate="EndTempTextbox" Operator="DataTypeCheck" Type="Integer" Display="None"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fyll i sluttemperaturen" ControlToValidate="EndTempTextbox"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:Label ID="TempStepLabel" runat="server" Text="Temperatursteg" /><br />
            <asp:TextBox ID="TempStepTextbox" runat="server" />
            
            <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Temperatursteget måste vara ett heltal. " ControlToValidate="TempStepTextbox" Type="Integer" Operator="DataTypeCheck" Display="None"></asp:CompareValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Värde får vara max 100 och minst 1" ControlToValidate="TempStepTextbox" MinimumValue="1" MaximumValue="100" Display="Dynamic"></asp:RangeValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Fyll i ett temperatursteg" ControlToValidate="TempStepTextbox"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:RadioButton ID="CtoFConversionRadioButton" runat="server" GroupName="ConversionRadioGroup" Checked="True" /><asp:Label ID="CtoFConversionLabel" runat="server" Text="Celcius till Fahrenheit" /><br />
            <asp:RadioButton ID="FtoCConversionRadioButton" runat="server" GroupName="ConversionRadioGroup" /><asp:Label ID="FtoCConversionLabel" runat="server" Text="Fahrenheit till Celcius" />
        </div>

        <asp:Button ID="SubmitButton" runat="server" Text="Konvertera" />
    </div>
    </form>
</body>
</html>
