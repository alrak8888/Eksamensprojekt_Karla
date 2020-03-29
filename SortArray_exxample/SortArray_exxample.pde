import java.util.Comparator;
import java.util.Arrays; 

class A {
 String str;
 // Constructor just sets the value of str
 A(String s) {
   str = s;
 }
 // Returns str
 String getStr() {
   return str;
 }
 // Override toString so the value of str is shown by println()
 String toString() {
   return str;
 }
}

class AComparator implements Comparator {
 int compare(Object o1, Object o2) {
   String str1 = ((A) o1).getStr();
   String str2 = ((A) o2).getStr();
   return str1.compareTo(str2);
 }
}

// Create an array with 3 A objects that are not sorted by the str field
A a1 = new A("abcd");
A a2 = new A("efgh");
A a3 = new A("cdef");
A[] aArray = new A[] {a1, a2, a3};

// Print the array to show array is not in sorted order
println(aArray);
println();

// Sort and print to show array is now sorted by the value of str
Arrays.sort(aArray, new AComparator());
println(aArray);
