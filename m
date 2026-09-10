Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD5D4B4891;
	Thu, 10 Sep 2026 16:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056222; cv=fail; b=BFjfhC6q5JkAVIBJDE4yZEpuCqm7uK69JBWGwS/I9rKCJ4HQ0LzoC7POZauDLtVhh0EvrkzjTrnWSQxGQbVtnp6oXkJALRPxsOa9/uaLCxj4ABsO64eu3PxeL4XC4kcdKKQKIBCs8Kwb07JiFiOOVtUcvOEvInB5Lm86aYacKaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056222; c=relaxed/simple;
	bh=k+eucumxkyGqavrg45lzb2d/hUm1izAJGJlItjVp8Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZIzNnNlqCiWs1axi2btMwEkPmFKSFwoZHuna7UCgzkqw7o9S6ZYqZgpOn5g5GkKkOY2s3/ijSRFPivLPNuI+1/ouRADQoeuBZyPAxLYQpusLHr9acrwWhYKQ7k6i7esZLlr2zPhQ0M7BJuuxnD0fKJ7eZirLc0RGNP832cs1i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ksEdWKNN; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ksEdWKNN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ztarz8U0u22j6wg/q/NtswZ5pQJKE2LL6Ya/7vLK7rA6zK98z51Zsq+DsY71JoM68dQztULtIa7K9y7fkcM2kS4z4lJoHSJemThMZ5hpOpcZDdNQJJSAyKvBXdAwLXW69Bgw3RLF3mJUwTXSukPGXio0MeSCmw+xIajOrhY1tpxV5tqofVjsrguqYTq2UuNgTbgx/dV0kU4Co1ox1CZi/m6AUuSBUDLgZ4VccO7NPb+h9bgRgMlbAmBK+zhBaZeAA9MdB0pl5/TsXGxKruYgAwp+XZx5YclZyo0Jj9RMm3x8O0ZEBk4z5BwYXLPpqimiuCreomawnT4j61xv6Q+tUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00UiDxAhvfMIyR4bgFi0HdCu7qXuEJWr4hPbbTB+QA0=;
 b=h4QrW4lTtTit3g58oMLxJmybNC6xy8DtS/JiVuNJ02l8n8qebVqgqTWAJFCRgfiNueypCf/ZRf6LSUfVI6MIzhVQ2OwciFsLHPDekOryyhMxakm9CFPJruhd6GmjQaIUMG+dQP1Rv2LqrgC2zR9/sn3j5CUOHf4j+DCsgd2mAyQ3UbEJ+3VOiVfgSraAJJq/dhn+APSQyfEPj0ZA6VxTyMBFxbP89JmiBvthvV9dT7aSgq5gWoJTWVM2UCcgpeDsjBofnXTYgJpmsPIvYd8n6aptE9oZ0ml6fwzvsM7kKwIVc+a+bgfRtBtA9I5aiUYOjo9MYUvui1jkNGqwdwiUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00UiDxAhvfMIyR4bgFi0HdCu7qXuEJWr4hPbbTB+QA0=;
 b=ksEdWKNNSB8LgUzY+ma24p9wwBflpYJV92TW/IRaQ/U5OtTyFsinGDNKVk7Cwc5BoeRO8+W/vT3mdhYx4ngahVPqgtl/nuWvTYzi2/E2gspNrDmLxPBCUC4OLRU8KNEcZtFUD9B77v7db1BWtFwRpmqoAZJLNBwT9bpJLKQU6yc=
Received: from TY4PR01CA0066.jpnprd01.prod.outlook.com (2603:1096:405:370::7)
 by OS7PR01MB14969.jpnprd01.prod.outlook.com (2603:1096:604:399::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:03:34 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:370:cafe::8a) by TY4PR01CA0066.outlook.office365.com
 (2603:1096:405:370::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 16:03:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 16:03:33 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.160])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 388F730083C7;
	Fri, 11 Sep 2026 01:03:30 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v2 1/4] pinctrl: renesas: rzt2h: restore correct pin mode on IRQ free
