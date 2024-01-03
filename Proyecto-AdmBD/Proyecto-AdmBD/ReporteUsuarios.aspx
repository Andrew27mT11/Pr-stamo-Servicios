<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteUsuarios.aspx.cs" Inherits="Proyecto_AdmBD.ReporteUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Estilos/Estilo-ReportesUsu.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Reportes">
            <asp:GridView ID="gvReporte" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
            <p class="signup-link"><a href="MenuAdm.aspx">VOLVER AL INICIO</a></p>
        </div>
    </form>
</body>
</html>
