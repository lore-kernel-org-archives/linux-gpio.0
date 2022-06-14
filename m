Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F1ACCA47B
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Jun 2022 20:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357083AbiFNU3b (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 14 Jun 2022 16:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358179AbiFNU31 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 16:29:27 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00ACE4E39D
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2022 13:29:24 -0700 (PDT)
Received: from localhost.localdomain ([37.4.249.155]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mn2iP-1nKxWv2UcB-00k5h0; Tue, 14 Jun 2022 22:29:06 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Phil Elwell <phil@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 2/2] pinctrl: bcm2835: Make the irqchip immutable
Date:   Tue, 14 Jun 2022 22:28:31 +0200
Message-Id: <20220614202831.236341-3-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614202831.236341-1-stefan.wahren@i2se.com>
References: <20220614202831.236341-1-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oWqgwADfGSQkbb8dC4ItUZznIfsMVheE+ifouker/5/oGszse2p
 zFYKmrmn5hmslm29vKqirmQyG+8yZnaeBYhDIsqk3fjvyiiPONJMdZzsWbLSbWU2EbCmSG3
 m4RIbeCHsRO/HHORx5Gzw2klgAvyDbq0tiGbsflsJy+TgtmfuqU6apZTkYLhK/HN4/nkgrP
 l3eEJOYafjjeB3ZczzrXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nWnFlMfZQ+4=:oKCIFwvMlWEyc+X+90sC/i
 rPfyCk9fRWXNLjluh5vC/38SEhuzd60rf+v0GVIas1KKKhuQzx+nslIZzu6AFnwTEntOaK4Jo
 c6Jhz7Rdtr/HTGifvnCNWSuAYUfw15EU0VqwgE/0GseV58UXwx3rcfYpxS6FaeQpRdMmwksnM
 hcsU7m7LeV4BBT3yzAAqeE69eD9Y04PkV9J58rAmiFdR2IicARr9DtDUtYaXTBcbxEKDINcZl
 QrEZhT5Z54XNUBNlNAY2CUIX5lvEVe2h//cyKEtb0Mx0RO/UyHhddyyb26++0zgengoa2CA5Y
 hU/g9Vjrjd+JnCu9JdAVEsmkU1206QYB+6ASWExJO152+rsneSQs+q3DnGr2uC1zHQ9OM0Eue
 3y/63nxZaWYYm+kri4PwAz+8gM8Gw8p5ho6fxzsMfUb3U09TYhfaTK/TDy6683T/U/qQlxXN9
 uxr0ijOhz+JnLhMLuRMdQlyX2/p3lsKBHod91dbcYAwNF6/jSqG5KQdTzrPUbg1RJuCIlZADl
 j2xy0MhE7Vs6Xak8xKabfZOLFT7Kga4WV5G+TKRJA2kU6Qo8a+RMg6u00rLZwV4Pls37+RiW+
 QYgw6EnVRXvcT/j/pgJi22WqcBHts1l1Pt9tcb69PWLWCPqSMtKkc2uQtG3lY9Idcw2d8UIwD
 7hiQ9N0s+gyGmppg9R7XDkBzYcnOhGNAfCIc+vgC3MgCQa1Dpw8go3hXtnrOlNZcRMHYfgaN5
 S8U1LNAoU2OIYx4U35XeEQS4/Rlek37EZlbE6JVhqVWEm71GwBXbBYAUsj8=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips. The bcm2835 pinctrl is also affected by this
warning.

Fix this by making the irqchip in the bcm2835 pinctrl driver immutable.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 807824bc9a10..7857e612a100 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -516,6 +516,8 @@ static void bcm2835_gpio_irq_unmask(struct irq_data *data)
 	unsigned bank = GPIO_REG_OFFSET(gpio);
 	unsigned long flags;
 
+	gpiochip_enable_irq(chip, gpio);
+
 	raw_spin_lock_irqsave(&pc->irq_lock[bank], flags);
 	set_bit(offset, &pc->enabled_irq_map[bank]);
 	bcm2835_gpio_irq_config(pc, gpio, true);
@@ -537,6 +539,8 @@ static void bcm2835_gpio_irq_mask(struct irq_data *data)
 	bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
 	clear_bit(offset, &pc->enabled_irq_map[bank]);
 	raw_spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
+
+	gpiochip_disable_irq(chip, gpio);
 }
 
 static int __bcm2835_gpio_irq_set_type_disabled(struct bcm2835_pinctrl *pc,
@@ -693,14 +697,15 @@ static int bcm2835_gpio_irq_set_wake(struct irq_data *data, unsigned int on)
 	return ret;
 }
 
-static struct irq_chip bcm2835_gpio_irq_chip = {
+static const struct irq_chip bcm2835_gpio_irq_chip = {
 	.name = MODULE_NAME,
 	.irq_set_type = bcm2835_gpio_irq_set_type,
 	.irq_ack = bcm2835_gpio_irq_ack,
 	.irq_mask = bcm2835_gpio_irq_mask,
 	.irq_unmask = bcm2835_gpio_irq_unmask,
 	.irq_set_wake = bcm2835_gpio_irq_set_wake,
-	.flags = IRQCHIP_MASK_ON_SUSPEND,
+	.flags = (IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE),
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int bcm2835_pctl_get_groups_count(struct pinctrl_dev *pctldev)
@@ -1278,7 +1283,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
 
 	girq = &pc->gpio_chip.irq;
-	girq->chip = &bcm2835_gpio_irq_chip;
+	gpio_irq_chip_set_chip(girq, &bcm2835_gpio_irq_chip);
 	girq->parent_handler = bcm2835_gpio_irq_handler;
 	girq->num_parents = BCM2835_NUM_IRQS;
 	girq->parents = devm_kcalloc(dev, BCM2835_NUM_IRQS,
-- 
2.25.1

