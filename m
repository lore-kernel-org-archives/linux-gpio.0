Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AE42EB5A6;
	Thu, 10 Sep 2026 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056233; cv=fail; b=NRBB7VuyF3K4KKBVLYGXQt6TeSCLVDbyuNpIk6R4pLzOz/FTO3R2tXWt7cXIVQ5hAeIt7X1OSuio9SY/kUYs+wKeeR2lCndvspiduwDeyVJsIMH7zVSlf7Ojc7olsFZeEcZN70r23ZKinnZUBfJrpbaPEze8igWhe4osRGRgqpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056233; c=relaxed/simple;
	bh=rpR60oG9pCtDqqYRsH37aCAXxhNxb/+ywveDqx1hh+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6QAcFhikxPpgjQzUrIhS966TeolE4QvMzRJC6pmP0ChOlwdSWjcsyxUQ3469XThMoZkYvWnsJXFt8pBwA7eejkYWksVgzIrHdAvtaAiVI+VRgmXuZOpduSpHGlEsBThwkvau6zNhWQRxWlZMGxtO5L+s/oS7cM+Qd4s5Nq70fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f8/bDxEw; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f8/bDxEw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXUEEcnFV2d70XGb2Z/NInSxgrODAQ9m69iERoEtZhr42S8eLb5nLp3gI4WMlrkSY8Yh2GuW4xyv+PZ67Q3Fu9Y2bep8iA6Z2u7QbgfY5mQo1pNDcdeteQof4WyVLBSl6HN4y8+8oMQke1ZjvRlNNsmGRmt8yyxUcdiczfRYVSTD/00jsxsiXy4CBMgY1nep/v6LsZcnGv7N8sQ3E58wk3Yse6qymVw3K+v49vTYPfuTZjYa5UeF3YNsQZDNt9nKNxQUsynhCBGZXN8yo7huFVVAZkeQNfezt35skaIZXknpaY5eXiGaM0IAqAUuTTfAAI/qa6IUfsvhojzQQj1rrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vzucJ3+1m8wzjgnGHs0+KTlzU+0pSFkZaZgxgZwCe8=;
 b=wZYltWUulcdmxqHyQ4Lcw2jJzQ7OmoTaonnNteDNS2WfieF47WBFTPkKwfNCQ/v94ykzBAVYW77OxES8P40gExK/Ejp+xOieJ49qlWAIBDfaKnoOYtZk86dvNqok9lbXm8RuxVRnUGNe9fYupwUIwrdvSJspKCBUkTHV8/7gIlNXo9lK2FzGSbK05W9yBIprSQSQWDdZg4bnaR8Vz9GvcI5pME3tr3ZUYDmSwcgcD8iFDzEBf2mviqN/T9wdUEHvC/b+Ay6sixGzaCx/t19ZjaQBrScdwkbykcF6QX1zP9WKAncOEQVkhX+cwhwo6U1xsw+DgRkQ2TKEyrwZhzriQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vzucJ3+1m8wzjgnGHs0+KTlzU+0pSFkZaZgxgZwCe8=;
 b=f8/bDxEwhMi8Tp9O8rgOktmQN1C5AWQfycDilNXLC2rzkt8vfwrImzURbm4X9fn59AqvtQdRgSfNh8QCYcv4m44AUWBliB3m0na/tkyVZ34ULaQVdmlgPh4/0zb2mv5TyMRb6OrDQB93Ln6d7HSMWUvFA8905xsLQjDIkokUs7A=
Received: from TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:263::8)
 by TY7PR01MB17246.jpnprd01.prod.outlook.com (2603:1096:405:32b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:03:48 +0000
Received: from TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263:cafe::45) by TYCP286CA0022.outlook.office365.com
 (2603:1096:400:263::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 16:03:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BADA.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 16:03:47 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.160])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 451D430083C7;
	Fri, 11 Sep 2026 01:03:45 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] pinctrl: renesas: rzt2h: reuse helpers
