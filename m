Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6915DC433E0
	for <linux-gpio@archiver.kernel.org>; Sat,  2 Jan 2021 18:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31897207CD
	for <linux-gpio@archiver.kernel.org>; Sat,  2 Jan 2021 18:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbhABSWJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 2 Jan 2021 13:22:09 -0500
Received: from os.inf.tu-dresden.de ([141.76.48.99]:44910 "EHLO
        os.inf.tu-dresden.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbhABSWJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Jan 2021 13:22:09 -0500
Received: from erwin.inf.tu-dresden.de ([141.76.48.80] helo=l4re.org)
        by os.inf.tu-dresden.de with esmtp (Exim 4.94)
        id 1kvlBA-0007bz-Ur; Sat, 02 Jan 2021 18:59:05 +0100
From:   Adam Lackorzynski <adam@l4re.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-arm-kernel@lists.infradead.org, linusw@kernel.org,
        kaloz@openwrt.org, khalasa@piap.pl, andrew@lunn.ch,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: [PATCH 4/6] irqchip/ixp4xx: Fix return check of __irq_domain_alloc_irqs
Date:   Sat,  2 Jan 2021 18:58:57 +0100
Message-Id: <20210102175859.335447-4-adam@l4re.org>
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
 drivers/irqchip/irq-ixp4xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-ixp4xx.c b/drivers/irqchip/irq-ixp4xx.c
index 37e0749215c7..54dcffe2309f 100644
--- a/drivers/irqchip/irq-ixp4xx.c
+++ b/drivers/irqchip/irq-ixp4xx.c
@@ -355,7 +355,7 @@ void __init ixp4xx_irq_init(resource_size_t irqbase,
 					      &fwspec,
 					      false,
 					      NULL);
-		if (ret < 0) {
+		if (ret <= 0) {
 			pr_crit("IXP4XX: can not allocate irqs in hierarchy %d\n",
 				ret);
 			return;
-- 
2.30.0.rc2