Date: Thu, 10 Sep 2026 19:02:23 +0300
Message-ID: <20260910160226.489183-2-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|OS7PR01MB14969:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aab0d646-e1a6-4db9-2c9a-08df0f5510c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	f8nw1e1UMbbWFc6tO1PtmaBGgpZD1DplwrSL3irErzGNQIqpCk7RPbgbK0p5uSLZa6G9RVEpr1RU09pq8LdH5643Ay+2xdtxglF6HtuA3dct6zHazglNr2o00ZaGVusaxyXUcdSPfEvACw3bvb3eFRuNGslP654h0El95yw3QJCt+pZ8qCMhNzRSxRJY+v0g0tIblsbcQ4WK6YV12Ma+tcWQZciBU+sVMZDWAAsBk6mt1mjJvoJ4TqORJ4K8P13a8MeZC8WsdgxvMdFX/k9hHEDnosGjC3GmmzQjkB6kPwnRB3JT25JJCaT8us2kW7EHxZPj6v7X3XPOC7gv0/FJnSIrAlJ+Tku5wT8v5K1kJh4hqrdYA/HjU70q5jzans357tVE3qCiprUD3yppiW3NMwCsHyg/8FgSraWDDcdAwFDad7h4Dcqhi/MD6xHkjVkN0NqJ9zcA2OhNtkbKwVM6BlWlQyv6i7CYaz5rIjm8nrvwPN8+J/ObGjyKzniakYNrP2p9licMbn/xEKCH3tuPexuAb89GEuZiNOokb2PvfSM+4zJEKWnqfJqi8MNRudzJXYpZqMc1RnofoBUy7B/jPe2Ta3CDLqbMTvfCNXud+VSUyXTpB4HIhnVUXHluM5qTQDemwIzS1lCzRIIpdwypU659rqQVdk8OnhvpgqeuEjexAEPssnE6FpYVNJmEjC2NIs1H3uAAtRhSkUwMavhmew==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4sOQrQycfEHa2O5GQcxnyAl78mnAAQ7nTLdIB2n8VPa/nduIAQ3ZxDM17xrpOps63u+hEKvPXxPhlbSNaTVwpuxgtPbSNXFeM7N46OMy42XeGigWd8GWtAoa15NhZNcNJK/X6h2NAslHAtAj96nOsdSt5tPG4HCL1o/MUgmGty+49GtBFpILuvjTXtK0ijFdLz9O28FXKlG8v+cWTur0iWkdhxyqL37wTjCam6Swvkll312Dda/+XRsOF+B+K7EJI011OcCJsrhyGKHGtcfAgLxlo8pPjJ11C7QcnoH2QFtRIPoqpW33sBbYGsCQLqwG6n7nqraEVpzyGI4tO0NeUJEvEZzXoeTxY86B1bkgyMyFHvgWRsgOKJRljvNCdYjKLXTTACf70Dgo/51NrRGIv8dNmbSE/dfhQT+YvtosAvkj1Z8eMhN2b5+3ym9PuvCp
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:03:33.7663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aab0d646-e1a6-4db9-2c9a-08df0f5510c9
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14969

rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
false leaving the pin in interrupt function instead of returning it to
GPIO mode.

Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
interrupt function after we're done using it as an IRQ.

rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
previous PM value.

Save the PM value before switching to Hi-Z, and restore it after the
IRQ is freed.

Cc: stable@kernel.org
Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * switch pm parameter in rzt2h_pin_write_pm() to unsigned int and
   remove the u16 cast

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 43 +++++++++++++++++++++----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index d29ef107c2c1..9c1ac836ffa6 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -95,6 +95,7 @@ struct rzt2h_pinctrl {
 	struct device			*dev;
 	struct gpio_chip		gpio_chip;
 	DECLARE_BITMAP(used_irqs, RZT2H_INTERRUPTS_NUM);
+	u8				saved_pm[RZT2H_INTERRUPTS_NUM];
 	raw_spinlock_t			lock; /* lock read/write registers */
 	struct mutex			mutex; /* serialize adding groups and functions */
 	bool				safety_port_enabled;
@@ -169,6 +170,26 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
 	return (pincfg & BIT(pin)) ? 0 : -EINVAL;
 }
 
+static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
+{
+	u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
+
+	return field_get(PM_PIN_MASK(pin), reg);
+}
+
+static void rzt2h_pin_write_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin,
+			       unsigned int pm)
+{
+	u16 reg;
+
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
+
+	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
+	reg &= ~PM_PIN_MASK(pin);
+	reg |= pm << (pin * 2);
+	rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
+}
+
 static void rzt2h_pinctrl_set_gpio_en(struct rzt2h_pinctrl *pctrl,
 				      u8 port, u8 pin, bool en)
 {
@@ -1022,16 +1043,23 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
 	u8 port = RZT2H_PIN_ID_TO_PORT(child);
 	u8 pin = RZT2H_PIN_ID_TO_PIN(child);
-	u8 parent_irq;
+	u8 parent_irq, irq_idx;
 
 	parent_irq = rzt2h_gpio_irq_map[child];
 	if (parent_irq < RZT2H_INTERRUPTS_START)
 		return -EINVAL;
 
-	if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
-			     pctrl->used_irqs))
+	irq_idx = parent_irq - RZT2H_INTERRUPTS_START;
+	if (test_and_set_bit(irq_idx, pctrl->used_irqs))
 		return -EBUSY;
 
+	/*
+	 * rzt2h_pinctrl_set_pfc_mode() sets PM to Hi-Z before switching to the
+	 * interrupt function, losing the previous PM value.
+	 * Save it so it can be restored when the IRQ is freed.
+	 */
+	pctrl->saved_pm[irq_idx] = rzt2h_pin_read_pm(pctrl, port, pin);
+
 	rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
 
 	*parent = parent_irq;
@@ -1049,14 +1077,17 @@ static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	u8 port = RZT2H_PIN_ID_TO_PORT(hwirq);
 	u8 pin = RZT2H_PIN_ID_TO_PIN(hwirq);
-	u8 parent_irq;
+	u8 parent_irq, irq_idx;
 
 	parent_irq = rzt2h_gpio_irq_map[hwirq];
 	if (parent_irq < RZT2H_INTERRUPTS_START)
 		return;
 
-	if (test_and_clear_bit(parent_irq - RZT2H_INTERRUPTS_START, pctrl->used_irqs))
-		rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, false);
+	irq_idx = parent_irq - RZT2H_INTERRUPTS_START;
+	if (test_and_clear_bit(irq_idx, pctrl->used_irqs)) {
+		rzt2h_pin_write_pm(pctrl, port, pin, pctrl->saved_pm[irq_idx]);
+		rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
+	}
 
 	irq_domain_free_irqs_common(domain, virq, nr_irqs);
 }
-- 
2.55.0
