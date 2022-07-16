using System.Text;

public delegate void UpdateNameHandler(string name);
class Program
{
    static void Main(string[] args)
    {
        Console.OutputEncoding = Encoding.Unicode;

        HocSinh hs = new HocSinh();

        hs.NameChanged += Hs_NameChanged;

        hs.Name = "Hieu";
        Console.WriteLine("Tên từ class: " + hs.Name);
        hs.Name = "Hieu M";
        Console.WriteLine("Tên từ class: " + hs.Name);

        Console.ReadLine();
    }

    private static void Hs_NameChanged(string name)
    {
        Console.WriteLine("Tên mới: " + name);
    }
}

public class HocSinh
{
    public event UpdateNameHandler NameChanged;

    private string _Name;
    public string Name
    {
        get => _Name;
        set
        {
            _Name = value;
            if (NameChanged != null)
            {
                NameChanged(Name);
            }
        }
    }
}