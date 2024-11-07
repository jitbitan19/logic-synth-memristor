#include <iostream>
#include <queue>
#include <iomanip>
#include <set>
#include <functional>
#include <regex>
using namespace std;

#define THRMX 8
#define THRMN 1
#define MAXN 1000
#define FW 4

struct Node
{
    int id, path, sub, indeg;
    Node *left;
    Node *right;
    Node(
        int v, int path = 0,
        Node *l_node = nullptr, Node *r_node = nullptr)
        : id{v}, path{path}, sub{1}, indeg{0},
          left{l_node}, right{r_node}
    {
    }
};

struct Node
{
    int id, path, sub, indeg;
    Node *left;
    Node *right;
    Node(int v, Node *leftNode = nullptr, Node *rightNode = nullptr)
        : id{v}, sub{1}, indeg{0}, left{leftNode}, right{rightNode} {}
};

class SparseTable
{
public:
    int n, k;
    vector<vector<int>> table;
    SparseTable(vector<int> &path)
    {
        n = path.size();
        k = __builtin_clzll(1) - __builtin_clzll(n);
        table.resize(k + 1, vector<int>(n));
        for (int j = 0; j < n; j++)
            table[0][j] = path[j];
        __build();
    }
    int get(int l, int r)
    {
        int i = __builtin_clzll(1) - __builtin_clzll(r - l + 1);
        return max(table[i][l], table[i][r - (1LL << i) + 1]);
    }

private:
    void __build()
    {
        for (int i = 1; i <= k; i++)
            for (int j = 0; j + (1LL << i) <= n; j++)
                table[i][j] = max(table[i - 1][j], table[i - 1][j + (1LL << (i - 1))]);
    }
};

Node *search_val(Node *root, int value)
{
    if (!root)
        return nullptr;
    if (root->id == value)
        return root;
    if (root->left)
        return search_val(root->left, value);
    if (root->right)
        return search_val(root->right, value);
    return nullptr;
}

void get_sublen(Node *root, int max_nodes)
{
    vector<bool> vis(max_nodes);
    vector<bool> did(max_nodes);
    function<void(Node *)> foo = [&](Node *root)
    {
        if (!root)
            return;
        vis[root->id] = 1;
        if (root->left)
        {
            if (!vis[root->left->id])
                foo(root->left);
            root->sub += root->left->sub;
        }
        if (root->right)
        {
            if (!vis[root->right->id])
                foo(root->right);
            root->sub += root->right->sub;
        }
    };
    foo(root);
}

void get_paths(Node *root)
{
    if (!root)
        return;
    root->path++;
    get_paths(root->left);
    get_paths(root->right);
}

void get_indeg(Node *root, int max_nodes)
{
    if (!root)
        return;

    queue<Node *> ui;
    ui.push(root);
    vector<bool> seen(max_nodes, false);
    while (!ui.empty())
    {
        Node *temp = ui.front();
        ui.pop();

        if (seen[temp->id])
            continue;
        seen[temp->id] = true;

        if (temp->left)
        {
            temp->left->indeg++;
            ui.push(temp->left);
        }
        if (temp->right)
        {
            temp->right->indeg++;
            ui.push(temp->right);
        }
    }
}

void traverse(Node *root)
{
    cout << "__________ Node Details __________" << '\n';
    queue<Node *> ui;
    ui.push(root);
    set<int> seen;
    while (!ui.empty())
    {
        Node *temp = ui.front();
        ui.pop();

        if (seen.count(temp->id))
            continue;
        seen.insert(temp->id);

        cout << "id: " << setw(FW) << temp->id << ", ";
        // cout << "path: " << setw(FW) << temp->path << ", ";
        cout << "sub: " << setw(FW) << temp->sub << ", ";
        cout << "indeg:" << setw(FW) << temp->indeg;
        cout << '\n';

        if (temp->left)
            ui.push(temp->left);
        if (temp->right)
            ui.push(temp->right);
    }
    cout << '\n';
}

