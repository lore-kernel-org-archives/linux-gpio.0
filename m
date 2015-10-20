From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: add a real time compliance checklist
Date: Tue, 20 Oct 2015 17:22:15 +0300
Message-ID: <56264E17.4030903@ti.com>
References: <1443821496-19818-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdbpgW2av7S=KN7cczr3PmWuGi3qXxvFRaEkk7qHy8T6oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:33272 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751701AbbJTOWT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 20 Oct 2015 10:22:19 -0400
In-Reply-To: <CACRpkdbpgW2av7S=KN7cczr3PmWuGi3qXxvFRaEkk7qHy8T6oA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>

On 10/12/2015 11:48 AM, Linus Walleij wrote:
> On Fri, Oct 2, 2015 at 11:31 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
>> Add some information about real time compliance to the driver document.
>> Inspired by Grygorii Strashko's real time compliance patches.
>>
>> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Grygorii: can you help out with some heavy comments on all I do wrong
>> in this document? Thx. For example I have no real clue of the difference
>> between generic_handle_irq() and handle_nested_irq() in this context.
>>
>> We also need to think about new helper functions that can aid driver writers
>> in getting drivers real time compliant and properly preemptible. Should we
>> have the goal to make *all* drivers using the helpers use nested/threaded IRQs,
>> or do you think there are (old) systems around that would suffer too much
>> from this?
> 
> Poking Grygorii about this!

I'm very sorry for delay (a month-long business trip made me non-functional for some time)

Below is what i come up with:

Subject: [PATCH] gpio: add a real time compliance notes

---
 Documentation/gpio/driver.txt | 80 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index 90d0f6a..12a6194 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -62,6 +62,11 @@ Any debugfs dump method should normally ignore signals which haven't been
 requested as GPIOs. They can use gpiochip_is_requested(), which returns either
 NULL or the label associated with that GPIO when it was requested.
 
+RT_FULL: GPIO driver should not use spinlock_t or any sleepable APIs
+(like PM runtime) in its gpio_chip implementation (.get/.set and direction
+control callbacks) if it is expected to call GPIO APIs from atomic context
+on -RT (inside hard IRQ handlers and similar contexts). Normally this should
+not be required.
 
 GPIO drivers providing IRQs
 ---------------------------
@@ -73,6 +78,13 @@ The IRQ portions of the GPIO block are implemented using an irqchip, using
 the header <linux/irq.h>. So basically such a driver is utilizing two sub-
 systems simultaneously: gpio and irq.
 
+RT_FULL: GPIO driver should not use spinlock_t or any sleepable APIs
+(like PM runtime) as part of its irq_chip implementation on -RT.
+- spinlock_t should be replaced with raw_spinlock_t [1].
+- If sleepable APIs have to be used, these can be done from the .irq_bus_lock()
+  and .irq_bus_unlock() callbacks, as these are the only slowpath callbacks
+  on an irqchip. Create the callbacks if needed [2].
+
 GPIO irqchips usually fall in one of two categories:
 
 * CHAINED GPIO irqchips: these are usually the type that is embedded on
@@ -93,6 +105,38 @@ GPIO irqchips usually fall in one of two categories:
   Chained GPIO irqchips typically can NOT set the .can_sleep flag on
   struct gpio_chip, as everything happens directly in the callbacks.
 
