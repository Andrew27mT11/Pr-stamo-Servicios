<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManteClientes.aspx.cs" Inherits="Proyecto_AdmBD.ManteClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Matenimineto Clientes</title>
       <link rel="stylesheet" href="Estilos/Mantenimientos.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvClientes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        <input type="text" name="CedulaCli" placeholder="Cedula" required>

        <input type="text" name="NombreCli" placeholder="Nombre">

        <input type="text" name="1ApellidoCli" placeholder="Primer Apellido">

        <input type="text" name="2ApellidoCli" placeholder="Segundo Apellido">

        <input type="text" name="CorreoCli" placeholder="Correo Electrónico">

        <input type="text" name="TelefonoCli" placeholder="Teléfono">

        <input type="text" name="EstadoCli" placeholder="Estado">

        <input type="text" name="fechaNac" placeholder="Fecha Nacimiento">
        <br />
        <asp:Label ID="lblRespu" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
        <asp:Button ID="btnCalcularPC" runat="server" OnClick="btnCalcularPC_Click" Text="Calcular Promedio Calificacion" />
         <p class="signup-link"><a href="MenuAdm.aspx">VOLVER AL INICIO</a></p>
    </form>
</body>
</html>
