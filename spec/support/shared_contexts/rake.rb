# frozen_string_literal: true

require 'rake'

RSpec.shared_context 'with rake' do
  let(:rake) { Rake::Application.new }
  let(:task_name) { self.class.top_level_description }
  let(:task_path) { "lib/tasks/#{task_name.split(':').first}" }

  def loaded_files_excluding_current_rake_path
    $LOADED_FEATURES.reject { |file| file == Rails.root.join("#{task_name}.rb").to_s }
  end

  before do
    Rake.application = rake
    Rake.application.rake_require(task_path, [Rails.root.to_s], loaded_files_excluding_current_rake_path)

    Rake::Task.define_task(:environment)
  end
end
