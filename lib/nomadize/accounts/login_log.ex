defmodule Nomadize.Accounts.LoginLog do
  use Ecto.Schema
  import Ecto.Changeset

  alias Nomadize.Accounts.User


  schema "login_log" do
    field :ip_address, :string
    field :login_timestamp, :utc_datetime
    # field :user_id, :id
    belongs_to(:user, User)

    # timestamps()
  end

  @doc false
  def changeset(login_log, attrs) do
    login_log
    |> set_login_log_timestamp()
    |> cast(attrs, [:ip_address, :user_id])
    |> validate_required([:user_id])
  end

    defp set_login_log_timestamp(%__MODULE__{} = login_log) do
    %__MODULE__{login_log | login_timestamp: DateTime.utc_now()}
  end
end
