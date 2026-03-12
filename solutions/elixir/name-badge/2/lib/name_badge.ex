defmodule NameBadge do
  def print(id, name, department) do
    id_part = if id, do: "[#{id}] - ", else: ""

    if department == nil do
      "#{id_part}#{name} - OWNER"
    else
      "#{id_part}#{name} - #{String.upcase(department)}"
    end
  end
end
