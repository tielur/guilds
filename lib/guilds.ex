defmodule Guilds do
  require IEx

  @moduledoc """
  Documentation for Guilds.
  """

  @doc """
  guild_from_channel_id

  ## Examples

      iex> [%{guild_id: 1, channels: [%{id: 1234}, %{id: 5678}]}, %{guild_id: 2, channels: [%{id: 9}, %{id: 10}]}]
      ...> |> Guilds.guild_from_channel_id(1234)
      1

      iex> [%{guild_id: 1, channels: [%{id: 1234}, %{id: 5678}]}, %{guild_id: 2, channels: [%{id: 9}, %{id: 10}]}]
      ...> |> Guilds.guild_from_channel_id(10)
      2

  """
  def guild_from_channel_id(guilds, channel_id) do
    Enum.map(guilds, fn guild ->
      channel_ids =
        Enum.map(guild.channels, fn channel ->
          channel.id
        end)

      if Enum.member?(channel_ids, channel_id) do
        guild.guild_id
      end
    end)
    |> Enum.filter(& &1)
    |> hd()
  end
end
