Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C9A3F9F3B;
	Sun, 13 Sep 2026 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329497; cv=fail; b=b6ARvcLhLHwvLC4W6qN6yemcp9mCqFY7rBSUG5fHtCZXH10mriR4EJZcYjJvML+0RiXfMQWoVAtzRAhUnpX2e3V9T3S70zDlirpe4r1TXxCB20JVP9l3k0k87nWl1BjOgikiGD+HRajwHsBUjV197klpJEzfZ0WqoYx8AwI3A8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329497; c=relaxed/simple;
	bh=16rVZZFKH0FtNaQsPENJFgXGWs/qvJX9bF8ItOiu/Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AONMy28RMZURZDV24LfMiUMC/AoAheXJPXGOLgv2mwUmyq43nph0eniod5ncKPioLzjosHfV6+U4EsZOaJJyrBbdt/BrQ977gqIJlL8qK1TR9G0nXLTn7vg0R6I985/QzmZhcQgAC9Rmh73qaXnPegSzGN6DIRFjLuKz1tYPWV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hlks9dEx; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hlks9dEx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESr4UDNYY1OlKwe+md3HG4c9ylkXdXtjZyP+EWdP3ItGwyWnzTWFUIT/BEmuR5NKjGNVrEnPufCrVrpsvrOjcfqHYO0MnykkhCeivFjghpPgsIJW4pKN4zqK5ng3oh4UsQ4E4HsxWWKPX9pqqU5ea6aLqIsp8b9zYx+lFWbGqzQhP9Bw5xYVNuqdx3z59C1rA2Yws2SuSJmHUAt6dtFuKqGDW/UYTFWIdIwXg6xN+HUrE/9ysE2miF6Atw2JDd24e/cbxVAe1Y4b0SPZcuGIuCP6O0G6SlEFPI3iOF6Tmzzfwl+jS7VvKZYbe3RSMn8oFeQDRTu+17y4M8nTaQ041A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHYjWSJPgfb4vu0RnSY5OkJRD31g93tK8aA1IYsDMB8=;
 b=B390fmZiAR5aQWuFtSpBXQ7IKUP0DiCA2cD53uHAyFelwSgUw9ChZ1lpTLTlex8NUBLwgw+BdEC7n6hRMX6On6ihwM2j/uRMoS7rInA0uHKJUgSudQ+i+/nI4A74UWySr7Qm44AbkvRZn76sgZRtGk5W+6RZndOO0pLO+jNENoxLxosC0T8M+3EC7rHVmdduySNB1ibAihaQH5v0UrxY7e/PqZm8JIeKAgQIlB1/UQ+gMnDyVkhN7Y9HLrdurkkvUrJgmeuV8qzx6a30i/tMo2NwPc0uiyTE8ngGOxMG0kYTwq9/HFArPjIAFhaE8Y8KhsIlK2D5arc9lrc2aGNkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHYjWSJPgfb4vu0RnSY5OkJRD31g93tK8aA1IYsDMB8=;
 b=hlks9dEx+dLNEdNnVYG7e5gKYte9SzVcUeUDLWjs74PAbHQgOIpilI+YSVTyTIeQJEcBbH1vGFT/UkCgvny5ioJYCnakcvlBPm75kJdwcRwmHnwm3mChFnxQoyayufITUu+XZ5fAMdxIBuhw9oM0sGx58+/G20xQpkxyB847Okg=
Received: from TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:385::12)
 by OS9PR01MB15774.jpnprd01.prod.outlook.com (2603:1096:604:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 19:58:06 +0000
Received: from TYO1EPF00005026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385:cafe::23) by TYCP286CA0209.outlook.office365.com
 (2603:1096:400:385::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Sun,
 13 Sep 2026 19:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005026.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Sun, 13 Sep 2026 19:58:05 +0000
Received: from demon-pc.localdomain (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.2])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id E2091300009E;
	Mon, 14 Sep 2026 04:58:02 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] pinctrl: renesas: rzt2h: reuse helpers
