$(document).ready(function(){
  countdownTimer($('#jcountdown').data('time'))
});

function countdownTimer( time ){
  $("#jcountdown").setCountdown({
  //Date for the countdown
  targetDate: time,
  //Labels for days/hours/minutes/seconds,
  //[ 'Days', 'Hours', 'Minutes', 'Seconds' ] by default
  itemLabels: [ 'D', 'H', 'M', 'S' ]
  });
}