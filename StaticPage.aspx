<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StaticPage.aspx.cs" Inherits="MyTable_StaticPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test</title>
    <style type="text/css">
        body
        {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
    </style>
    <link href="css/jquery.mytables.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            if ($("#jTable_Loading")) {
                $("#jTable_Loading").css({
                    "left": ($("#jTable_Loading_Panel").width() - $("#jTable_Loading").width()) / 2,
                    "top": ($("#jTable_Loading_Panel").height() - $("#jTable_Loading").height()) / 2
                })
            }
            //setTimeout("RemoveEle()", 5000);
        })
        function RemoveEle() {
            if ($("#jTable_Loading_Panel")) {
                $("#jTable_Loading_Panel").remove();
            }
        }

        $(function () {
            $(".jTablesTr").hover(function () {
                $(this).addClass("hover");
            }, function () {
                $(this).removeClass("hover");
            });
        })
    </script>
</head>
<body>
    <div style="width: 800px; margin: 0 auto;">
        <div class="M_DivHeader">
            <div class="M_DivHeader_Icon">
            </div>
            <span class="M_DivHeader_Title">实验室记录</span>
        </div>
        <div id="jTable_Loading_Panel" class="M_DivHeader_Loadingpanel">
            <div class="M_DivHeader_Loadingpanel_Bg">
            </div>
            <div id="jTable_Loading" class="M_DivHeader_Loadingpanel_border">
                <div class="M_DivHeader_Loadingpanel_border_ico">
                    Waiting...
                </div>
            </div>
        </div>
    </div>
    <br />
    <div style="width: 800px; margin: 0 auto;">
        <div class="M_DivHeader">
            <div class="M_DivHeader_Icon">
            </div>
            <span class="M_DivHeader_Title">实验室记录</span>
        </div>
        <div id="divBrowse" class="M_DivTable">
            <table cellpadding="0" cellspacing="0" width="100%" class="M_Table">
                <tbody class="M_Tbody">
                    <tr>
                        <th>
                            <input type="checkbox" />
                        </th>
                        <th class="M_tablesortingdesc" columnname="UserName">
                            姓名
                        </th>
                        <th class="M_tablesortingasc" columnname="UserAge">
                            年龄
                        </th>
                        <th class="M_tablesorting" columnname="UserSex">
                            性别
                        </th>
                        <th class="M_tablesorting" columnname="WorkAge">
                            工作年限
                        </th>
                        <th class="M_tablesorting" columnname="WorkArea">
                            工作地点
                        </th>
                        <th class="M_tablesorting" columnname="UserStatus">
                            用户状态
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    <tr class="jTablesTr">
                        <td style="text-align: center;">
                            <input class="M_CheckBox" type="checkbox" value="aaaaa" />
                        </td>
                        <td>
                            <a href="#">aa</a>
                        </td>
                        <td>
                            bb
                        </td>
                        <td>
                            cc
                        </td>
                        <td>
                            dd
                        </td>
                        <td>
                            ee
                        </td>
                        <td>
                            ff
                        </td>
                        <td>
                            gg
                        </td>
                    </tr>
                    <tr class="jTablesTr">
                        <td style="text-align: center;">
                            <input class="M_CheckBox" type="checkbox" value="aaaaa" />
                        </td>
                        <td>
                            <a href="#">aa</a>
                        </td>
                        <td>
                            bb
                        </td>
                        <td>
                            cc
                        </td>
                        <td>
                            dd
                        </td>
                        <td>
                            ee
                        </td>
                        <td>
                            ff
                        </td>
                        <td>
                            gg
                        </td>
                    </tr>
                    <tr class="jTablesTr">
                        <td style="text-align: center;">
                            <input class="M_CheckBox" type="checkbox" value="aaaaa" />
                        </td>
                        <td>
                            <a href="#">aa</a>
                        </td>
                        <td>
                            bb
                        </td>
                        <td>
                            cc
                        </td>
                        <td>
                            dd
                        </td>
                        <td>
                            ee
                        </td>
                        <td>
                            ff
                        </td>
                        <td>
                            gg
                        </td>
                    </tr>
                    <tr class="jTablesTr">
                        <td style="text-align: center;">
                            <input class="M_CheckBox" type="checkbox" value="aaaaa" />
                        </td>
                        <td>
                            <a href="#">aa</a>
                        </td>
                        <td>
                            bb
                        </td>
                        <td>
                            cc
                        </td>
                        <td>
                            dd
                        </td>
                        <td>
                            ee
                        </td>
                        <td>
                            ff
                        </td>
                        <td>
                            gg
                        </td>
                    </tr>
                    <tr class="jTablesTr">
                        <td style="text-align: center;">
                            <input class="M_CheckBox" type="checkbox" value="aaaaa" />
                        </td>
                        <td>
                            <a href="#">aa</a>
                        </td>
                        <td>
                            bb
                        </td>
                        <td>
                            cc
                        </td>
                        <td>
                            dd
                        </td>
                        <td>
                            ee
                        </td>
                        <td>
                            ff
                        </td>
                        <td>
                            gg
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="M_pagination">
                <span>共21条记录
                    <select>
                        <option selected="selected">5</option>
                        <option>10</option>
                        <option>30</option>
                        <option>50</option>
                        <option>100</option>
                    </select>
                </span><a href="javascript:void(0)">首页</a><a class="paginate_button" href="javascript:void(0)">上一页</a><a
                    class="paginate_button" href="javascript:void(0)">1</a><a id="current">2</a><a class="paginate_button"
                        href="javascript:void(0)">3</a><a class="paginate_button" href="javascript:void(0)">4</a><a
                            class="paginate_button" href="javascript:void(0)"> 5</a><a href="javascript:void(0)">下一页</a><a
                                class="paginate_button" href="javascript:void(0)">尾页</a>
            </div>
        </div>
    </div>
</body>
</html>
