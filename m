Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1A4AB1BC;
	Thu, 10 Sep 2026 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056224; cv=fail; b=IatKv99ZSGDeRX6/5inmZ6YCUmM86/wDoT79EtE3PcAlNctcNV3OyfbKwIYCABsZJhs3j+XuGMo52IMyryYlJWp6t/fFix7oCeO2O9e/63e4k1oeHeFc8guHVlP14s8T5mnGDmZpG76xN/QQShoH71IFETdtoR6NMfUmgezZ4r8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056224; c=relaxed/simple;
	bh=K7vRPs+dbd9UDpmIIgXr4BU2dJMIC0sHAC8GoEY/EvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=baZX0vyz3p0ftE0+dGB7o6Y9ABexly6N9B+akVbmrj8oT6Xr+7MPiyOlbH/mN4HAEpuZ9LtKD2z76ldbiuU4IcfPm9VQcqhgbGhBUTJBmB+2vucC/TyG7phf1YZRI+2dOfNvbyw/119WDhYRVspYd+LGuLni9+9LtCIHrW+i0eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pmTNq/PW; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pmTNq/PW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bospEQ0ZOuDi+nUI+fXv9rBzmxBBY5b/SmsyZQe/ND+j/h5Kqk4iF+dtU/4l0QZkHyTpFxZGZBSa3wlQWolRyBzvhr5rCl+yWmE1AwPZcexal6j0Bh1I4ZtArto6ehbwp3rcShihHzJg8CD9GGLA053VhLiC4jlzWXBski3kG+6RAZ+n8sSM9+URoGrYZsJBKVfKwr3uOvzZOLqbZ+JQoqfPqvm+2Cwcp0t29KkvZznKSawCD/rIet/iRLaw42ByLy1lijL+L9H0TQoRMz2JH2leBh+x393eEtaR1Dz9aRMLOZOvJ/ieQUAM2xILBE5bUOY1m2M982RcXkWEVBhmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hvx1gIpOHvFYsfecgsjDxWMiKfzlisLGDtNQsgl2Oc=;
 b=Kb/dn/tpVCgHa20lvCl9SvEs07QGklFuBbyr2MsIdjdF4TUXfNYYWaLdSuwMxQ1DY1Fm22hy3NEV1lUU5PoQVxovc/dDRWyg8xhYS2aL+D77awuUTXGkdYNbFvI48DgkOq+PzdQEQ3/DYqYpuNv+dUqw7GK9ejiOY+Y5Ukn9OhaweOgGksp/TU6UbZSlSbPZsNObDqxrvB1cTmLupniHvisiPBPncSrqC56bdV4XQqkfAojihtKC2EEMlZpMmguFNLcILme8MfKYV+/9gOhgCOKNtIK5iK/1YvrarVtCAwxIbBVlTl47PqTDkFDZgL6B1B8GTMwHeapH53QjBfqAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hvx1gIpOHvFYsfecgsjDxWMiKfzlisLGDtNQsgl2Oc=;
 b=pmTNq/PWl6pCsVCJhcXqUI2eIZzxl2g3ei1pPZE6drIls+5G13TrZkcL0Yq9vHUjlntF/Soj/05HCLYS/rWVIXza50Gl+0RH7P6jmVZkU73MyzIkFDtqLv0TU7jSZdVhkpumulS3Iz3zS5G81k6Wl6ZRyZggay8q8caQNTrlIQ8=
Received: from TY4P286CA0106.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:380::10)
 by OSOPR01MB12361.jpnprd01.prod.outlook.com (2603:1096:604:2d9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:03:38 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380:cafe::2b) by TY4P286CA0106.outlook.office365.com
 (2603:1096:405:380::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 16:03:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 16:03:38 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.160])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 7D70B300044C;
	Fri, 11 Sep 2026 01:03:35 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v2 2/4] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
