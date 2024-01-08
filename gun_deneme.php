<?php

$userAgent = $_SERVER['HTTP_USER_AGENT'];

function isMobile($userAgent) {
    return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|plucker|pocket|psp|symbian|treo|up\.browser|up\.link|webos|wos)/i", $userAgent);
}

function isTablet($userAgent) {
    return preg_match("/(tablet|ipad|playbook)|(android(?!.*(mobi|opera mini)))/i", $userAgent);
}

function isDesktop($userAgent) {
    return !isMobile($userAgent) && !isTablet($userAgent);
}

if (isMobile($userAgent)) {
    echo 'You are using a Mobile Device.<br />';
} elseif (isTablet($userAgent)) {
    echo 'You are using a Tablet.<br />';
} else {
    // isDesktop
    echo 'You are using a Desktop.<br />';
}

?>