+  RT_FULL: Note, chained IRQ handlers will not be forced threaded on -RT.
+  As result, spinlock_t or any sleepable APIs (like PM runtime) can't be used
+  in chained IRQ handler.
+  if required (and if it can't be converted to the nested threaded GPIO irqchip)
+  - chained IRQ handler can be converted to generic irq handler and this way
+  it will be threaded IRQ handler on -RT and hard IRQ handler on non-RT
+  (for example, see [3]).
+  Know W/A: The generic_handle_irq() is expected to be called with IRQ disabled,
+  so IRQ core will complain if it will be called from IRQ handler wich is forced
+  thread. The "fake?" raw lock can be used to W/A this problem:
+
+	raw_spinlock_t wa_lock;
+	static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
+		unsigned long wa_lock_flags;
+		raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
+		generic_handle_irq(irq_find_mapping(bank->chip.irqdomain, bit));
+		raw_spin_unlock_irqrestore(&bank->wa_lock, wa_lock_flags);
+
+* GENERIC CHAINED GPIO irqchips: these are the same as "CHAINED GPIO irqchips",
+  but chained IRQ handlers are not used. Instead GPIO IRQs dispatching is
+  performed by generic IRQ handler which is configured using request_irq().
+  The GPIO irqchip will then end up calling something like this sequence in
+  its interrupt handler:
+
+  static irqreturn_t gpio_rcar_irq_handler(int irq, void *dev_id)
+	for each detected GPIO IRQ
+		generic_handle_irq(...);
+
+  RT_FULL: Such kind of handlers will be forced threaded on -RT, as result IRQ
+  core will complain that generic_handle_irq() is called with IRQ enabled and
+  the same W/A as for "CHAINED GPIO irqchips" can be applied.
+
 * NESTED THREADED GPIO irqchips: these are off-chip GPIO expanders and any
   other GPIO irqchip residing on the other side of a sleeping bus. Of course
   such drivers that need slow bus traffic to read out IRQ status and similar,
@@ -133,6 +177,13 @@ To use the helpers please keep the following in mind:
   the irqchip can initialize. E.g. .dev and .can_sleep shall be set up
   properly.
 
+- Nominally set all handlers to handle_bad_irq() in the setup call and pass
+  handle_bad_irq() as flow handler parameter in gpiochip_irqchip_add() if it is
+  expected for GPIO driver that irqchip .set_type() callback have to be called
+  before using/enabling GPIO IRQ. Then set the handler to handle_level_irq()
+  and/or handle_edge_irq() in the irqchip .set_type() callback depending on
+  what your controller supports.
+
 It is legal for any IRQ consumer to request an IRQ from any irqchip no matter
 if that is a combined GPIO+IRQ driver. The basic premise is that gpio_chip and
 irq_chip are orthogonal, and offering their services independent of each
@@ -169,6 +220,31 @@ When implementing an irqchip inside a GPIO driver, these two functions should
 typically be called in the .startup() and .shutdown() callbacks from the
 irqchip.
 
+Real-Time compliance for GPIO IRQ chips
+---------------------------------------
+
+Any provider of irqchips needs to be carefully tailored to support Real Time
+preemption. It is desireable that all irqchips in the GPIO subsystem keep this
+in mind and does the proper testing to assure they are real time-enabled.
+So, pay attention on above " RT_FULL:" notes, please.
+The following is a checklist to follow when preparing a driver for real
+time-compliance:
+
+- ensure spinlock_t is not used as part irq_chip implementation;
+- ensure that sleepable APIs are not used as part irq_chip implementation.
+  If sleepable APIs have to be used, these can be done from the .irq_bus_lock()
+  and .irq_bus_unlock() callbacks;
+- Chained GPIO irqchips: ensure spinlock_t or any sleepable APIs are not used
+  from chained IRQ handler;
+- Generic chained GPIO irqchips: take care about generic_handle_irq() calls and
+  apply corresponding W/A;
+- Chained GPIO irqchips: get rid of chained IRQ handler and use generic irq
+  handler if possible :)
+- regmap_mmio: Sry, but you are in trouble :( if MMIO regmap is used as for
+  GPIO IRQ chip implementation;
+- Test your driver with the appropriate in-kernel real time test cases for both
+  level and edge IRQs.
+
 
 Requesting self-owned GPIO pins
 -------------------------------
@@ -190,3 +266,7 @@ gpiochip_free_own_desc().
 These functions must be used with care since they do not affect module use
 count. Do not use the functions to request gpio descriptors not owned by the
 calling driver.
+
+[1] http://www.spinics.net/lists/linux-omap/msg120425.html
+[2] https://lkml.org/lkml/2015/9/25/494
+[3] https://lkml.org/lkml/2015/9/25/495
-- 
2.5.1

-- 
regards,
-grygorii
