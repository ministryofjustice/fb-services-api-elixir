defmodule ServicesApi.ServicePoolTest do
  use ServicesApi.DataCase

  alias ServicesApi.ServicePool

  describe "services" do
    alias ServicesApi.ServicePool.Service

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def service_fixture(attrs \\ %{}) do
      {:ok, service} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ServicePool.create_service()

      service
    end

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert ServicePool.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert ServicePool.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      assert {:ok, %Service{} = service} = ServicePool.create_service(@valid_attrs)
      assert service.name == "some name"
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ServicePool.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      assert {:ok, %Service{} = service} = ServicePool.update_service(service, @update_attrs)
      assert service.name == "some updated name"
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = ServicePool.update_service(service, @invalid_attrs)
      assert service == ServicePool.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = ServicePool.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> ServicePool.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = ServicePool.change_service(service)
    end
  end
end
