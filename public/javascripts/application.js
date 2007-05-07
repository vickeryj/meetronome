// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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
CHEIGHT = 36;

function set(total) {
	offset = total - Math.floor(total);
	total = total - offset;

	for (i=0; i < 6; i++)
	{
		placeset(Math.pow(10,i), offset + (total % 10));
		if (total % 10 != 9)
		{
			offset = 0;
		}
		total = Math.floor(total/10);
	}
}
function placeset(sig_place, value) {
	$("place" + String(sig_place)).style.backgroundPosition = "0px " + String(value*-CHEIGHT) + "px" 
}
/*can add start amount to this to allow ajax syncing*/
function roll(cents_per_hour, start_time, start_amount) {
	milliseconds_per_cent = 3600000/cents_per_hour;
	now = new Date();
	duration = now.getTime() - start_time;
	cents = duration/milliseconds_per_cent + start_amount;
	set(cents);
	/*there must be a better way to refer to the roll callback create a function pointer or something)*/
	setTimeout("roll(" + String(cents_per_hour) +", "+String(start_time) + ", " + String(start_amount) + ");", 40);
}

