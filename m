Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DDCC433E0
	for <linux-gpio@archiver.kernel.org>; Sat,  2 Jan 2021 18:21:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C5DA207CD
	for <linux-gpio@archiver.kernel.org>; Sat,  2 Jan 2021 18:21:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbhABSV0 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 2 Jan 2021 13:21:26 -0500
Received: from os.inf.tu-dresden.de ([141.76.48.99]:44788 "EHLO
        os.inf.tu-dresden.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbhABSV0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Jan 2021 13:21:26 -0500
Received: from erwin.inf.tu-dresden.de ([141.76.48.80] helo=l4re.org)
        by os.inf.tu-dresden.de with esmtp (Exim 4.94)
        id 1kvlBB-0007bz-F2; Sat, 02 Jan 2021 18:59:05 +0100
From:   Adam Lackorzynski <adam@l4re.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-arm-kernel@lists.infradead.org, linusw@kernel.org,
        kaloz@openwrt.org, khalasa@piap.pl, andrew@lunn.ch,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: [PATCH 5/6] gpiolib: Fix return check of __irq_domain_alloc_irqs
Date:   Sat,  2 Jan 2021 18:58:58 +0100
Message-Id: <20210102175859.335447-5-adam@l4re.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210102175859.335447-1-adam@l4re.org>
References: <20210102175859.335447-1-adam@l4re.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

0 is not a proper IRQ number and also indicates failure.

Signed-off-by: Adam Lackorzynski <adam@l4re.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b02cc2abd3b6..9667e1a62626 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1003,7 +1003,7 @@ static void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gc,
 						      &fwspec,
 						      false,
 						      NULL);
-			if (ret < 0) {
+			if (ret <= 0) {
 				chip_err(gc,
 					 "can not allocate irq for GPIO line %d parent hwirq %d in hierarchy domain: %d\n",
 					 i, parent_hwirq,
-- 
2.30.0.rc2

