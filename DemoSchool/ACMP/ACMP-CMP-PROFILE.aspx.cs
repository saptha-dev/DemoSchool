using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;
using BAL.BE;

namespace PresentationLayer.ACMP
{
    public partial class ACMP_CMP_PROFILE : System.Web.UI.Page
    {
        CompanyBL objCmpnyBL = new CompanyBL();
        static int flag = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CompanyDetails();
                bindbranches();

            }
        }

        private void CompanyDetails()
        {
            SqlDataReader dr = objCmpnyBL.GetCompanyDetailss("ACMPSMT001");
            DataTable dt = new DataTable();
            dt.Load(dr);
            txtACMPID.Text = dt.Rows[0]["CompanyId"].ToString();
            txtACMPName.Text = dt.Rows[0]["CompanyName"].ToString();
            txtACMPROCRegNo.Text = dt.Rows[0]["RegistrationNO"].ToString();
            txtACMPROCRegDate.Text = dt.Rows[0]["ROC_RegistrationDate"].ToString();
            txtACMPPHONE.Text = dt.Rows[0]["OfficePhoneNO"].ToString();
            txtACMPMOBILE.Text = dt.Rows[0]["MobileNumber"].ToString();
            txtACMPEmail.Text = dt.Rows[0]["EmailID"].ToString();
            txtACMPOtherEmail.Text = dt.Rows[0]["ContactPersonAlternativeEmailID"].ToString();
            txtACMPRegDate.Text = dt.Rows[0]["DateofRegistration"].ToString();
            txtACMPStatus.Text = dt.Rows[0]["Status"].ToString();
            txtACMPStatusDate.Text = dt.Rows[0]["StatusDate"].ToString();


            txtACMPStreetName.Text = dt.Rows[0]["StreetName"].ToString();
            txtACMPStreetNo.Text = dt.Rows[0]["StreetNO"].ToString();
            txtACMPVillage.Text = dt.Rows[0]["Village_Town_City"].ToString();
            txtACMPState.Text = dt.Rows[0]["StateID"].ToString();
            txtACMPPincode.Text = dt.Rows[0]["PostalCode"].ToString();
            txtACMPMandal.Text = dt.Rows[0]["SubUrban_Area"].ToString();
            txtACMPLandMark.Text = dt.Rows[0]["LandMarkName"].ToString();
            txtACMPHNo.Text = dt.Rows[0]["HouseNO"].ToString();
            txtACMPFlatNo.Text = dt.Rows[0]["Flat_UnitNo"].ToString();
            txtACMPDistrict.Text = dt.Rows[0]["DistrictID"].ToString();
            txtACMPCountry.Text = dt.Rows[0]["CountryID"].ToString();

            // txtACMPCPIDesg.Text = dt.Rows[0][""].ToString();
            txtACMPCPIDOB.Text = dt.Rows[0]["DateOfBirth"].ToString();
            txtACMPCPIEmail.Text = dt.Rows[0]["ContactPersonEmailID"].ToString();
            txtACMPCPIFName.Text = dt.Rows[0]["Father_GuardianName"].ToString();
            txtACMPCPIMName.Text = dt.Rows[0]["MotherMaidenName"].ToString();
            txtACMPCPIMobile.Text = dt.Rows[0]["MobileNumber"].ToString();
            txtACMPCPIName.Text = dt.Rows[0]["FirstName"].ToString() + dt.Rows[0]["LastName"].ToString();
            txtACMPCPIOtherEmail.Text = dt.Rows[0]["ContactPersonAlternativeEmailID"].ToString();
            txtACMPCPIPhone.Text = dt.Rows[0]["Fixed_LandlineNO"].ToString();
            txtACMPCPIPOB.Text = dt.Rows[0]["PlaceOfBirth"].ToString();

            txtLoginID.Text = "ACMPSMT001";
            txtAccesscode.Text = "23422";

            LoadBranchesDetails();
        }

        internal void bindbranches()
        {
            SqlDataReader sdr = objCmpnyBL.selectCompanyBranches("ACMPSMT001");
            DataTable dt2 = new DataTable();
            dt2.Load(sdr);
            if (dt2.Rows.Count > 0)
            {
                ddlselBr.DataSource = dt2;
                ddlselBr.DataValueField = "SNo_ID";
                ddlselBr.DataTextField = "BranchName";
                ddlselBr.DataBind();
                ddlselBr.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
            }
        }


        private void LoadBranchesDetails()
        {
            SqlDataReader dr1 = objCmpnyBL.GetBranchCount("ACMPSMT001");
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            txtTotalBranches.Text = dt1.Rows[0][0].ToString();

            SqlDataReader dr2 = objCmpnyBL.GetBranchDetails("ACMPSMT001");
            DataTable dt2 = new DataTable();
            dt2.Load(dr2);
            if (dt2.Rows.Count > 0)
            {
                int res = (Convert.ToInt32(dt1.Rows[0][0].ToString())) - (Convert.ToInt32(dt2.Rows.Count.ToString()));
                if (res < 1)
                {
                    pnlAddBranch.Visible = false;
                }
                else
                {
                    pnlAddBranch.Visible = true;
                }
                System.Data.DataColumn ClmSbrnchId = new System.Data.DataColumn("BranchID", typeof(System.String));
                ClmSbrnchId.DefaultValue = dt2.Rows[0]["BranchID"].ToString();

                System.Data.DataColumn Clmbrnchname = new System.Data.DataColumn("BranchName", typeof(System.String));
                Clmbrnchname.DefaultValue = dt2.Rows[0]["BranchName"].ToString();

                System.Data.DataColumn Clmbrnchloc = new System.Data.DataColumn("BranchLocation", typeof(System.String));
                Clmbrnchloc.DefaultValue = dt2.Rows[0]["BranchLocation"].ToString();

                System.Data.DataColumn Clmbrncharea = new System.Data.DataColumn("BranchArea", typeof(System.String));
                Clmbrncharea.DefaultValue = dt2.Rows[0]["BranchArea"].ToString();

                System.Data.DataColumn Clmbrnchofc = new System.Data.DataColumn("BranchOffice", typeof(System.String));
                Clmbrnchofc.DefaultValue = dt2.Rows[0]["BranchOffice"].ToString();

                System.Data.DataColumn Clmbrnchsts = new System.Data.DataColumn("BranchStatus", typeof(System.String));
                Clmbrnchsts.DefaultValue = dt2.Rows[0]["BranchStatus"].ToString();

                txtAddRemBranches.Text = res.ToString();
                GvNodata.DataSource = dt2;
                ViewState["BranchDetails"] = dt2;
                GvNodata.DataBind();
            }
        }

        protected void btnAddBranchSubmit_Click(object sender, EventArgs e)
        {
            string Id = string.Empty;
            if (ViewState["brnchId"] != null)
            {
                Id = ViewState["brnchId"].ToString();
            }
            if (Id == null || Id == "")
            {
                string BranchID = txtACMPName.Text.Substring(0, 3) + GenerateTransactionId();
                SqlDataReader dr = objCmpnyBL.CompanyAddBranch(BranchID, 1, "ACMPSMT001", txtAddBranchName.Text.Trim(), txtAddBranchLoc.Text, txtAddBranchArea.Text, txtAddBranchOffice.Text, txtAddBranchStatus.Text, Convert.ToInt32(txtAddBrSessions.Text));
                txtAddBranchName.Text = "";
                txtAddBranchLoc.Text = "";
                txtAddBranchArea.Text = "";
                txtAddBranchOffice.Text = "";
                txtAddBranchStatus.Text = "";
                LoadBranchesDetails();
            }
            else
            {
                SqlDataReader dr = objCmpnyBL.updtatebranch(Id, txtAddBranchName.Text, txtAddBranchLoc.Text, txtAddBranchOffice.Text, txtAddBranchArea.Text, txtAddBranchStatus.Text);
                LoadBranchesDetails();
            }
        }

        protected void ddlselBr_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader sdr = objCmpnyBL.selectCompanyBranchesSessions(Convert.ToInt32(ddlselBr.SelectedItem.Value));
            DataTable dt2 = new DataTable();
            dt2.Load(sdr);
            if (dt2.Rows.Count > 0)
            {
                txttotSess.Text =dt2.Rows[0]["No_Of_sessions"].ToString();
            }
        }

        public static string GenerateTransactionId()
        {
            int digit = 3;
            string possibles = "0123456789";
            char[] TranId = new char[digit];
            Random rd = new Random();
            for (int i = 0; i < digit; i++)
            {
                TranId[i] = possibles[rd.Next(0, possibles.Length)];
            }
            return new string(TranId);
        }

        protected void btnAddBranchCount_Click(object sender, EventArgs e)
        {
            if (btnAddBranchCount.Text == "Update Branches Count")
            {
                SqlDataReader dr = objCmpnyBL.UpdateBranchCount("ACMPSMT001", Convert.ToInt32(txtAddRemBranches.Text));
                LoadBranchesDetails();
                btnAddBranchCount.Text = "Add Branch";
                txtAddRemBranches.ReadOnly = true;
            }
            else
            {
                btnAddBranchCount.Text = "Update Branches Count";
                txtAddRemBranches.ReadOnly = false;
                txtAddBranchName.ReadOnly = false;
                txtAddBranchLoc.ReadOnly = false;
                txtAddBranchArea.ReadOnly = false;
                txtAddBranchOffice.ReadOnly = false;
                txtAddBranchStatus.ReadOnly = false;
                txtAddBrSessions.ReadOnly = false;

                txtAddRemBranches.Text = txtTotalBranches.Text;
            }

        }

        protected void UpdatePassword_Click(object sender, EventArgs e)
        {

            if (flag == 1)
            {
                CompanyBL cbl = new CompanyBL();
                CompanyBE cbe = new CompanyBE();
                cbe.MobileNumber = txtACMPMOBILE.Text;
                cbe.OfficePhoneNO = txtACMPPHONE.Text;
                cbe.EmailID = txtACMPEmail.Text;
                cbe.HouseNO = txtACMPHNo.Text;
                cbe.Flat_UnitNo = txtACMPFlatNo.Text;
                cbe.landmark = txtACMPLandMark.Text;
                cbe.StreetNO = txtACMPStreetNo.Text;
                cbe.StreetName = txtACMPStreetName.Text;
                cbe.Village_Town_City = txtACMPVillage.Text;
                cbe.SubUrban_Area = txtACMPMandal.Text;
                cbe.DistrictID = 1;
                cbe.StateID = 1;
                cbe.CountryID = 1;
                cbe.PostalCode = Convert.ToInt32(txtACMPPincode.Text);
                cbe.FirstName = txtACMPCPIName.Text;
                cbe.Father_GuardianName = txtACMPCPIFName.Text;
                cbe.MotherMaidenName = txtACMPCPIMName.Text;
                cbe.DateOfBirth = Convert.ToDateTime(txtACMPCPIDOB.Text);
                cbe.PlaceOfBirth = txtACMPCPIPOB.Text;
                cbe.Fixed_LandlineNO = txtACMPCPIPhone.Text;
                cbe.MobileNumber = txtACMPCPIMobile.Text;
                cbe.ContactPersonEmailID = txtACMPCPIEmail.Text;
                cbe.ContactPersonAlternativeEmailID = txtACMPCPIOtherEmail.Text;
                SqlDataReader dr = cbl.UpdateCMPProfile(cbe);
                flag = 0;
            }
            else
            {
                flag = 1;
                if (txtNewPassword.Text == txtConfirmPassword.Text)
                {
                    SqlDataReader dr = objCmpnyBL.UpdatePassword("admin123", txtNewPassword.Text, txtPassword.Text);
                    DataTable dt = new DataTable();
                    dt.Load(dr);

                    if (dt.Rows[0][0].ToString() == "1")
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Password Updated Successfully');", true);
                        txtPassword.Text = "";
                        txtNewPassword.Text = "";
                        txtConfirmPassword.Text = "";
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Password dosent match with Old Password');", true);
                    }
                }
                ReadonlyTextboxes();
            }

        }

        protected void btnCancelUpdatepwd_Click(object sender, EventArgs e)
        {
            txtPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
        protected void gvViewRecord_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgbtn = (ImageButton)sender;
            GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
            int rowindex = gvrow.RowIndex;
            if (gvrow != null)
            {
                string BranchId = GvNodata.Rows[rowindex].Cells[0].Text;
                ViewState["brnchId"] = BranchId;
                txtAddBranchName.Text = GvNodata.Rows[rowindex].Cells[1].Text;
                txtAddBranchLoc.Text = GvNodata.Rows[rowindex].Cells[2].Text;
                txtAddBranchArea.Text = GvNodata.Rows[rowindex].Cells[3].Text;
                txtAddBranchOffice.Text = GvNodata.Rows[rowindex].Cells[4].Text;
                txtAddBranchStatus.Text = GvNodata.Rows[rowindex].Cells[5].Text;
                SqlDataReader dr = objCmpnyBL.updtatebranch(BranchId, txtAddBranchName.Text, txtAddBranchLoc.Text, txtAddBranchOffice.Text, txtAddBranchArea.Text, txtAddBranchStatus.Text);
            }
        }

        protected void imgbtnGo_Click(object sender, ImageClickEventArgs e)
        {
            btnmacaddressSubmit.Visible = true;
            //SetInitialRow();
            //SetPreviousData();
            BindData();
            //AddNewRowToGrid();
            if (txtNoOfExams.Text == string.Empty)
            {
                btnmacaddressSubmit.Visible = true;
            }
        }
        private void BindData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Mac_addres", typeof(string));
            if (ViewState["data"] != null)
            {
                dt = ViewState["data"] as DataTable;
            }
            DataRow dr = null;
            dr = dt.NewRow();
            dr["Mac_addres"] = txtNoOfExams.Text.Trim();
            dt.Rows.Add(dr);
            ViewState["data"] = dt;
            gvMACaddress.DataSource = dt;
            gvMACaddress.DataBind();
            txtNoOfExams.Text = string.Empty;
        }

        //private void SetInitialRow()
        //{
        //    DataTable dt = new DataTable();
        //    DataRow dr = null;
        //    dt.Columns.Add(new DataColumn("Mac_addres", typeof(string)));

        //    for (int i = 0; i < Convert.ToInt32(txtNoOfExams.Text); i++)
        //    {
        //        dr = dt.NewRow();
        //        dt.Rows.Add(dr);
        //    }

        //    //Store the DataTable in ViewState
        //    ViewState["CurrentTable"] = dt;

        //    gvMACaddress.DataSource = dt;
        //    gvMACaddress.DataBind();
        //}
        //private void SetPreviousData()
        //{
        //    int rowIndex = 0;
        //    if (ViewState["CurrentTable"] != null)
        //    {
        //        DataTable dt = (DataTable)ViewState["CurrentTable"];
        //        if (dt.Rows.Count > 0)
        //        {
        //            for (int i = 0; i < dt.Rows.Count; i++)
        //            {
        //                TextBox box1 = (TextBox)gvMACaddress.Rows[rowIndex].Cells[0].FindControl("txtgdMacaddr");
        //                box1.Text = dt.Rows[i]["Mac_addres"].ToString();
        //                rowIndex++;
        //            }
        //        }
        //    }
        //}

        protected void btnmacaddressSubmit_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < gvMACaddress.Rows.Count; i++)
            {
                Label box1 = (Label)gvMACaddress.Rows[i].Cells[0].FindControl("lblgdMacaddr");
                string s = box1.Text;
                SqlDataReader sdr = objCmpnyBL.saveMacaddress(ddlselBr.SelectedItem.Text, s, "ACMPSMT001");
                //DataTable dt = new DataTable();
                //dt.Load(sdr);
            }
            gvMACaddress.DataSource = null;
            gvMACaddress.DataBind();
            txtNoOfExams.Text = string.Empty;
        }

        internal void ReadonlyTextboxes()
        {
            txtACMPMOBILE.ReadOnly = true;
            txtACMPPHONE.ReadOnly = true;
            txtACMPEmail.ReadOnly = true;
            txtACMPHNo.ReadOnly = true;
            txtACMPFlatNo.ReadOnly = true;
            txtACMPLandMark.ReadOnly = true;
            txtACMPStreetNo.ReadOnly = true;
            txtACMPStreetName.ReadOnly = true;
            txtACMPVillage.ReadOnly = true;
            txtACMPMandal.ReadOnly = true;
            txtACMPDistrict.ReadOnly = true;
            txtACMPState.ReadOnly = true;
            txtACMPCountry.ReadOnly = true;
            txtACMPPincode.ReadOnly = true;
            txtACMPCPIName.ReadOnly = true;
            txtACMPCPIFName.ReadOnly = true;
            txtACMPCPIMName.ReadOnly = true;
            txtACMPCPIDOB.ReadOnly = true;
            txtACMPCPIPOB.ReadOnly = true;
            txtACMPCPIPhone.ReadOnly = true;
            txtACMPCPIMobile.ReadOnly = true;
            txtACMPCPIEmail.ReadOnly = true;
            txtACMPCPIOtherEmail.ReadOnly = true;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtACMPMOBILE.ReadOnly = false;
            txtACMPPHONE.ReadOnly = false;
            txtACMPEmail.ReadOnly = false;
            txtACMPHNo.ReadOnly = false;
            txtACMPFlatNo.ReadOnly = false;
            txtACMPLandMark.ReadOnly = false;
            txtACMPStreetNo.ReadOnly = false;
            txtACMPStreetName.ReadOnly = false;
            txtACMPVillage.ReadOnly = false;
            txtACMPMandal.ReadOnly = false;
            txtACMPDistrict.ReadOnly = false;
            txtACMPState.ReadOnly = false;
            txtACMPCountry.ReadOnly = false;
            txtACMPPincode.ReadOnly = false;
            txtACMPCPIName.ReadOnly = false;
            txtACMPCPIFName.ReadOnly = false;
            txtACMPCPIMName.ReadOnly = false;
            txtACMPCPIDOB.ReadOnly = false;
            txtACMPCPIPOB.ReadOnly = false;
            txtACMPCPIPhone.ReadOnly = false;
            txtACMPCPIMobile.ReadOnly = false;
            txtACMPCPIEmail.ReadOnly = false;
            txtACMPCPIOtherEmail.ReadOnly = false;
            flag = 1;
        }



        //private void AddNewRowToGrid()
        //{
        //    int rowIndex = 0;

        //    if (ViewState["CurrentTable"] != null)
        //    {
        //        DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
        //        DataRow drCurrentRow = null;
        //        if (dtCurrentTable.Rows.Count > 0)
        //        {
        //            for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
        //            {
        //                //extract the TextBox values
        //                TextBox box1 = (TextBox)gvMACaddress.Rows[rowIndex].Cells[0].FindControl("txtgdMacaddr");
        //                drCurrentRow = dtCurrentTable.NewRow();

        //                dtCurrentTable.Rows[i - 1]["Mac_addres"] = box1.Text;
        //                ViewState["Mac_addres"] = box1.Text;
        //                rowIndex++;
        //            }
        //            dtCurrentTable.Rows.Add(drCurrentRow);
        //            ViewState["CurrentTable"] = dtCurrentTable;

        //            gvMACaddress.DataSource = dtCurrentTable;
        //            gvMACaddress.DataBind();
        //        }
        //    }
        //    else
        //    {
        //        Response.Write("ViewState is null");
        //    }

        //    //Set Previous Data on Postbacks
        //    SetPreviousData();
        //}
    }
}