Date: Thu, 10 Sep 2026 19:02:24 +0300
Message-ID: <20260910160226.489183-3-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910160226.489183-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260910160226.489183-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|OSOPR01MB12361:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1fac0d1b-9e88-4e39-9952-08df0f55135a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|22082099003|18002099003|56012099006|10067099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	2htT5fIvJt1dV2LegdYgBqGwyjjjRDseG2Aw/mmKH6Fb9RnrhdII5O/w5gzpEU5KWIIAbhfvu5gfqwrhNq7OgoDeujn+UmTHdVQ8VymKFfZLZn8tQgcx1CJ3RXb2hFyGYQqvZ7rsPpUWgGlucJKmssuXLLtuyWAcLX+t2znnwKxvndc4Sj5apQNfEKHWmegoGzvSYRjXmWWGmfJiY071NOEONrjimHVoucJOle9QQSmy7r/9p4iCsieollFvOedCX4zKmA9CL6SU3ADGeztjOhdurcZODlw1eF2VJaA184m4NJNGZUiJYnQstArkPQddtJ3Lngd9ghJBATtopFMNYLqPFAVTmBQsSoCk1zjfJ+1dUhmeewH6g7Nb+nKu5GCt0JNI7itji5Pjcqzp5/1AXdf/9ughZQqu16Vn8UOitAmHdW1kj6hfEfACAk4QpaHe7I5ZaYHCWxqSgQBQ+FD+ubIWdLRr3T0VUWD/M7Ek1Ibdu7xum0kP8yid3RGFLxGIVZuZ1GBpPI7rD/EjAYm4+RKVaNKMW5INq820JKYjjQW2px5DaaiDI05OQMLJCOeO4/VHUxqvRxBmVYrSHwqmhiAUQ9WbtGbZTHUZgLSsVK/5Pqb0w2nO2eAiYAWj/qecwfc3oeIISELUTRZwav4IAMdMWT7Jc4N9+Y4ROzfNv64NJiXm+aY76C4IjriaeqksIonW7+DRSTo00pG4gkJx5w==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sfPGbM2XDatuQin5gxUOzbVSlhKZgA5UYLXuRBEtyoDBYBjvlcbi2Rb1wRh1P/Vsly3E1t0A3Eg4sImLzH2FDeoDnxJiyjGbiSZ+2imOz1AiXCaLXHmtjtD5DsDLI3XIqFzAXpy9WYpt+fivvvDCcRDUjc+E9uuNF4ufLjz6Lw0FFmhpKEKVP2oXvHu1YgasmUH2iRpbLkFYoKS9NCEuOL9MlZip2dJyuHxkdZvy51IaFjuMd1ueToxzTaYTJNe/maC+uGy/CMZA5Yu4Fxb6UZZ75xHd+Ps2wMiM77Sug76aPnz7Dd22FEBGpQvVLdpEcN0qOP08V9O0N5NkBZ51eFbgakOms/Jtueda0XBsOuQ51VrpUjGL43fiwxVK47hQJc8sZCKKARVLuV2unOckUSPi2kus9bqk6Xzl7UJN5CmalTELCcyiCggeZkeKOzaI
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:03:38.0743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fac0d1b-9e88-4e39-9952-08df0f55135a
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12361

When exporting a GPIO using the deprecated sysfs GPIO API,
gpio_is_visible() calls gpiod_to_irq() to determine whether a GPIO is
IRQ-capable, which ends up using
struct gpio_irq_chip::child_to_parent_hwirq().

When using the GPIO character device, it is possible to request a line
and to dynamically switch between using it as an IRQ or as a GPIO, by
updating the edge detector.

The current struct gpio_irq_chip::child_to_parent_hwirq() implementation
makes the assumption that it will only be called with the intention of
setting up the IRQ permanently, and that it will only be released when
the IRQ domain is freed.

Since we now know that this is not the case, take the following steps in
order to properly handle that case.

Implement struct irq_chip::irq_{request,release}_resources() based on
the default GPIOCHIP_IRQ_RESOURCE_HELPERS implementations.

Move the IRQ setup and release logic inside them.

Keep the mapping logic inside ::child_to_parent_hwirq() to be able to
provide a proper HW IRQ number, but do not actually setup the IRQ.

Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free the
acquired IRQs. irq_domain_free_irqs_common() will still be set up as
struct gpio_irq_chip::child_irq_domain_ops::free by
gpiochip_hierarchy_setup_domain_ops().

Cc: stable@kernel.org
Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * reuse irq_idx in rzt2h_gpio_irq_request_resources()
 * mention that irq_domain_free_irqs_common() is still wired up

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 79 +++++++++++++++----------
 1 file changed, 49 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 9c1ac836ffa6..796120e70bc4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -1020,32 +1020,17 @@ static int rzt2h_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
