Return-Path: <SRS0=eRu/=CU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DDEC433E2
	for <linux-gpio@archiver.kernel.org>; Fri, 11 Sep 2020 02:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 993A821582
	for <linux-gpio@archiver.kernel.org>; Fri, 11 Sep 2020 02:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgIKCLU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 10 Sep 2020 22:11:20 -0400
Received: from pi.codeconstruct.com.au ([103.231.89.101]:41918 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgIKCLT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 22:11:19 -0400
Received: by codeconstruct.com.au (Postfix, from userid 20001)
        id 4DD823FEF9; Thu, 10 Sep 2020 22:11:16 -0400 (EDT)
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 2/2] gpio/aspeed-sgpio: don't enable all interrupts by default
Date:   Fri, 11 Sep 2020 09:51:05 +0800
Message-Id: <20200911015105.48581-2-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911015105.48581-1-jk@codeconstruct.com.au>
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, the IRQ setup for the SGPIO driver enables all interrupts in
dual-edge trigger mode. Since the default handler is handle_bad_irq, any
state change on input GPIOs will trigger bad IRQ warnings.

This change applies sensible IRQ defaults: single-edge trigger, and all
IRQs disabled.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")

---
v2:
 - update comments to reflect trigger mode change
 - tweak wording to reflect disabled state & single-edge trigger mode
---
 drivers/gpio/gpio-aspeed-sgpio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index a18ca52432e0..64e54f8c30d2 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -452,17 +452,15 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	irq->parents = &gpio->irq;
 	irq->num_parents = 1;
 
-	/* set IRQ settings and Enable Interrupt */
+	/* Apply default IRQ settings */
 	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
 		bank = &aspeed_sgpio_banks[i];
 		/* set falling or level-low irq */
 		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
 		/* trigger type is edge */
 		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
-		/* dual edge trigger mode. */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
-		/* enable irq */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));
+		/* single edge trigger */
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));
 	}
 
 	return 0;
-- 
2.28.0

