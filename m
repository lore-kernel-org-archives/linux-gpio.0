Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584C3B14C6;
	Mon, 17 Aug 2026 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993120; cv=fail; b=prTWF3T8AMcsOkdJbzMHfOFYAh4Rc6XDQBWjoRrf1LF+8+NvCiZsEF07WgynKmsTUI6tc1Q54/Yl+EAofzYWjJLvA6UkCTApBMDnpPlOu9QCVGmD4jBcbReHcMVaWS/cN3VGSeV1u+rdS7z8TE3s50G+66Zttpa5vBp4zKcsCGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993120; c=relaxed/simple;
	bh=oMGDu89k0ztPcYByoz1azyEjrc2qSJxaS+cVnh2JZQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/LNxDjL2b0tImvmmQShh6+BQj29aTZ/UtQuBiYJfzku/L/UccYrShBqbj2ZA8PmhoUtBVggbKadBku/d21FnDzJoGmoikQWmArEHOsspKX7+w7Lz3g+oMPfEHFWwGDeiBa/DRR75TBtH4jtZPol3yvMavY70bESesKw/e01Vgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dsqtkAAs; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dsqtkAAs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrAd9S4who8F1XGs7flJb6+uR0DQjuF48KdnRw/eAtK+NxPTFeAT8m5Z36F6ls+6U3Eym2WJQLQQyG/Qcbp4v3M3AcRq13qgv7ti6xyBN3tY/o7F2IQjexW240mFVyh/MJmQ1r0i3nWBQ6mdFhqP4NSiYddbUM6zIzi/ftaY7odIDqEYzwDZyo/TFkBerIx7h+hIu/j0lguYwyaI8pHC4DNBVHU6xjTGUDjfpw2v57e0Po63W9iNKvrKIKeIe2r3v0HZqT8acr2rq6dkiY6liNVAkveRIK4YyCXLRS7uoGimgpDCdFHRfjc4nKf7cSaoJKeuWPs4rEMW97ejioHvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDtAm+pyhLLIHOLhWXADKveAPlKegiA+mZbmYCryD/I=;
 b=IdPW5gvRnfDz5uitlVoMkcv3bPJqPUy2x3OQkQBZl5hH1FTQxyL2u3LG9d7/EX8USCiH12VIl2B25cAhodxPrlMsm+nuElXifMfVxCdFXdByDG1sEIPGqv11RxtfUN2vu66VBzDkGj7I5kfoIE+dj5gZz0joaho6S9Wt7GbTL8uEEB1z4H6lpqP0B7HgPCvpxfCFOu40tEX9MTcNhsh2ODGKPVJyUQSdjZ1++rqCsA7835xZDUIhKTSdRA2IvMVOU1mEjZhqLESNo6Sh1AKKi/Zo3LdrSOrP9+//aA20ePWzG85end5KZBu81rJJk4XsmV0bfv8K07798vQ6tZ/URA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDtAm+pyhLLIHOLhWXADKveAPlKegiA+mZbmYCryD/I=;
 b=dsqtkAAsLlX39QfcX5lcJJ0gkWaGFRMgbId5I2rxQJXhYWtzU3jTHc32aQZ+9sCjhjIW+0RuomRp43b3w5T8yQ1WUlxfQWd3brkRs3BLupeNW1GufCFxntNhwxXMZT/tJGBr38OBDD4jvogx61tQK8nXqcng4t2gKm4p975NMjg=
Received: from TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:26c::13)
 by OS9PR01MB12279.jpnprd01.prod.outlook.com (2603:1096:604:2e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:58:34 +0000
Received: from TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c:cafe::7d) by TYCP286CA0004.outlook.office365.com
 (2603:1096:400:26c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 18:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BADA.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 18:58:33 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.24])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id E189C300022C;
	Tue, 18 Aug 2026 03:58:29 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] pinctrl: renesas: rzt2h: reuse helpers
