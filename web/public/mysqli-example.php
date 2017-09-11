<?php
// To run this script, first execute './web/public/sample.sql'

// print getHostByName($_SERVER['HOSTNAME'])."<br>";
// print getHostByName('mysql')."<br>";

// we should use ip address of 'mysql', because error mysql socket 

$db     = new mysqli('mysql' , 'root', 'root', 'sekolah');
$result = $db->query("select * from siswa;");
$no     = 1;

?>
<html>
<body style='font-family:arial, sans-serif;margin:50px;'>
<h2>Students</h2>
<table cellspacing='1' cellpadding='5' bgcolor='#cccccc'>
<thead bgcolor='#eeeeee'><tr><th>No.</th><th>Name</th><th>Birth date</th></tr></thead>
<tbody bgcolor='#ffffff'>
<?php while($row = $result->fetch_object()){ ?>
<tr>
<td><?php echo $no++; ?></td>
<td><?php echo $row->nama_siswa; ?></td>
<td><?php echo $row->tanggal_lahir; ?></td>
</tr>
<?php } ?>
</tbody>
</table>
</body>
</html>