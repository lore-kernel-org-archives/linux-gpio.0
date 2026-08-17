Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACF93B14A4;
	Mon, 17 Aug 2026 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993114; cv=fail; b=mYrUTZ4AfI4uys0/V+qG9kuJvzoZiPL6IduPun46Ps506kUxF2fEtB9la7Ggn3asq/WYmTSHlaexEL94NNtVWKKozE0/eqU35MRg3vRWANrw3IH1iNH9FQiVuhTfjxJJNmwRuR2bPtWfcoXJZKoXrt0Vc2KmRsJfm1g+oFKK/KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993114; c=relaxed/simple;
	bh=VAZaHcSCKTgWpC5w3uQGyZ82QUnhugo4IpKfYcahmfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOC8mHj6T4fI2y8eTXYKYVW9TNqkVrLlg0XEbtB6TDwGOJGzuqEDM16ax5Ar3fEh5orXRr+L4xdGpJoUsWjRMvNSAOX9avo3Y1Vy5r1bW5aliYYKR9kxhYDT3pd1ush2j3thlA+/Id7ovAlW7cRoOO1Y+IGwt9/xZ0oQEdcY9os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lOm71mC1; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lOm71mC1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttNcarDe7Fo9SumLMeoy85NkMckn6JG9NB3k6vocYe6n1kzMSThLzTSfCGxlL8tgsPmUmbhIkQkxWFGi2zC3vYbcu5tI2Vbe7RnDcucb77ws4v4W7lJ3/Zyg/giXiplTBOKsu0Ek3r0tuIFbeJe+93P/mzR0c5hWzoCSZ6dzbiZ0tSJmj7j57JKlWB6f0dOS6gNQ96QP6nanHs3vY+EMmp9TYs5aFC5NkFahhMnDHMcZfmIs96KH8BjsXpEv1FTV4YGSxFJPRSWWzFtoxUVDTy4ie7cGkIMErFu6qKFOi/avEEXrkDV05pu8j41uNCfK/6djbLSuHfDEuLoBc4dyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkelglPdpzmA5XmdLdlsJ26KPW6Nmu5FZxbGVWDTnwA=;
 b=LVzW0G0jkoo3mSuR7mWXpFutimJ2d6jssDjgmSmNDx3LFxqdxipggxi7DtUlXZtJn+WTrmy8ae0AAQxh6as/wkuX//zUwIHMGXgInQ8zZwilpH9ZbAJw/CmnrBZedGc2b49vRULI21KVhUJbfqT1Y1CXu0Osos4JwYFbSzglEmFtjI84WACvBBXr3ZzX3KVEQ3R4b71qn7alFfiY14xJL/2MfKFFAkziHeGi07mHy055udJ857ogh0RnCI1D1d12mWpNY3pclXGODbVBcdVbiRWFawI+kfozxnoH92QViRxxIgF3RmDB2xcsSAmtTbd3+F2Ev6Yf52IQHeZf5JvEjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkelglPdpzmA5XmdLdlsJ26KPW6Nmu5FZxbGVWDTnwA=;
 b=lOm71mC1xsDOOB5Bw3zgr+TLC3oRYbU7CptsoIHOT9jPb8c9acMSA9ky/ABDooUONaD7WhE7++VVA32gePuix7a3+1AuNYlUTE6Wjak3NuKWHdZAJE6tvLfRwywX541og34wDAmnKDNGWbWAX32dp+s5sCgfMGa7WBTioNfMQNo=
Received: from TYCP286CA0107.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29c::9)
 by OS9PR01MB12342.jpnprd01.prod.outlook.com (2603:1096:604:2e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:58:28 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c:cafe::48) by TYCP286CA0107.outlook.office365.com
 (2603:1096:400:29c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 18:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 18:58:28 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.24])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id A66B83000262;
	Tue, 18 Aug 2026 03:58:25 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] pinctrl: renesas: rzt2h: remove unused struct rzt2h_pinctrl::gpio_range
