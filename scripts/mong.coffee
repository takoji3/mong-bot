module.exports = (robot) ->
  robot.hear /つかれた/, (msg) ->
    msg.send "つかれたねぇ〜"
