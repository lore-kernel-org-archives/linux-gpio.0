Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023095.outbound.protection.outlook.com [40.107.159.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9974443B4B4;
	Mon, 27 Jul 2026 17:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174151; cv=fail; b=EQYK/fG7uaqXl6SwSYWhQi967HK4jpZgPaUuwhaC71Xu/7gLV5QuzEkcIVRhaCBviTs1TnWQGb3t5UTn6sH0gHUPW2ux2lAuxqKCWvxY9ByMdP80E6WimWXdyW+NJw54sIrq+3lfNyF5MaNDTjhLCazXqO0LpsUJ6L5Xta6+VUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174151; c=relaxed/simple;
	bh=/MnTGvAcde8FBAcGAqXEbd0U4qjWg0oI7TszP97ex4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eSnZMxBddQX+psNJ12qNQzDmjLbb6w/uSXE1yRBFvYvgHtZ/oxRAmnkuYmucSkraULSBSF6tmp986Pa22fBSb5uGrFbudK3Uu1IDVuseHRxFjYKtVKMEd5mQmzY3Wt+tTbrXXvbBj36KBYdSGtvtMwFpQuoT33LON5//YgVhQoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=6lYZb1it; arc=fail smtp.client-ip=40.107.159.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="6lYZb1it"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlJ6ui/C/47V1quVhuvQ7ViFCSYMoL/gwUPyOcbwRYJTvez8sJB2fBniQA+NOrpGN1mAnVP5ha4UwcMQFOO/lX0tiKcehWabcLnEKg10EWN1L9aFxZwXW1cRkDyXAZR1qhypRTWps4wfDPl1e6s81D2fRTXl6ucWUc3iJP610K9hwXz/Vo+85VkOeFbIAuaw8h89+AD+yWdZCZbHrTIBCD9V5RlGtV3QlnYvK05kUbwtepY6IdkMQgRfb48l622spkFyg8PNEIpf4mcZGSEYBefE+u2blS5cIAYu5RaCCKMzKL4+ka6nyOyZM6M2iuLMixN2uwutZF/PIXYt656yiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pc4UE6SLTP65RQuRJUfopTl4MH0EGmmGcZNCwEK4EZ4=;
 b=A8drzygQIg0UcbzdqsyudTl038agDtShgAjksPwcVSTxXe0jCtj6jBlxdACuZsPlL95JrSM6d8bBQ7SSfGEkmGbD40nBDHKXZrFL7GE+WQghDQ8rO8JvHRmegLG47wHOhNk+vVv9voG5TToNZdBzPP5X+dbd9rjmqfim0r5QK0hn4BZ27No/bsnIGqdnY2fGUFF/sekp4Sx5GvxWhPkbnuxmSkoLa6TKuRn7gGQORvyb5JvTthxVHmfSo1cfVkWK0QWGblMIN7nVgwEmo7sxKKPdDxRBzelKPTgnBWGkokSL+OOqJb0nnbCkgZap+w+QXyaW53j55zf5AAZH94hiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc4UE6SLTP65RQuRJUfopTl4MH0EGmmGcZNCwEK4EZ4=;
 b=6lYZb1itoSLQe9qsxjOIDEXRoFd4dkUTiWwA5ydMShQTJ8r+hyWN8ibadWQQ0C/CZvdRna4zsOzwNFfoOS8mt+1s5Q/OeecYooLMVz+opLtGHKA8zh00ydvdhKtvnHzYxlAcjwvsDl8oMdNXJbys9iMC+7ZDpYC/IWSdHZ6U0hXAwe2PecmSVO2qdt+KeP6CdMtO17PGeaegOzwPIWBxnCLbUMzlnCyCNV3c7OQ2d0TGKsmqyqYaNWd8y5KyrAefegmmHbGUxpNKjZoSoPKAVfHOwW6eQm/81P+e+6xURFP+QI7WBl4tz/0D3dVjwOPQ5S78r6K8fIkHoqVlti8NdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:21 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:20 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v8 16/35] pinctrl: airoha: fix IRQ mask/unmask code
