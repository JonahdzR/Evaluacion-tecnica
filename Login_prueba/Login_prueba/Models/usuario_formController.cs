using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Login_prueba.Models
{
    public class usuario_formController : Controller
    {
        private usuarios_pruebaEntities db = new usuarios_pruebaEntities();

        // GET: usuario_form
        public ActionResult Index()
        {
            return View(db.usuario_form.ToList());
        }

        // GET: usuario_form/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            usuario_form usuario_form = db.usuario_form.Find(id);
            if (usuario_form == null)
            {
                return HttpNotFound();
            }
            return View(usuario_form);
        }

        // GET: usuario_form/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: usuario_form/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,last_name,email,password")] usuario_form usuario_form)
        {
            if (ModelState.IsValid)
            {
                db.usuario_form.Add(usuario_form);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(usuario_form);
        }

        // GET: usuario_form/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            usuario_form usuario_form = db.usuario_form.Find(id);
            if (usuario_form == null)
            {
                return HttpNotFound();
            }
            return View(usuario_form);
        }

        // POST: usuario_form/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,last_name,email,password")] usuario_form usuario_form)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usuario_form).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(usuario_form);
        }

        // GET: usuario_form/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            usuario_form usuario_form = db.usuario_form.Find(id);
            if (usuario_form == null)
            {
                return HttpNotFound();
            }
            return View(usuario_form);
        }

        // POST: usuario_form/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            usuario_form usuario_form = db.usuario_form.Find(id);
            db.usuario_form.Remove(usuario_form);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
