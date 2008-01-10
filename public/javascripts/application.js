// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var MC = function() {
  function number_str (n) {
    var x = n.toString ();
    var l = x.length;
    var res = x.substr(0, l-2) + "." + x.substr(l-2,l);
    return res;
  }
  
  
  //hmm accessing all these elements by id makes them less useful?
  //Should we pass elements as parameters?
  function calc() {
    var cost = $('meeting_attendance').value * $('salary').value;
    if ($('wage_type_annual').checked)
    {
      cost = cost/(50*40);
    }
    return cost.toFixed(2);
  }
  
  function check_wage_type(amount) {
    if (!$("wage_type_annual").checked)
    {
      amount = amount/(50*40);
    }
    return parseFloat(amount).toFixed(2);
  }
  
  

  function inc_totals_at_rate(rate, inc) {
    curamount += inc;
    if (startamount != $("startcost").firstChild.nodeValue)
    {
      startamount = parseInt($("startcost").firstChild.nodeValue);
      curamount = startamount;
    }
    // redisplay the raw total 
    //the $() function is from prototype its awesome
    $("raw").firstChild.nodeValue = 
    "$" + number_str(curamount);

    // run this function again 
    setTimeout('inc_totals_at_rate('+rate+','+inc+');', rate);
  }

  var send_it = true;
  function do_send()
  {
  	return false;
  	if (send_it)
  	{
  		return(send_it);
  	}
  	else
  	{
  		send_it = true;
  		return false;
  	}
  }


  function calc_costa()
  {
  	$("meeting_dollars_per_hour").value = parseInt($("dph").value).toFixed(2);
  	send_it = false;
  }

  function calc_costb()
  {
  	$("meeting_dollars_per_hour").value = (parseInt($("pwm").value) * parseInt($("salary").value) / (52 * 40)).toFixed(2);
  	send_it = false;
  }

  /*might be neat to set this automatically by reading the css style info or something*/
  var CHEIGHT = 36;
  var CDIGITS = 6;

  /*
   * This is sort of hacky, since this function gets called all the time
   * I took the local variable and made them global so they don't
   * have to be garbage collected.
   */
  var offset = 0;
  var total = 0;
  function set(total, rolling_digits) {
  	offset = total - Math.floor(total);
  	total = total - offset;

  	for (i=1; i <= CDIGITS; i++)
  	{
  		placeset(i, offset + (total % 10));
  		if (total % 10 != 9 && rolling_digits < i)
  		{
  			offset = 0;
  		}
      if (rolling_digits >= i)
      {
        offset = total/10 - Math.floor(total/10);
  		}
      total = Math.floor(total/10);
  	}
    while (total > 0)
    {
      if ((CDIGITS +1) % 3 == 0)
      {
        new Insertion.Top($("current_cost"), "<div class='decimal'>,</div>")
      }
      CDIGITS += 1;
      new Insertion.Top($("current_cost"), "<div class='numeral' id='place" +String(CDIGITS)+"'></div>");
      storePlaceStyle(CDIGITS);
      placeset(CDIGITS, total % 10);
      total = Math.floor(total/10);
    }
  }
  
  var milliseconds_per_cent = 0;
  var placeStyles = [];
  var rollers = 0;
  var intervalId;

  /*
   *  Store the style of each place in an array for faster lookup
   */
  function storePlaceStyle(place) {
    placeStyles[place] =  $("place" + String(place)).style;
  }

  /*
   * move the number strip at a specified place by a specified amount
   */
  function placeset(sig_place, value) {
    placeStyles[sig_place].backgroundPosition = "0px " + String(value*-CHEIGHT) + "px" 
  }
  
  /*
   * Initialize the counter
   */
  function init(cents_per_hour, start_time, start_amount) {
    milliseconds_per_cent = 3600000/cents_per_hour;
  	rollers = Math.ceil(Math.log(40/milliseconds_per_cent)/Math.LN10);
    for (i=1; i <= 6; i++) {
      storePlaceStyle(i);
    }
  	intervalId = setInterval("MC.roll(" + String(cents_per_hour) +", "+String(start_time) + ", " + String(start_amount) + ");", 40);
  }

  /*
   * can add start amount to this to allow ajax syncing
   * TODO: need a sync method that cancels the current interval and starts
   * a new one (use intervalId to cancel)
   */
  function roll(cents_per_hour, start_time, start_amount) {
  	duration = new Date().getTime() - start_time;
  	cents = duration/milliseconds_per_cent + start_amount;
    set(cents, rollers );
  }
  
  return {roll : roll,
          set : set,
          number_str: number_str,
          calc : calc,
          do_send : do_send,
          check_wage_type : check_wage_type,
          inc_totals_at_rate : inc_totals_at_rate,
          init :init}
  
}();






