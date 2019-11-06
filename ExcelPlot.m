excel = actxserver('Excel.Application');
wb = excel.Workbooks.Add;
excel.Visible = true;
chart1 = wb.Charts.Add;

a = 1:21;
b = 12:32;
Data = [a',b'];

wb.Worksheets.Item('Sheet1').Range('A1:B21').value = Data;
chart1.SetSourceData(wb.Worksheets.Item('Sheet1').Range('$A1:$B21'));
chart1.Name = 'Chart1';
chart1.ChartType = 'xlRadar';
wb.ActiveChart.ChartStyle = 250;