class String
  def markup_newlines
    '<p>' + gsub(/\n\n/,'</p><p>').gsub(/\n/,'<br/>') + '</p>'
  end
end

class Object
  def method_missing(symbol, *args)
    $post[symbol] ? $post[symbol] : $options[symbol]
  end
end

def content
  $post[:description].markup_newlines
end

def tags
  $post[:mt_keywords]
end

eval $stdin.readlines.join
