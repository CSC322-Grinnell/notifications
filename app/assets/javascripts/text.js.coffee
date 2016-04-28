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

numStudentsSelected = () =>
    return $('.recipients-student-select:checked').length

messageNotEmpty = () =>
    if $('.message-template-wrapper').hasClass('hidden-force')
        return $('.message-custom-textarea').val().length > 0
    else 
        return templatesNotEmpty() && !$('.message-template-textarea').is(':empty')

templatesNotEmpty = () =>
    return $(".message-template-textarea").children().toArray().reduce (previousValue, currentValue) =>
        return previousValue && currentValue.value.length > 0
    , true

verifyInput = () =>
    if  messageNotEmpty() && numStudentsSelected() > 0
        $('.submit-button').removeClass('inactive')
    else
        $('.submit-button').removeClass('inactive')
        $('.submit-button').addClass('inactive')

$ ->

    ## section text-recipients

    # show and hide classrooms
    $('.recipients-room-label').click ->
        labelFor = $(this).attr('for')
        legendId = labelFor.substring('class-tab-'.length) # find the id e.g 'class-tab-5' -> 5
        $("#classroom-" + legendId).toggleClass('hidden')

    $('.recipients-student-select').click ->
        verifyInput()

    $('.recipients-select-all').click ->
        thisId = this.id.substring("recipients-select-all-".length) # find the id e.g. 'recipients-select-all-1' -> 1
        $("#classroom-" + thisId + " .recipients-student-select").each (index, element) =>
            if $(this).prop("checked") # check all
                $(element).prop("checked", true)
            else                       # uncheck all
                $(element).prop("checked", false)
        verifyInput()


    ## section text-sendmessage

    # select template onclick
    $(".message-template-item").click ->   

        template = messages[$(this)[0].id]
        msg = template.text
        counter = 0

        while msg.indexOf("_$_") > 0
            firsthalf = msg.substring(0, msg.indexOf("_$_"))
            secondhalf = msg.substring(msg.indexOf("_$_") + 3)
            msg = firsthalf + '<input type="text" class="template-input" required placeholder="' + template.blanks[counter] + '">' + secondhalf
            counter++

        $('.message-template-input-wrapper').removeClass('hidden-force') # unhide entire template input section
        showMessagePrompt() # unhide h3 prompt
        if counter == 0
            hideMessagePrompt() # hide h3 prompt if no input is required

        $(".message-template-textarea").html(msg) # fill textarea with template message
        verifyInput()


        $(".template-input").each (index, element) =>
            $(element).css('min-width', getPlaceholderWidth(element) + 7)
            resizeInput.call($(element))

        $('.template-input').keyup ->
            resizeInput.call($(this))
            verifyInput()

    # write custom message onclick

    $('.message-custom-toggle').click ->
        $('.message-custom-textarea').val('')
        $('.message-custom-wrapper').toggleClass('hidden')
        $('.message-template-wrapper').toggleClass('hidden-force')
        verifyInput()

    $('.message-custom-textarea').keyup ->
        verifyInput()

    # send message onclick

    $('#send-message-form').submit (event) =>
        if $('.submit-button').hasClass('inactive')
            return false
        else
            return true


    $('.submit-button').click ->
        
        verifyInput()

        if ('.submit-button').hasClass('invalid')
            return true # break out, don't submit form
        else
            $(".message-template-textarea").children().map (index, element) =>
                $(element).replaceWith(element.value)
            
            $('.message-custom-textarea').text($(".message-template-textarea").text())

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




