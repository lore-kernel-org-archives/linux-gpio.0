From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] pinctrl: intel: Prevent force threading of the interrupt handler
Date: Thu, 16 Jun 2016 11:25:37 +0300
Message-ID: <1466065537-82027-2-git-send-email-mika.westerberg@linux.intel.com>
References: <1466065537-82027-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:18271 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751276AbcFPIZl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 16 Jun 2016 04:25:41 -0400
In-Reply-To: <1466065537-82027-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kim Tatt Chuah <kim.tatt.chuah@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>

The pinctrl-intel needs to use request_irq() instead of chained interrupt
handling because it shares the interrupt with multiple GPIO host
controllers found on Intel CPUs. In -rt all such interrupts are forced to
run in thread context which triggers following warning:

 WARNING: CPU: 0 PID: 530 at kernel/irq/handle.c:151 handle_irq_event_percpu+0x23d/0x240
 irq 348 handler irq_default_primary_handler+0x0/0x10 enabled interrupts
 Modules linked in:
 CPU: 0 PID: 530 Comm: irq/14-INT3452: Not tainted 4.6.2-rt5 #1060
  0000000000000000 ffff88007a257c98 ffffffff812d8494 ffff88007a257ce8
  0000000000000000 ffff88007a257cd8 ffffffff8105e554 000000977a257d90
  ffff88007a37a380 000000000000015c 0000000000000002 0000000000000000
 Call Trace:
  [<ffffffff812d8494>] dump_stack+0x4f/0x6b
  [<ffffffff8105e554>] __warn+0xe4/0x100
  [<ffffffff8105e5bf>] warn_slowpath_fmt+0x4f/0x60
  [<ffffffff810b18f0>] ? __synchronize_hardirq+0x60/0x60
  [<ffffffff810b17fd>] handle_irq_event_percpu+0x23d/0x240
  [<ffffffff810b1862>] handle_irq_event+0x62/0x90
  [<ffffffff810b4e1f>] handle_edge_irq+0x8f/0x190
  [<ffffffff810b0d82>] generic_handle_irq+0x22/0x30
  [<ffffffff81307abc>] intel_gpio_irq+0xdc/0x150
  [<ffffffff810b2293>] irq_forced_thread_fn+0x23/0x70
  [<ffffffff810b250b>] irq_thread+0x13b/0x1d0
  [<ffffffff8167b844>] ? __schedule+0x2e4/0x5a0
  [<ffffffff810b2270>] ? irq_finalize_oneshot.part.37+0xd0/0xd0
  [<ffffffff810b25a0>] ? irq_thread+0x1d0/0x1d0
  [<ffffffff810b23d0>] ? wake_threads_waitq+0x30/0x30
  [<ffffffff8107e624>] kthread+0xd4/0xf0
  [<ffffffff8167ec27>] ? _raw_spin_unlock_irq+0x17/0x40
  [<ffffffff8167f592>] ret_from_fork+0x22/0x40
  [<ffffffff8107e550>] ? kthread_worker_fn+0x190/0x190

The handle_irq_event_* functions (and I suppose generic_handle_irq()) is
expected to be called with interrupts disabled and they rightfully complain
here because we run in thread context with interrupts enabled.

Fix this by adding IRQF_NO_THREAD flag when the master interrupt is
requested. This prevents forced threading of the interrupt used by the GPIO
host controllers.

Reported-by: Kim Tatt Chuah <kim.tatt.chuah@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Hi,

I'm not 100% sure this is the proper fix so adding tglx in case there is a
better alternative. It would be nice to be able to handle irqchip
interrupts from thread context.

 drivers/pinctrl/intel/pinctrl-intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index f1b14f256001..fe19b1e7b278 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -919,7 +919,8 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	 * to the irq directly) because on some platforms several GPIO
 	 * controllers share the same interrupt line.
 	 */
-	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq, IRQF_SHARED,
+	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
+			       IRQF_SHARED | IRQF_NO_THREAD,
 			       dev_name(pctrl->dev), pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to request interrupt\n");
-- 
2.8.1