Date: Mon, 17 Aug 2026 21:56:59 +0300
Message-ID: <20260817185700.322370-7-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|OS9PR01MB12342:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f37789d7-736f-4668-fcb6-08defc91865e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|22082099003|56012099006|18002099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	rXlKppwk6Bt5Urt4JNA+EONcf7VpaTnwf4MBVj6346MxoTXuQPCts//ZAwPvTYQHFwKnGag6KG7cce6fnIPkPF/l0yUBv787WR5js0Cc0smpa5lhomyrvnwLyBJkw4/S+vPBBC7tZJZgDlNXKirQlR9hVQmJBdyoA1PRU3+tWeeavKJW/K5gKzwM1XDMOUOAzlYM1HQAhxBtZyD7nqvN76bOzEUcXyktSYiDzEgmInlL7Cg4Qnq8pJfMHlkA+FH9ray2jATPL4+uiAwZi+5N2BRrMJD+wZ9O38lS2KcEwVYXI5MtEuQJqFcqvgTMLHxE2YaqzIY3AVvtFA798psxeYFk/yqUizePZgI7SRelN8Oe6ECM6+2z9NcrFDKcaCcxoQwIxr7wJYu5Z2sy4Hv4XYWuxCDZ6/FnSTAHUHva1w2UmnckFB9GjWy4RjOYytsjSZyMFLj5TmuZi5bcJeF2sVpNJfdpjONBYb2GPWRqLRor+Xw2urZ0hX+FmNbdeBAg+NZfBcUqONl1Ny57jQjTb3FLE1Qs5EuxK2GfH+CgQpNRQioYJOmWijYaQ1YyScjAFiJvil/gV5iWRzQ0XE9KtJ9buUQthpsDKjBR7Rv/P29hKKZ0yM0yGfkrVnpHlJjwm+HnNhoyjU7rduSi+JZF+DyJcmVML5YeWqNgx1aRZWb5Uxm0MuXHvpjtyTLSNU3SBXIfG6a20i1c0WiOh3AkNA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(22082099003)(56012099006)(18002099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XJ63HN2n2gP/lm4L6UbdgltEFqGBTI3R+kk4GOoHI7Nh4abPP8amqEtoBdW23aNkTD/GC7sOiSUIcPKzWCnNLhZoOfVScMM+Xhy6Dl71zM/DcH4dlBCpyhpRRtSovT1VBIMP05yAjDLDixlyzNT5ZLY1IUbejfgBevhaDFBAA2wSmpZ9hsHse/Pm5YsKS6pUo0riatvFaI9UYdyNXWLWLSDXsJYiIWcJlJ2FMx75N3HssvkC1b/ptNVbgxiXSWWt9eOKi+rQOmd+GntyH3R3FK682vXUl/59K5kXTOe1TFvboMhZ58+9CWyrJty6HGEzvNu5juH0u6wamAmnbxqaPPoXSHitp4mkM9knRF9WVHTKVcUj/G0acXj3BWsewamO2xyYAKIZFw1SpRQq1fBv+Iu4uO9Ss2snpuOr6baB5w5AfrE88cQRwSDUK0Ehrim8
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:58:28.7505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f37789d7-736f-4668-fcb6-08defc91865e
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12342

The struct rzt2h_pinctrl::gpio_range field is unused and seems to be a
vestige of calling pinctrl_add_gpio_range(). Remove it.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 3e33543953a1..525ccea344bd 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -94,7 +94,6 @@ struct rzt2h_pinctrl {
 	void __iomem			*base0, *base1;
 	struct device			*dev;
 	struct gpio_chip		gpio_chip;
-	struct pinctrl_gpio_range	gpio_range;
 	DECLARE_BITMAP(used_irqs, RZT2H_INTERRUPTS_NUM);
 	u8				saved_pm[RZT2H_INTERRUPTS_NUM];
 	raw_spinlock_t			lock; /* lock read/write registers */
@@ -1151,7 +1150,6 @@ static void rzt2h_gpio_init_irq_valid_mask(struct gpio_chip *gc,
 
 static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
 {
-	struct pinctrl_gpio_range *range = &pctrl->gpio_range;
 	struct gpio_chip *chip = &pctrl->gpio_chip;
 	struct device_node *np = pctrl->dev->of_node;
 	struct irq_domain *parent_domain;
@@ -1205,13 +1203,6 @@ static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
 		girq->init_valid_mask = rzt2h_gpio_init_irq_valid_mask;
 	}
 
-	range->id = 0;
-	range->pin_base = 0;
-	range->base = 0;
-	range->npins = chip->ngpio;
-	range->name = chip->label;
-	range->gc = chip;
-
 	ret = devm_gpiochip_add_data(dev, chip, pctrl);
 	if (ret)
 		return dev_err_probe(dev, ret, "gpiochip registration failed\n");
-- 
2.55.0

