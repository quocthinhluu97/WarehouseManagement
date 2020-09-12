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
        public ICommand LoadedWindowCommand { get; set; }
        public ICommand UnitCommand { get; set; }
        public ICommand SupplierCommand { get; set; }

        public MainViewModel()
        {
            IsLoaded = false;

            LoadedWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                IsLoaded = true;
                LoginWindow loginWindows = new LoginWindow();
                loginWindows.ShowDialog();
            });

            UnitCommand = new RelayCommand<object>((p)=> { return true; }, (p)=>
            {
                UnitWindow window = new UnitWindow();
                window.ShowDialog();
            });

            SupplierCommand = new RelayCommand<object>((p)=> { return true; }, (p)=>
            {
                SupplierWindow window = new SupplierWindow();
                window.ShowDialog();
            });
        }
    }
}
