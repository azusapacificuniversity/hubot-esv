# Description:
#   Simple ESV passage lookup based on esv-api.org
# 
# Commands:
#   hubot esv <passage>
#
# Configuration:
#   HUBOT_ESV_API_KEY (Authorization token header value without "Token")
#
# Notes:
#   An API key from api.esv.org is required.
#   Obtain one from https://api.esv.org/account/create-application/
#   See https://api.esv.org/docs/passage-text/#required-parameters for syntax
#
# Author:
#   Scott A. Williams <vwfoxguru@gmail.com>

module.exports = (robot) ->
  robot.respond /esv\s+(.*)/i, (msg) ->
    if not msg.match[1]
      msg.send "Please provide a Bible passage for lookup"
      return
    else
      passage = msg.match[1]
      url = "https://api.esv.org/v3/passage/text/?q=" + passage + "&output-format=plain-text&include-footnotes=false&include-passage-horizontal-lines=false&include-heading-horizontal-lines=false&include-headings=false&include-subheadings=false&include-footnotes=false"
      robot.http(url)
        .header("Authorization","Token #{process.env.HUBOT_ESV_API_KEY}")
        .get() (err, res, body) ->
          if err
            msg.send "We have a problem: #{err}"
            return
          else
            data = JSON.parse body
            payload = passage for passage in data.passages
            if payload.split('\n').length > 8 || payload.split(' ').length > 50
              filename = passage
              opts = {
                content: payload
                title: passage
                channels: msg.message.room
                mode: "snippet"
              }
              robot.adapter.client.web.files.upload(filename, opts)
            else
              msg.send payload
            return
