$(document).ready(function(){
var data =eval('${studentList}');
var table = $('#StudentTable').DataTable( {
"aaData": data,
"aoColumns": [
	{ "mData": "id"},
	{ "mData": "standard" },
	{ "mData": "gender" },
	{ "mData": "city" },
	{ "mData": "dob" },
	{ "mData": "smssubscription" }
	]
});
});
