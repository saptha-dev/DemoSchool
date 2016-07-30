using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoSchool
{
    public partial class Student_Regestration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Wizardstudentreg.PreRender += new EventHandler(Wizardstudentreg_PreRender);
        }
        protected void Wizardstudentreg_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = Wizardstudentreg.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizardstudentreg.WizardSteps;
            SideBarList.DataBind();

        }

        protected string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }
            int stepIndex = Wizardstudentreg.WizardSteps.IndexOf(step);

            if (stepIndex < Wizardstudentreg.ActiveStepIndex)
            {
                return "prevStep";
            }
            else if (stepIndex > Wizardstudentreg.ActiveStepIndex)
            {
                return "nextStep";
            }
            else
            {
                return "currentStep";
            }
        }

    }
}