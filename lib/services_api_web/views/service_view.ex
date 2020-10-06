defmodule ServicesApiWeb.ServiceView do
  use ServicesApiWeb, :view
  alias ServicesApiWeb.ServiceView

  def render("index.json", %{services: services}) do
    %{data: render_many(services, ServiceView, "service.json")}
  end

  def render("show.json", %{service: service}) do
    %{data: render_one(service, ServiceView, "service.json")}
  end

  def render("service.json", %{service: service}) do
    %{id: service.id,
      name: service.name}
  end
end
