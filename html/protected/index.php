<html lang="en">
<HEAD>
  <TITLE>Protected page</TITLE>
  <link rel="stylesheet" href="/style.css">
</HEAD>
<BODY>

<h1>Welcome to the protected directory.</h1>

<HR width="50%"/>
<P/>
<table>
<tr>
  <th align=right>Remote user</th>
  <td><? print $_SERVER['REMOTE_USER']?></td>
</tr>

<tr><td>&nbsp;</td></tr>
<?php
  foreach( apache_request_headers() as $h=>$v)
    if ( (strncmp($h, "OIDC", 4) === 0) && (strlen($v) > 0) ) {
      echo "<tr><th align=right>$h</th><td>";
      if ( strlen($v) < 80 ) {
        echo "$v";
      }
      else {
        echo substr($v,0,80) . "...";
      }
      echo "</td></tr>\n";
    }
?>
</table>
<HR width="50%"/>

</BODY>
</HTML>
