using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using WarehouseManagement.Model;

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

            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                IsLoaded = true;

                if (p == null) return;

                p.Hide();
                LoginWindow loginWindow = new LoginWindow();
                loginWindow.ShowDialog();

                if (loginWindow.DataContext == null) return;

                var loginVM = loginWindow.DataContext as LoginViewModel;

                if (loginVM.IsLogin)
                {
                    p.Show();
                }
                else
                {
                    p.Close();
                }

            });

            UnitCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
             {
                 UnitWindow window = new UnitWindow();
                 window.ShowDialog();
             });

            SupplierCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
             {
                 SupplierWindow window = new SupplierWindow();
                 window.ShowDialog();
             });

        }
    }
}
