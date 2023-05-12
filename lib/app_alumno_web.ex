defmodule AppAlumnoWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, components, channels, and so on.

  This can be used in your application as:

      use AppAlumnoWeb, :controller
      use AppAlumnoWeb, :html

  The definitions below will be executed for every controller,
  component, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define additional modules and import
  those modules here.
  """


  def router do
    quote do
      use Phoenix.Router

      # Import common connection and controller functions to use in pipelines
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def controller do

    quote do
      use Phoenix.Controller, namespace: AppAlumnoWeb

      import Plug.Conn
      import AppAlumnoWeb.Gettext
      alias AppAlumnoWeb.Router.Helpers, as: Routes
    end

  end

  def view do
    quote do
      use Phoenix.View,
          root: "lib/app_alumno_web/templates",
          namespace: AppAlumnoWeb

      # Import convenience functions from controllers
      import Phoenix.Controller,
             only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Include shared imports and aliases for views
      unquote(view_helpers())
    end
  end

  defp view_helpers do
    quote do
      # Import basic rendering functionality (render, render_layout, etc)
      import Phoenix.View

      import AppAlumnoWeb.ErrorHelpers
      import AppAlumnoWeb.Gettext
      alias AppAlumnoWeb.Router.Helpers, as: Routes
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
