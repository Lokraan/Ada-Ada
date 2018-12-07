defmodule AdaAda.InputHelpers do
  use Phoenix.HTML

  # http://blog.plataformatec.com.br/2016/09/dynamic-forms-with-phoenix/ 

  def input(form, field, opts \\ []) do
    type = opts[:using] || Phoenix.HTML.Form.input_type(form, field)
    name = opts[:name] || field
    IO.puts "#{name} = #{opts[:name]} || #{field}"

    wrapper_opts = [class: "form-group #{state_class(form, field)}"]
    label_opts = [class: "control-label"]
    input_opts = [class: "form-control #{state_class(form, field)}"]

    content_tag :div, wrapper_opts do
      label = label(form, field, humanize(name), label_opts)
      input = input(type, form, field, input_opts)
      error = AdaAda.ErrorHelpers.error_tag(form, field) || ""
      [label, input, error]
    end
  end

  defp state_class(form, field) do
    cond do
      # The form was not yet submitted
      !form.source.action -> ""
      form.errors[field] -> "is-invalid"
      true -> "is-valid"
    end
  end

  # Implement clauses below for custom inputs.
  # defp input(:datepicker, form, field, input_opts) do
  #   raise "not yet implemented"
  # end
  defp input(type, form, field, input_opts) do
    apply(Phoenix.HTML.Form, type, [form, field, input_opts])
  end
end
