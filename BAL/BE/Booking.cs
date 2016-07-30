using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
    public class Booking
    {
        public int Slot_ID { get; set; }
        public int BookingId { get; set; }
        public DateTime BookingDate { get; set; }
        public string Bookingsession { get; set; }
        public DateTime Bookingtime { get; set; }
        public DateTime statusdate { get; set; }
        public int status { get; set; }
        public string Remarks { get; set; }
        public string slot { get; set; }
    }
}
