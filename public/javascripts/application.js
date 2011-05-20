$(function(){
  // Subscribe to juggernaut
  var channel_id = $('#chat_form #room').val();
  var channel_password = $('#chat_form #password').val();
  var channel_name = "chatroom_" + channel_id + "_" + channel_password;
  var juggernaut = new Juggernaut;
  
  juggernaut.on('connect', function(){
    // We are connected!
    console.log('Connected to push server!');
    add_message_to_chat('You are now connected.');
  });
  
  juggernaut.on('disconnect', function(){
    console.log('Disconnected from push server!');
    add_message_to_chat('You were disconnected from the server.');
  });
  
  juggernaut.subscribe(channel_name, function(data){
    // All data received is handled here
    add_message_to_chat(data.author + ": " + data.message);
  });
});

function current_time() {
  var date = new Date();
  var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
  var mins = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
  var secs = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
  return hours + ":" + mins + ":" + secs;
}

function add_message_to_chat(message) {
  var message = $('<p><b>' + current_time() + '</b> ' + message + '</p>');
  $('#messages').append(message);
}