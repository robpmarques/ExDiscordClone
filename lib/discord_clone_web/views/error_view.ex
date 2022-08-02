defmodule DiscordCloneWeb.ErrorView do
  use DiscordCloneWeb, :view

  alias DiscordCloneWeb.ErrorHelpers

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
    def render("error.json", %{message: message}) do
      %{errors: %{message: message}}
    end

    def render("error.json", %{changeset: changeset}) do
      errors = ErrorHelpers.translate_error(changeset)

      %{errors: errors}
    end


  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
