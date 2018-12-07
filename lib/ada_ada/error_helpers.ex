defmodule AdaAda.ErrorHelpers do
  use Phoenix.HTML

  def error_tag(form, field) do
    IO.inspect form.errors
    IO.inspect field
    if Enum.find(form.errors, fn err -> elem(err, 0) == field end) do
      err_msg = elem(form.errors[field], 0)
      IO.inspect err_msg
      ~E"""
        <div class="invalid-feedback">
          <%= err_msg %> 
        </div>
      """
    end
  end
end
