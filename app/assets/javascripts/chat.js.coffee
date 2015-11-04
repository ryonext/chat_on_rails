#= require websocket_rails/main

class @ChatClass
  constructor: (url, useWebsocket) ->
    @dispatcher = new WebsocketRails(url, useWebsocket)
    @events()

  events: () =>
    $("#button").on "click", @submitMessage
    @dispatcher.bind "after_send_message", @receiveMessage

  submitMessage: (event) =>
    @dispatcher.trigger "send_message", { body: "hogehoge" }

  receiveMessage: (message) =>
    console.log message

$ ->
  window.chatClass = new ChatClass("http://localhost:3000/websocket", true)
