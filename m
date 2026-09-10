Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612E14BB276;
	Thu, 10 Sep 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056228; cv=fail; b=Wv8d/2F4S6VFmREVl5SSOfpeASV9ppnNoKE1CE8NUvSiFSwecM1WfUL4N+J92xBu4NNaEjsXLuzXLHJqCGjP7NBDRW+Qunnbr+O3GTmwK0aWV/FI+PotNXjtdIsQZPmuiITI47HqhXBh/wTHPBrpy+WrIaK3z6mdAIhNHa3GlVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056228; c=relaxed/simple;
	bh=WBNtttzHmW4zLItWuIc/heM4f0W5p264VFrp6TsJwwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B5cPhHLyXUzBxu+3R0XNnYiEqwJtz9b4RqXbKGQgRxMAzaBjrZSUywh9X5KySRWrhgg3q9Mn2bKd3+zPMNPNFFOxLkRBy2p6PhpOzCWwa4/014J6uClVa7mZvJ065qDwWMcjLtX0gYIwA78QpcpRvGgmL5dZeodH73q4ChSRwYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C8aUX7/N; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C8aUX7/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEcycFBCYPhZLvU5WDntwZKcdyNIOlfuGJKvuTnSnnFnGrCjKGgxGqgYNflcOZ3KOSEyk48YUlENwcP6VbOzupqT1hg/Vpg6GeZ8alvkYzjgc+yGKJckPsWCHWBRkUbo8AvFMW5jGDFdbb096cGi3+GYUdQPu4wafrWNz8i75Em0uZdDEyn+04MyrQsOzBB8J3SQpCfXrAJp7k7v59WoWsR3whJwiLXV03zNya1E924qx72mZznHgWUtAQBXWOthGnsO+3Ewi8dkxv8MBVLN4TJncoWMFVzNxmL+Y/bM3S0dfdJ03I151SvM831b908D8o5PZEX67PVp6aPuWb+kaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhHVKQhud0dOH012E6ym0ZZI26SlP/gDpNFlzzDP9YE=;
 b=X4OyAjSQASSRabciaYrDSWhDwsxCTL4bYoNzXe35sI8gT2OcsYh6LZGDh29y3GJl180gHNOzEAEm+f0+DSrGNpr43/zirmNEqzVPHoTSDaTTMHtXSg6bRcDsYrBe+Oe45UGpnMoYyddBIfgvlCbymoB/zaeq30UjR80MZlidDf5JGKNR7cWHan6AYeCGeZf+SgY3Kpx8tlCMn5Y+u+fi/CLKfQEXypYfO6svFx191jWBoTQDYhK+u/HsDxHxAU+QCBGIOU+YYvZArJTITxen7rM5qIjwzvfPco2WJhO+uIAfaFEoByfqYek2SLKIyHlkrHiMhiyTs2s346kyS4d5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhHVKQhud0dOH012E6ym0ZZI26SlP/gDpNFlzzDP9YE=;
 b=C8aUX7/N8HadNWINYxh+Ib/ZygFt/YIoPASqUscLwVLLlH6mDsvR1dIMGy0YTYtgAHsNsqLuZJpvzeF4tCcpvwfLB87xYfFlVJ5AOxqEd8dxVrF+KhNVMddMPh9+XJHxzeWubNV6Spx83Wj3pKZlVgfVCSL0PucVthTx6zJmvTo=
Received: from TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c6::18)
 by TYYPR01MB10610.jpnprd01.prod.outlook.com (2603:1096:400:2f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:03:42 +0000
Received: from TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6:cafe::5d) by TYCP286CA0168.outlook.office365.com
 (2603:1096:400:3c6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 16:03:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005621.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 16:03:41 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.160])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 40627300044C;
	Fri, 11 Sep 2026 01:03:38 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v2 3/4] pinctrl: renesas: rzt2h: fix reading pin value in IRQ function
