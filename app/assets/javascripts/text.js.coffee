# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $(".message-template-item").click ->
        $(".message-textarea").text($(this).text()) # fill textarea with template message