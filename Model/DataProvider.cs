using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WarehouseManagement.Model
{
    public class DataProvider
    {

        private static DataProvider _ins;
        public static DataProvider Ins
        {
            get
            {
                if (_ins == null)
                {
                    _ins = new DataProvider();
                    return _ins;
                }
                else
                {
                    return _ins;
                }
            }
            set
            {
                _ins = value;
            }
        }

        public WarehouseManagementEntities db { get; set; }
        private DataProvider()
        {
            db = new WarehouseManagementEntities();
        }
    }
}
