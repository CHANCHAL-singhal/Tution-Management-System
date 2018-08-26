<script src="js/jquery.min.js"></script>

<script src="datatable/jquery.dataTables.min.js"></script>

<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>
<script src="datatable/dataTables.bootstrap.min.js"></script>


<script src="datatable/dataTables.buttons.min.js"></script>

<script src="datatable/buttons.bootstrap.min.js"></script>

<script src="datatable/jszip.min.js"></script>
<script src="datatable/pdfmake.min.js"></script>
<script src="datatable/vfs_fonts.js"></script>
<script src="datatable/buttons.html5.min.js"></script>
<script src="datatable/buttons.print.min.js"></script>
<script src="datatable/buttons.colVis.min.js"></script>

<script>
$(document).ready(function(){
    var table = $('#example').DataTable(
    		{
    			/* lengthChange: false, */
    			
    		    buttons: [ 'copy', 'excel', 'pdf', 'print', 'colvis' ]
    		
    		});
    table.buttons().container()
	.appendTo( '#example_wrapper .col-sm-6:eq(0)' );
    
    
    
});
</script>
