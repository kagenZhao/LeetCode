//
//  main.swift
//  LeetCode
//
//  Created by 赵国庆 on 2017/3/30.
//  Copyright © 2017年 kagenZhao. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {
    public var count: Int {
        return 1 + (next?.count ?? 0)
    }
}


extension ListNode: CustomStringConvertible {
    public var description: String {
        return "\(val) -> \(next != nil ? next!.description : "")"
    }
}

extension Array where Element == Int {
    var toNode: ListNode? {
        return reversed().reduce(nil) { (r: ListNode?, e: Element) -> ListNode? in
            let n = ListNode(e)
            n.next = r
            return n
        }
    }
}


//print(AddTwoNumbers().addTwoNumbers([2, 4, 3].toNode, [5, 6, 4].toNode) ?? "")


//print(LongestSubStringWithoutRepetingCharacters().lengthOfLongestSubstring("dvdf"))



//ReqularExpressionMatching1().isMatch("abc", "a*bc")

//[
//    [true, false, false, false, false, false],
//    [false, false, false, false, false, false],
//    [false, false, false, false, false, false],
//    [false, false, false, false, false, false]
//]

//[
//    [true, false, true, false, false],
//    [false, true, true, false, false],
//    [false, false, false, true, false],
//    [false, false, false, false, true]
//]

//print(RomanToInteger().romanToInt("DCXXI"))

//print(LongestCommonPrefix().longestCommonPrefix(["a"]))

//print(Sum3().threeSum([3,-2,1,0, 1,8, -9, 10, 4, -1, 2, 4, 6]))

//print(Sum3Closest().threeSumClosest([1,2,4,8,16,32,64,128], 82))

//print(LetterCombinationsOfAPhoneNumber().letterCombinations("23"))

//print(Sum4().fourSum([-3,-2,-1,0,0,1,2,3], 0))

//print(RemoveNthNodeFromEndOfList().removeNthFromEnd([1, 2].toNode, 1))


//print(ValidParentheses().isValid("[([([])])]]"))


//print(GenerateParentheses().generateParenthesis(3))

//print(MergeKSortedLists().mergeKLists([[Int]().toNode, [1].toNode]))



//print(SwapNodesInPairs().swapPairs([1, 2, 3, 4].toNode!))

//print(ReverseNodesInkGroup().reverseKGroup([1, 2, 3].toNode, 4))

//var num = [Int](arrayLiteral: 1, 2, 3, 4, 5, 5, 6)
//print(RemoveDuplicatesFromSortedArray().removeDuplicates(&num))


// var num = [3, 2, 2, 3]
//print(RemoveElement().removeElement(&num, 3))
//print(num)


//print(ImplementStrStr().strStr("asdfggg", "df"))

//print(DivideTwoIntegers().divide(-2147483648, -1))


//print(SubstringwithConcatenationofAllWords().findSubstring("a", ["a"]))

//var nums = [5,4,7,5,3,2]
//print(Next_Permutation().nextPermutation(&nums))


//print(Search_in_Rotated_Sorted_Array().search([1,3], 0))

//print(Search_for_a_Range().searchRange([5,7,7,8,8,10], 8))

//print(Search_Insert_Position().searchInsert([1,3], 4))

//print(Valid_Sudoku().isValidSudoku(
//    [[".","8","7","6","5","4","3","2","1"],
//     ["2",".",".",".",".",".",".",".","."],
//     ["3",".",".",".",".",".",".",".","."],
//     ["4",".",".",".",".",".",".",".","."],
//     ["5",".",".",".",".",".",".",".","."],
//     ["6",".",".",".",".",".",".",".","."],
//     ["7",".",".",".",".",".",".",".","."],
//     ["8",".",".",".",".",".",".",".","."],
//     ["9",".",".",".",".",".",".",".","."]]))


//var board: [[Character]] = [
//    ["8",".",".",".",".",".",".",".","."],
//    [".",".","3","6",".",".",".",".","."],
//    [".","7",".",".","9",".","2",".","."],
//    [".","5",".",".",".","7",".",".","."],
//    [".",".",".",".","4","5","7",".","."],
//    [".",".",".","1",".",".",".","3","."],
//    [".",".","1",".",".",".",".","6","8"],
//    [".",".","8","5",".",".",".","1","."],
//    [".","9",".",".",".",".","4",".","."],
//]
//Sudoku_Solver().solveSudoku2(&board)
//print(board)


//print(Count_and_Say().countAndSay(4))

//print(Combination_Sum().combinationSum([2, 3, 5], 8))


//print(Combination_Sum_II().combinationSum2([4,4,2,1,4,2,2,1,3], 6))

//print(First_Missing_Positive().firstMissingPositive([-1,4,2,1,9,10]))
//                    0 1 2 3 4 5 6 7 8
print(接雨水().trap([9,2,9,3,2,2,1,4,8]))
//print(接雨水().trap([3,0,1,2]))

