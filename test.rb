# frozen_string_literal: true

t1 = [1, 2]
t2 = [3, 4]
@st = [t1, t2]

def met
  @st.each { |value| yield(value) }
end
met { |v1, v2| p "#{v1} , #{v2}" }
