From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 2/5] genirq: Move bus locking into __setup_irq()
Date: Thu, 29 Jun 2017 23:33:36 +0200
Message-ID: <20170629214343.960949031@linutronix.de>
References: <20170629213334.375848050@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=genirq--Move-locking-into-_-setup_irq--.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Julia Cartwright <julia@ni.com>, linux-gpio@vger.kernel.org, John Keeping <john@metanate.com>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

There is no point in having the irq_bus_lock() protection around all
callers to __setup_irq().

Move it into __setup_irq(). This is also a preparatory patch for addressing
the issues with the irq resource callbacks.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/irq/manage.c |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1167,6 +1167,8 @@ static int
 	if (desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE)
 		new->flags &= ~IRQF_ONESHOT;
 
+	chip_bus_lock(desc);
+
 	/*
 	 * The following block of code has to be executed atomically
 	 */
@@ -1347,6 +1349,7 @@ static int
 	}
 
 	raw_spin_unlock_irqrestore(&desc->lock, flags);
+	chip_bus_sync_unlock(desc);
 
 	irq_setup_timings(desc, new);
 
@@ -1378,6 +1381,8 @@ static int
 out_unlock:
 	raw_spin_unlock_irqrestore(&desc->lock, flags);
 
+	chip_bus_sync_unlock(desc);
+
 out_thread:
 	if (new->thread) {
 		struct task_struct *t = new->thread;
@@ -1417,9 +1422,7 @@ int setup_irq(unsigned int irq, struct i
 	if (retval < 0)
 		return retval;
 
-	chip_bus_lock(desc);
 	retval = __setup_irq(irq, desc, act);
-	chip_bus_sync_unlock(desc);
 
 	if (retval)
 		irq_chip_pm_put(&desc->irq_data);
@@ -1674,9 +1677,7 @@ int request_threaded_irq(unsigned int ir
 		return retval;
 	}
 
-	chip_bus_lock(desc);
 	retval = __setup_irq(irq, desc, action);
-	chip_bus_sync_unlock(desc);
 
 	if (retval) {
 		irq_chip_pm_put(&desc->irq_data);
@@ -1924,9 +1925,7 @@ int setup_percpu_irq(unsigned int irq, s
 	if (retval < 0)
 		return retval;
 
-	chip_bus_lock(desc);
 	retval = __setup_irq(irq, desc, act);
-	chip_bus_sync_unlock(desc);
 
 	if (retval)
 		irq_chip_pm_put(&desc->irq_data);
@@ -1980,9 +1979,7 @@ int request_percpu_irq(unsigned int irq,
 		return retval;
 	}
 
-	chip_bus_lock(desc);
 	retval = __setup_irq(irq, desc, action);
-	chip_bus_sync_unlock(desc);
 
 	if (retval) {
 		irq_chip_pm_put(&desc->irq_data);
