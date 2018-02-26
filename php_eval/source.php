<?php
     $myvar = '';
$contacts = array("Lemmiwinks",
                  "MrHanky",
                  "Catatafish",
                  "Sparky",
                  "Porcupiney",
                  "MrSlave",
                  "Furrycat",
                  "Satan",
                  "SaddamHussein",
                  "Towelie",
                  "BigGayAl",
                  "Chef");
if (isset($_GET['name']) && !(empty($_GET['name']))) {
    echo "<br>\n<br>\n";
    $myvar = htmlentities($_GET['name']);
    eval('$myvar = ' . ucwords($myvar) . ';');
    if (in_array($myvar, $contacts)) {
        printf('Message sent to %s.', $myvar);
    } else {
        printf('%s not in contact list.', $myvar);
    }
} else if (isset($_GET['contact']) && !(empty($_GET['contact']))) {
    echo "<br>\n<br>\n";
    $myvar = htmlentities($_GET['contact']);
    printf('Message sent to %s.', $myvar);
}
?>