Date: Mon, 17 Aug 2026 21:57:00 +0300
Message-ID: <20260817185700.322370-8-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BADA:EE_|OS9PR01MB12279:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a7680478-858a-4197-cd9c-08defc9188f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	w5oEqTO0kck4XfpbpEFp/G02WXuX7FxSJiujaS8LpbtfFqW+agOkKEWmEj/442pQSjJptDyCCa8Z7I8O9HoBmJnXC7xUrWTgMuNvHnMbAtsHOVGIIbdCixF1FUg/p1slfMWOAQf3bjWUgmd668KOxDnOpNTc4ncSeOKLNB/mmGo6dIFOPY9+wg0GetegZV5aL1tXS3ZzQocje7qzIMvzHifQ43FDmpwU+CWfG+nDpPwlEu08zX/AcTKdnC7BLDcIN/Mce/e9CTO3JjTdGn34JPk3fTIAvD4UA+M4TF5UDGNEyuPPvdkD/ZK7Q31v1ps0edgAuHsroF62Bt5SgKM7Fxhb6mBmoZKZ40yssL1sZ6V2cQ4byx/CxmyWb0399wOLjrw4oiGCd+A0RCT1d5vHkwyatX/FASM0ewBclp25n88CWMw+LnLtV0cp8FQhLZh0yZeaShFJFexDlQd0G+llo9jav75erlN2DgBDZxSQ/f6+kAJz49X774lTsY93dFdCkxZbl5Sx3dL+dfW//YWMxo/doGd8HAp2H1OWm3jK/mPZkcjOS5dIXOgQ+Q5tCs/XhJyykV/k5KcpbrogTCqh0PKmD6eMvNo8NIOIFmS4C3vC+/1QrCOxcgRoQY5aytt1DQtfvE/ZE6XO3WZ2H2UN8U4UyhR+5vdT/pcHbjIjueqEUzJTQvlNPnjNZMwAL+E1iBwupvF1Z7CXxnn6AspEUg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bBhdMQ0YextGFSUz6NJjp/Yw1BOvsG29b27EZUs4yO/U9jw+4/Dl3wYleI3zkrC6LAfWVjW4LpAB5GxA21r/HRrxDLKEs2wndEDCqIuHblEFIaheR541MKV7pvaI+e3s+c2RcKJ6tpUG/B5Vy23e3qZYuA6+u3TcaFbZ7MStJ0hHMAaQ6N2Xlpvzzzl2GdVugpUvLJ3W+n6E1vWsKGQsNyyY6I/S8eosSPXkNWWrb7+WB8NF92KVk3Sbw68hZ2i+LMQpnwsAsEY4ZZu2PTA6va5tvqJBtMd6OO3bp1m1Xbigwwoet/wW+FP7Ci8z1dF7hQzgcKlMdx07MnNveLUzHj7NsTSXkkQY9UgEVTb5wIx5SHTsiGJbC57SiSmBxDOdgPIcFTqnnHr5J0ysVQbNvJGk/Rdcqrr+6+GOHMELN/n+VPygm1SqPMI2niYeZG2s
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:58:33.0890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7680478-858a-4197-cd9c-08defc9188f4
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12279

The PMCm peripheral-mode test, the PFCm function read, the PINm input
read, the PMm write, and the PMm read are open-coded in several places.

Reuse the already existing helpers.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 39 +++++++++----------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 525ccea344bd..d7f02fbb6a12 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -229,7 +229,7 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 
 	reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
 	/* Check if pin is already configured to the desired function */
-	if ((rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(pin)) &&
+	if (rzt2h_pin_mode_is_peripheral(pctrl, port, pin) &&
 	    field_get(PFC_PIN_MASK(pin), reg64) == func)
 		return;
 
@@ -783,15 +783,7 @@ static int rzt2h_gpio_request(struct gpio_chip *chip, unsigned int offset)
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
@@ -799,9 +791,8 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
-	u64 reg64;
-	u16 reg;
 	int ret;
+	u8 pm;
 
 	ret = rzt2h_validate_pin(pctrl, offset);
 	if (ret)
@@ -809,7 +800,7 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
-	if (rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit)) {
+	if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit)) {
 		/*
 		 * When a GPIO is being requested as an IRQ, the pinctrl
 		 * framework expects to be able to read the GPIO's direction.
@@ -819,19 +810,16 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 		 * called to enable the IRQ function.
 		 * Default to input direction for IRQ function.
 		 */
-		reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
-		reg64 = (reg64 >> (bit * 8)) & PFC_MASK;
-		if (reg64 == PFC_FUNC_INTERRUPT)
+		if (rzt2h_pin_read_pfc(pctrl, port, bit) == PFC_FUNC_INTERRUPT)
 			return GPIO_LINE_DIRECTION_IN;
 
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
@@ -861,7 +849,7 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
-	u16 reg;
+	u8 pm;
 
 	if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit)) {
 		if (rzt2h_pin_read_pfc(pctrl, port, bit) == PFC_FUNC_INTERRUPT)
@@ -870,11 +858,10 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return -EINVAL;
 	}
 
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

