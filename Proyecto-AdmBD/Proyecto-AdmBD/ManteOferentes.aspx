<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManteOferentes.aspx.cs" Inherits="Proyecto_AdmBD.ManteOferentes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Matenimineto Oferentes</title>
           <link rel="stylesheet" href="Estilos/Mantenimientos.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvOferentes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        </div>
        <input type="text" name="CedulaOf" placeholder="Cedula" required>

        <input type="text" name="NombreOf" placeholder="Nombre">

        <input type="text" name="1ApellidoOf" placeholder="Primer Apellido">

        <input type="text" name="2ApellidoOf" placeholder="Segundo Apellido">

        <input type="text" name="CorreoOf" placeholder="Correo Electrónico">

        <input type="text" name="TelefonoOf" placeholder="Teléfono">

        <input type="text" name="Provincia" placeholder="Provincia">

        <input type="text" name="EstadoOf" placeholder="Estado">

        <input type="text" name="Servicio" placeholder="Servicio">
        <br />
        <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
        <asp:Button ID="btnCalcularP" runat="server" OnClick="btnCalcularP_Click" Text="Calcular Promedio Calificacion" />
        <asp:Label ID="lblRespu" runat="server" Text=""></asp:Label>
         <p class="signup-link"><a href="MenuAdm.aspx">VOLVER AL INICIO</a></p>
    </form>
</body>
</html>
