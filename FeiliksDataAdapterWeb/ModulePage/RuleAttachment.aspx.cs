using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Sourcesoft;
using Sourcesoft.ExControls;
using System.IO;
using Aspose.Words;
using Aspose.Words.Saving;
using Aspose.Cells;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;


namespace TCCA.Unified.ModulePage
{
    public partial class RuleAttachment : DataPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
            //
            InitializeComponent();
            base.OnInit(e);

        }
        private void InitializeComponent()
        {

            this.btnUploadFiles.Click += new System.EventHandler(this.Button_Command);
            this.ButtonEx1.Click += new System.EventHandler(this.Button_Command);
            //this.btnDeleteAttachAll.Click += new System.EventHandler(this.Button_Command);
        }

        public void Button_Command(object sender, System.EventArgs e)
        {
            ButtonEx cmd = (ButtonEx)sender;
            //this.DataBind();
            if (cmd.CommandName == "UploadFiles")
            {
                UploadFiles();
            }
            else if (cmd.CommandName == "DeleteFiles")
            {
                DataTable dtFileList = FormDatas.Tables["AttachListAll"];
                DataRow[] selectedRowsAll = dtFileList.Select("Selected=1");
                if (selectedRowsAll == null)
                {
                    ShowMessages("选择附件失败！");
                    return;
                }
                if (selectedRowsAll.Length == 0)
                {
                    ShowMessages("请选择一条附件！");
                    return;
                }

                string selectIndx = "";
                foreach (DataRow selectedRow in selectedRowsAll)
                {
                    if (selectedRow["OriginalFilePath"].ToString().Trim() != "" && File.Exists(@selectedRow["OriginalFilePath"].ToString().Trim()))
                    {
                        File.Delete(@selectedRow["OriginalFilePath"].ToString().Trim());
                    }
                    if (selectedRow["FilePath"].ToString().Trim() != "" && File.Exists(@selectedRow["FilePath"].ToString().Trim()))
                    {
                        File.Delete(@selectedRow["FilePath"].ToString().Trim());
                    }

                    if (selectIndx.Trim() == "")
                    {
                        selectIndx = selectedRow["Indx"].ToString().Trim();
                    }
                    else
                    {
                        selectIndx += "," + selectedRow["Indx"].ToString().Trim();
                    }
                }
                if (selectIndx.Trim() != "")
                {
                    DataAccess.ExecuteSql("DELETE FROM C2K.T_AttachedDoc   WHERE indx IN (" + selectIndx + ")");
                    if (DataAccess.ErrMessages != "")
                    {
                        ShowMessages(DataAccess.ErrMessages);
                        return;
                    }
                }
                ClientScript.RegisterStartupScript(this.GetType(), "k_alertO", "alert('删除成功！');this.location.href=this.location.href;", true);
            }
        }

        private void UploadFiles()
        {
            if (Indx.Trim() == "")
            {
                ShowMessages("请先选择货物贸易订单！");
                return;
            }
            if (fileUpload.PostedFile == null || fileUpload.PostedFile.FileName.Trim() == "")
            {
                ShowMessages("尚未选择文件！");
                return;
            }

            //*.doc,*.docx,*.xls,*.xlsx,*.jpg,*.png,*.pdf
            string IsXlsO = System.IO.Path.GetExtension(fileUpload.PostedFile.FileName).ToString().ToLower();
            string IsXls = IsXlsO.ToLower();
            if (IsXls != ".doc" && IsXls != ".docx" && IsXls != ".xls" && IsXls != ".xlsx" && IsXls != ".jpg" && IsXls != ".png" && IsXls != ".pdf" && IsXls != ".bmp" && IsXls != ".jpeg" && IsXls != ".tif" && IsXls != ".rtf" && IsXls != ".txt")
            {
                ShowMessages("只能上传Word、Excel、JPG、PNG、BMP、TIF、RTF、TXT和PDF文件！");
                return;
            }
            string fPath = "", url = "";

            fPath = Server.MapPath("~\\UploadFile\\EntryInfo") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + FormDatas.Tables["EntryInfo"].Rows[0]["UniEntryID"].ToString().Trim();
            url = "UploadFile/EntryInfo/" + DateTime.Now.ToString("yyyyMM") + "/" + FormDatas.Tables["EntryInfo"].Rows[0]["UniEntryID"].ToString().Trim();

            if (!Directory.Exists(fPath))
            {
                Directory.CreateDirectory(fPath);
            }
            if (!Directory.Exists(fPath + "\\Original"))
            {
                Directory.CreateDirectory(fPath + "\\Original");
            }
            if (!Directory.Exists(fPath + "\\Converted"))
            {
                Directory.CreateDirectory(fPath + "\\Converted");
            }

            string result = "";
            string fileName = System.IO.Path.GetFileName(fileUpload.PostedFile.FileName).Replace(IsXlsO, "") + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + IsXls;
            string fileNameConverted = fileName.Replace(IsXlsO, ".pdf");
            fileUpload.PostedFile.SaveAs(fPath + "\\Original\\" + fileName);//保存到原始文件夹
            if (IsXls == ".pdf")
            {
                #region pdf
                //转存文件到转换后文件夹
                if (System.IO.File.Exists(fPath + "\\Original\\" + fileName))
                {
                    FileInfo fi = new FileInfo(fPath + "\\Original\\" + fileName);
                    fi.CopyTo(fPath + "\\Converted\\" + fileName, true);

                    ////Open document
                    //Aspose.Pdf.Document pdfDocument = new Aspose.Pdf.Document(fPath + "\\Original\\" + fileName);

                    ////Create image stamp
                    //Aspose.Pdf.ImageStamp imageStamp = new Aspose.Pdf.ImageStamp(Server.MapPath("~\\Images") + "\\chaodaidian.png");
                    //imageStamp.HorizontalAlignment = Aspose.Pdf.HorizontalAlignment.Left;
                    //imageStamp.VerticalAlignment = Aspose.Pdf.VerticalAlignment.Top;
                    ////imageStamp.Background = true;
                    ////imageStamp.XIndent = 50;
                    ////imageStamp.YIndent = 50;
                    ////imageStamp.Height = 88;
                    ////imageStamp.Width = 127;
                    ////imageStamp.Rotate = Rotation.on270;
                    ////imageStamp.Opacity = 1;
                    ////Add stamp to particular page
                    //foreach (Aspose.Pdf.Page page in pdfDocument.Pages)
                    //{
                    //    page.AddStamp(imageStamp);
                    //}
                    ////pdfDocument.Pages[1].AddStamp(imageStamp);

                    ////Save output document
                    //pdfDocument.Save(fPath + "\\Converted\\" + fileName);

                    result = "Success";
                }
                #endregion
            }
            else if (IsXls == ".doc" || IsXls == ".docx" || IsXls == ".rtf" || IsXls == ".txt")
            {
                #region doc
                //转换文件，存入转换后文件夹
                try
                {
                    Aspose.Words.Document doc = new Aspose.Words.Document(fPath + "\\Original\\" + fileName);
                    //保存为PDF文件，此处的SaveFormat支持很多种格式，如图片，epub,rtf 等等
                    doc.Save(fPath + "\\Converted\\" + fileNameConverted, Aspose.Words.SaveFormat.Pdf);
                    result = "Success";
                }
                catch (Exception ex)
                {
                    result = ex.Message;
                }
                #endregion
            }
            else if (IsXls == ".xls" || IsXls == ".xlsx")
            {
                #region xls
                //转换文件，存入转换后文件夹
                try
                {
                    Aspose.Cells.Workbook xls = new Aspose.Cells.Workbook(fPath + "\\Original\\" + fileName);
                    xls.Save(fPath + "\\Converted\\" + fileNameConverted, Aspose.Cells.SaveFormat.Pdf);
                    result = "Success";
                }
                catch (Exception ex)
                {
                    result = ex.Message;
                }
                #endregion
            }
            else
            {
                result = Image2PdfCOnversion(fPath + "\\Original\\" + fileName, fPath + "\\Converted\\" + fileNameConverted);
            }
            if (result != "Success")
            {
                ShowMessages(result);
                return;
            }

            #region 将上传记录保存到数据库
            DataRow drR = DataAccess.GetTable("select * from T_AttachedDoc where 1=2").NewRow();
            drR["OriginalFileName"] = fileName;
            drR["OriginalFilePath"] = fPath + "\\Original\\" + fileName;
            drR["OriginalFileURL"] = url + "/Original/" + fileName;

            drR["OriginalFileType"] = IsXls.Substring(1, IsXls.Length - 1);
            drR["FileName"] = fileNameConverted;
            drR["FilePath"] = fPath + "\\Converted\\" + fileNameConverted;
            drR["FileURL"] = url + "/Converted/" + fileNameConverted;
            drR["FileType"] = ".pdf";
            drR["DocType"] = txtFileType.Value.Trim();
            drR["DocTypeName"] = txtFileType.Text.Trim();
            drR["CreateUser"] = LoginUserName;
            drR["CreateUserID"] = LoginUser;
            drR["CreateTime"] = DateTime.Now.ToString();
            drR["Remark"] = txtRemark.Text.Trim();
            drR["AttachType"] = "EntryInfoDoc";

            drR["PIndx"] = Indx;
            drR["PNO"] = FormDatas.Tables["EntryInfo"].Rows[0]["EntryNo"].ToString().Trim();

            string docIndx = DataAccess.Insert("T_AttachedDoc", drR, "Indx");
            if (DataAccess.ErrMessages != "")
            {
                ShowMessages(DataAccess.ErrMessages);
                return;
            }
            #endregion

            ClientScript.RegisterStartupScript(this.GetType(), "k_alertO", "alert('上传成功！');this.location.href=this.location.href;", true);
        }
        protected string Image2PdfCOnversion(string InputLocation, string OutputLocation)
        {
            string result = "";
            iTextSharp.text.Document doc = new iTextSharp.text.Document();
            try
            {
                iTextSharp.text.Image gif = iTextSharp.text.Image.GetInstance(InputLocation);
                Rectangle rectangle = new Rectangle(gif.Width, gif.Height);
                doc = new iTextSharp.text.Document(rectangle);
                PdfWriter.GetInstance(doc, new FileStream(OutputLocation, FileMode.Create));
                doc.Open();
                doc.Add(gif);
                result = "Success";
            }
            catch (DocumentException dex)
            {
                result = dex.Message;
            }
            catch (IOException ioex)
            {
                result = ioex.Message;
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
            finally
            {
                if (doc.IsOpen())
                {
                    doc.Close();
                }
            }
            return result;
        }
    }
}