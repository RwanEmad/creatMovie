//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace creatMovie.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Movie_images
    {
        public int movie_id { get; set; }
        public string image { get; set; }
    
        public virtual Movy Movy { get; set; }
    }
}
