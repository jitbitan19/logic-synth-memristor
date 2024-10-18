#include <iostream>
#include <string>
#include <regex>
using namespace std;

int main()
{
    string input = "    n6  = x4'";

    // Define the regex pattern to capture numbers after 'n' and 's'
    regex pattern1(R"(n(\d+)\s*=\s*s(\d+))");
    regex pattern2(R"(n(\d+)\s*=\s*d(\d+))");
    regex p1(R"(\s*n(\d+)\s*=\s*x(\d+)')");
    smatch match;


    // if (regex_search(input, match, pattern1))
    // {
    //     string n_number = match[1];
    //     string s_number = match[2];

    //     cout << "Extracted n_number: " << n_number << endl;
    //     cout << "Extracted s_number: " << s_number << endl;
    // }
    // else if (regex_search(input, match, pattern2))
    // {
    //     string n_number = match[1];
    //     string d_number = match[2];

    //     cout << "Extracted n_number: " << n_number << endl;
    //     cout << "Extracted d_number: " << d_number << endl;
    // }
    // else
    // {
    //     cout << "Pattern not found!" << endl;
    // }

    return 0;
}

// #include <iostream>
// #include <regex>
// #include <string>

// int main()
// {
//     // Test inputs
//     std::string input1 = "n2 = s25";
//     std::string input2 = "n3 = d65";
//     std::string input3 = "n4 = s4 + d24";

//     // Patterns for single assignment and addition
//     std::regex singleAssignmentPattern(R"(n(\d+)\s*=\s*([sd](\d+)))");
//     std::regex additionPattern(R"(n(\d+)\s*=\s*([sd](\d+))\s*\+\s*([sd](\d+)))");

//     std::smatch matches;

//     // Check for single assignment pattern
//     if (std::regex_search(input1, matches, singleAssignmentPattern))
//     {
//         std::cout << "Input 1 - First number: " << matches[1] << ", Left side number: " << matches[2] << matches[3] << std::endl;
//     }

//     if (std::regex_search(input2, matches, singleAssignmentPattern))
//     {
//         std::cout << "Input 2 - First number: " << matches[1] << ", Left side number: " << matches[2] << matches[3] << std::endl;
//     }

//     // Check for addition pattern
//     if (std::regex_search(input3, matches, additionPattern))
//     {
//         std::cout << "Input 3 - First number: " << matches[1] << ", Left side number: " << matches[2] << matches[3]
//                   << ", Right side number: " << matches[4] << matches[5] << std::endl;
//     }

//     return 0;
// }
