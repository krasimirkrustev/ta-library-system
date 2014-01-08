<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="LibrarySystem.Search" %>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="span12">
            <h1>Search Results for Query "<asp:Literal ID="LiteralQuery" runat="server"></asp:Literal>"</h1>
        </div>
    </div>
    <div class="row">
        <div class="span12">
            <ul>
                <asp:Repeater ID="RepeaterSearchResult" runat="server" ItemType="LibrarySystem.Models.Book"
                    SelectMethod="RepeaterSearchResult_GetData">
                    <ItemTemplate>
                        <li><a href="BookDetails.aspx?id=<%#: Item.Id %>"><%#: Item.Title %> by <%#: Item.Author %></a> (Category: <%#: Item.Category.Name %>)</li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</asp:Content>
