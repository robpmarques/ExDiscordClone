defmodule DiscordClone.Error do
  @error [:status, :message]

  defstruct @error

  @type t :: %__MODULE__{
    status: integer,
    message: String.t()
  }

  def build(status, message) do
    %__MODULE__{
      status: status,
      message: message
    }
  end
end
