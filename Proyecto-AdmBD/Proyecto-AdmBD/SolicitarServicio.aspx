<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SolicitarServicio.aspx.cs" Inherits="Proyecto_AdmBD.SolicitarServicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Solicitar Servicio Cliente</title>
    <link rel="stylesheet" href="Estilos/Estilo_SolicitarServ.css">

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
            <br />
            <br/>
        </div>
        <asp:DropDownList ID="ddlServicios" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlServicios_SelectedIndexChanged" Width="392px">
            <asp:ListItem Text="Seleccionar Servicio" Value=""></asp:ListItem>
            <asp:ListItem Text="Fontanero" Value="Fontanero"></asp:ListItem>
            <asp:ListItem Text="Pintor" Value="Pintor"></asp:ListItem>
            <asp:ListItem Text="Empleada Doméstica" Value="Empleada Domestica"></asp:ListItem>
            <asp:ListItem Text="Niñeras" Value="Niñera"></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="ddlProvincias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged" Width="392px">
            <asp:ListItem Text="Seleccionar Provincia" Value=""></asp:ListItem>
            <asp:ListItem Text="San José" Value="San Jose" />
            <asp:ListItem Text="Alajuela" Value="Alajuela" />
            <asp:ListItem Text="Cartago" Value="Cartago" />
            <asp:ListItem Text="Heredia" Value="Heredia" />
            <asp:ListItem Text="Guanacaste" Value="Guanacaste" />
            <asp:ListItem Text="Puntarenas" Value="Puntarenas" />
            <asp:ListItem Text="Limón" Value="Limon" />
        </asp:DropDownList>
         <br/>
         <br/>
        <asp:TextBox ID="txtCedulaCli" runat="server" placeholder="Cedula Cliente" required ></asp:TextBox>
        <asp:TextBox ID="txtCedulaOf" runat="server" placeholder="Cedula Oferente" required></asp:TextBox>
        <asp:TextBox ID="txtMensaje" runat="server" placeholder="Mensaje" required Width="365px"></asp:TextBox>
        <br/>
         <br/>
        
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar Solicitud" OnClick="btnEnviar_Click" />
        <asp:Label ID="lblRespu" runat="server" Text=""></asp:Label>
        <p class="signup-link"><a href="MenuCli.aspx">VOLVER AL INICIO</a></p>
    </form>
</body>
</html>
