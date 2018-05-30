require 'nokogiri'

def wrap_content(page_content)
	html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)

	#wrap each header h1,h2,h3,h4 tags with a div of the same level 
	level1 = html_doc.css("h1[@id]").wrap("<div class='level-1'></div>")
	level2 = html_doc.css("h2[@id]").wrap("<div class='level-2'></div>")
	level3 = html_doc.css("h3[@id]").wrap("<div class='level-3'></div>")
	level4 = html_doc.css("h4[@id]").wrap("<div class='level-4'></div>")

	#iterate through the nodes to add as child to the pre-processed nodes above
	[level4, level3, level2].each do | level_nodeset |
		level_nodeset.each do | node |
			level = node.parent['class']
			next_node = node.parent.next_element

			while next_node and next_node['class'] != level

				#check for end of level
				if next_node['class'] and next_node['class'][-1] < level[-1]
					break
				end

				next_node.parent = node.parent
				next_node = next_node.parent.next_element
			end
		end
	end
	html_doc
end

