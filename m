Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458933B14A4;
	Mon, 17 Aug 2026 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993101; cv=fail; b=INgXk+yKiiJb6bIyEYNjIGSwjKN1xz+JlUuIh0f+UJnxZJXyIp3dkXh5BOFH2PH5EFBVA/nqjYbe9Wj4Mrthtf5X1D9jxU6FuQR9EqVIq8328LCz7djCWF62SoporvMlWw+0l6FAKDnHC63WrdOQjJRtNQN//vs/4bX9+XnCfbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993101; c=relaxed/simple;
	bh=ardk4DIWtsN0LWC9JvNmAc1jQM9KlTH48TNz2HXMPfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2aWW3aEDPGPmKURguOM9p/dwtnlXKU6TDA3yFV1antig/S29stqSTQ2x+2N+33p29vVyQMP2CBxouNkpgSy+4/ZgTgjRp8NRJSscrlRtyLEcKKA1rAAm4OWLHDzv73sJn1V9KRXrf8Q0FMJIwnlXhyczm/Aw2ibHk7gMLCrSvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DPt5gOVB; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DPt5gOVB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNsaDCQJ+mkUMGtQ2cYKZ/WjwKvhNer5lHAjii+aP5vvyDLEZrBmr4bSH859/hzLywjwLn6R0295XawG7KT9lAtKCev9poiCGIaRGc5MfnUVo2/J3SM+JyVsmz6OCqWA3LvkeH+mcvCXbigJ0zVVilHJ7z317yP6If9VL4GbLlbbHtD+T5l07HbASWc1wywTz+pZ11YphXM7KE6TWXLu+Psi/bcvPRMjrXW/5qLLRvS2rIdLjF82hAdZDxYSaG6bcCx01xlbUpd8PqBF6se3vLINWbeSx+nqW9/RsBUHNimbLYdJy5GVWmrd0c3/9gDtpLjx8pCO6g1HVXUs3n43Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lg19ZTdz5xsF8/vyqwL1T9lLCpj5JtCOXhTc0VkxHHI=;
 b=dZ5IM2geDCQAIfEQMr0hsNscGjTgXVwHCpApQFAtevHli7EdEmpCfBYoei6e0RDn/fsr3onYmucFAsBEFNJPfpDC0VHLDu835kBbVOjRMMfT9kDwlwRd/OQndgSNwdE0hxMXaajHf5BJK4sbTlvSNV70ZQdi6h11fQjeVRKBGjAlUEIF4RXWviG7276Vxga9NfD/aOek7+kEcJX6FbyqZeY1cy9j6yoH5JnxjiH8T8Rso9PBrvb68Nys4ugsSLTSPLiappQEGA3Zi3NVIWmbPuSXBuxCjQ9SNWuYqsvGo5APhhs8ioutMM2NxecdG4vpk12WEHyDADWRQEeqja/S0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lg19ZTdz5xsF8/vyqwL1T9lLCpj5JtCOXhTc0VkxHHI=;
 b=DPt5gOVB2HfOsqaBdqKKoSZk88EoReCcexegFmKXwkn8xzWp69ErYCJ4UHBFhi4CVofhUir+95k8K0DKyW3A4Wqn8vn11whlP2XflnIjprv/byaIIUWBtd3rzrDG0BruGau0VfFXvz9XVzJwgzOCuZSZOkhS8nQsKVw6xXhhm7w=
Received: from OS7PR01CA0167.jpnprd01.prod.outlook.com (2603:1096:604:24c::18)
 by TYCPR01MB11355.jpnprd01.prod.outlook.com (2603:1096:400:362::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:58:16 +0000
Received: from OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:24c:cafe::ad) by OS7PR01CA0167.outlook.office365.com
 (2603:1096:604:24c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 18:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20F.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 18:58:15 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.24])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 81B86300022C;
	Tue, 18 Aug 2026 03:58:12 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH 3/7] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
Date: Mon, 17 Aug 2026 21:56:56 +0300
Message-ID: <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20F:EE_|TYCPR01MB11355:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2cea962b-18b2-4747-0ee7-08defc917ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	PerDF5QXVpZ+R3E25oxWOV+YJtGoBB95OCGmbyRYwPFjDBEQO33TwIz9+oq+xrwAYcsQDyCTXItGYIw+HGiBdFlpR8lNMXdQ+D4Apyi9vVaNQ5r5eHdRic7emLli02Vy9QFNwTipkzHprlnm2XgonQdtJ0Y/pG2J9QAuKLeSIg99M0pXr3y1xEUgj1eVhz5CA02o6rhrrCSA4HQwR7IjhxXthsuW374uAxQD54XoKfQEwmDIhiYg7/9uEaNqses3I5DpZ/32lXi9QtUOnsm3xaaqgYaWx+of3HOsOxgFUeizgHHQXlcG0gAiy6G2ijZdGW1y1Uhu0M7aETFHVLSIcxH8s8i/6u8tV1pVAkkIrC9a+suh0irncIoCzRktf8LaUazYCK7lIjsAH9mrjm8BCpk4DoOJpPW+3Tk6BCTp0mkUKkUCjkgBvJcfwRlMK057YGVa2NRVSVdYIxEA6xA3P9jjE5tkHZDowdkS6g37L8imrsDLybzsQHLglu0tdN8hOusHAb+ZE8Pi7IvuouKAmmLGOuNOlyl/0+PEELdl8O2hRBrown2wrqBEJyImu+8WP4DnK0pvVGvjZlgqJdoCu5MoAtGgS4aWJ7CoZL+v+HjE0g2Qjbx9tA4u5QCXpPnbSzSJdn3/rijSVrx8wQznPLBTfVJCY6zGS48wbnLCJ0WuAmfx+gqE86Rb5h1DhReiGkChW+231v97SPjvmjt7zw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6NBgH526bk9HOfh1dWA7le1xCx+Raj6UqKKa11NX+BJ4OtIaGLOusEYuX3aUbGpy8U+LIgAaBv3998sA3afaV4LuF67xjnrFEFJKWOcAqctyoVTWmIUjO9uLvv/SnqMW4kAbHIRFO9sUHBu7s93OusI3XPeSEZdD2Ykl6MH/2zTb2jmYhYRDLkmmaFX+6IS/1IpU0ZSh32D3R1pkrLT7mtvHkBoRwnLbMzb5otDNrxtHmde1U32i/8RhfI78N6rzLMjLlDSWQkIIY8Rlhl7aIiN+QOFLGgbgb7KNK5tfXQ4a1B3fAS864rcW3qblag/YxylN+34T1nPQtzmG+Z0wMwPObapKIxervIvmd0OnAqoJ7H04JG3FSH69oJo0/9tI4t9y1b5nODF7QAq7abVdUuJ7bMSG+pwfU0F7+jv8A9SV2CNhCPc6QkItaWVBoOAx
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:58:15.9451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cea962b-18b2-4747-0ee7-08defc917ebf
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11355

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

Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free
the acquired IRQs.

Cc: stable@kernel.org
Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 79 +++++++++++++++----------
 1 file changed, 49 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 82fe9b5e8f72..287cacbcb37b 100644
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
+		clear_bit(parent_irq - RZT2H_INTERRUPTS_START, pctrl->used_irqs);
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

