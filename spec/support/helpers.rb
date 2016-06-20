def check_response_with_template(template, layout = 'application', content_type = 'html', status = 'ok')
  it { is_expected.to respond_with status.to_sym }
  it { is_expected.to respond_with_content_type content_type.to_sym }
  it { is_expected.to render_with_layout layout.to_sym }
  it { is_expected.to render_template template.to_sym }
end
