$(document).ready(function(){
  $("#jcountdown").setCountdown({
    //Date for the countdown
    targetDate: '2012-12-23',
    //Labels for days/hours/minutes/seconds,
    //[ 'Days', 'Hours', 'Minutes', 'Seconds' ] by default
    itemLabels: [ 'D', 'H', 'M', 'S' ]
  });
});