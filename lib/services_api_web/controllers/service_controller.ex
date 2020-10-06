defmodule ServicesApiWeb.ServiceController do
  use ServicesApiWeb, :controller

  alias ServicesApi.ServicePool
  alias ServicesApi.ServicePool.Service

  action_fallback ServicesApiWeb.FallbackController

  def index(conn, _params) do
    services = ServicePool.list_services()
    render(conn, "index.json", services: services)
  end

  def create(conn, %{"service" => service_params}) do
    with {:ok, %Service{} = service} <- ServicePool.create_service(service_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.service_path(conn, :show, service))
      |> render("show.json", service: service)
    end
  end

  def show(conn, %{"id" => id}) do
    service = ServicePool.get_service!(id)
    render(conn, "show.json", service: service)
  end

  def update(conn, %{"id" => id, "service" => service_params}) do
    service = ServicePool.get_service!(id)

    with {:ok, %Service{} = service} <- ServicePool.update_service(service, service_params) do
      render(conn, "show.json", service: service)
    end
  end

  def delete(conn, %{"id" => id}) do
    service = ServicePool.get_service!(id)

    with {:ok, %Service{}} <- ServicePool.delete_service(service) do
      send_resp(conn, :no_content, "")
    end
  end
end
