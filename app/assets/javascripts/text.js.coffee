# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

getPlaceholderWidth = (element) ->
    _$tmpSpan = $('<span/>').html($(element).attr('placeholder')).css({
        position: 'absolute',
        left: -99999,
        top: -9999
    }).appendTo('body')
    textWidth = _$tmpSpan.width()
    _$tmpSpan.remove()
    return textWidth

resizeInput = () ->
    $(this).attr('size', $(this).val().length + 2)

hideMessagePrompt = () ->
    $('.message-template-prompt').addClass('message-template-prompt-hidden')
    $('.message-template-prompt').attr("aria-hidden", true)

showMessagePrompt = () ->
    $('.message-template-prompt').removeClass('message-template-prompt-hidden')
    $('.message-template-prompt').attr("aria-hidden", false)
    

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

        $('.message-template-input-wrapper').removeClass('hidden') # unhide entire template input section
        showMessagePrompt() # unhide h3 prompt
        if counter == 0
            hideMessagePrompt() # hide h3 prompt if no input is required

        $(".message-template-textarea").html(msg) # fill textarea with template message

        $(".template-input").each (index, element) =>
            $(element).css('min-width', getPlaceholderWidth(element) + 7)
            resizeInput.call($(element))

        $('.template-input').keyup ->
            resizeInput.call($(this))

    # fill template blank onchange



    

    # write custom message onclick

    $('.message-custom-toggle').click ->
        $('.message-template-wrapper').toggleClass('hidden')

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




