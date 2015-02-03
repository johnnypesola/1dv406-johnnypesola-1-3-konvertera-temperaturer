using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _1_3_konvertera_temperaturer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                int startTemp, endTemp, tempStep, i, outputValue;
                TableHeaderRow headerRow;
                TableHeaderCell cHeaderCell, fHeaderCell;
                TableRow row;
                TableCell cell;
                Boolean isOddRow = true;
                CustomValidator customValidator;
                String conversionMode;

                // Try parse values
                try {
                    int.TryParse(StartTempTextbox.Text, out startTemp);
                    int.TryParse(EndTempTextbox.Text, out endTemp);
                    int.TryParse(TempStepTextbox.Text, out tempStep);

                    // Get radio buttons value
                    conversionMode = ConversionRadioButtonList.SelectedItem.Value;

                // Catch error, should not happen.
                } catch (Exception error) {

                    // Add custom error to Validationsummary
                    customValidator = new CustomValidator();
                    customValidator.IsValid = false;
                    customValidator.ErrorMessage = error.Message;
                    this.Page.Validators.Add(customValidator);

                    return;
                }


                // Build table header
                headerRow = new TableHeaderRow();
                cHeaderCell = new TableHeaderCell();
                fHeaderCell = new TableHeaderCell();

                cHeaderCell.Controls.Add(new LiteralControl("&deg;C"));
                fHeaderCell.Controls.Add(new LiteralControl("&deg;F"));


                // Celcius to Fahrenheit Conversion
                if (conversionMode == "CtoF")
                {
                    headerRow.Cells.Add(cHeaderCell);
                    headerRow.Cells.Add(fHeaderCell);
                }
                // Fahrenheit to Celcius Conversion
                else if (conversionMode == "FtoC")
                {
                    headerRow.Cells.Add(fHeaderCell);
                    headerRow.Cells.Add(cHeaderCell);
                }

                // Add header row to table
                OutputTable.Rows.Add(headerRow);

                // Loop through the temperatures
                for (i = startTemp; i <= endTemp; i += tempStep)
                {
                    // Celcius to Fahrenheit Conversion
                    if (conversionMode == "CtoF")
                    {
                        outputValue = Model.TemperatureConverter.CelciusToFahrenheit(i);
                    } 
                    // Fahrenheit to Celcius Conversion
                    else if (conversionMode == "FtoC")
                    {
                        outputValue = Model.TemperatureConverter.FahrenheitToCelcius(i);
                    }
                    else
                    {
                        break;
                    }

                    // Create row
                    row = new TableRow();
                    row.CssClass = (isOddRow ? "odd" : "");

                    // Create first cell, add value and add to row
                    cell = new TableCell();
                    cell.Controls.Add(new LiteralControl(i.ToString()));
                    row.Cells.Add(cell);

                    // Create second cell, add value and add to row
                    cell = new TableCell();
                    cell.Controls.Add(new LiteralControl(outputValue.ToString()));
                    row.Cells.Add(cell);
                    
                    // Add row to table
                    OutputTable.Rows.Add(row);

                    // Reverse odd row value.
                    isOddRow = !isOddRow;
                }

                // Show table
                OutputTable.Visible = true;
            }
        }
    }
}