Date: Thu, 10 Sep 2026 19:02:26 +0300
Message-ID: <20260910160226.489183-5-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BADA:EE_|TY7PR01MB17246:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6e92d28d-e30c-4e08-af98-08df0f5518ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|10067099003|3023799007|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	HpUY+M0FQb4JWRDLFt5rtsX6Fl0PTgwf67sMIBuvjyYZ+Jw9Zkxxn8JVh1ewNXwkTQ5LrorA0MH5LcIgD455Jd3hYAfWTb7ZCWuojlk/DRGYuBYeX7FFPqrgKOGvBuBpJM2kkao1/ix/y1wl2yMYZDLHkuBaitI28KeFRMuY1nRnDO9BCd0+sBtsFkahD5ItCX0LYatuexqLlpNiyX+adV3L+I49emmSmsh1oLBw+7axNnIYLTbblCjmRwwpb8joS7oJ0OpCBNxGavqj2OCo9qbwBUxs7EjMnnX6exTJN3S2m2Q/DlM79wphRFhYtVYmCfCMG86d1EQ8TORnKa4ESS7l5k6AC1CN3lTJFYDRgoq/F40DNLXDkJiGvSyZffYRPTyXy5muEBKsKZKwv1H/acxjmyreQu7PFuzO1/QqDu2sXS3WTNH60U0Aijd3dMN2Rm4hYBx/rOSDyj8kwJNg/BXm2GCyFtlLVU3bTjFHV7TrABfw8DyEqyp5L97XspPOw+h3p3TuJscBjgqeJFehX7QEXkFHL2ZO7zgnAOfV4NLLdcU6Z+yb/5oX2e3Ew7y+8k8Sifi6UdBKsU1soSvPZBeTQkYeQJ/dk9eogObqJmCNyhR2MnU6ezvCzraPjFD0840DLafVxUGK0ydT5QE0hVuPvfOkK6YVukxezmMYY4tpAt6YD7HjmCZ4Pw6NPUXDtpCchJAerk0IF6hy5PnOsg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(10067099003)(3023799007)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	az18aeV1anxaI+gT+alvhWuY7MK+Lv1iBIds7ZC+4E1O7765H4jxYKXSor3nXEg+RHrJfkFDT6swlxF4pPZrcT3kBJ3qIec0FM8UEEherv/08uXw97ZJoKAsxOzQd7MBAxmr7R8iQfUUoyTzixgsIfUstpPwFPMIPb9ZmXz1sY65zzmDW+mNRPhKhct6hBMrZTeCqYJMkpqNIvQonSNsKg8FX2TU74JGuLJsRMnPBCCSIskxd0EC3XY19yaYLo0B7LGnzci95UShmTTwg2G8W+DLvuLVL1/pQOELr19ZsEX9L4iPGdUXa/6k6UV6ib4Q0PWueyPuzJhjieD8bDoWbb4fwRanEucdmFKG8XlXM2rO6oY1Zt51uVXq6rdBK+piXb6N1FhUi1OjaRZDZiSrDB38Vo857t9nCIPZKdJ0pDWXeD2rvF7QpWg6KZxjcqVo
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:03:47.5454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e92d28d-e30c-4e08-af98-08df0f5518ff
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17246

The PMCm peripheral-mode test, the PFCm function read, the PINm input
read, the PMm write, and the PMm read are open-coded in several places.

Reuse the already existing helpers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * pick up Geert's Reviewed-by

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 39 +++++++++----------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 8cf4b7f48e7e..4872a208e0c3 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -230,7 +230,7 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 
 	reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
 	/* Check if pin is already configured to the desired function */
-	if ((rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(pin)) &&
+	if (rzt2h_pin_mode_is_peripheral(pctrl, port, pin) &&
 	    field_get(PFC_PIN_MASK(pin), reg64) == func)
 		return;
 
@@ -784,15 +784,7 @@ static int rzt2h_gpio_request(struct gpio_chip *chip, unsigned int offset)
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
@@ -800,9 +792,8 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
-	u64 reg64;
-	u16 reg;
 	int ret;
+	u8 pm;
 
 	ret = rzt2h_validate_pin(pctrl, offset);
 	if (ret)
@@ -810,7 +801,7 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
-	if (rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit)) {
+	if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit)) {
 		/*
 		 * When a GPIO is being requested as an IRQ, the pinctrl
 		 * framework expects to be able to read the GPIO's direction.
@@ -820,19 +811,16 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
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
@@ -862,16 +850,15 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
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
