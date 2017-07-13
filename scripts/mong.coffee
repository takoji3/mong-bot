CronJob = require('cron').CronJob

module.exports = (robot) ->

  send = (channel, msg) ->
    robot.send { room: channel }, msg

  new CronJob('0 0 8 * * *', () ->
    send "#general", "おはようございます！"
  ).start()

  robot.hear /つかれた/, (msg) ->
    msg.send "つかれたねぇ〜"
