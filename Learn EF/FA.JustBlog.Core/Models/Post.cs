
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FA.JustBlog.Core.Models
{
    public class Post
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "Title name is required.")]
        [StringLength(255)]
        public string Title { get; set; }
        [StringLength(255)]
        public string ShortDecription { get; set; }
        [StringLength(1024)]
        public string PostContent { get; set; }
        [StringLength(255)]
        public string UrlSlug { get; set; }
        [StringLength(255)]
        public string Published { get; set; }
        [StringLength(255)]
        public string PostedOn { get; set; }
        [StringLength(255)]
        public string Modified  { get; set; }
        [ForeignKey("CategoryID")]
        public int CategoryID { get; set; }
        [StringLength(255)]
        public Category Category { get; set; }
        public int ViewCount { get; set; }
        public int RateCount { get; set; }
        public int TotalRate { get; set; }

    }
}
