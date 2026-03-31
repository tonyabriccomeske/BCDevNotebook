# Prompt: Create Invoice Detail Layout for BC Sales Data

You are working with exported data from Business Central **Report 1306 – Standard Sales Invoice**, extended to include `Unit Cost` and `Line Amount`. 
Create a clean, professional, analysis-ready worksheet based on this dataset.

**IMPORTANT**: The new sheet must use **formulas that dynamically reference the source dataset**. Do NOT copy and paste static data values. The data should update automatically if the source dataset changes.

1. Create a new sheet named **"Invoice Detail"**.
2. On this sheet, create an Excel table that **uses formulas to pull data from the source dataset**:
   - **Use dynamic formulas** (e.g., FILTER function, structured table references, or dynamic array formulas) to reference the original dataset.
   - **Filter the data to include only rows where `Item No.` is not blank.**
     - Because this is a report dataset (used for totaling, showing captions, etc.), we only want detail lines that have actual items.
   - Use clear, readable header text based on the column names.
   - **Ensure the solution dynamically handles any dataset size** (from 1 row to 1,000+ rows) by using formulas that automatically expand/contract.
   - Format dates with MM/DD/YYYY format.  
3. Apply professional formatting:
   - Bold headers.
   - Alternating row shading for the data region.
   - Freeze the top row.
   - Auto-size all columns to fit their content.
4. At the top of the sheet (above the table), add a summary section that shows:
   - Total revenue (sum of **Line Amount**).
   - Total invoice count (count of distinct **Invoice No.** or equivalent).
   - Average line amount (average of **Line Amount**).
   - Format these summary values with appropriate currency/number formats.
5. Do **not** add charts, pivot tables, or additional calculated columns on this sheet yet.
   - This sheet should serve as the primary, well-formatted data source for downstream analysis and dashboards.

---

Add two calculated columns:
1. Year - Month, grouping Posting Date into YYYY-MM format.
2. Margin %, calculated as 
      (Line Amount - (Unit Cost * Quantity)) / Line Amount.
Format the margin column as a percentage with one decimal place.

**Please add this to the existing Dynamic Filter formula**

---

See on the Aggregated Metadata sheet in the ReportFilterValues table, If there are filters that start with Header, 
  we want to display those on the Invoice Detail at the top.

We ONLY want to include the name of the field-- example: Bill-to Customer No., or Posting Date,
  and then the value next to it.

Please ensure this is dynamic (meaning it's a filter to these values)

Add these "Applied Filters" to the right of the "Invoice Detail Summary" 

---

Create a new sheet with a dashboard summarizing revenue by month, top ten customers and top ten items. 
Add slicers for year, customer group and item category. 
Place all visuals in a new sheet called "Dashboard".