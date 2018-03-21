# require modules here

def load_library(path)
  require 'yaml'
  emoticons_file = YAML.load_file(path)

  emoticons = {"get_emoticon" =>{}, "get_meaning" => {}}
  emoticons_file.each do |key, value|
    emoticons["get_meaning"][value[1]] = key.to_s
    emoticons["get_emoticon"][value[0]] = value[1]
    # puts "meanings. E: #{value[0]}. J: #{value[1]}"
  end
  return emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons_hash = load_library(file_path)

  emoticons_hash.each do |get_meaning, get_emoticon|
    get_emoticon.each do |e_key, j_value|
      if emoticon == e_key.to_s
        return j_value
      end
    end
    return "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(file_path, emoticon)
  emoticons_hash = load_library(file_path)

  emoticons_hash.each do |meaning, emo|
    emo.each do |e_key, j_value|
      if emoticon == e_key
        return j_value
      end
    end
  end
  return "Sorry, that emoticon was not found"
end
