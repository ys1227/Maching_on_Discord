class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # jsのspeak関数のperformによって呼び出される
  # この後receivedに渡せるようにデータ保存後にmessege.rbのjobが機能してreceivedへ
  def speak(data)
    Message.create! content: data['message']
  end
end