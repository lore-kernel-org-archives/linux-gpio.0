From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: add a real time compliance checklist
Date: Fri,  2 Oct 2015 14:31:36 -0700
Message-ID: <1443821496-19818-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:36805 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262AbbJBVbo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 17:31:44 -0400
Received: by lbcao8 with SMTP id ao8so33107805lbc.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 14:31:42 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>

Add some information about real time compliance to the driver document.
Inspired by Grygorii Strashko's real time compliance patches.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Grygorii: can you help out with some heavy comments on all I do wrong
in this document? Thx. For example I have no real clue of the difference
between generic_handle_irq() and handle_nested_irq() in this context.

We also need to think about new helper functions that can aid driver writers
in getting drivers real time compliant and properly preemptible. Should we
have the goal to make *all* drivers using the helpers use nested/threaded IRQs,
or do you think there are (old) systems around that would suffer too much
from this?
---
 Documentation/gpio/driver.txt | 72 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 12 deletions(-)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index 90d0f6aba7a6..9d7985171f07 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -93,22 +93,37 @@ GPIO irqchips usually fall in one of two categories:
   Chained GPIO irqchips typically can NOT set the .can_sleep flag on
   struct gpio_chip, as everything happens directly in the callbacks.
 
-* NESTED THREADED GPIO irqchips: these are off-chip GPIO expanders and any
-  other GPIO irqchip residing on the other side of a sleeping bus. Of course
-  such drivers that need slow bus traffic to read out IRQ status and similar,
-  traffic which may in turn incur other IRQs to happen, cannot be handled
-  in a quick IRQ handler with IRQs disabled. Instead they need to spawn a
-  thread and then mask the parent IRQ line until the interrupt is handled
-  by the driver. The hallmark of this driver is to call something like
-  this in its interrupt handler:
+  NOTE: chained IRQ handlers are usually not good for real time. If you
+  are submitting a new driver or refactoring a driver for real time compliance,
+  consider using creating a nested/threaded irqchip instead, see below.
+
+* NESTED THREADED GPIO irqchips: these are traditionally off-chip GPIO
+  expanders and any other GPIO irqchip residing on the other side of a
+  sleeping bus. Of course such drivers that need slow bus traffic to read
+  out IRQ status and similar, traffic which may in turn incur other IRQs to
+  happen, cannot be handled in a quick IRQ handler with IRQs disabled.
+
+  With the introduction of real time support in the Linux kernel, also other
+  GPIO irqchips are encouraged to use a nested and threaded IRQ handler.
+  Doing so makes the interrupts naturally preemptible on a real time
+  setup, which means the system can easily be configured for real time with
+  a (usually negligable) performance loss.
+
+  These drivers spawn a thread and then mask the parent IRQ line until the
+  interrupt is handled by the driver. The hallmark of this driver is to call
+  something like this in its interrupt handler:
 
   static irqreturn_t tc3589x_gpio_irq(int irq, void *data)
       ...
       handle_nested_irq(irq);
+      OR
+      generic_handle_irq(irq);
 
-  The hallmark of threaded GPIO irqchips is that they set the .can_sleep
-  flag on struct gpio_chip to true, indicating that this chip may sleep
-  when accessing the GPIOs.
+  Threaded GPIO irqchips should set the .can_sleep flag on struct gpio_chip
+  to true if they are e.g. accessing the chip over I2C or SPI, indicating that
+  this chip may sleep when accessing the GPIOs. irqchips that are just made
+  threaded to be preemptible and thus real time compliant need not do this:
+  preemption is not sleeping.
 
 To help out in handling the set-up and management of GPIO irqchips and the
 associated irqdomain and resource allocation callbacks, the gpiolib has
@@ -125,7 +140,7 @@ symbol:
   gpio_chip from a parent IRQ and passes the struct gpio_chip* as handler
   data. (Notice handler data, since the irqchip data is likely used by the
   parent irqchip!) This is for the chained type of chip. This is also used
-  to set up a nested irqchip if NULL is passed as handler.
+  to set up a threaded/nested irqchip if NULL is passed as handler.
 
 To use the helpers please keep the following in mind:
 
@@ -170,6 +185,39 @@ typically be called in the .startup() and .shutdown() callbacks from the
 irqchip.
 
 
+Real-Time compliance for GPIO IRQ chips
+---------------------------------------
+
+Any provider of irqchips needs to be carefully tailored to support Real Time
+preemption. It is desireable that all irqchips in the GPIO subsystem keep this
+in mind and does the proper testing to assure they are real time-enabled. The
+following is a checklist to follow when preparing a driver for real
+time-compliance:
+
+- Nominally use raw_spinlock_t in the IRQ context path of the IRQ handler as
+  we do not want these sections to be preempted.
+
+- Do NOT use chained_irq_enter() or chained_irq_exit() in the IRQ handler,
+  as we want the hotpath to be preemptible.
+
+- Instead use nested IRQs and generic handlers such as handle_bad_irq(),
+  handle_level_irq() and handle_edge_irq(). Consequentally the handler
+  argument of gpiochip_set_chained_irqchip() should be NULL when using the
+  gpiolib irqchip helpers.
+
+- Nominally set all handlers to handle_bad_irq() in the setup call, then
+  set the handler to handle_level_irq() and/or handle_edge_irq() in the irqchip
+  .set_type() callback depending on what your controller supports.
+
+- If you need to use the pm_runtime_get*()/pm_runtime_put*() callbacks in some
+  of the irqchip callbacks, these should be moved to the .irq_bus_lock()
+  and .irq_bus_unlock() callbacks respectively, as these are the only
+  slowpath callbacks on an irqchip. Create the callbacks if need be.
+
+- Test your driver with the apropriate in-kernel real time test cases for both
+  level and edge IRQs.
+
+
 Requesting self-owned GPIO pins
 -------------------------------
 
-- 
2.4.3

