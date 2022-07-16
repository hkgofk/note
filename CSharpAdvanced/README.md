# Anonymous Types

Trong C #, kiểu ẩn danh có thể chứa các thuộc tính chỉ đọc công khai. Nó không thể chứa các thành viên khác, chẳng hạn như trường, phương thức, sự kiện, v.v.



    var student = new { Id = 1, FirstName = "James", LastName = "Bond" };
    Console.WriteLine(student.Id); //output: 1
    Console.WriteLine(student.FirstName); //output: James
    Console.WriteLine(student.LastName); //output: Bond

    student.Id = 2;//Error: cannot chage value
    student.FirstName = "Steve";//Error: cannot chage value

# Dynamic Types
Một kiểu động thoát khỏi việc kiểm tra kiểu tại thời điểm biên dịch; thay vào đó, nó giải quyết loại tại thời gian chạy.
    
    dynamic MyDynamicVar = 1;
    Console.WriteLine(MyDynamicVar.GetType()); //output : System.Int32

Nếu bạn gán một đối tượng lớp cho kiểu động, thì trình biên dịch sẽ không kiểm tra các phương thức và tên thuộc tính chính xác của kiểu động chứa đối tượng lớp tùy chỉnh.

    class Program
    {
        static void Main(string[] args)
        {
            dynamic stud = new Student();

            stud.DisplayStudentInfo(1, "Bill");// run-time error, no compile-time error
            stud.DisplayStudentInfo("1");// run-time error, no compile-time error
            stud.FakeMethod();// run-time error, no compile-time error
        }
    }

    public class Student
    {
        public void DisplayStudentInfo(int id)
        {
        }
    }

# Generic
* Sử dụng generic type tối đa hóa việc tái sử dụng code, đảm bảo và an toàn về kiểu dữ liệu, hiệu suất cao.
* .Net Framwork hỗ trợ một số generic collection, chúng ta nên sử dụng bất kể khi nào có thể, thay vì dùng classes như ArrayList.
* Bạn có thể tạo generic cho riêng mình với nhiều loại khác nhau như: Interfaces, classes, methods, events và delegates.
* Generic classes có thể được ràng buộc để cho phép truy cập các methods trên các data riêng biệt.

        public class ExampleList<T>
        {
            public void Add(T input) { }
        }
        class TestProgram
        {
            private class ListItem { }
            static void Main()
            {
                ExampleList<int> list1 = new ExampleList<int>();
                list1.Add(1);

                ExampleList<string> list2 = new ExampleList<string>();
                list2.Add("Hello world");

                ExampleList<ListItem> list3 = new ExampleList<ListItem>();
                list3.Add(new ListItem());
            }
         }

## Các loại Generic
1. Generic Type Parameters: có thể hiểu nó như một kiểu dữ liệu có thể dùng khai báo biến, trong đó có một kiểu T là động, nghĩa là chúng ta có thể truyền nhiều kiểu dữ liệu khác nhau cho nó
2. Generic classes: đóng gói các xử lý mà không chỉ định rõ kiểu dữ liệu. Hầu hết các trường hợp phổ biến sử dụng generic classes là với collections giống như: danh sách liên kết (Linked List), hash tables, queues, trees,..Các xử lý giống như thêm mới, gỡ bỏ item trong collection cơ bản được thực hiện theo cùng một cơ chế bất kể kiểu dữ nào được lưu trữ trong collection.
3. Generic Interface: Nó thường hữa ích để định nghĩa cho collection classes, hoặc cho generic classes. Có thể lấy ví dụ như IComparable<T>.

# Delegates

Delegates là một kiểu đại diện cho các tham chiếu đến các phương thức với một danh sách tham số cụ thể và kiểu trả về.

Delegate là một biến kiểu tham chiếu(references) chứa tham chiếu tới một phương thức.

Tham chiếu của Delegate có thể thay đổi runtime (khi chương trình đang thực thi).

