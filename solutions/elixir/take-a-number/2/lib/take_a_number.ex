defmodule TakeANumber do
  def start() do
    spawn(fn -> child_process_func() end)
  end

  defp child_process_func(state \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        child_process_func(state)

      {:take_a_number, sender_pid} ->
        new_state = state + 1
        send(sender_pid, new_state)
        child_process_func(new_state)

      :stop ->
        nil

      _ ->
        child_process_func(state)
    end
  end
end
