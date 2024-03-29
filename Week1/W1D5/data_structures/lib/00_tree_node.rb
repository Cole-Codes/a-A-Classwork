require "byebug"

class PolyTreeNode
    attr_reader :parent, :children 
    attr_accessor :value

    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        p @value
    end

    def parent=(parent) 
        return if @parent == parent
        
        @parent.children.delete(self) if !@parent.nil?

        ## set parent property
        @parent = parent

        ## add node to parent's array of children (unless parent is nil)
        @parent.children << self if !@parent.nil?
        
        self
    end
    
    def add_child(child_node)  ## no need to add child to array as the parent=() function already performs this act
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Cannot disown someone else's kid dude" if !@children.include?(child_node)

        child_node.parent = nil
    end
    
    ### Search Methods

    def dfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }
    
        return self if prc.call(self)
    
        children.each do |child|    
            result = child.dfs(&prc)
            return result unless result.nil?
        end
    
        nil
    end
    
    def bfs(target = nil, &prc)
        # look at self for value, if not found, look at children nodes and add to result (pop self)
        # iterate through first child node, look at value, if not found, pop child and push child's child in

        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }
    
        nodes = [self]
        until nodes.empty?
            node = nodes.shift

            return node if prc.call(node)
            nodes.concat(node.children)
        end

        nil
    end

    

end








# Phase 4: Searching
# Write a #dfs(target_value) method which takes a value to search for and performs the search. Write this recursively.
# First, check the value at this node. If a node's value matches the target value, return the node.
# If not, iterate through the #children and repeat.


# Write a #bfs(target_value) method to implement breadth first search.
# You will use a local Array variable as a queue to implement this.
# First, insert the current node (self) into the queue.
# Then, in a loop that runs until the array is empty:
# Remove the first node from the queue,
# Check its value,
# Push the node's children to the end of the array.
# Prove to yourself that this will check the nodes in the right order. Draw it out. Show this explanation to your TA.
# Get your TA to check your work!
# Make sure all the specs pass.