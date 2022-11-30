require 'csv'

# Method to Convert CSV Row Data in an Array to Row Data as a Hash
def convert_row_array_to_hash(row, csv_headers)
  h = {}
  csv_headers.zip(row) { |a,b| h[a.to_sym] = b }
  h
end

namespace :import_from_csv do
  desc "Import data from CSV"
  task :create_videos => :environment do
    Dir.glob('/myapp/*.csv') do |filename|
      csv_headers = ["uri","name","length","image_uri","iframe","tags","actor","vid","category","mode"]
      File.open(filename, 'r') do |file|
        csv = CSV.new(file, headers: false, quote_char: nil, col_sep: ';')
        while row = csv.shift
          Video.create(convert_row_array_to_hash(row, csv_headers))
        end
      end
    end
  end
end