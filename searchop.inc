<div class="container">
    <div class="row">
        <h4>SELECT CRITERIA</h4>
        <div class="col-md-3">
            <div class="toc">Operator</div>
            <div class="form-group input-group">
                <select name="operator" class="form-control">
                    <option value="" selected>&lt;All Operators&gt;
                    <% set conn = Server.createObject("ADODB.Connection")
                                 set rs = Server.createObject("ADODB.Recordset")
                             	   conn.Provider = "SQLOLEDB"
                                 conn.ConnectionString = application("RigConnectionString")
                                 conn.Open
                                 SQL =  "select distinct OperatorName from vwWebRig2 " & _
                                 "where Operator is not null and RigType = 'D' order by OperatorName"
                                 rs.open SQL, conn, adOpenStatic
                                 while not rs.eof
                                 response.write "      <option>" & rs(0) & chr(13) & chr(10)
                                 rs.moveNext
                                 wend
                                 rs.close %>
                    </option>
                </select>
            </div>
        </div>
        <div class="col-md-3">
            <div class="toc">Province/Region</div>
            <div class="form-group input-group">
                <select name="province" class="form-control">
                    <option value="" selected>&lt;All&gt;</option>
                    <option value="AB">Alberta</option>
                    <option value="SK">Saskatchewan</option>
                    <option value="BC">British Columbia</option>
                    <option value="MB">Manitoba</option>
                    <option value="EC">Eastern Canada</option>
                    <option value="NC">Northern Canada</option>
                </select>
            </div>
        </div>
        <div class="col-md-2">
            <div class="toc">Select Rig Statues</div>
            <div class="form-group input-group">
                <select name="status" class="form-control">
                    <option value="all" selected>&lt;All&gt;</option>
                    <option value="active">ALL ACTIVE</option>
                    <option value="DRILL">DIR - Drilling</option>
                    <option value="MIR">MIR - Moving in rig</option>
                    <option value="RIGUP">RIGUP - Rigging up (setting up rig)</option>
                    <option value="inactive">DOWN - Not active</option>
                </select>
            </div>
        </div>
    </div>
</div>
<div class="container content">
    <div class="row">
        <div class="col-lg-8">
            <div class="row">
                <h4>SELECT A SORT OPTION</h4>
                <div class="col-md-4">
                    <input type="radio" name="sort" value="">
                    Location<br>
                    <input type="radio" name="sort" value="Operator" checked>
                    Operator<br>
                    <input type="radio" name="sort" value="Rig">
                    Contractor and Rig<br>
                    <input type="radio" name="sort" value="Area">
                    Area Name<br>
                </div>
                <div class="col-md-4">
                    <input type="radio" name="sort" value="Spud">
                    Spud Date<br>
                    <input type="radio" name="sort" value="Class">
                    Well Class<br>
                    <input type="radio" name="sort" value="Status">
                    Rig Status<br>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-1">
            <input type="image" value="SEARCH" name="OP" alt="Search" border=0>
        </div>
        <div class="col-md-1">
            <input type="reset" value="CLEAR">
        </div>
    </div>
</div>
</form>
