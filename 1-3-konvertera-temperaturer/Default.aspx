<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_1_3_konvertera_temperaturer.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>1-3-konvertera-temperaturer</title>

    <%: Styles.Render("~/Content/styles") %>
    <%: Scripts.Render("~/Content/javascript") %>

</head>
<body>
    <form id="form1" runat="server" defaultbutton="SubmitButton">
        <h1>Konvertera temperaturer</h1>
        <div id="input">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error-message" HeaderText="Fel inträffade. Åtgärda felen och försök igen." />
        
            <div>
                <asp:Label ID="StartTempLabel" runat="server" Text="Starttemperatur" /><br />
                <asp:TextBox ID="StartTempTextbox" runat="server" />

                <asp:CompareValidator ID="StartTempTypeValidator" runat="server" ErrorMessage="Starttemperaturen måste vara ett heltal" Type="Integer" ControlToValidate="StartTempTextbox" Operator="DataTypeCheck" Display="None"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="StartTempRequired" runat="server" ErrorMessage="Fyll i en starttemperatur" ControlToValidate="StartTempTextbox" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="EndTempLabel" runat="server" Text="Sluttemperatur" /><br />
                <asp:TextBox ID="EndTempTextbox" runat="server" />
            
                <asp:CompareValidator ID="EndTempTypeValidator" runat="server" ErrorMessage="Sluttemperaturen måste vara ett heltal" ControlToValidate="EndTempTextbox" Operator="DataTypeCheck" Type="Integer" Display="None"></asp:CompareValidator>
                <asp:CompareValidator ID="EndTempValueValidator" runat="server" ErrorMessage="Sluttemperaturen måste vara högre än Starttemperaturen" ControlToValidate="EndTempTextbox" ControlToCompare="StartTempTextbox" Type="Integer" Display="None" Operator="GreaterThan"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="EndTempRequired" runat="server" ErrorMessage="Fyll i sluttemperaturen" ControlToValidate="EndTempTextbox" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="TempStepLabel" runat="server" Text="Temperatursteg" /><br />
                <asp:TextBox ID="TempStepTextbox" runat="server" />
            
                <asp:CompareValidator ID="TempStepTypeValidator" runat="server" ErrorMessage="Temperatursteget måste vara ett heltal. " ControlToValidate="TempStepTextbox" Type="Integer" Operator="DataTypeCheck" Display="None"></asp:CompareValidator>
                <asp:RangeValidator ID="TempStepRangeValidator" runat="server" ErrorMessage="Värde får vara max 100 och minst 1" ControlToValidate="TempStepTextbox" MinimumValue="1" MaximumValue="100" Display="None" Type="Integer"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="TempStepRequired" runat="server" ErrorMessage="Fyll i ett temperatursteg" ControlToValidate="TempStepTextbox" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:RadioButtonList ID="ConversionRadioButtonList" runat="server">
                    <asp:ListItem Text="Celcius till Fahrenheit" Value="CtoF" Selected="True" />
                    <asp:ListItem Text="Fahrenheit till Celcius" Value="FtoC" />
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="ConversionRequired" runat="server" ErrorMessage="Var god fyll ange konverteringstyp" ControlToValidate="ConversionRadioButtonList" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="SubmitButton" runat="server" Text="Konvertera" OnClick="SubmitButton_Click" />
        </div>
        <div id="output">
            <asp:Table ID="OutputTable" runat="server" Visible="False"></asp:Table>
        </div>
    </form>
</body>
</html>
