<%@ Page
    MasterPageFile="/master/public.master"
    Title="Contact Us | Rig Locator"
    CodeFile="contact.aspx.cs"
    Inherits="Contact"
    Language="C#"
    %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<asp:Content runat="server" ContentPlaceHolderID="page_content">
    <section class="mainContent contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Contact Us</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <p> We welcome any feedback, questions or ideas you have regarding <em>Rig Locator</em>. Please select the appropriate department you would like to contact and complete the form below. You should receive a response within two business days. </p>
                    <p> If you would like a response sooner, please feel free to contact us at either one of our Edmonton or Calgary office locations. </p>
                    <div>
                        <div class="errormsg">
                            <asp:ValidationSummary id="errormessages" runat="server"
                             ValidationGroup="feedbackgroup" />
                        </div>
                        <div class="contact-line">
                            <div class="label"> To: </div>
                            <div class="contact-input">
                                <asp:DropDownList runat="server" id="dept">
                                    <asp:ListItem>Editor</asp:ListItem>
                                    <asp:ListItem>Sales</asp:ListItem>
                                    <asp:ListItem>Web Master</asp:ListItem>
                                    <asp:ListItem>General</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="contact-line">
                            <div class="label"> Name*:
                                <asp:RequiredFieldValidator
            ID="nameRequiredValidator"
            runat="server" ControlToValidate="name"
            ErrorMessage="Name is missing"
            ValidationGroup="feedbackgroup"><span class="errormsg">●</span></asp:RequiredFieldValidator>
                            </div>
                            <div class="contact-input">
                                <asp:Textbox runat="server" id="name" />
                            </div>
                        </div>
                        <div class="contact-line">
                            <div class="label"> Email*:
                                <asp:RequiredFieldValidator
            ID="emailRequiredValidator"
            runat="server"
            ControlToValidate="email"
            ErrorMessage="Email address is missing"
            ValidationGroup="feedbackgroup"><span class="errormsg">●</span></asp:RequiredFieldValidator>
                                <asp:CustomValidator
            runat="server"
            ErrorMessage="Email address isn't in the correct format"
            OnServerValidate="validateEmail"
            ValidationGroup="feedbackgroup"><span class="errormsg">●</span></asp:CustomValidator>
                            </div>
                            <div class="contact-input">
                                <asp:TextBox runat="server" id="email" />
                            </div>
                        </div>
                        <div class="contact-line">
                            <div class="label"> Verify email*:
                                <asp:CompareValidator
            ID="compareEmailValidator"
            runat="server"
            ControlToCompare="verifyEmail"
            ControlToValidate="email"
            ErrorMessage="Verify email address doesn't match"
            ValidationGroup="feedbackgroup"><span class="errormsg">●</span></asp:CompareValidator>
                            </div>
                            <div class="contact-input">
                                <asp:TextBox runat="server" id="verifyEmail" />
                            </div>
                        </div>
                        <div class="contact-line">
                            <div class="label">Phone:</div>
                            <div class="contact-input">
                                <asp:TextBox runat="server" id="phone" />
                            </div>
                        </div>
                        <div class="contact-line">
                            <div class="label"> Message*:
                                <asp:RequiredFieldValidator
            ID="commentRequiredValidator"
            runat="server"
            ControlToValidate="comment"
            ErrorMessage="No comment or question was entered"
            ValidationGroup="feedbackgroup"><span class="errormsg">●</span></asp:RequiredFieldValidator>
                            </div>
                            <div class="contact-input">
                                <asp:TextBox runat="server" id="comment" TextMode="MultiLine" Rows="10" Columns="35"/>
                            </div>
                        </div>
                        <div class="contact-line">
                            <div class="label"> Anti-spam verification*:
                                <asp:CustomValidator
            runat="server"
            ErrorMessage="Enter the anti-spam verification code"
            OnServerValidate="validateCaptcha"
            ValidationGroup="feedbackgroup"><span class="errormsg">●</span></asp:CustomValidator>
                            </div>
                            <div class="contact-input">
                                <asp:RequiredFieldValidator
            ID="captchaRequiredValidator"
            runat="server"
            ControlToValidate="captcha"
            ErrorMessage="No anti-span verification was entered"
            ValidationGroup="feedbackgroup"><span class="errormsg">●</span></asp:RequiredFieldValidator>
                                <div class="captcha-image">
                                    <cc1:CaptchaControl ID="captchaImage" runat="server" Height="50px" 
                              Width="180px" CaptchaLength="5" BackColor="WhiteSmoke"
                              EnableViewState="False" />
                                </div>
                                <asp:TextBox runat="server" id="captcha" CssClass="captcha-input" />
                            </div>
                        </div>
                        <div class="contact-line">
                            <div class="label"></div>
                            <div class="contact-input">
                                <asp:Button runat="server"
                    id="submit"
                    CssClass="contact-submit"
                    Text="Submit"
                    ValidationGroup="feedbackgroup"
                    OnClick="submit_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 pull-right">
                    <h3>JuneWarren-Nickle's Energy Group</h3>
                    <h4>Calgary Location</h4>
                    <p> 2nd Flr-816 55 Avenue NE<br />
                        Calgary, Alberta<br />
                        Canada T2E 6Y4 </p>
                    <p> Ph: 403.209.3500<br />
                        Toll-Free Ph: 1.800.387.2446</p>
                    <p>&nbsp;</p>
                    <h4>Edmonton Location</h4>
                    <p> 220-9303 34 Ave NW<br />
                        Edmonton, Alberta<br />
                        Canada T6E 5W8 </p>
                    <p> Ph: 780.944.9333<br />
                        Toll-Free Ph: 1.800.563.2946 </p>
                    <div style="clear: both;"></div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
