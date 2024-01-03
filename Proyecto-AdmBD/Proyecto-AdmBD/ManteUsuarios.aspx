<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManteUsuarios.aspx.cs" Inherits="Proyecto_AdmBD.ManteUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Mantenimineto Usuarios</title>
           <link rel="stylesheet" href="Estilos/Mante_Usuarios.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:GridView ID="gvUsuarios" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        <%--        <input type="text" name="IdUsu" placeholder="Id Usuarios" required>--%>
        <input type="text" name="cedula" placeholder="Cedula" required>
        <input type="text" name="NombreUsu" placeholder="Nombre Usuario">
        <input type="password" name="contraA" placeholder="Contraseña Antigua">
        <input type="password" name="contraN" placeholder="Contraseña Nueva">
        <input type="password" name="contraNV" placeholder="Contraseñas Iguales">
        
        <div>
            <label for="cedulaAd">Administrador</label>
            <input type="checkbox" name="cedulaAd" placeholder="Administrador">
        </div>

        <div>
            <label for="cedulaCl">Cliente</label>
             <input type="checkbox" name="cedulaCl" placeholder="Cliente">
        </div>

         <div>
             <label for="cedulaOf">Oferente</label>
             <input type="checkbox" name="cedulaOf" placeholder="Oferente">
         </div>


        <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
        <p class="signup-link"><a href="MenuAdm.aspx">VOLVER AL INICIO</a></p>
    </form>
</body>
</html>
