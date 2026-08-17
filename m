Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449883AFCED;
	Mon, 17 Aug 2026 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993098; cv=fail; b=I4Zrr6XftGJHY3dJrjv0NRyJU1mpTqm9+oBa7zPMZKhddgQVCcBm7F0ot5idITbp7/FARgWKlTtw+vC4tQWiEVT13DTOAr3zWV1i26RwNUCSKmiOBZs2Nt8zhVSp2V7ieC9gznGKl0vtWsmEe4cdGjReXt9rMvWTZ7iovSf8axc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993098; c=relaxed/simple;
	bh=pGM6ZSX1ja0XOkH5H5zvEp1e6kqtaRlrfdZMXnFoRwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dmxOv0eUxJI4gMbPWfeW8dSdSkaV0e2Fz6dcz+sC6/vDD9HEc0J1DmBHRoF6jaTHqbiJpWP2Ipdv1VqXPJXPV0ouyK//bWtUWPcr1+/CJ9C7TCtHdMmXi5IyzYTFooRs+q9vpP95Udtz/2gngyc2ev744ClUX8xV6hmsAJ/qg+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cMtZjFJR; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cMtZjFJR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLSmSp1/04NXhH7Z+nGr0RvTwU14qBFXm4gyaSeuBWghMdM8YYkAki5jakv4UDH9VDrJ+sPwqEWkLFujKvUT9uIGD3arXOYCuWN3AojI6BD1cEuo16rtjwEmwgYnHGQaPsjw/GIsjTgrAMe+eTKVtmkkbX9POcFllEN4idmDRwfAZYcVsAmpAT1SF7/PMZ9BgegU7+aQwjTItsqk7/eVm0Nhif+UBV8VVqQehOzVQ+P4OuF2Nv4MBFkYM/vu36zn1nXWll88jgB0PmbI40nNMVFARNrUcnUCDmnR1kWIq9Ui8O2tUtx95dj2bQ2EuH/ISQDZZf5MC3iMSgq3jwNUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0Eb2j5z3vtcpBMO7lxgV0SgNqvl9wudD0X9TWSvYfc=;
 b=xVA2HZuLX/94iurb0t9EkZ1pPXtCwiCCdrAacr9jB6axXoR07Pyh7Rf9N52UjCHi9qGxdnFrCqVwGuVic/Iz4X2VTq/lxTDlP5Q7rg4/mhyTQQGVRQtovXu+HdtUBB5iiD7mcMqQEB00SbP0hpn3J2I35nI2zJ80/mKZGnzn00bZF02SIlJHLRjaZl4oSq/iMlbgupjv/jeA/faIn2bAnWv1bAVu9KiC6gI6bQu8YKi1LraircSPZdbroaZdqlVuZRbFz/Our44m+CjaCYU27mEPRzNspFZEIdeiOOLdOeWohFxc0WYoOUkJNBMVr85DYfvP+oC3/j36VhjsU01Bxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0Eb2j5z3vtcpBMO7lxgV0SgNqvl9wudD0X9TWSvYfc=;
 b=cMtZjFJR2/vwkaWZHDt9swAgmUo21sI4gOojtF06Q0my/F4ZwdgHi5a36N2JylIo7oQwWKSYUA7+BJgql9mOAC+RjuICB+neqeyhswYPee+ZijU5rFt4EQC5omZBWfx1yTxL6Fw8NahxPBFtiX7BjAAismlbDOBef55yFICbxIg=
Received: from OS0PR01CA0186.jpnprd01.prod.outlook.com (2603:1096:604:1c5::6)
 by TYRPR01MB13342.jpnprd01.prod.outlook.com (2603:1096:405:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:58:11 +0000
Received: from OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1c5:cafe::1b) by OS0PR01CA0186.outlook.office365.com
 (2603:1096:604:1c5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 18:58:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20E.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 18:58:11 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.24])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 6BE213000262;
	Tue, 18 Aug 2026 03:58:08 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH 2/7] pinctrl: renesas: rzt2h: restore correct pin mode on IRQ free
