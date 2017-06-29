From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [patch 3/5] genirq: Add mutex to irq desc to serialize
 request/free_irq()
Date: Thu, 29 Jun 2017 23:33:37 +0200
Message-ID: <20170629214344.039220922@linutronix.de>
References: <20170629213334.375848050@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline;
 filename=genirq--Add-mutex-to-irq-desc-to-serialize-request-free.patch
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Julia Cartwright <julia-acOepvfBmUk@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

The irq_request/release_resources() callbacks ar currently invoked under
desc->lock with interrupts disabled. This is a source of problems on RT and
conceptually not required.

Add a seperate mutex to struct irq_desc which allows to serialize
request/free_irq(), which can be used to move the resource functions out of
the desc->lock held region.

Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 include/linux/irqdesc.h |    3 +++
 kernel/irq/irqdesc.c    |    1 +
 kernel/irq/manage.c     |    8 ++++++++
 3 files changed, 12 insertions(+)

--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -3,6 +3,7 @@
 
 #include <linux/rcupdate.h>
 #include <linux/kobject.h>
+#include <linux/mutex.h>
 
 /*
  * Core internal functions to deal with irq descriptors
@@ -45,6 +46,7 @@ struct pt_regs;
  *			IRQF_FORCE_RESUME set
  * @rcu:		rcu head for delayed free
  * @kobj:		kobject used to represent this struct in sysfs
+ * @request_mutex:	mutex to protect request/free before locking desc->lock
  * @dir:		/proc/irq/ procfs entry
  * @debugfs_file:	dentry for the debugfs file
  * @name:		flow handler name for /proc/interrupts output
@@ -96,6 +98,7 @@ struct irq_desc {
 	struct rcu_head		rcu;
 	struct kobject		kobj;
 #endif
+	struct mutex		request_mutex;
 	int			parent_irq;
 	struct module		*owner;
 	const char		*name;
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -373,6 +373,7 @@ static struct irq_desc *alloc_desc(int i
 
 	raw_spin_lock_init(&desc->lock);
 	lockdep_set_class(&desc->lock, &irq_desc_lock_class);
+	mutex_init(&desc->request_mutex);
 	init_rcu_head(&desc->rcu);
 
 	desc_set_defaults(irq, desc, node, affinity, owner);
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1167,6 +1167,8 @@ static int
 	if (desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE)
 		new->flags &= ~IRQF_ONESHOT;
 
+	mutex_lock(&desc->request_mutex);
+
 	chip_bus_lock(desc);
 
 	/*
@@ -1350,6 +1352,7 @@ static int
 
 	raw_spin_unlock_irqrestore(&desc->lock, flags);
 	chip_bus_sync_unlock(desc);
+	mutex_unlock(&desc->request_mutex);
 
 	irq_setup_timings(desc, new);
 
@@ -1383,6 +1386,8 @@ static int
 
 	chip_bus_sync_unlock(desc);
 
+	mutex_unlock(&desc->request_mutex);
+
 out_thread:
 	if (new->thread) {
 		struct task_struct *t = new->thread;
@@ -1446,6 +1451,7 @@ static struct irqaction *__free_irq(unsi
 	if (!desc)
 		return NULL;
 
+	mutex_lock(&desc->request_mutex);
 	chip_bus_lock(desc);
 	raw_spin_lock_irqsave(&desc->lock, flags);
 
@@ -1521,6 +1527,8 @@ static struct irqaction *__free_irq(unsi
 		}
 	}
 
+	mutex_unlock(&desc->request_mutex);
+
 	irq_chip_pm_put(&desc->irq_data);
 	module_put(desc->owner);
 	kfree(action->secondary);
