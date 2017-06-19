defmodule Spawn2 do
  def great do
    receive do
      { sender, name } ->
        send sender, { :ok, "Hello, #{name}!" }
    end
  end
end


pid = spawn(Spawn2, :great, [])
send pid, {self(), "World!"}

receive do
  { :ok, message } ->
    IO.puts message
end

send pid, { self(), "Donya!" }

receive do
  { :ok, message } ->
    IO.puts message
end
