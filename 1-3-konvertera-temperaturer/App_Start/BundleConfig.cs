using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace _1_3_konvertera_temperaturer
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {

            bundles.Add(new ScriptBundle("~/Content/javascript").Include(
                "~/Scripts/main.js"
            ));

            bundles.Add(new StyleBundle("~/Content/styles").Include(
                "~/Content/css/style.css"
            ));

            BundleTable.EnableOptimizations = true;
        }
    }
}