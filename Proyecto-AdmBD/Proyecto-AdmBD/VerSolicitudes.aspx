<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerSolicitudes.aspx.cs" Inherits="Proyecto_AdmBD.VerSolicitudes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ver Solicitudes</title>
    <link rel="stylesheet" href="Estilos/Estilo_VerSoli.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvSolicitudes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <div>
            <p>Aceptar o Rechazar Solicitudes de Servicios</p>
            <asp:TextBox ID="txtSoli" runat="server" placeholder="Numero de Mensaje"></asp:TextBox>
            <asp:Label ID="lblRespu" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" />
            <asp:Button ID="btnRechazar" runat="server" Text="Rechazar" OnClick="btnRechazar_Click" />
            <p class="signup-link"><a href="MenuOf.aspx">VOLVER AL INICIO</a></p>
        </div>
    </form>
</body>
</html>
