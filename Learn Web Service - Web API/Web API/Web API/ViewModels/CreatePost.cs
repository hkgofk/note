namespace Web_API.ViewModels
{
    public class CreatePost
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string ShortDecription { get; set; }
        public string PostContent { get; set; }
        public string UrlSlug { get; set; }
        public string Published { get; set; }
        public string PostedOn { get; set; }
        public string Modified { get; set; }
        public int? CategoryID { get; set; }
        public int ViewCount { get; set; }
        public int RateCount { get; set; }
        public int TotalRate { get; set; }
    }
}
