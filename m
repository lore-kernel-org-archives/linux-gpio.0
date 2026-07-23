Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A336826E;
	Thu, 23 Jul 2026 03:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779122; cv=none; b=ALVaHskK2ERXkUbOVPMCe3HiN0bcU3xF6VOh99roSLNhiuyQIl+u0MEsQ0ZEKQ2EqdgAudPNYsED5OC2jlksv6HwB+gFj13X3xZXlifs2YgUle3NcWRI1GpGDCFXzas0MOa86iOyOGkHXrnVF6XQ4188yeIju9ubV0nuXn6FTAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779122; c=relaxed/simple;
	bh=ycuMSZ5JIGGE14y7RYDqvr8p3XRdeQ3R6mo5kNi8s44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mI3l1RDH/PZ2F4xM3Knjwr3Z8ptFPGprZNbXppD5ESXZnIl+uBooaVQbA8/LmrF8J1p8lCuo+pp6VtDwUf4S5aJ3FEfwFZJWhhDPuWiIWa6F9KsFkZO8tGUfvrfzzcXH7tPbhD72SUR6kVkucxGLVC6je2xtnUJ2Gqb3FN3qcuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FdRnTieD; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FdRnTieD"
X-UUID: c22f4028864a11f18dc8c9802ae25ab1-20260723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AiFxMQJcPCjNrSOlVHZhtCQZBI3sh0SumQ8GAaE0fO4=;
	b=FdRnTieDC8QJvxuj9ycu9RujLSCSkbfWaepvM/DtQAK5ONe3U5+XGYj0RWrAFIIMhZxJO4KvcgJhF4ikLdE/kEXHIxvBW96nutmEPzxtc4wHlvifjQjJRnDa8bz0BnIcbIP4nO0z/AoC7UKsZDKcwyPx//8t0zugTaONEEgnSXw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:3dacd60f-8c26-4e7d-83a1-3bbadf58442a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:309b0931-c234-4105-b2c8-ac1d356c64f7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c22f4028864a11f18dc8c9802ae25ab1-20260723
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 777233578; Thu, 23 Jul 2026 11:58:26 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Jul 2026 11:58:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Jul 2026 11:58:25 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v7 2/5] pinctrl: mediatek: free EINT resources on unbind
Date: Thu, 23 Jul 2026 11:58:13 +0800
Message-ID: <20260723035823.2041832-3-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260723035823.2041832-1-justin.yeh@mediatek.com>
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

mtk_eint_do_init() creates an IRQ domain, populates it with a mapping for
every EINT line and installs a chained handler on the parent interrupt,
but none of these are ever released. This was harmless while the drivers
were built-in, but now that they can be built as modules and
unbound/rmmod'd it leaves behind a dangling IRQ domain, interrupt mappings
whose chip data points at freed memory, and a chained handler that keeps
firing into that freed data.

The plain allocations in mtk_eint_do_init() already use the device-managed
devm_*() helpers, so tear the remaining resources down the same way:
register a devm action that detaches the chained handler, waits for any
in-flight handler to finish, disposes of the per-line mappings and removes
the IRQ domain. This mirrors the device-managed lifecycle adopted for the
GPIO chip and keeps the whole EINT setup self-cleaning on unbind.

Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 47ac92ea98c2..8b022545a3e9 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -12,8 +12,10 @@
  */
 
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -509,6 +511,27 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
 }
 EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 
+static void mtk_eint_teardown(void *data)
+{
+	struct mtk_eint *eint = data;
+	unsigned int i, virq;
+
+	/* Detach the demux handler so it can no longer reference freed data. */
+	irq_set_chained_handler_and_data(eint->irq, NULL, NULL);
+
+	/* Wait for any in-flight handler to finish before tearing down. */
+	synchronize_irq(eint->irq);
+
+	/* Dispose of all child mappings before the domain is removed. */
+	for (i = 0; i < eint->hw->ap_num; i++) {
+		virq = irq_find_mapping(eint->domain, i);
+		if (virq)
+			irq_dispose_mapping(virq);
+	}
+
+	irq_domain_remove(eint->domain);
+}
+
 int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 {
 	unsigned int size, i, port, virq, inst = 0;
@@ -601,7 +624,7 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 	irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
 					 eint);
 
-	return 0;
+	return devm_add_action_or_reset(eint->dev, mtk_eint_teardown, eint);
 
 err_eint:
 	for (i = 0; i < eint->nbase; i++) {
-- 
2.45.2

