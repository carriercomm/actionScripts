<?php
/**
 * User: Suraj.Savita
 * Date: 6/26/12
 * Time: 3:35 PM
 */


error_reporting(-1);

// Set plain text headers
header("Content-type: text/plain; charset=utf-8");

// Include the SDK

ini_set('include_path', ini_get('include_path') . ';C:\wamp\www');
require_once '/sdk-1.5.7/sdk.class.php';
require_once '/include/get_account_name_creds.php';

$shortopts = "abc"; // These options do not accept values

$longopts = array(
    "InstanceId::",
    "Status::", // Optional value
    "StartTime::", // Optional value
    "EndTime::", // Optional value
    "ReasonCode::", // Optional value
    "Description::", // Optional value
    "curlopts::",
    "returnCurlHandle::",
);
$options = getopt($shortopts, $longopts);


$options = $params;

$err = "Not sufficient arguments";
$creds = array();
$creds['key'] = $access_key;
$creds['secret'] = $secret_key;
//print_r($creds);
$ec2 = new AmazonEC2($creds);

$opt = array();
if (isset($options['InstanceId'])) {
    $opt['InstanceId'] = $options['InstanceId'];

}
if (isset($options['Status'])) {
    $opt['Status'] = $options['Status'];

}
if (isset($options['StartTime'])) {
    $opt['StartTime'] = $options['StartTime'];

}
if (isset($options['EndTime'])) {
    $opt['EndTime'] = $options['EndTime'];

}
if (isset($options['ReasonCode'])) {
    $opt['ReasonCode'] = $options['ReasonCode'];

}
if (isset($options['Description'])) {
    $opt['Description'] = $options['Description'];

}
if (isset($options['curlopts'])) {
    $opt['curlopts'] = $options['curlopts'];

}
if (isset($options['returnCurlHandle'])) {
    $opt['returnCurlHandle'] = $options['returnCurlHandle'];

}


$response = $ec2->report_instance_status($opt);
//    print_r($response->isOK());
//    print_r($response);
$file = fopen(dirname(__FILE__) . '/' . basename(__FILE__, '.php') . '-' . time() . ".json", 'w');
fwrite($file, json_encode($response));
fclose($file);
return $response;