Date: Thu, 10 Sep 2026 19:02:25 +0300
Message-ID: <20260910160226.489183-4-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF00005621:EE_|TYYPR01MB10610:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 84c3febf-7df0-4360-ecb0-08df0f551594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	7lwAbteVuCHOhV+yg2JY25Ah9tv6oFLn6JzJtzUnmL31qotQGSciGdSZhIrs32Y1nPWMEVPkmv4Sm02tCKVSw0/0hfKKGFLqyC3TEdXg3TOAEJEx/t5IbEKC8OXFoAcT1dv/rTv1SwGoVdaDouGYZ2siu8suaL1rZlt+H4s1iLQtHbd3OzxAZOLjarLO9Rg7opYNGhw9fqeLqy3jpc5dxhD149mvD8kwFIY3/y5zP/H+agtWVV9INOxjmDHQwQRm/wQU0/JI+AsbpRay47jcE8kbaFUxvV4g8Q1c1pSkoRETvLjyaqxjgKuyx5U3br6mKNO0usgfmyd/+DNmg5ahQ66XHq0BaGfiOHhR+/eCoxgj3HdAhG2IlDlLT1WuymjgaeDwXVyJBdDVbBDJppwBZMmdJ6g7tP9JTWhjGZkHwC/sTf1zlawOpPWl9o2SB/Q+P2xleNiyq6F+WTaC1wHmQiPbEzumoIZO5TpSjDJGceCjKgDyqaLy3oJt230cjupM9xxsYbNiITZ9U6NIbSMU1Jd57ZpjWVdBbyZa4wr5f+B8MsxhRdiRE9uJRDcbk+RWYHClFPGFrE763P9EWDqdQu7LwUk26LXaV1/Q13gOSzYCrBkw9wKYtmBX2/U2v6xMEokA4oxUhPzg6cW4ngG/uh6WETr2P09Ev75+iBT91zZJM/xfdVZTqWnYb93ZUhBYvgfV/dSAyNWIlRi35uvFlQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KzjeLaZPIui/+pkTUKgVQGXwZmDdaUpS2QJSUsWbjFBuV/WfjCikRb3nOwX98P1w1UFCoxrmvdjFD3fmeU2oIZ3T2OvIrch43JMAToBaIFJBUjbH9j1MMQzBcS74PKjkio0Y/LmSa77252mG5sPAlchvBPW2/apl+0C77byrL5SHfFbjKsFvy4AisZpZDNZ25KZ/Xdb9IMOH6VmWgZNrO0yB/+TaVWv1FZH8+1OoPIRQ+zye9LH7dv6z9xHUOIJobURPd0j8bNKvZXWjnEelfwtCf04mIuoFGWIbNnZBXnDz7lG0dE+PE/cIX7Yp+oT9AHWMGKNqQrsrNPl/UjBRsNw6aDVaER2O8PIGtJZFOaAZoZUudzgkuppNa9iAYq5oyeEy0WeAMNdUmd+rzK8w1q9K7MMQw6YGzW91IzTI5qbNcgCNLcQ3mxdd8gSg8X9P
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:03:41.8113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c3febf-7df0-4360-ecb0-08df0f551594
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10610

rzt2h_gpio_get() only reports a level for pins in input or output mode
and returns -EINVAL otherwise. When a pin is requested as an interrupt
it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
value can no longer be read.

gpiolib calls gpiod_get_value_cansleep() to determine the edge's
direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
Non-zero values are translated to a rising edge, zero to a falling edge.

Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
returns -EINVAL when the pin is in IRQ function, every edge is reported
as rising.

When using the IRQ function, the input buffers are enabled and the PINm
registers reflect the live state of the input.

Report the input level even when the pin is used as an IRQ.

Cc: stable@kernel.org
Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * remove the PFC_FUNC_INTERRUPT check in rzt2h_gpio_get()

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 796120e70bc4..8cf4b7f48e7e 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -170,6 +170,23 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
 	return (pincfg & BIT(pin)) ? 0 : -EINVAL;
 }
 
+static bool rzt2h_pin_mode_is_peripheral(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
+{
+	return rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit);
+}
+
+static u8 rzt2h_pin_read_pfc(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
+{
+	u64 reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
+
+	return field_get(PFC_PIN_MASK(pin), reg64);
+}
+
+static bool rzt2h_pin_read_input(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
+{
+	return rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit);
+}
+
 static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
 {
 	u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
@@ -847,6 +864,9 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
 	u16 reg;
 
+	if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit))
+		return rzt2h_pin_read_input(pctrl, port, bit);
+
 	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
 	reg = (reg >> (bit * 2)) & PM_MASK;
 	if (reg & PM_INPUT)
-- 
2.55.0