Date: Mon, 27 Jul 2026 20:41:22 +0300
Message-ID: <20260727174141.664933-17-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b94730-b352-4412-8e5f-08deec066863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	3MXrrlMagRTjdCIvDt/ucR3OVLOgqmr1IfneKVZZyjRBP9wVMvx0+868nEWImuqGlcq1OTcY5HB8RPKDovx3NDfVvQWLBsv+LbgdEpqWGoofaiM350kYsNcDlf7UXUe2pnRMte8bS9mVto4dXaB8wbjMnrvSmhmvSja5eXxw7EfjYPrpKIYkpgYwwnstQeSiu7hJrfMqi/hoVrKoMIEm8SsN1ZcRodCb3hTV4Ias1s+wW76B9fhKNOVt6gYEFEdicn05eveDuRKG0HqDcAFe322DS/Rl6Yy+jHxBHa6RWkUIvcImfMgENNEYRcobpZLR7fB8zqkulpugY7kJbasoS4ww+i3oZ2bXZkoxeTiG7M349SFlya7I0R6LD8UIWz4rs4xx+/1JpLa67boXjcYw21pxALRa8EUyVnZmKUOgP3MdsS3+jm6mE7RTxZk4cozJ3V23fh6GesRu6BcfQFjR7h5PBXvRATrxm98n7qa9GFji2eA1CW24SVu9DPqBoBI1ysOJs+xfJ7waRkhz2mwzCFaSW6Qoz0cgyBmHbpmDKqnH8mGB7ypbchtIHuRWUE3NYhP6TRAW9W7AqHQSBVDeQjpKjJo7N4EWzwuQhK/6E0SVTdEamyBy9GJr7Ac/htV0sqORnRw7bPacpnc3GPrUUvzZEijQKioRy91Lh7IzgOITvjlJVK5q6xSBqymCm3+EPc6qmjcEFLSm08503l5I2suTceZRgf2GXjVT3qclrhdVtEt3EctlApS1xIv+vlao
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LS0TJcfpuuzL3Fp9/OGcD8TY2vrjZ8WyYgardQbKkCimyXRB5Wpak0DUknEN?=
 =?us-ascii?Q?PLrh9fe3H+VYWxMV0FaOhslB5bCwzi3W64OT1KEHdxpmJOdzh/GcNAJvJSvm?=
 =?us-ascii?Q?NM3obyyBt+yPHdqe84VX2naRfTI/IGouVmv1N3j8nkmNVLm8BrCYF6JjlcLN?=
 =?us-ascii?Q?fiTV3VP9u+gqJ0a8ms1rJSo0kh/d2sINpNWjBuMQLttnHQ85vvq9pjd1mlMZ?=
 =?us-ascii?Q?dD6dbeweDD9hhN0ZzOT8csG9aDGHihNooUnBKOcsecBFSVy2kSynA1kB+gkE?=
 =?us-ascii?Q?Ohxr6u86g7R+7Zmxr+32qT7m9WyNK967/tu2XoRn7Wrpd0aAPsyXeqbP5bet?=
 =?us-ascii?Q?UPFnBsV7GYx6kSNUo0YayRx5mlwjxnJGXh+Q4AplXQBPiqeVhAvUueEqBrj4?=
 =?us-ascii?Q?QkPkyqoOwMlzA+s00QaS9QyTIPO8NOUM//NKKAJsVmQ7oha//tBK+Gp/lzZU?=
 =?us-ascii?Q?2SHUyjiMOakv7yGAOE2Qx3pMcE5cG4nCN8IwpflahnEetwFg2KBJIpIFrE9p?=
 =?us-ascii?Q?c5gJ95MZnA8rjHOA7VpHsvGc7FQswv+D/WdXMhRX9A7JQ6kgFqxZ3tDXo4yr?=
 =?us-ascii?Q?F9xgE+Bmu70H9La3/JjpSXHoFd69UGZGOFlkTDE2GIVOHugeLA5w3FL3pgFr?=
 =?us-ascii?Q?IzgzxnxtUrKWDop6Z0L1sWDW6aKcGiBz5pTX9tpcbacPZQhl7phjzS1l4n1S?=
 =?us-ascii?Q?apNToxORwTTQPmCB71ecnEEmYdCQoBVGSCvZQM8h2Fgr07deP5J8fBhsiakS?=
 =?us-ascii?Q?IXSISr6OGvNgGQbfHQTR55vq6xvW7sc0azKmhXzXeGE5DTS/To6Zhxbv1et8?=
 =?us-ascii?Q?fnKw/ZAvx2GY3lg1z/xCVoKGR69IRkl+xLTaieIdPKsXTUwABlFQZCmsMS/y?=
 =?us-ascii?Q?/7la19B1KazHsz6Elk+NPs9DsAh9WugeP4HWy3RqaYJ/NokEhHmtimWuM+v6?=
 =?us-ascii?Q?Sz4ssIZoFx4h5qG1qIxViiCrFKDvUTxQkrH+s9eeQXcqcPXuqicWgn/JwILe?=
 =?us-ascii?Q?dqTZPpy5DPAUA1b9crZeLt9l1AGcDlfDZArhPOSB0ujOuAOdBvtmgEDTvEAv?=
 =?us-ascii?Q?IUjIKIudNe7C0oLQCKIa1nXK5bGneAR42fY+FqkXef/3e7/JhvnEPzIEMBKn?=
 =?us-ascii?Q?UivQwWnN0y9qozKsdyeeWf8dmTkJrw7xRnAs17POHuSV2lm5q1P5FXYmzCG3?=
 =?us-ascii?Q?7wZyWX7nqZ//r0i04ZOg7Fr+NVGfjeIKL4001J8kg33bMSti+JTY8kVHjG6C?=
 =?us-ascii?Q?JulZf9zRivAdmg4JtIfLMvpHX3gKVLdYlZHB14cYO4Ldp6VTlHFpkY1lfr9B?=
 =?us-ascii?Q?pLEz5cOETUoBHn6sPaP5ZP2ugqcqdtQRitmqOqpo2NRzNrqGQST+wzvgnMoF?=
 =?us-ascii?Q?ynD7Uk/Z3N0MNYy1K7MIta0BUuwMlCI9yITn6zcBPUfSvxY0RKPW/ioJKdd6?=
 =?us-ascii?Q?XLj1ddz9nqLS8usSDiUe4kTRpHpySiRiVS4p8SyJfZ1Q6iFSSxVfHnXVLQpE?=
 =?us-ascii?Q?rL3xgw8PPa7nxuUcKxe0CGeeySuZbG8I5VtivLG3kWQaFnME+2xFU90aoU3r?=
 =?us-ascii?Q?x67HRmLXrWQINhUN/hxMDqfo+BuWTLBYS2ZAK5eBmJZs5jBMDOtfg7SC21mg?=
 =?us-ascii?Q?QaXicL8Fk+bYKAdclfyoTSUFeuFezisYU97e/F2CYi9zvbkzoE5pbtPF78Np?=
 =?us-ascii?Q?rFBMR5sB8c0ISskRPU1dmTEYv/wkPaqhhPBOSoAT7GyLzq5N1hLoZ0GbwAWv?=
 =?us-ascii?Q?KyM3IVs7Pmg76yU7Ar6sdKse7yjsXRY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b94730-b352-4412-8e5f-08deec066863
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:19.9824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ei7k2gFEdoqaG/uG5V9euyCWCMHIiWAvI/Ej7zQKoxiDaWo2fRPGgqLufEJU7Ry5Gn1Fzsskl4MUiXNL9tKiVOAcrdfs2zaxfsQCwbB3YM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

When using IRQCHIP_IMMUTABLE, airoha_irq_unmask() must manually call
gpiochip_enable_irq() and airoha_irq_mask() must call
gpiochip_disable_irq(). Without these calls, gpiolib never sets the
GPIOD_FLAG_IRQ_IS_ENABLED bit. Because this bit is missing,
gpiod_direction_output() will not realize the pin is actively used
as an interrupt.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index a27a3188ca006..d58829da6465c 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2575,6 +2575,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
 		return;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
 	switch (gpiochip->irq_type[data->hwirq]) {
 	case IRQ_TYPE_LEVEL_LOW:
 		val = val << 1;
@@ -2609,6 +2610,7 @@ static void airoha_irq_mask(struct irq_data *data)
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
 	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
 }
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
-- 
2.53.0

