class AvailableTeachersTool < RubyLLM::Tool
  description 'Get available teachers and TAs working today'

  def initialize(batch_number:)
    @batch_number = batch_number
  end

  def execute
    url = "https://kitt.lewagon.com/api/v1/camps/#{@batch_number}/todays_teachers"

    response = Faraday.get(url)
    return JSON.parse(response.body)
  rescue StandardError => e
    { error: e.message }
  end
end
