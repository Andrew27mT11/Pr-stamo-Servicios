<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Proyecto_AdmBD.Reportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Reportes</title>
    <link rel="stylesheet" type="text/css" href="Estilos/Estilo-Reportes.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="Reportes">
            <asp:GridView ID="gvReportes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <input type="text" name="CedulaCli" placeholder="Cedula" required><br />
            <asp:Button ID="btnBuscar" runat="server" Text="Generar" OnClick="btnBuscar_Click" /><br />
            <br />
            <asp:Label ID="lblMensaje" runat="server" Text="..."></asp:Label><br />
            <p class="signup-link"><a href="MenuCli.aspx">VOLVER AL INICIO</a></p>
        </div>
    </form>
</body>
</html>
