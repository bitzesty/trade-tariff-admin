module FeaturesHelper
  def ensure_on(path)
    visit(path) unless current_path == path
  end

  def verify(call)
    expect(call).to be_truthy
  end

  def refute(call)
    expect(call).to be_falsey
  end

  def dom_id_for(model)
    ActionView::RecordIdentifier.dom_id(model)
  end

  def dom_id_selector(model)
    "##{dom_id_for(model)}"
  end
end
