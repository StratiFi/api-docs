require 'nokogiri'

def wrap_content(page_content)
	html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)

	# level1 = html_doc.css('h4').wrap("<div class='level1'></div>")
	# level1.each do | node |
	# 	node.parent.xpath("following-sibling::div[@class='level1'][1]/preceding-sibling::*[preceding-sibling::div[@id='" + node['id'] +"']]").each do | sib |

	#grouping level 4s into 1 div for styling
	# level4 = html_doc.css('h4').wrap("<div class='level4'></div>")
	# level4.each_with_index do | node, index |
	# 	if index != level4.size - 1
	# 		node.parent['id'] = node['id']
	# 		puts node.parent.xpath("following-sibling::h3[1]/preceding-sibling::div[@class='level4'][last()]/following-sibling::div[@class='level4']")
	# 		puts " "
	# 		node.parent.xpath("following-sibling::div[@class='level4'][1]/preceding-sibling::p[preceding-sibling::div[@id='" + node['id'] +"']]").each do | sib |
	# 			sib.parent = node.parent
	# 		end
	# 	end
	# end
	html_doc
end

