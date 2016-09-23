From: Jacob Chen <jacob-chen@iotwrt.com>
Subject: [PATCH] pinctrl: rockchip: don't disable clk when irq mask is already set
Date: Sat, 24 Sep 2016 02:26:37 +0800
Message-ID: <1474655197-26919-1-git-send-email-jacob-chen@iotwrt.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33896 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933869AbcIWS1S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 14:27:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Jacob Chen <jacob2.chen@rock-chips.com>

From: Jacob Chen <jacob2.chen@rock-chips.com>

In some drivers, disable_irq() call don't be symmetric with enable_irq()
, disable_irq() will be called before call free_irq().

But both disable_irq() and free_irq() will call rockchip_irq_gc_mask_set_bit,
 and clk_disable() will be called more times than clk_enable(), which will
cause bugs.

I think we can correct that by checking of mask.If mask is already set, do nothing.

Change-Id: If19912c7658253e15531c04db6c70fdbffd5960a
Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index c6c04ac..9a8804a 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2334,8 +2334,12 @@ static void rockchip_irq_gc_mask_clr_bit(struct irq_data *d)
 void rockchip_irq_gc_mask_set_bit(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
 	struct rockchip_pin_bank *bank = gc->private;

+	if (*ct->mask_cache & d->mask)
+		return;
+
 	irq_gc_mask_set_bit(d);
 	clk_disable(bank->clk);
 }
--
2.7.4

