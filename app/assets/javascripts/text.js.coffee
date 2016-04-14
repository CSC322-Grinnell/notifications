# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->


    # select template onclick
    $(".message-template-item").click ->     
        template = messages[$(this)[0].id]
        msg = template.text
        counter = 0

        while msg.indexOf("_$_") > 0
            firsthalf = msg.substring(0, msg.indexOf("_$_"))
            secondhalf = msg.substring(msg.indexOf("_$_") + 3)
            msg = firsthalf + '<input type="text" class="template-input" placeholder="' + template.blanks[counter] + '">' + secondhalf
            counter++

        $(".message-template-textarea").html(msg) # fill textarea with template message

    # fill template blank onchange




    # write custom message onclick

messages = [
    {
        text: "Head Start / Early Head Start classes are cancelled due to weather",
    },
    {
        text: "Head Start / Early Head Start classes will be starting late. Start time will be available from local radio station.",
    },
    {
        text: "Head Start / Early Head Start classes are closing early today due to weather.  Please pick up your child at _$_.",
        blanks: ["location"]
    },
    {
        text: "Reminder - No Head Start / Early Head Start classes on _$_ due to teacher inservice or work day."
        blanks: ["date"]
    }
]




