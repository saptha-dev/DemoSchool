using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoSchool
{
    public class Utils
    {
        public static int ToInt(object val)
        {
            int result;

            if (val == null)
                return 0;

            if (Int32.TryParse(Convert.ToString(val), out result))
            {
                return result;
            }
            return result;
        }
    }
}