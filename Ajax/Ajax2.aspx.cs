using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Text;
using System.Web.Script.Serialization;

namespace MyApp.JQTable.Ajax
{
    public partial class Ajax2 : System.Web.UI.Page
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
                    userInfo.UserName = "王五";
                    userInfo.UserAge = 23;
                    userInfo.UserSex = "男";
                    userInfo.WorkAge = 5;
                    userInfo.WorkArea = "上海";
                    userInfo.UserStatus = "正常";
                    dataList.Add(userInfo);
                }
                else
                {
                    if (i > 5)
                    {
                        UserInfo userInfo = new UserInfo();
                        userInfo.UserId = 123;
                        userInfo.UserName = "赵四";
                        userInfo.UserAge = 23;
                        userInfo.UserSex = "男";
                        userInfo.WorkAge = 5;
                        userInfo.WorkArea = "北京";
                        userInfo.UserStatus = "正常";
                        dataList.Add(userInfo);
                    }
                    else {
                        UserInfo userInfo = new UserInfo();
                        userInfo.UserId = 123;
                        userInfo.UserName = "王五";
                        userInfo.UserAge = 23;
                        userInfo.UserSex = "男";
                        userInfo.WorkAge = 5;
                        userInfo.WorkArea = "上海";
                        userInfo.UserStatus = "正常";
                        dataList.Add(userInfo);
                    }
                }
            }
            //dataList = new List<UserInfo>();  //返回无数据的情况
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
}