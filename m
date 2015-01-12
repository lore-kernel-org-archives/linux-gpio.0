From: Aaron Lu <aaron.lu@intel.com>
Subject: [PATCH] gpio: crystalcove: use handle_nested_irq
Date: Mon, 12 Jan 2015 10:09:32 +0800
Message-ID: <54B32CDC.4050407@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:23508 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750846AbbALCJx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 11 Jan 2015 21:09:53 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Zhu, Lejun" <lejun.zhu@linux.intel.com>

The CrystalCove GPIO chip has can_sleep set so its demultiplexed irqs
will have IRQ_NESTED_THREAD flag set, thus we should use the nested
version handle_nested_irq in CrystalCove's irq handler instead of
handle_generic_irq, or the following warning will be hit and the
functionality is lost:

[ 4089.639554] Hardware name: ASUSTeK COMPUTER INC. T100TA/T100TA, BIOS T100TA.313 08/13/2014
[ 4089.639564]  00000002 00000000 c24fbdf4 c16e0257 c24fbe38 c24fbe28 c105390c c18ec480
[ 4089.639596]  c24fbe54 00000048 c18f8e3b 00000295 c10a60fc 00000295 c10a60fc f4464540
[ 4089.639626]  f446459c c278ad40 c24fbe40 c1053974 00000009 c24fbe38 c18ec480 c24fbe54
[ 4089.639656] Call Trace:
[ 4089.639685]  [<c16e0257>] dump_stack+0x41/0x52
[ 4089.639707]  [<c105390c>] warn_slowpath_common+0x8c/0xc0
[ 4089.639727]  [<c10a60fc>] ? irq_nested_primary_handler+0x2c/0x30
[ 4089.639744]  [<c10a60fc>] ? irq_nested_primary_handler+0x2c/0x30
[ 4089.639763]  [<c1053974>] warn_slowpath_fmt+0x34/0x40
[ 4089.639781]  [<c10a60fc>] irq_nested_primary_handler+0x2c/0x30
[ 4089.639800]  [<c10a5c56>] handle_irq_event_percpu+0x76/0x190
[ 4089.639818]  [<c1461570>] ? regmap_format_10_14_write+0x30/0x30
[ 4089.639836]  [<c1464f4c>] ? _regmap_bus_raw_write+0x4c/0x70
[ 4089.639854]  [<c10a5da1>] handle_irq_event+0x31/0x50
[ 4089.639872]  [<c10a83eb>] handle_simple_irq+0x4b/0x70
[ 4089.639889]  [<c10a5384>] generic_handle_irq+0x24/0x40
[ 4089.639908]  [<c1366d87>] crystalcove_gpio_irq_handler+0xa7/0xc0
[ 4089.639927]  [<c10a85a7>] handle_nested_irq+0x77/0x190
[ 4089.639947]  [<c1469801>] regmap_irq_thread+0x1b1/0x360
[ 4089.639966]  [<c10a6ae8>] irq_thread_fn+0x18/0x30
[ 4089.639983]  [<c10a6906>] irq_thread+0xf6/0x110
[ 4089.640001]  [<c10a6ad0>] ? irq_finalize_oneshot.part.30+0x1b0/0x1b0
[ 4089.640019]  [<c10a6b50>] ? irq_forced_thread_fn+0x50/0x50
[ 4089.640037]  [<c10a6810>] ? irq_thread_check_affinity+0xc0/0xc0
[ 4089.640054]  [<c106f389>] kthread+0xa9/0xc0
[ 4089.640074]  [<c16e6401>] ret_from_kernel_thread+0x21/0x30
[ 4089.640091]  [<c106f2e0>] ? kthread_create_on_node+0x110/0x110
[ 4089.640105] ---[ end trace dca7946ad31eba7d ]---

Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=90521
Reported-and-tested-by: Brian Loften <bloften80@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Aaron Lu <aaron.lu@intel.com>
---
 drivers/gpio/gpio-crystalcove.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 55d4803d71b0..3d9e08f7e823 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -272,7 +272,7 @@ static irqreturn_t crystalcove_gpio_irq_handler(int irq, void *data)
 	for (gpio = 0; gpio < CRYSTALCOVE_GPIO_NUM; gpio++) {
 		if (pending & BIT(gpio)) {
 			virq = irq_find_mapping(cg->chip.irqdomain, gpio);
-			generic_handle_irq(virq);
+			handle_nested_irq(virq);
 		}
 	}
 
-- 
2.1.0

