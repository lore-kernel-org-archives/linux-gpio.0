From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 4/5] genirq: Move irq resource handling out of spinlocked
 region
Date: Thu, 29 Jun 2017 23:33:38 +0200
Message-ID: <20170629214344.117028181@linutronix.de>
References: <20170629213334.375848050@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=genirq--Move-irq-resource-handling-out-of-spinlocked-region.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Julia Cartwright <julia@ni.com>, linux-gpio@vger.kernel.org, John Keeping <john@metanate.com>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

Aside of being conceptually wrong, there is also an actual (hard to
trigger and mostly theoretical) problem.

CPU0				CPU1
free_irq(X)			interrupt X
				spin_lock(desc->lock)
				wake irq thread()
				spin_unlock(desc->lock)
spin_lock(desc->lock)
remove action()
shutdown_irq()			
release_resources()		thread_handler()
spin_unlock(desc->lock)		  access released resources.

synchronize_irq()

Move the release resources invocation after synchronize_irq() so it's
guaranteed that the threaded handler has finished.

Move the resource request call out of the desc->lock held region as well,
so the invocation context is the same for both request and release.

This solves the problems with those functions on RT as well.
 
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/irq/manage.c |   23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1168,6 +1168,14 @@ static int
 		new->flags &= ~IRQF_ONESHOT;
 
 	mutex_lock(&desc->request_mutex);
+	if (!desc->action) {
+		ret = irq_request_resources(desc);
+		if (ret) {
+			pr_err("Failed to request resources for %s (irq %d) on irqchip %s\n",
+			       new->name, irq, desc->irq_data.chip->name);
+			goto out_mutex;
+		}
+	}
 
 	chip_bus_lock(desc);
 
@@ -1271,13 +1279,6 @@ static int
 	}
 
 	if (!shared) {
-		ret = irq_request_resources(desc);
-		if (ret) {
-			pr_err("Failed to request resources for %s (irq %d) on irqchip %s\n",
-			       new->name, irq, desc->irq_data.chip->name);
-			goto out_unlock;
-		}
-
 		init_waitqueue_head(&desc->wait_for_threads);
 
 		/* Setup the type (level, edge polarity) if configured: */
@@ -1386,6 +1387,10 @@ static int
 
 	chip_bus_sync_unlock(desc);
 
+	if (!desc->action)
+		irq_release_resources(desc);
+
+out_mutex:
 	mutex_unlock(&desc->request_mutex);
 
 out_thread:
@@ -1484,7 +1489,6 @@ static struct irqaction *__free_irq(unsi
 	if (!desc->action) {
 		irq_settings_clr_disable_unlazy(desc);
 		irq_shutdown(desc);
-		irq_release_resources(desc);
 		irq_remove_timings(desc);
 	}
 
@@ -1527,6 +1531,9 @@ static struct irqaction *__free_irq(unsi
 		}
 	}
 
+	if (!desc->action)
+		irq_release_resources(desc);
+
 	mutex_unlock(&desc->request_mutex);
 
 	irq_chip_pm_put(&desc->irq_data);
