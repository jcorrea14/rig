<%@ Page Language="C#" MasterPageFile="site.master" %>
<%@ Register Src="/common/nauth/webverify.ascx" TagName="webverify" TagPrefix="jwn" %>
<asp:Content runat="server" ContentPlaceHolderID="page_content">
  <div id="content-area">
    <jwn:webverify runat="server" />
  </div>
</asp:Content>
