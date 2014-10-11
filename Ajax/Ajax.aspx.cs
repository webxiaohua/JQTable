using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Text;
using System.Web.Script.Serialization;

public partial class MyTable_Ajax_Ajax : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Thread.Sleep(500);
        int pageIndex = Request["jPageIndex"] != null ? Convert.ToInt32(Request["jPageIndex"]) : 1; //当前页码
        int pageSize = Request["jPageSize"] != null ? Convert.ToInt32(Request["jPageSize"]) : 5; //每页显示的数据量
        int dataCount = 215; //总数据量
        string sorttype = Request["jSortType"];  //排序类型 升序还是降序
        string sortCol = Request["jSortCol"]; ;//排序列名

        //string pageHtml = GetPageHtml(dataCount, pageSize, pageIndex);
        List<UserInfo> dataList = new List<UserInfo>();
        for (int i = 0; i < pageSize; i++)
        {
            if (i % 2 == 0)
            {
                UserInfo userInfo = new UserInfo();
                userInfo.UserId = 123;
                userInfo.UserName = "张三";
                userInfo.UserAge = 23;
                userInfo.UserSex = "男";
                userInfo.WorkAge = 5;
                userInfo.WorkArea = "上海";
                userInfo.UserStatus = "正常";
                userInfo.IsParent = true;
                dataList.Add(userInfo);
            }
            else
            {
                UserInfo userInfo = new UserInfo();
                userInfo.UserId = 456;
                userInfo.UserName = "李四";
                userInfo.UserAge = 23;
                userInfo.UserSex = "男";
                userInfo.WorkAge = 5;
                userInfo.WorkArea = "北京";
                userInfo.UserStatus = "正常";
                userInfo.IsParent = false;
                dataList.Add(userInfo);
            }
        }
        //dataList = new List<UserInfo>();  //返回无数据的情况
        //dataList = null;  //返回无数据的情况
        //声明一个匿名类型的变量
        var result = new
        {
            PageIndex = pageIndex,
            PageSize = pageSize,
            DataCount = dataCount,
            SortType = sorttype,
            SortCol = sortCol,
            //PageHtml = pageHtml,
            DataList = dataList
        };
        JavaScriptSerializer jss = new JavaScriptSerializer();
        string ret = jss.Serialize(result);
        Response.Write(ret);
    }
}

public class GeneralPage
{
    public static string GetPageHtml(int total, int pageSize, int pageIndex)
    {
        int allpage = 0;//总页数
        int next = 0;//下一页
        int prev = 0;//上一页
        string pagestr = "";
        int startCount = 0;//开始页
        int endCount = 0;//结束页
        if (pageIndex < 1) { pageIndex = 1; }
        //计算总页数
        if (pageSize != 0)
        {
            allpage = (total / pageSize);
            allpage = ((total % pageSize) != 0 ? allpage + 1 : allpage);
            allpage = (allpage == 0 ? 1 : allpage);
        }
        next = pageIndex + 1;
        prev = pageIndex - 1;
        startCount = (pageIndex + 5) > allpage ? allpage - 9 : pageIndex - 4;//中间页起始序号
        endCount = pageIndex < 5 ? 10 : pageIndex + 5;
        if (startCount < 1) { startCount = 1; }
        if (allpage < endCount) { endCount = allpage; }
        pagestr += pageIndex > 1 ? "<a class=\"paginate_button\" href=\"javascript:$$.listSubmit(3,1)\">首页</a><a class=\"paginate_button\" href=\"javascript:$$.listSubmit(3," + prev + ")\">上一页</a>" : "";
        for (int i = startCount; i <= endCount; i++)
        {
            pagestr += pageIndex == i ? "<a id=\"current\">" + i + "</a>" : "<a class=\"paginate_button\" href=\"javascript:$$.listSubmit(3," + i + ")\">" + i + "</a>";
        }
        pagestr += pageIndex != allpage ? "<a class=\"paginate_button\" href=\"javascript:$$.listSubmit(3," + next + ")\">下一页</a><a class=\"paginate_button\" href=\"javascript:$$.listSubmit(3," + allpage + ")\">尾页</a>" : "";

        var selectHtml = "<select onchange=\"$$.listSubmit(2,this)\"><option " + (pageSize == 5 ? "selected=\"selected\"" : "") + " >5</option><option " + (pageSize == 10 ? "selected=\"selected\"" : "") + ">10</option><option " + (pageSize == 30 ? "selected=\"selected\"" : "") + ">30</option><option " + (pageSize == 50 ? "selected=\"selected\"" : "") + ">50</option><option " + (pageSize == 100 ? "selected=\"selected\"" : "") + ">100</option></select>";
        HtmlString result = new HtmlString("<div class=\"M_pagination\"><span>共" + total + "条记录" + selectHtml + "</span>" + pagestr + "</div>");
        return result.ToString();
    }
}
public class UserInfo
{
    private string _userName;
    private int _userAge;
    private string _userSex;
    private int _workAge;
    private string _workArea;
    private string _userStatus;
    private int _userId;
    private bool _isParent;

    public bool IsParent
    {
        get { return _isParent; }
        set { _isParent = value; }
    }

    public int UserId
    {
        get { return _userId; }
        set { _userId = value; }
    }

    public string UserStatus
    {
        get { return _userStatus; }
        set { _userStatus = value; }
    }

    public string WorkArea
    {
        get { return _workArea; }
        set { _workArea = value; }
    }

    public int WorkAge
    {
        get { return _workAge; }
        set { _workAge = value; }
    }

    public string UserSex
    {
        get { return _userSex; }
        set { _userSex = value; }
    }

    public int UserAge
    {
        get { return _userAge; }
        set { _userAge = value; }
    }
    public string UserName
    {
        get { return _userName; }
        set { _userName = value; }
    }

    //string result = "{\"PageIndex\":1,\"PageSize\":5,\"PageCount\":21,\"Sorttype\":null,\"SortCol\":null,\"PageHtml\":" + pageHtml + ",\"DataList\":[{\"UserName\":\"aaa\",\"UserAge\":23,\"UserSex\":\"男\",\"WorkAge\":5,\"WorkArea\":\"上海\",\"UserStatus\":\"正常\"},{\"UserName\":\"bbb\",\"UserAge\":26,\"UserSex\":\"男\",\"WorkAge\":7,\"WorkArea\":\"上海\",\"UserStatus\":\"正常\"},{\"UserName\":\"bbb\",\"UserAge\":26,\"UserSex\":\"男\",\"WorkAge\":7,\"WorkArea\":\"上海\",\"UserStatus\":\"正常\"},{\"UserName\":\"bbb\",\"UserAge\":26,\"UserSex\":\"男\",\"WorkAge\":7,\"WorkArea\":\"上海\",\"UserStatus\":\"正常\"},{\"UserName\":\"bbb\",\"UserAge\":26,\"UserSex\":\"男\",\"WorkAge\":7,\"WorkArea\":\"上海\",\"UserStatus\":\"正常\"}]}";
}