Date: Mon, 17 Aug 2026 21:56:55 +0300
Message-ID: <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20E:EE_|TYRPR01MB13342:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 98931798-042e-4b78-856b-08defc917c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	xywStnJrCLN8/bL9tyr+dFrKeyGDKGTcT7ldlk3yG/gJ+8vitjuTm9IPk4N73T0IOMb7T0XnogVu0UMxz2ETzkd4SXDFQSYeRXesXIUydPZqsMdlmpm3YWqLyIeSAgFkatJkT+dYxtmjXNqQaBN/PM1xxm+YehQfEHS2NoyJgH0DZ2oaxmNI1WWOTCjWCdW1Ic4RPG8lXXG8+UV07nRNsLreYwVNSty7QD81MVMwJUeZT3jWRCHv0RcJRmjh6vZUWo3xI0UX95FximnQimt9Tt8d4OP7BtdbNCsUP5cU023zhr+XSev4iwTMM0RBRlctcLNmpiPN/vlnsOArnOu0/pRdpfgzp8JliJJD2OS9I7B6YIzjvggsm3VYmujwYDHa0Wa7ZNzK0EllnFEi3k9lef7u/oiG4QeFnzae1NOoxAczwHVWQJKcUhaFcSDUUJUru8ATH3n29fVN1XLyRVskIkyG/vJn3h9pyHdgcEjIND6n1O0OK0eDjH8BOYwfD/k41cz9fk01qRg6MmmX5FnqZ/CMjeKnLP6prpRukgt0UJhluqFR1fa+NKD6Z2gZ5Hk6FvSofa9GOPzmDO9+nO0szdDFlZHiVGzNS6fuAlESbWwHbhUkhMF9b2t6kPdoaIYCTWmiZUSJ/sSIjWa0b6mq++kulbkpEFrKo2P3y88KWB6hEUvi/BSRi5sNnKbHapCR6InNWUrYGkLVWAsU3HTqgQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	je/WPieK63Pes8S/zVRTqfCdKGOUN/6GPzZpsseLL9kRk7IqLhYBWbJXU8xLkr1AucIBC74zuVo2gLhzcCrF5AsMIZjvvuS0RUkKo/3IvfWr2DhX0DwIEkHi7Pk5qRSj59sjJOwEclX+6t0fVdkpsb2ujvaSR/O06zWRfgSVUZfDAAq4V1GNx7NE7MSG2zid2VVnRY7dP9mVNGfiOqTBlAHxaB4pq6hhVsmLwtiJ1Q1/fQ9Bb7dX5h93C42mVVuwSsJ8W914tFe0Wdqqrc7t/XzSx2zSwb9g5C3PlTWGrcBg/a3zG5n2OcSsSx2KRuiChBe0IGVMQ7DcNeoi6mXfuUc1DSZFc4IKb/+cEMRnRBqXKMdS/IsDG0+aIvl5gCCMjyaR+Y0fSLrjCOcy7226IUmK18k+4EznH4gwLFGuYZX6Y6AN1zdwquuvlJUAsp7k
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:58:11.4740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98931798-042e-4b78-856b-08defc917c14
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13342

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
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 42 +++++++++++++++++++++----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index a37f1e399446..82fe9b5e8f72 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -96,6 +96,7 @@ struct rzt2h_pinctrl {
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
 	DECLARE_BITMAP(used_irqs, RZT2H_INTERRUPTS_NUM);
+	u8				saved_pm[RZT2H_INTERRUPTS_NUM];
 	raw_spinlock_t			lock; /* lock read/write registers */
 	struct mutex			mutex; /* serialize adding groups and functions */
 	bool				safety_port_enabled;
@@ -170,6 +171,25 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
 	return (pincfg & BIT(pin)) ? 0 : -EINVAL;
 }
 
+static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
+{
+	u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
+
+	return field_get(PM_PIN_MASK(pin), reg);
+}
+
+static void rzt2h_pin_write_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin, u8 pm)
+{
+	u16 reg;
+
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
+
+	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
+	reg &= ~PM_PIN_MASK(pin);
+	reg |= (u16)pm << (pin * 2);
+	rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
+}
+
 static void rzt2h_pinctrl_set_gpio_en(struct rzt2h_pinctrl *pctrl,
 				      u8 port, u8 pin, bool en)
 {
@@ -1023,16 +1043,23 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
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
@@ -1050,14 +1077,17 @@ static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
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

