module FeaturesHelper
  def ensure_on(path)
    visit(path) unless current_path == path
  end

  def verify(call)
    expect(call).to be_true
  end

  def refute(call)
    expect(call).to be_false
  end

  def dom_id_for(model)
    ActionView::RecordIdentifier.dom_id(model)
  end

  def dom_id_selector(model)
    "##{dom_id_for(model)}"
  end
end
