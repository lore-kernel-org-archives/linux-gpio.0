Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B03F9F25;
	Sun, 13 Sep 2026 19:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329485; cv=fail; b=MsfD7tbRo+xqHZuwJR06nJF6qcvo4Loo6/2aa/ylyJdVIAchC6kNv90voXoXmEt+J3SLI7ggJlXv5X4zZvzUXpkHD4EWwMM3jgeYvb8DBTc6xfymwSdVXpJEp/vYPBuwgLEe5ncMpnlUuX510l9+g4p2PHfU39p4mAykIxjXZ0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329485; c=relaxed/simple;
	bh=I0I2ZvqYScArgU8tOYR5vtkDlwSdUsukUEy08RgYp7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V7HedZLFH6xN0LxDjO2g0iXMo0yJoW332nswgHAYTFPnOJqXozhOHj1hVuW8pwABsBrnksOKxLYakC+63B5rEeusbwH2Soz1q3vqapIFMo9gngwSqqH5s0cYvtKP8uXMIER4Hc7asxw6P37kpO7CfTW/AzpxNrKdFwEfFamMY4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZtI+tTwR; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZtI+tTwR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfPO6EuF/ozS1OmKtU/g9aWiIeM3p9t/EJ8UTioYUb9JmpQNZFQ9u/vSUZwZn/brW2zJ1FLs+csubjoP9CxbuGHqO0Y0gPukdNsg57HHGX1ql9h2Y8JdJ9Cy5joWk4j3UrTMCL+grK1q3igUI36KqM2+m/HGFKap3TluDAf7AcchbYv1kYOkedLD75fAiGf6ZE9lyig5IGS9cpfOvbaJBb/+MHsOxc2d4vHyKUWlLjV3nLZ1IF8PKdqHWn4IDiokHX642ObLRVXNIo+9yjNfR3Ohq12xy5pEeALLZwdYc7YAToDhRfmfDqwYPthoMxBQxU3G6zhcxioqgHeuZI1W2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHH/udZ/YKkVrvFyl+xKIZHiYYQDUnGB3h/WRWO7oEU=;
 b=NQXqWZmsDQNgPcaZZg282F0j/SwlSwD4DtWFjMah0s3sac+j71DK0tNL8746pOFXFCPVsMWXro112gld5MNCZ96iB+VzA1Yq9aOX7GmIVm3ssMf8vtK/RsnA29zY/VYf+/22cMV3aLGe1lCZmgrWcraxe8OD5UT5S9LuCWTI/hHqtPF38GL9OughzA0ves5jn4WreRXC3WtJolJF1JjVIoEPiMXLkv6bIbm9mho1DlfgqMTV2sp91Eo3spF/XhGoS/FGn9FC0HZVyCluFcExvlXuldodbX/XmPUur8d3TAJraGDcNVW87fHXNYn66nfrvDlWQDAZH/pLlHjHtSEsRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHH/udZ/YKkVrvFyl+xKIZHiYYQDUnGB3h/WRWO7oEU=;
 b=ZtI+tTwR1TL6s4ofun2eZOV/DdwkGaf17fGTfzPNdxJ30ZL9ipXAwQ/DJG81kK/VwpQvoWDQKLsEz9Do/kUfdtwahVKHsBGqYsYz/z0yTycnANcq32hxLI0Ylb4K1fVmjFFofIIY7n9L++8g1Dc4IArnLmR5g9u7HMjJSjmsL0Q=
Received: from OS7PR01CA0141.jpnprd01.prod.outlook.com (2603:1096:604:25c::10)
 by OS3PR01MB6742.jpnprd01.prod.outlook.com (2603:1096:604:115::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 19:57:55 +0000
Received: from OS1PEPF0000D20D.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:25c:cafe::30) by OS7PR01CA0141.outlook.office365.com
 (2603:1096:604:25c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Sun,
 13 Sep 2026 19:57:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20D.mail.protection.outlook.com (10.167.240.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Sun, 13 Sep 2026 19:57:54 +0000
Received: from demon-pc.localdomain (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.2])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 8EC44300009E;
	Mon, 14 Sep 2026 04:57:51 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v3 1/5] pinctrl: renesas: rzt2h: restore correct pin mode on IRQ free
Date: Sun, 13 Sep 2026 22:56:50 +0300
Message-ID: <20260913195654.3371385-2-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20D:EE_|OS3PR01MB6742:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aff79f2e-5bad-416b-d65d-08df11d14cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xNwpTHRT/0hzjQxuKGGqbI0DgYmG0PvmDgI7PnR2Wdi7DbaM6/F6ny1lKSYSkzd+x1W/eYVY+YXuye6a+avdk2Eyfx8cRGncNDEWMNHmP91Zzr4A5NbTYpWUIe3WjZioh11P1K8JLBpcIDjHMkI1+9PSmeUEaIxwKDC95rrjzP/GdtSmk3ESp5TERX/EDq1h2WBJp1BnAxssFd5zsTzwBpzsXu70BpVlvfPlJL1XIFt5mHS6mplnEgF1PGLPOphU0lkmY8tM9XhKdgnu88Ses0p0/yBy6pkCqvewFI0Y67eDv18AIU0MNQLaLwugujW6jYUZwxR0JV5A6g7i3UdYzV32c8M0kUnDr/TI2k2ceZO3FZEgarafJwvZq7c7MoT8HO6TwTk8hB4oFZy1ik9gU3rZOjhUWmXu8q7ZNumwcegm3eq6eJI2c+SLH4kB9sPM05tzDLr5iH7YpS1SN/ZjCpdj54DxMdByJcMA0We0Yh45yxgwMtqSVK+wKqfpYv8+n5Q7TYBZdoOUS2lKbTBuqWrJl/1BUeE3KeKPEIjXNFhGszOpLqqNyvVHtgi388OisQzJ2rNUsbhEZRdJjElZfV3UWltHDe6nL+LPLvPd9seUwob0L+00RG+aferWehI3LsHiQ52/ZNM/jLdcFywRRdGdJQyu3d70FUH45WLYirgKtmTsbukMkALamSpndck1oAQgvh8a2jw+irSFhEX0Rg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1x07K2NY+A/l6T9sDAtYoL4j1mtPwvpqPaq0mwQtdbynedBbS0IiegOSVV54l/M7rDrOWgMkYeyUwRMnj4DloUlHhmwE+TvtjRyRdq1QB9758fNf42jcVmLDPS2XQaRwH1n7bMOlQGwPaZt40pvS81WG9W5Dt4DSRUmGy/GNRb1v7QPdwCD/glvhAUx3gu1mGLsOwo6UhUD0ZeUvf7M0UkfJ8nPnu+A7ViYmkUywC3e5kniFetPFK5iWYHhLPWFDx4o0zr30gvRPp4l4bgwlhXR0wcdZNuq6IXHFmKDhZu3QB2N1d8kF3S4V3g7VXUiDQpp+5tL3sajmYe2HWgm8d3zD4PqBXdkt2KIKwSSm6k1q2sNFwTcvat1GuNsHPiQLYdRvxa80Zj3/j/pSs15E+nyAKnji1yIxAD/zOMJJR7sbVt28LmdUUbconyEABunt
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:57:54.4384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aff79f2e-5bad-416b-d65d-08df11d14cd8
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20D.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6742

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

V3:
 * no changes

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
