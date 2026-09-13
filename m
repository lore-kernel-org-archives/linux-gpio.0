Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E2D36E484;
	Sun, 13 Sep 2026 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329491; cv=fail; b=pG3RjRtTRcy8l2DHHDPxHIpfAUA27BiS726UTPuwcc4Pi0ZqOBKFmBvvHdSi4x2s1ttnQe8xD0jnu5yksAdzAz+/Y4P0mC/hB3Ml2JH6t+WRe2zhJhwQWE/3/ePD0BLKP+HK3NIgD8brYw/DyONsqB58bxXFg7hC9H3MEv3C3zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329491; c=relaxed/simple;
	bh=WdG0HYEa6LdjB9bNA8lPEB4vVt64IpaicGt/GWDPtoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WzbUss56YbY+eJpXo0wTPnjfKTgnH9ZXo68lHVsAQmkWDwW7wN0qzamPNOHg5UTe+MH44AGs53YfZ11uisAMG/booVxaYp7qh5qtVkzfuzgmzyfPJjS+GgF9ynasz2oraPXIssD3V6eCEnZAK4O8C7D4PFvK4gIxNED+KJXj+qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=REzXII4D; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="REzXII4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgHfpTSRQ5pS/cG1PRQ3fYaqfRCMIrmwib9mYq5QtlxkT8105byCBeMq0Wo4Uo7Xbyy0RLFWIQ+yUF46DY/xe9BvqWfLQQJjBbSWW+RaEXJmLU4tAf/I9lK82HNxZhxP50lPdWTQi5TRzQ/gMiqF+ntHP1T1a+P4pz/EFjpAQN+X7lHMvqv570aPu8MLetlz/twlLz6Amv4opDmmAfxLh8rnLes1LDmjTpXg6b5evM2/EPPoHnSjimVoxShi8NCadZMChAqfJIKloUEIjbIUJ4uB2VVnSPPQavVY/JhrVQpBSGisu/1nnWY/DZsw25j/lPbRRyeMGcznarmuLre3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ALvPzfPAGABPwL+xa5E8850zKtjfLbhnjj/uj/i/cg=;
 b=k6QDwcBGqlF1+tioq836HKxQIPme5CLopI81o7o9ClPCaHSMcrSuw3zftp67u6X0t4k4VEH9p9MAW8ZvrGjI1bApcRIgeyftMLiJmh8uQTk5GFyYOMaQnTcS7YbwPj7r8w3XH2bZO/Y196BoeqQlmpaUE4GZ0EuY17ttwrhuNEUGlLAIHBcZaGOuUV8Iejh+Od5MNrxeIOzCWsekgWiEAM+oqcmA5tqTaeZQUjQMl6z9Z1mcUGo6VRGPnTVJAtpy0G0TWP58+dLpnwk3JXrNa/dcD6gjlz9aqq5I2fsNJv+nf1wlJ6lejliRCyqVvD5mJ6RqrKviXAdzS2+GQoVMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ALvPzfPAGABPwL+xa5E8850zKtjfLbhnjj/uj/i/cg=;
 b=REzXII4DMkPZNgq2hoU/JsgXWjATG24zOL+LJUP+0ksk+2n1ZaoG9l067DFmqmmSSN0nwUJ0DWaAjJ4KS2IIeezs5p4KeGjvYvGeA1r+cYuBhuqr8cQMLunrgJ9TH14XGMisDToCDo6OPFxy30biVjXqVFM0gQpP/1goaC8nOPU=
Received: from OS3PR01CA0085.jpnprd01.prod.outlook.com (2603:1096:604:da::18)
 by TY3PR01MB10400.jpnprd01.prod.outlook.com (2603:1096:400:251::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 19:57:59 +0000
Received: from OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:da::4)
 by OS3PR01CA0085.outlook.office365.com (2603:1096:604:da::18) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12
 via Frontend Transport; Sun, 13 Sep 2026 19:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D213.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Sun, 13 Sep 2026 19:57:57 +0000
Received: from demon-pc.localdomain (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.2])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 43F2D30000A8;
	Mon, 14 Sep 2026 04:57:55 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v3 2/5] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
Date: Sun, 13 Sep 2026 22:56:51 +0300
Message-ID: <20260913195654.3371385-3-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D213:EE_|TY3PR01MB10400:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9268e796-ef69-4a76-8c29-08df11d14ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1LFp22Oggp/ijmoqlRGA4LHegEf4u00CIxd3/KGw+u/Gnx758pJupPkFdBXwsu95fssY/Bj/hGtqoZKG7ydFUqjj38fBd1Rz9s63GugIHAJaxdj3Fnkjzx6rd+aoL7n407rjZtULPshGnP4qecOP7+DcNhjvtM99P3uTTGJFJfHLRuRE0jkiJf3fL/8kwFKRXRfq26FeXGzrvZzJFdTNTLj6HK9eDxb1V+JF5LEHMvFTnI3wrzj9PS/Htde71PMsaZMfkT/a3jcXMNrQvCIjz9njYAewHDwipgNEopcA3Fp10nc7DtgzVHKSfY+ZFOylkeOF6yj/CCGa76a75l8Z/wGoSsRnFOx0VmuOmHRgOEDptKfXuUXjTbpNZF+DWwyr9RzO7dGcKfKWEDWHcCtHYgb4ced6YuYwAJ8tqqjBZVqjg+VYiFDa+Geo/ZyPl6WjtpMXi7w6AzTqCD3MA1YyIAIWgatJlRz8sZ55ikunSGn6Lqa+ja0qOL/0ei3SdtMzxnE37gVOwdRz2eShaCYhbDsZpiaYq40cYfLQgDoA2HYwArIwzOGLZ872k8YnOeVmE677mtgNlSljuQnpCXNYhTFqBm58wlAHflDqDg/WlIa4RxzP12OPj2tjB4MmDA7uXodz+fN/nDVF4mVAj3R520Go/VOSizuCDGUJDlVx8mEzqa5cvHGW2st1GtFFTaqEUdqTCLOwlqZghdWvFamO3w==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QtqsK7i8B1h1f7rVuhQLKQTs9LfrhVqtJ7xhLRjNfF4SDUeZWYGDwlik78YbYGxgU8M4l0Bw4yDGGZL2Mf5QPK0pzdhn6SWyGdk3QmSQS3DCUrqu1k49+1QLQImv6Akn8+/YX5bAOgZ5m72xJiuc15TvU9fGU6MM+LWjbhSdQZz598F25EymEbGpCPQrC+9C8Rwsy1xBX2QPHKQM4KNoU8hid29Ty1PeN3xc/TDSzLDB0ErEs09nAegfHEElT0MQRCTEWMKOLVokJdO9qgi+JOMLwR975YeZkiLiEB/b5EgmRwRznFFr7KydZLGm2isXyKydLRCxjr2mJ16TW+Qc1vv8K8fSuLqjCOQRFpE9dpSDNKao8wdfT1TSt3OZzKzv7INg9RTr/qjq36zCT5Tvsa8eIktA0Hp6ipwd1R8JGUuocV8bMYDnEW6SBrOkQEFA
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:57:57.8448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9268e796-ef69-4a76-8c29-08df11d14ee0
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10400

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

V3:
 * no changes

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
