Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BE2C433DB
	for <linux-gpio@archiver.kernel.org>; Sat,  2 Jan 2021 18:20:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA4BC207CD
	for <linux-gpio@archiver.kernel.org>; Sat,  2 Jan 2021 18:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbhABSUA (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 2 Jan 2021 13:20:00 -0500
Received: from os.inf.tu-dresden.de ([141.76.48.99]:44658 "EHLO
        os.inf.tu-dresden.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbhABSUA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Jan 2021 13:20:00 -0500
Received: from erwin.inf.tu-dresden.de ([141.76.48.80] helo=l4re.org)
        by os.inf.tu-dresden.de with esmtp (Exim 4.94)
        id 1kvlBB-0007bz-Tx; Sat, 02 Jan 2021 18:59:06 +0100
From:   Adam Lackorzynski <adam@l4re.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-arm-kernel@lists.infradead.org, linusw@kernel.org,
        kaloz@openwrt.org, khalasa@piap.pl, andrew@lunn.ch,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: [PATCH 6/6] x86/ioapic: Fix return check of __irq_domain_alloc_irqs
Date:   Sat,  2 Jan 2021 18:58:59 +0100
Message-Id: <20210102175859.335447-6-adam@l4re.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210102175859.335447-1-adam@l4re.org>
References: <20210102175859.335447-1-adam@l4re.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

0 is not a proper IRQ number and also indicates failure.
Also check for this case in upwards functions.

Signed-off-by: Adam Lackorzynski <adam@l4re.org>
---
 arch/x86/kernel/apic/io_apic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index e4ab4804b20d..8ae46a092c88 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -1007,7 +1007,7 @@ static int alloc_isa_irq_from_domain(struct irq_domain *domain,
 		info->flags |= X86_IRQ_ALLOC_LEGACY;
 		irq = __irq_domain_alloc_irqs(domain, irq, 1, node, info, true,
 					      NULL);
-		if (irq >= 0) {
+		if (irq > 0) {
 			irq_data = irq_domain_get_irq_data(domain, irq);
 			data = irq_data->chip_data;
 			data->isa_irq = true;
@@ -1050,10 +1050,11 @@ static int mp_map_pin_to_irq(u32 gsi, int idx, int ioapic, int pin,
 			irq = alloc_irq_from_domain(domain, ioapic, gsi, &tmp);
 		else if (!mp_check_pin_attr(irq, &tmp))
 			irq = -EBUSY;
-		if (irq >= 0) {
+		if (irq > 0) {
 			data = irq_get_chip_data(irq);
 			data->count++;
-		}
+		} else if (irq == 0)
+			irq = -ENOENT;
 	}
 	mutex_unlock(&ioapic_mutex);
 
-- 
2.30.0.rc2

