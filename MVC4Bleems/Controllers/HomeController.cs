using Microsoft.AspNetCore.Mvc;
using MVC4Bleems.DataAccess;
using MVC4Bleems.Models;
using System.Diagnostics;

namespace MVC4Bleems.Controllers
{
    public class HomeController : Controller
    {
        DataAccessLayer dl = new DataAccessLayer();
        
        private readonly ILogger<HomeController> _logger;



        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }


        [HttpPost]
        public ActionResult<IEnumerable<Products>> GetProducts(Dates dt)
        {
            try
            {
                var abc = new { };
                return Json(dl.GetProducts(0, dt.Fromdate, dt.Todate, "", ""));

            }
            catch (Exception ex)
            {
                //log error
                return Json(StatusCode(500, ex.Message));
            }
        }

        public ActionResult<IEnumerable<Products>> GetProductsListRandomOrder()
        {
            try
            {
                var abc = new { };
                return Json(dl.GetProducts(0, "", "", "random", ""));

            }
            catch (Exception ex)
            {
                //log error
                return Json(StatusCode(500, ex.Message));
            }
        }
        public JsonResult GetProductDetailsById(string id)
        {
            try
            {

                return Json(dl.GetProducts(Convert.ToInt32(id), "", "", "", ""));

            }
            catch (Exception ex)
            {
                //log error
                return Json(StatusCode(500, ex.Message));
            }
        }

        public JsonResult GetProductDetailsByIdWithCurrency(string id)
        {
            try
            {

                return Json(dl.GetProducts(Convert.ToInt32(id), "", "", "", "currency"));

            }
            catch (Exception ex)
            {
                //log error
                return Json(StatusCode(500, ex.Message));
            }
        }

        [HttpGet]
        public ActionResult<IEnumerable<Categories>> GetCategs()
        {
            try
            {

                return Json(dl.GetCategs());

            }
            catch (Exception ex)
            {
                //log error
                return Json(StatusCode(500, ex.Message));
            }
        }

        [HttpPost]
        public JsonResult AddEditProduct(Products pr)
        {
            try
            {
                var res = "";
                if(pr.Id > 0)
                {
                    res = dl.CrudProduct(pr, 2);
                }
                else
                {
                    res = dl.CrudProduct(pr, 1);
                }
                return Json(res);

            }
            catch (Exception ex)
            {
                //log error
                return Json(StatusCode(500, ex.Message));
            }
        }

        public JsonResult DeletePr(string id)
        {
            try
            {
                Products pr = new Products();
                pr.Id = Convert.ToInt32(id);
                return Json(dl.CrudProduct(pr, 3));

            }
            catch (Exception ex)
            {
                //log error
                return Json(StatusCode(500, ex.Message));
            }
        }

        [HttpPost]
        public JsonResult AddEditCateg(Categories categ)
        {
            try
            {
                var res = "";
                if (categ.Id > 0)
                {
                    res = dl.CrudCateg(categ, 2);
                }
                else
                {
                    res = dl.CrudCateg(categ, 1);
                }
                return Json(res);

            }
            catch (Exception ex)
            {
                //log error
                return Json(StatusCode(500, ex.Message));
            }
        }

    }
}