Date: Sun, 13 Sep 2026 22:56:53 +0300
Message-ID: <20260913195654.3371385-5-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYO1EPF00005026:EE_|OS9PR01MB15774:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7b577319-83d1-47e7-b4af-08df11d1535a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	EIWUK1mU3JwJjb8DCL7li4dtMo9TYarkY+NtXBQr6j/Cl7W2einuCdOvu08vFJaMcJkJXolydn8k2QVnz4mts+GuljZsk57kE0VwteuW7YIxZ8gpp4gTtbVx0f77bJ2/6x7Kk08UAQK9CqBFTyWqzaQbtmqmEGPFZeFJJ/qyCoHPU/xvE2fLxwr3Jf4g2pZO0UG1oUoVm95XB0ZvM0IkCYlt76erdoHFx7zH/i1umk4lbVtAyx1tVFah1VhdjqyFrMTsFtJ2nUy686Z3tmD4T8/DalEYhPpWOHvOzNthC1shXjQpePn2i1qdllyEjjnD5EG1wjZYWyTUBRbpV4VqFbgwLD4tGtVsB5JwBkmR52oxWSeOBtQrQYtaSSDzqL0eJoVQzSYNynTS2ci8/zCznW2zVcc3GJsP+Zm1d+ppbrvc85H8iwVsAzybFdo9LehspQAcyg/75ffqfUZZ2ucFGhBSqZWJEnui1d6uSqLfnEWpNXcJX0dWhdNv6vmbwjGg42JjyP+gn8DgRQxDMsLTdu9NehtJDDsJslEmymaH9yEnTZeAkzQyb6DgXzG5XPqx/9Nt/wmaTKcEFKrkiZ5h4B8z8FZL8GOLLPN583inzFW6JQC8O0vmz3mmE7d6P4tN3XtSbGCKHszGB/3lnm/J3VJiMzES8bB3pzE4oah0himH/dX8ziSysYk/Bc9tdGHTOiZs3d2pMYhFychOJfKEyw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ewmODWTaQH6qf0EBr8daGb9V1oCUaqTXY3r0jLdZFtxnIhWijP1ynTYYUfYWw86YVXku74y83Ifz70QgEpCIpKAT7kvdjSF5tPzqtfliGZOd2aXGdMnAgXCHteVdqFu3kxouyT2vi37XeQs7hFXFhsnnasQCSmLKFoMlp5l0fTQa8urxjOtDbInWMneVKMC4L57DLxa/lKqRKoE+LZLLqC/LLlEGD2rXhGaDV4qsjCEMP5x0Xb+jJHTA00spC31f3mm7FeT5ikGk1nv3UBrMiPQUjEjr84WMu6HbtvimKKBw9TuClVjZX8wSHrk9w9jid4xYK396cGSyxrk1i+QfgEaR9IsQh0Tv3aGNcbdPXKf5DDL2Z6aC+th6ifbj83BqF9WZ8MkJJZQz+04EuoXI8iedBytisVUFqLg61yWIEGg/Xk2+9G7EtfOQVvjSYQiA
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:58:05.3698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b577319-83d1-47e7-b4af-08df11d1535a
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005026.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15774

The PMCm peripheral-mode test, the PINm input read, the PMm write, and
the PMm read are open-coded in several places.

Reuse the already existing helpers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V3:
 * move the PFC read helper reusal to a later patch

V2:
 * pick up Geert's Reviewed-by

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 34 +++++++++----------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 9d7e4cba85c9..80a581fdef37 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -223,7 +223,7 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 
 	reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
 	/* Check if pin is already configured to the desired function */
-	if ((rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(pin)) &&
+	if (rzt2h_pin_mode_is_peripheral(pctrl, port, pin) &&
 	    field_get(PFC_PIN_MASK(pin), reg64) == func)
 		return;
 
@@ -777,15 +777,7 @@ static int rzt2h_gpio_request(struct gpio_chip *chip, unsigned int offset)
 static void rzt2h_gpio_set_direction(struct rzt2h_pinctrl *pctrl, u32 port,
 				     u8 bit, bool output)
 {
-	u16 reg;
-
-	guard(raw_spinlock_irqsave)(&pctrl->lock);
-
-	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
-	reg &= ~PM_PIN_MASK(bit);
-
-	reg |= (output ? PM_OUTPUT : PM_INPUT) << (bit * 2);
-	rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
+	rzt2h_pin_write_pm(pctrl, port, bit, output ? PM_OUTPUT : PM_INPUT);
 }
 
 static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -794,8 +786,8 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
 	u64 reg64;
-	u16 reg;
 	int ret;
+	u8 pm;
 
 	ret = rzt2h_validate_pin(pctrl, offset);
 	if (ret)
@@ -803,7 +795,7 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
-	if (rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit)) {
+	if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit)) {
 		/*
 		 * When a GPIO is being requested as an IRQ, the pinctrl
 		 * framework expects to be able to read the GPIO's direction.
@@ -821,11 +813,10 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 		return -EINVAL;
 	}
 
-	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
-	reg = (reg >> (bit * 2)) & PM_MASK;
-	if (reg & PM_OUTPUT)
+	pm = rzt2h_pin_read_pm(pctrl, port, bit);
+	if (pm & PM_OUTPUT)
 		return GPIO_LINE_DIRECTION_OUT;
-	if (reg & PM_INPUT)
+	if (pm & PM_INPUT)
 		return GPIO_LINE_DIRECTION_IN;
 
 	return -EINVAL;
@@ -855,16 +846,15 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
-	u16 reg;
+	u8 pm;
 
 	if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit))
 		return rzt2h_pin_read_input(pctrl, port, bit);
 
-	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
-	reg = (reg >> (bit * 2)) & PM_MASK;
-	if (reg & PM_INPUT)
-		return !!(rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit));
-	if (reg & PM_OUTPUT)
+	pm = rzt2h_pin_read_pm(pctrl, port, bit);
+	if (pm & PM_INPUT)
+		return rzt2h_pin_read_input(pctrl, port, bit);
+	if (pm & PM_OUTPUT)
 		return !!(rzt2h_pinctrl_readb(pctrl, port, P(port)) & BIT(bit));
 
 	return -EINVAL;
-- 
2.55.0
