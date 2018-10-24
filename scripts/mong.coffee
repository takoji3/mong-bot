cronJob = require('cron').CronJob

module.exports = (robot) ->

  send = (channel, msg) ->
    robot.send { room: channel }, msg

  new cronJob('0 55 7 * * *', () ->
    send "#general", ":sunny: おはようございます！ :star2:"
  ).start()

  new cronJob('0 30 23 * * *', () ->
    send "#general", "@takoji お休みの時間ですよ！ :zzz:"
  ).start()

  new cronJob('0 30 17 * * 3,6', () ->
    send "#general", "@takoji ランニングの時間だ :running: 走れ走れ！"
  ).start()

  robot.hear /つかれた/, (msg) ->
    msg.send "つかれたねぇ〜"

  robot.respond /focus ([0-9]+)/, (res) ->
    t = res.match[1]
    res.send "OK, I'll notify you in #{t} minutes"
    setTimeout () ->
      res.reply "#{t} miniutes has passed!"
    , t * 1000 * 60