void point_nodes(Node *root, int max_nodes)
{
    vector<bool> seen(max_nodes);
    vector<int> order, sub, path, indeg;
    function<void(Node *)> dfs = [&](Node *root)
    {
        if (!root || seen[root->id])
            return;

        seen[root->id] = 1;
        order.push_back(root->id);
        sub.push_back(root->sub);
        path.push_back(root->path);
        indeg.push_back(root->indeg);

        dfs(root->left);
        dfs(root->right);
    };
    dfs(root);
    int n_traverse = order.size();

    for (auto &itr : order)
        cout << setw(2) << itr << ' ';
    cout << '\n';
    for (auto &itr : sub)
        cout << setw(2) << itr << ' ';
    cout << '\n';
    for (auto &itr : indeg)
        cout << setw(2) << itr << ' ';
    cout << '\n';

    SparseTable table(indeg);
    vector<int> opt_nodes;
    for (int i = 0; i < n_traverse; i++)
    {
        if (sub[i] > THRMX || sub[i] < THRMN)
            continue;

        int sublen = sub[i] - 1;
        int max_indeg = table.get(i + 1, i + sublen);
        if (max_indeg != 1)
            continue;
        opt_nodes.push_back(order[i]);
        i += sublen;
    }

    cout << "\n________ Optimisable Nodes ________\n";
    for (auto &itr : opt_nodes)
        cout << itr << ' ';
    cout << '\n';
}

void read_nodes(Node **all_nodes, int &base)
{
    cout << "_______ Dependency List _______" << '\n';
    while (1)
    {
        string line;
        getline(cin, line);

        if (line[0] == '.')
            break;

        regex p1(R"(n(\d+)\s+=\s+x(\d+)')");            // ni = xj'
        regex p2(R"(n(\d+)\s+=\s+n(\d+)')");            // ni = nj'
        regex p3(R"(n(\d+)\s+=\s+\(n(\d+)'x(\d+)'\))"); // ni = (nj'xk')
        regex p4(R"(n(\d+)\s+=\s+\(x(\d+)'n(\d+)'\))"); // ni = (xj'nk')
        regex p5(R"(n(\d+)\s+=\s+\(n(\d+)'n(\d+)'\))"); // ni = (nj'nk')
        regex p6(R"(n(\d+)\s+=\s+\(x(\d+)'x(\d+)'\))"); // ni = (xj'xk')

        smatch match;
        if (regex_search(line, match, p1))
        {
            int x = stoi(match[1]);
            cout << setw(FW) << x << ": " << '\n';
            all_nodes[x] = new Node{x};
        }
        else if (regex_search(line, match, p2))
        {
            int x = stoi(match[1]);
            int y = stoi(match[2]);
            cout << setw(FW) << x << ": " << setw(FW) << y << '\n';
            all_nodes[x] = new Node{x};
            all_nodes[x]->left = all_nodes[y];
        }
        else if (regex_search(line, match, p3))
        {
            int x = stoi(match[1]);
            int y = stoi(match[2]);
            cout << setw(FW) << x << ": " << setw(FW) << y << '\n';
            all_nodes[x] = new Node{x};
            all_nodes[x]->left = all_nodes[y];
        }
        else if (regex_search(line, match, p4))
        {
            int x = stoi(match[1]);
            int y = stoi(match[3]);
            cout << setw(FW) << x << ": " << setw(FW) << y << '\n';
            all_nodes[x] = new Node{x};
            all_nodes[x]->right = all_nodes[y];
        }
        else if (regex_search(line, match, p5))
        {
            int x = stoi(match[1]);
            int y = stoi(match[2]);
            int z = stoi(match[3]);
            base = x;
            cout << setw(FW) << x << ": " << setw(FW) << y << ", " << setw(FW) << z << '\n';
            all_nodes[x] = new Node{x};
            all_nodes[x]->left = all_nodes[y];
            all_nodes[x]->right = all_nodes[z];
        }
        else if (regex_search(line, match, p6))
        {
            int x = stoi(match[1]);
            cout << setw(FW) << x << ": " << '\n';
            all_nodes[x] = new Node{x};
        }
    }
    cout << '\n';
}

int main()
{
    // Replace xyz in BENCH/xyz with the appropriate benchmark
    freopen("BENCH/xor5_d.txt", "r", stdin);
    freopen("fo.txt", "w", stdout);

    int base{};
    Node *all[MAXN + 1]{};
    read_nodes(all, base);

    // for (int i = 0; i <= MAXN; i++)
    //     all[i] = new Node{i};
    // all[21]->left = all[22], all[21]->right = all[20];
    // all[22]->left = all[10];
    // all[10]->left = all[7], all[10]->right = all[9];
    // all[7]->left = all[6], all[9]->left = all[8];

    // all[20]->left = all[16], all[20]->right = all[17];
    // all[17]->left = all[16];
    // all[16]->left = all[13], all[16]->right = all[15];
    // all[13]->left = all[12];
    // all[15]->left = all[14];

    Node *root = all[base];

    cout << "Base Node: " << base << "\n\n";

    get_sublen(root, MAXN);
    get_indeg(root, MAXN);
    get_paths(root);
    traverse(root);
    point_nodes(root, MAXN);

    return 0;
}
