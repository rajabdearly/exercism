defmodule TakeANumber do
  def start() do
    spawn(fn -> child_process_func() end)
  end

  defp child_process_func(state \\ 0) do
    result =
      receive do
        {:report_state, sender_pid} ->
          %{state_to_send: state, sender_pid: sender_pid, status: :ok}

        {:take_a_number, sender_pid} ->
          %{sender_pid: sender_pid, state_to_send: state + 1, status: :ok}

        :stop ->
          :stop

        _ ->
          :continue
      end

    case result do
      %{status: :ok, sender_pid: spid, state_to_send: st} ->
        send(spid, st)
        child_process_func(st)

      :stop ->
        nil

      :continue ->
        child_process_func(state)
    end
  end
end
