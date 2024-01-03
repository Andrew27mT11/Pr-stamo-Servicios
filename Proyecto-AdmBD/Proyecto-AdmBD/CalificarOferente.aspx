<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalificarOferente.aspx.cs" Inherits="Proyecto_AdmBD.CalificarOferente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Calificar Oferente</title>
    <link rel="stylesheet" href="Estilos/Estilo_CalificarOf.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvServicios" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        <div>
            <br />

            <asp:TextBox ID="txtCedulaOf" runat="server" placeholder="Cedula Oferente"></asp:TextBox>
            <asp:TextBox ID="txtMensaje" runat="server" placeholder="Numero de Mensaje"></asp:TextBox>
            <asp:DropDownList ID="ddlCalificacion" runat="server"></asp:DropDownList>
            <asp:Button ID="btnCalificar" runat="server" Text="Calificar" OnClick="btnCalificar_Click" />
            <asp:Label ID="lblRespu" runat="server" Text=""></asp:Label>
             <p class="signup-link"><a href="MenuCli.aspx">VOLVER AL INICIO</a></p>
        </div>
    </form>
</body>
</html>
