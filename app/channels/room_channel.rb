class RoomChannel < ApplicationCable::Channel
  def subscribed
    question = Question.find(params[:id])
    stream_for question
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # jsのspeak関数のperformによって呼び出される
  # この後receivedに渡せるようにデータ保存後にmessege.rbのjobが機能してreceivedへ
  def speak(data)
    question = Question.find(data['question_id'])
    message = question.messages.build(content: data['message']) 
    message.user = current_user 
    message.save!
  end
end
