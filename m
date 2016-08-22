From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2] pinctrl: cherryview: Do not mask all interrupts in probe
Date: Mon, 22 Aug 2016 14:42:52 +0300
Message-ID: <1471866172-64154-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:55366 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752148AbcHVLnN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Aug 2016 07:43:13 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, Anisse Astier <anisse@astier.eu>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org

The Cherryview GPIO controller has 8 or 16 wires connected to the I/O-APIC
which can be used directly by the platform/BIOS or drivers. One such wire
is used as SCI (System Control Interrupt) which ACPI depends on to be able
to trigger GPEs (General Purpose Events).

The pinctrl driver itself uses another IRQ resource which is wire OR of all
the 8 (or 16) wires and follows what BIOS has programmed to the IntSel
register of each pin.

Currently the driver masks all interrupts at probe time and this prevents
these direct interrupts from working as expected. The reason for this is
that some early stage prototypes had some pins misconfigured causing lots
of spurious interrupts.

We fix this by leaving the interrupt mask untouched. This allows SCI and
other direct interrupts work properly. What comes to the possible spurious
interrupts we switch the default handler to be handle_bad_irq() instead of
handle_simple_irq() (which was not correct anyway).

Reported-by: Yu C Chen <yu.c.chen@intel.com>
Reported-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Changes from the previous version [1]:

  - Update changelog
  - Use handle_bad_irq() instead of handle_simple_irq()

[1] https://lkml.org/lkml/2015/5/22/111

Anisse,

This is slightly different what I asked you test last time. I wonder if you
could give this a try and see if you still get ACPI GPEs.

 drivers/pinctrl/intel/pinctrl-cherryview.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 5749a4eee746..0fe8fad25e4d 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1539,12 +1539,11 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		offset += range->npins;
 	}
 
-	/* Mask and clear all interrupts */
-	chv_writel(0, pctrl->regs + CHV_INTMASK);
+	/* Clear all interrupts */
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 
 	ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, 0,
-				   handle_simple_irq, IRQ_TYPE_NONE);
+				   handle_bad_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add IRQ chip\n");
 		goto fail;
-- 
2.8.1

