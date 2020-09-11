using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace WarehouseManagement.ViewModel
{
    public class MainViewModel : BaseViewModel
    {
        public bool IsLoaded { get; set; }
        public ICommand UnitCommand { get; set; }
        public MainViewModel()
        {
            if (!IsLoaded)
            {
                LoginWindow loginWindows = new LoginWindow();
                loginWindows.ShowDialog();
                IsLoaded = true;
            }

            UnitCommand = new RelayCommand<object>((p)=> { return true; }, (p)=>
            {
                UnitWindow window = new UnitWindow();
                window.ShowDialog();
            });
        }
    }
}
