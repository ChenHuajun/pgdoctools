void Item_Bound(Object sender, DataGridItemEventArgs e) { //v1.0
    if(sender is DataGrid)
    {
        TableCellCollection cells;
        DataGridColumnCollection columns;
        int i;
        cells = e.Item.Cells;
        columns = ((DataGrid)sender).Columns;
        for( i = 0 ; i < cells.Count ; i++)
        {
             if(columns[i] is BoundColumn && !cells[i].Text.Equals("&nbsp;"))
             {
                 cells[i].Text = Server.HtmlEncode( cells[i].Text );
             }
        }
    }
}

