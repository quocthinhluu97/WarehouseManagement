using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
        private ObservableCollection<InStock> _InStockList;
        public ObservableCollection<InStock> InStockList { get => _InStockList; set { _InStockList = value; OnPropertyChanged(); } }
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
                    LoadInStockData();
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

        void LoadInStockData()
        {
            InStockList = new ObservableCollection<InStock>();

            var objectList = DataProvider.Ins.db.Objects;

            int i = 1;

            foreach (var item in objectList) {
                var inputList = DataProvider.Ins.db.InputInfoes.Where(p=>p.IdObject == item.Id);
                var outputList = DataProvider.Ins.db.OutputInfoes.Where(p=>p.IdObject == item.Id);

                int sumInputList = 0;
                int sumOutputList = 0;

                if (inputList != null)
                {
                    sumInputList = (int)inputList.Sum(p => p.Count);

                }

                if (outputList != null)
                {
                    sumOutputList = (int)outputList.Sum(p => p.Count);

                }
                InStock inStock = new InStock();
                inStock.Index = i;
                inStock.Count = sumInputList - sumOutputList;
                inStock.Object = item;

                InStockList.Add(inStock);

                i++;
                    
            }
    
        }
    }
}
