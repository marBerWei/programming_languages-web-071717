def reformat_languages(languages)
  new_hash = {}
  array = []
  languages.each do |oo_func, lang_hash|
    array << lang_hash.keys
    new = array.flatten
    duplicates = new.select { |e| new.count(e) > 1 }
      lang_hash.each do |language, type|
        new_hash[language] = {:type=>type[:type],:style=>[oo_func]}
          if duplicates.uniq[0] == language
            new_hash[language] = {:type=>type[:type],:style=>[:functional, :oo]}
          end
        end
      end

  new_hash
end
