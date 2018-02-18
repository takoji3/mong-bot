cronJob = require('cron').CronJob

module.exports = (robot) ->

  send = (channel, msg) ->
    robot.send { room: channel }, msg

  new cronJob('0 5 7 * * *', () ->
    send "#general", "おはようございます！"
  ).start()

  robot.hear /つかれた/, (msg) ->
    msg.send "つかれたねぇ〜"

  robot.respond /focus ([0-9]+)/, (res) ->
    t = res.match[1]
    res.send "OK, I'll notify you in #{t} minutes"
    setTimeout () ->
      res.reply "#{t} miniues has passed!"
    , t * 1000 * 60
