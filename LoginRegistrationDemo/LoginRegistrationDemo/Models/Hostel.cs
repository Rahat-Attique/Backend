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
    
    public partial class Hostel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Hostel()
        {
            this.Rooms = new HashSet<Room>();
        }
    
        public int HostelID { get; set; }
        public string hostelName { get; set; }
        public string Category { get; set; }
    
        public virtual Hostel Hostel1 { get; set; }
        public virtual Hostel Hostel2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Room> Rooms { get; set; }
    }
}
