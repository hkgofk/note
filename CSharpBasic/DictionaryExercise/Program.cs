Dictionary<int, string> map = new Dictionary<int, string>();
map.Add(1, "One");
map.Add(2, "Two");
map.Add(3, "Three");
map.Add(4, "Four");
map.Add(5, "Five");

foreach (var item in map)
{
    Console.WriteLine($"Key: {item.Key}\t Value: {item.Value}");
}

Console.WriteLine($"Count in map: {map.Count}");
string result = map[1];
Console.WriteLine("Value of key 1: " + result);
map.ToString();