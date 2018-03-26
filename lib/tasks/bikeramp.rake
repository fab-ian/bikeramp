# frozen_string_literal: true

namespace :bikeramp do
  desc 'Generate Trip sample data'
  task generate_sample_data: :environment do
    SampleDataGenerator.generate
  end
end
