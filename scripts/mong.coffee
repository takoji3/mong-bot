cronJob = require('cron').CronJob

module.exports = (robot) ->

  send = (channel, msg) ->
    robot.send { room: channel }, msg

  new cronJob('0 55 7 * * *', () ->
    send "#general", ":sunny: おはようございます！ :star2:"
  ).start()

  new cronJob('0 30 23 * * *', () ->
    send "#general", "お休みの時間ですよ！ :zzz:"
  ).start()

  new cronJob('0 30 17 * * 3,6', () ->
    send "#general", "ランニングの時間だ :runnning: 走れ走れ！"
  ).start()

  new cronJob('0 0 10 * * 1,2,3,4,5', () ->
    send "#general", "お仕事を開始しましょう :+1:"
  ).start()

  robot.hear /つかれた/, (msg) ->
    msg.send "つかれたねぇ〜"

  robot.respond /focus ([0-9]+)/, (res) ->
    t = res.match[1]
    res.send "OK, I'll notify you in #{t} minutes"
    setTimeout () ->
      res.reply "#{t} miniutes has passed!"
    , t * 1000 * 60
