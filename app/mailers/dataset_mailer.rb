class DatasetMailer < ActionMailer::Base

  default :from => Settings['mail.opendata.sender']

  def new_dataset_message(dataset_params)
    @dataset_params = dataset_params['dataset']
    @dataset = Dataset.find_by_tracking_number(dataset_params[:id])
    mail(:to => Settings['mail.opendata.recipient'], :subject => 'Новое сообщение из раздела «Открытые данные»')
  end

end
