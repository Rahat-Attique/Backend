//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LoginRegistrationDemo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Allotment
    {
        public int AllotmentID { get; set; }
        public int StudentID { get; set; }
        public int RoomID { get; set; }
        public Nullable<bool> Status { get; set; }
        public Nullable<System.DateTime> DateOfAllotment { get; set; }
        public Nullable<System.DateTime> DateOfRele { get; set; }
    
        public virtual Room Room { get; set; }
        public virtual Student Student { get; set; }
    }
}