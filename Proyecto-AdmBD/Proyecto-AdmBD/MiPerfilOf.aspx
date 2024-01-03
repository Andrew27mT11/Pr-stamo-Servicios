<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MiPerfilOf.aspx.cs" Inherits="Proyecto_AdmBD.MiPerfilOf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Perfil Oferente</title>
    <link rel="stylesheet" href="Estilos/Estilo_PerfilOf.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblCedulaCli" runat="server" Text=""></asp:Label>
            <input type="text" id="txtNombreCli" runat="server" name="NombreCli" placeholder="Nombre">
            <input type="text" id="txt1ApellidoCli" runat="server" name="1ApellidoCli" placeholder="Primer Apellido">
            <input type="text" id="txt2ApellidoCli" runat="server" name="2ApellidoCli" placeholder="Segundo Apellido">
            <input type="text" id="txtCorreoCli" runat="server" name="CorreoCli" placeholder="Correo Electrónico">
            <input type="text" id="txtTelefonoCli" runat="server" name="TelefonoCli" placeholder="Teléfono">
            <input type="text" name="fechaNac" placeholder="Fecha Nacimiento">

            <select id="seleccionarOp" runat="server" onchange="filtrarDatos()">
                <option value="1">Fontanero</option>
                <option value="2">Niñera</option>
                <option value="3">Pintor</option>
                <option value="4">Empleada Doméstica</option>
            </select>

            <input type="text" id="txtProvincia" runat="server" name="Provincia" placeholder="Provincia">
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />

            <asp:Label ID="lblRespu" runat="server" Text=""></asp:Label>
             <p class="signup-link"><a href="MenuOf.aspx">VOLVER AL INICIO</a></p>
        </div>
    </form>
</body>
</html>
