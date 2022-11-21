Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E39C433FE
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Nov 2022 15:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiKUPvF (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 21 Nov 2022 10:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiKUPvE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 10:51:04 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C57125FB
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 07:51:02 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:4821:1ba5:2638:5c3a])
        by xavier.telenet-ops.be with bizsmtp
        id n3r02800R5WXlCv013r0qy; Mon, 21 Nov 2022 16:51:00 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ox94W-0019Fy-3O; Mon, 21 Nov 2022 16:51:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ox94V-00BQYQ-6U; Mon, 21 Nov 2022 16:50:59 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Emil Renner Berthing <kernel@esmil.dk>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] pinctrl: starfive: Use existing variable gpio
Date:   Mon, 21 Nov 2022 16:50:58 +0100
Message-Id: <3b6b8597792a393d0f21b8489dd933663dfd2b90.1669045778.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the existing variable "gpio", instead of obtaining the hwirq number
again.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index bdf61cfd143a5120..6fe5e1e9baa9b20a 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -1086,7 +1086,7 @@ static void starfive_irq_mask(struct irq_data *d)
 	writel_relaxed(value, ie);
 	raw_spin_unlock_irqrestore(&sfp->lock, flags);
 
-	gpiochip_disable_irq(&sfp->gc, d->hwirq);
+	gpiochip_disable_irq(&sfp->gc, gpio);
 }
 
 static void starfive_irq_mask_ack(struct irq_data *d)
@@ -1115,7 +1115,7 @@ static void starfive_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 value;
 
-	gpiochip_enable_irq(&sfp->gc, d->hwirq);
+	gpiochip_enable_irq(&sfp->gc, gpio);
 
 	raw_spin_lock_irqsave(&sfp->lock, flags);
 	value = readl_relaxed(ie) | mask;
-- 
2.25.1

