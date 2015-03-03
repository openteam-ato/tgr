require 'esp-commons'
require 'progress_bar'
require 'timecop'

desc "Syncronize blue-pages tree"

namespace :contexts do
  task :sync => :environment do
    remotes = JSON.parse(Requester.new("#{Settings['blue-pages.url']}/categories/2.json?sync=true").response_body)
    bar = ProgressBar.new(remotes.count + (DatasetContext.pluck('id') - remotes.map{|r| r['id']}).count)

    DatasetContext.record_timestamps = false
    updated_at = Time.zone.now

    remotes.each do |remote|
      Timecop.freeze(updated_at) do
        (DatasetContext.find_or_initialize_by_id(remote['id'])).tap do |context|
          context.created_at ||= updated_at
          context.updated_at = updated_at
          context.update_attributes! remote
        end
      end
      bar.increment!
    end

    DatasetContext.where('updated_at <> ?', updated_at).each do |stale_context|
      stale_context.destroy
      bar.increment!
    end
  end
end
