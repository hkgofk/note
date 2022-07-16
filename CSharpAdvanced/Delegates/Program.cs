using System.Text;

public class programs
{
    static void Main(string[] args)
    {
        Console.OutputEncoding = Encoding.Unicode;
        MyDelegate convertToInt = new MyDelegate(ConvertStringToInt);
        string numberSTR = "35";
        int valueConverted = convertToInt(numberSTR);
        Console.WriteLine("Giá trị đã convert thành int: " + valueConverted);

        Func<int, int, int> func = ( x, y) => x + y;
        Console.Write("Test Func: ");
        Console.WriteLine("1 + 2 = " + func(1,2));

        Action<string> action = s => Console.WriteLine(s);
        Console.Write("Test Action: ");
        action("Hiếu đại gia");
        Console.ReadLine();

    }
    delegate int MyDelegate(string s);
    static int ConvertStringToInt(string stringValue)
    {
        int valueInt = 0;

        Int32.TryParse(stringValue, out valueInt);
        Console.WriteLine("Đã ép kiểu dữ liệu thành công");

        return valueInt;
    }

}