-static const struct irq_chip rzt2h_gpio_irqchip = {
-	.name = "rzt2h-gpio",
-	.irq_disable = rzt2h_gpio_irq_disable,
-	.irq_enable = rzt2h_gpio_irq_enable,
-	.irq_mask = irq_chip_mask_parent,
-	.irq_unmask = irq_chip_unmask_parent,
-	.irq_set_type = irq_chip_set_type_parent,
-	.irq_set_wake = rzt2h_gpio_irq_set_wake,
-	.irq_eoi = irq_chip_eoi_parent,
-	.irq_set_affinity = irq_chip_set_affinity_parent,
-	.flags = IRQCHIP_IMMUTABLE,
-	GPIOCHIP_IRQ_RESOURCE_HELPERS,
-};
-
-static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
-					    unsigned int child,
-					    unsigned int child_type,
-					    unsigned int *parent,
-					    unsigned int *parent_type)
+static int rzt2h_gpio_irq_request_resources(struct irq_data *d)
 {
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
-	u8 port = RZT2H_PIN_ID_TO_PORT(child);
-	u8 pin = RZT2H_PIN_ID_TO_PIN(child);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u8 port = RZT2H_PIN_ID_TO_PORT(hwirq);
+	u8 pin = RZT2H_PIN_ID_TO_PIN(hwirq);
 	u8 parent_irq, irq_idx;
+	int ret;
 
-	parent_irq = rzt2h_gpio_irq_map[child];
+	parent_irq = rzt2h_gpio_irq_map[hwirq];
 	if (parent_irq < RZT2H_INTERRUPTS_START)
 		return -EINVAL;
 
@@ -1062,18 +1047,21 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 
 	rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
 
-	*parent = parent_irq;
-	*parent_type = child_type;
+	ret = gpiochip_lock_as_irq(gc, hwirq);
+	if (ret) {
+		clear_bit(irq_idx, pctrl->used_irqs);
+		rzt2h_pin_write_pm(pctrl, port, pin, pctrl->saved_pm[irq_idx]);
+		rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
+		return ret;
+	}
 
 	return 0;
 }
 
-static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int virq,
-				       unsigned int nr_irqs)
+static void rzt2h_gpio_irq_release_resources(struct irq_data *d)
 {
-	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct rzt2h_pinctrl *pctrl = container_of(gc, struct rzt2h_pinctrl, gpio_chip);
+	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	u8 port = RZT2H_PIN_ID_TO_PORT(hwirq);
 	u8 pin = RZT2H_PIN_ID_TO_PIN(hwirq);
@@ -1089,7 +1077,39 @@ static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
 		rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
 	}
 
-	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+	gpiochip_unlock_as_irq(gc, hwirq);
+}
+
+static const struct irq_chip rzt2h_gpio_irqchip = {
+	.name = "rzt2h-gpio",
+	.irq_disable = rzt2h_gpio_irq_disable,
+	.irq_enable = rzt2h_gpio_irq_enable,
+	.irq_mask = irq_chip_mask_parent,
+	.irq_unmask = irq_chip_unmask_parent,
+	.irq_set_type = irq_chip_set_type_parent,
+	.irq_set_wake = rzt2h_gpio_irq_set_wake,
+	.irq_eoi = irq_chip_eoi_parent,
+	.irq_request_resources = rzt2h_gpio_irq_request_resources,
+	.irq_release_resources = rzt2h_gpio_irq_release_resources,
+	.irq_set_affinity = irq_chip_set_affinity_parent,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					    unsigned int child,
+					    unsigned int child_type,
+					    unsigned int *parent,
+					    unsigned int *parent_type)
+{
+	u8 parent_irq = rzt2h_gpio_irq_map[child];
+
+	if (parent_irq < RZT2H_INTERRUPTS_START)
+		return -EINVAL;
+
+	*parent = parent_irq;
+	*parent_type = child_type;
+
+	return 0;
 }
 
 static void rzt2h_gpio_init_irq_valid_mask(struct gpio_chip *gc,
@@ -1157,7 +1177,6 @@ static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
 		girq->parent_domain = parent_domain;
 		girq->child_to_parent_hwirq = rzt2h_gpio_child_to_parent_hwirq;
 		girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_twocell;
-		girq->child_irq_domain_ops.free = rzt2h_gpio_irq_domain_free;
 		girq->init_valid_mask = rzt2h_gpio_init_irq_valid_mask;
 	}
 
-- 
2.55.0
