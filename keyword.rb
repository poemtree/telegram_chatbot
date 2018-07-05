require 'telegram/bot'

token = ENV["telegram_token"]

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/sunwoo'
      bot.api.send_message(chat_id: message.chat.id,text:"선우야 밥은 묵고댕기냐~~!!")
    end
  end
end