Delegate thường được dùng để triển khai các phương thức hoặc sự kiện call-back.

Bạn cứ hiểu Delegate là một biến bình thường, biến này chứa hàm mà bạn cần gọi. Sau này lôi ra sài như hàm bình thường. Giá trị của biến Delegate lúc này là tham chiếu đến hàm. Có thể thay đổi runtime khi chương trình đang chạy.

+ Khi bạn khởi tạo một delegates, bạn có thể liên kết thể hiện của nó với bất kỳ phương thức nào có chữ ký và kiểu trả về tương thích.

Delagates được sử dụng để truyền các phương thức làm đối số cho các phương thức khác.

    public delegate void Del(string message);
    // Create a method for a delegate.
    public static void DelegateMethod(string message)
    {
        Console.WriteLine(message);
    }
    // Instantiate the delegate.
    Del handler = DelegateMethod;

    // Call the delegate.
    handler("Hello World");

# Func delegate

* Func là một đại diện chung được bao gồm trong namespace. Nó có không hoặc nhiều tham số đầu vào và một tham số ra. Tham số cuối cùng được coi là tham số ra.

# Action delegate

+ Action là một kiểu đại biểu được xác định trong namespace. Đại biểu loại Action giống như đại biểu Func ngoại trừ đại biểu Action không trả về giá trị. Nói cách khác, một đại biểu Action có thể được sử dụng với một phương thức có kiểu trả về là void

# Anonymous Method
Anonymous method (phương thức vô danh) là phương thức không có tên được khai báo với từ khóa delegate. 

Anonymous method cho phép bạn tạo ra các hành động cho một delegate với cách viết inline. 
# Events
Event là Delegate với mục đích để cho lớp khác hoặc đối tượng cha của đối tượng hiện tại ủy thác(định nghĩa) hàm vào trong đó.

Mục đích chính của chuyện này là để thông báo lên cho đối tượng cha biết mà xử lý.

# Extension Method

    là các phương thức thêm vào lớp, cấu trúc, giao diện có sẵn mà không cần thiết phải kế thừa lớp để tạo ra các lớp mới, không cần biên dịch lại thư viện. Các phương thức mở rộng khai báo là những phương thức tĩnh, nhưng lại được gọi thông qua đối tượng lớp mà phương thức mở rộng đó khai báo. 

# HttpClient

Lớp HttpClient được sử dụng để gửi truy vấn HTTP (Http Request Message - Request) và nhận phản hồi Response (Http Response Message) từ các truy vấn đó. Lớp này thuộc namespace System.Net.Http, namespace này chứa các lớp giúp tạo ra sự liên lạc giữa client và server. 

# Constructor and Destructor

1. Constructor
    *    Các class bạn xây dựng  tự bản thân nó không có nhiều giá trị với chương trình bởi vì class chỉ đơn thuần là mô tả kiểu dữ liệu. Để sử dụng class trong chương trình C#, bạn cần khởi tạo đối tượng của nó.

    * Khởi tạo đối tượng trong C# là quá trình yêu cầu tạo ra một object của class tương ứng trên vùng nhớ heap và lấy địa chỉ của object gán cho một biến.

    * Sau khi object được khởi tạo, bạn có thể truy xuất các thành viên của nó để phục vụ cho mục đích của chương trình.

    * Để khởi tạo object trong C# sử dụng từ khóa new và lời gọi tới một trong số các hàm tạo (constructor) của class

2. Destructor có một số đặc điểm như sau:

    * Được gọi đến trước khi một đối tượng bị thu hồi. Rất hữu ích để giải phóng tài nguyên bộ nhớ trước khi kết thúc chương trình.
    * Không được chỉ định phạm vi truy cập.
    * Không được kế thừa (inherited) hoặc nạp chồng (overloaded).
    * Mỗi lớp chỉ có duy nhất một phương thức destructor.
    * Destructor không thể được gọi từ đối tượng, mà nó sẽ được gọi ngầm một cách tự động.






