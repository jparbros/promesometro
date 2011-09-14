module ApplicationHelper
  
  def print_topics_links
    ("A".."Z").each do |letter|
      concat link_to(letter, '', :class => 'topic_link', :letter => letter)
    end
    
    def print_topics_by_letter
      @topics = Topic.grouped_by_first_letter
      ("A".."Z").each do |letter|
        topic_div = content_tag(:div, :id => letter, :class => 'topic_content') do
          if @topics.include?(letter)
            @topics[letter].each do |topic|
              concat(link_to(topic.name.humanize, promesas_path('search[topics_name_equals]' => topic.name)))
              concat(tag(:br))
            end
          end
        end
        concat(topic_div)
      end
    end
  end
end
