Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021080.outbound.protection.outlook.com [40.107.130.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4229A4302E7;
	Thu,  6 Aug 2026 22:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054031; cv=fail; b=pXGaAzbgOls8VAeiT6mbTbNS2ePW3vanTVPVeWktnd33lzDi98ZtNHkIr53hUuDfZhLHvFMNKU7hm5q+CIX7u9+vNJtkbiuGDYO/N0kSA4ZH8LgSIMWzDdXQB1oxieWAB5TiRDWyJHEU4omaRxZSF+F/GCSS0Zf0WH4B9VA5rAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054031; c=relaxed/simple;
	bh=zZpwFS6jrP14RYJOhiJIMjFz31HyO2bkrVUqUq+gMA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FxiBbYHH+v7EA1YaDh5bRQdUQomLHwyMTyGi5nCkF1w+qBC+QSnvsRPGfw0Msfkp0CjKx5eCEjl08LaxiXwgPvfYLtae7T/xfok2H+4F9uDO2i49lwySQLH/XrhiOGnA6UuoHUJ8wKiYFCY60tgJ46HJQ46e/jDAruyQ8Q6zxZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=P5/jp2vw; arc=fail smtp.client-ip=40.107.130.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="P5/jp2vw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBN6Sp1rYCA/TWX8sg0I9J/6ydLr2DDtBqOPhbjX75ARLRgreCk6XtbqDjJ/JoZcJ7DA8hP1QgDCNIYLyyXB45oKHkasYvAUZGzbzLz2SGWlwSkZeZTouAiiYsyZo+B0f9vmYbpe9xotZuwIJupbmpZeegMr9aWPT9hW7PtIvoKnUhF/9ieWc/kIqV/BwIgS/WA5lueq7rDg8+q745E6RWykpz77ehLkWYZ8XwBR4HbYyy+VrNIHLxWeZ3hTjoENLRLhWq7tBm0OOv14reiuT3Jqs/S/pazTcTSL6xKbpmAra7o0CFWMFgkqEd8fWTBgm+LwtL0L5v1vrTPysOSHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDaXBo0suX5TtrxDytcpznhLGqRrwrA02KYekcB6jq8=;
 b=FvWd5hxti3y+MGngANa9YMBB/YxQBumbkDCTkdJoqJ92QqjdM+oIJnkbjn4vzAwlb/Fh109K0KuLUQQvR11BUAwqU3OmfZbkYP6pAcopbJeIIar60aep86ifLLkZTangmsBdiJO0flk1LMEGaoaPItp6mgUUuX/mUhVVWl8Ftnrz8pG99REGn7Nqc5Bok0uvEMOqg44g8xaNS5EJ0BO9fzbubC8s50WaufNqz8BxJEsP17BDfmWA6OoXOVbNmOA/sOBgmHUe27TKhvCbE4F++SQctp0KsKbC8q+rNAhdu9C59sgJuytElyVzBZIRTIYG0enMqM/VdkHAXZZwt6uJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDaXBo0suX5TtrxDytcpznhLGqRrwrA02KYekcB6jq8=;
 b=P5/jp2vwdlyroySZuXgTeXMqvpyTjfterxKBwAQfQEXkAzqPZe6czdz9Cj93yTnapU39svV8q/Ci9BzTLXqNQu6MxEGw5I84Sd4psDGwUglC2lwFxsmYJh8OkGd5eTeqFIWHpGmu0puKQ2q9DbqAPN66gHaqxFF42o59L2sjj1eqgk3LcUFXGUzSYDzP+VhYTaiXLGdClj2IFqIfKTUdc9LzKqwaOo6GaIuRyampOy70cL97U3c4q+xpXORtuoT0ROXexCIixAQjw8TT19QgBrjUjJHoZvJUlvOXwLDrNNgpdf9020JDyADjW8S45RrTQbaMOtgeXoXlRsFu53+7rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:06:59 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:59 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v11 19/37] pinctrl: airoha: add missed IRQ resource helpers
Date: Fri,  7 Aug 2026 01:05:57 +0300
Message-ID: <20260806220615.4078303-20-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d86b875-77db-4826-ddd8-08def4070981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	atWN+tai9DAilZDKdUE234ufrPI1AstNO25q3Ken1HkafEYGoEj/+Yta3+Zr3wgRxRNxYJ1PkLXJ6fxv1NA7mbbfDh4rCnLun1vLZnwzbCQmCCP8bcItPrcaJYLdsMDrMHy9/nP+uz0bcc7a3VeBvthg+ZCvqtE9ooq3jtOEhttl1t0tRX+fASFW9FsdSLQ4dvRH42ooLayyewZLbU1z680LMdqDJCaxVPnvrroemDYeUkIem6cFej2AuNuMPoPpopwCx43fuj8hO1IewKsvwZ/UO44S3TM0AeeH/K/yHfEUvl8ZOt5wHGAtSoKYHUbS+LwhGEQFOVB/2ff/trUGjxRgXRJ1aQML+VlU+WUvYLedAxEHfWhYd0tlOppm2aC145HScJXmgIOU1haVMPZOUg7f8UiGJjbcdrvraDpHSv/cnrSdY6K7zNFHzJKhUZI8odhUK6ojncI7FEMa0Xk358YX3ueS4yVHmkCHAUhJ17A0BzeZKN2YK43Ga7694N5m1oQVc9cXQFbcJCdTADe14eJSIABXNl8p42UYk95kyEJOEC/WIzWossy/EuJLWDew4XN6//vp4m3X9mKy+BGCBuXi0X8NEjh0xaw7JOYn9u7jK2YNVIPZCywozRhWCQfxwI5b7zhmQaz4mX401zbjY340aTB2pCbrxe5Epgkmzg0vWguDwkB2D+156xpZ0zljZr0R7EWJqWVvTs6FWYrlA8X6Cb+9jAc0waeCM163MIi7sGBfNWlHfMVcklNA8ugB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/ac1PlQiJgzmIgHFW/yvMVt8+2ft8NESId6uZah0pmJc7mlkHYEqAykAYVJ?=
 =?us-ascii?Q?UpiYncNxN3c7PUZvP7u2yyZ3bv7l2HDDGJ8PZf2ANCNKFgH3UhTYWNCzqDb2?=
 =?us-ascii?Q?jdtMnAIiYlsR2RyJIKTD9CcDx5uWofKZ7rZV2A56c2cLXefryIo+X1NPUnS+?=
 =?us-ascii?Q?1IB7nSYXhmw0rC9uKHwxLmkvcVAL4bhOPMHTBe9MhYZCTcr0a4vCuCTZxXKz?=
 =?us-ascii?Q?yXA8Zu6av+wY05BcO1By3ENlvo6kUGife6biCuvM932OsNnqcPVl8KDzlrMT?=
 =?us-ascii?Q?9YvKPxyGTtxaiNFPHX+Cz0FuW4ffTXbUDop93pg7qwkHiIIKx4k4jcHHwWWq?=
 =?us-ascii?Q?Y+uPcSUGorG72fvdoThh4X8/brfKjYbo+uluJUtyeOGuC6p2mtjL4RvvK+4P?=
 =?us-ascii?Q?O//W6vprpkb9xX5qqtSgH0CgKNE+RJxHgBsVQc9U4n1bX7W5d2D+JSvL4g0/?=
 =?us-ascii?Q?cPeUiPPL9pv3iWXAL7LiABpoxZOvkEWYbtaqOPEEnRAv8rJIU/wCkq8S5nls?=
 =?us-ascii?Q?YETW44EhNDv7G1VRS6U3f0Fh0gGCN5GxnARUNf3o3/I82is+iXQTInRukOVK?=
 =?us-ascii?Q?r9/IudSii5UCuY0FXdjtUi3D7VxkQNKkP1iuQrgrrjkaDLwDqqPR/WIYxc2I?=
 =?us-ascii?Q?YQJkwyE0MRyjIYFpLiavvKskPxREZzF0LERi6S0oFJtswyqrzvbD6Pgl3YY/?=
 =?us-ascii?Q?WslxuxrthsDtTIV/fHtfZqqyk4ut9oRZYwYcxFoOfo6VnLeBZ1eBjsqa6q7G?=
 =?us-ascii?Q?8BBPEd3izVvH9oVbsnkCsmC0J8vCsTdRgdPoljxI9dHTyzQOQVVqelYuVXOm?=
 =?us-ascii?Q?C+o6yfyGsjVtYMPnrO3G0/1l9asNGIh04u2OFmQjMGC+Qtq+4QEL1nRO0XjV?=
 =?us-ascii?Q?/hsN9TWZNcRoanbb7Tr2n8NzUCmmQPcMJdzFT48c8Qda1RZcgb4M6C1xjmtl?=
 =?us-ascii?Q?VEyH5ALbUeNq+/Ae4HBD97D8GiMr7+2KmCdzCWIHk4IR5YeQrQ6x2afeaUzA?=
 =?us-ascii?Q?EZfa4zWPPpxMMFgOv23WslR6ofkpRiY96ZYoQwUtChlpJ5UqcDB7xT/22ej4?=
 =?us-ascii?Q?petKDruQxYtJiyV2qB/vrB1VWDlE947FfYPHAa6iytWPL96aN72V+YFQ69vh?=
 =?us-ascii?Q?tNVCHX15Ff81KCXkJYueBXNNTlQNVUlQ2HQQzZmUkv0PSg2IurDbMjtX9A37?=
 =?us-ascii?Q?cYOrGH6zhIgXltP+9XrbYvU33XrpnUkdXkZrH+xNmXy1uUHyCnWBRcneuUlv?=
 =?us-ascii?Q?NDETQn7jPK+SopGf2B+N0m+Ey0i3iLBM/7EbDdB9hS+n6E0SzmbKU/4woB2q?=
 =?us-ascii?Q?r/9LbbaA2imJvTk9PkFz+3/DLZ0q9gGvsO/TrOoa0zOfsBdpDcR1mGg055dG?=
 =?us-ascii?Q?FFPj+5Fcd4fKFLeVOD14zz7OviJ2xFtxeAN4scCTCTqKTQjrTMFoMz4yxLJX?=
 =?us-ascii?Q?Xezq8AyZXQqTKwrTBqnLipHeP/JXJ/BUOWdNwlUmrWcX0Gj1FhHVLBpHdIxb?=
 =?us-ascii?Q?NDNvwHCaBeh/odP+P9rIW0fxOrLfia+hhwXQvMTJhoT8lBFLenm4czESeidl?=
 =?us-ascii?Q?OokIfVuFVdYZ4XTo8MifQ3sGAaW2k05U0PqzNA33FxU7TynPRgoeHYgw19N6?=
 =?us-ascii?Q?s+N0lzBrNuap9tG+rg8sFBFn37wPSE4NW3zO3QNlwLgS/Ys7RqeF8smeMJn3?=
 =?us-ascii?Q?J6I53rLYrkYolWsJ4ZRyYSafE/Cm4CJOymvDaTUH+LaipwJkfi4Hf9ZNrjU1?=
 =?us-ascii?Q?bwSc49LFZLxBSMdgJ+ktoLK+7ow4hyY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d86b875-77db-4826-ddd8-08def4070981
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:59.6246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrix5Xdi29LTA43pBfuYI67gfLtTY+v2/I0xT0rrY6VfpMjCw7fCjoi/cJvw7nRvJx9hOYpFijzr8wX2BN6aqnl4xCtOVNk/dTjiMzorr4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

Without hooking .irq_request_resources, gpiolib cannot set
GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
userspace or another driver to reconfigure an active IRQ pin as an output

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 0f2837320d1ca..c64f3c9a35acf 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2689,6 +2689,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	.irq_mask_ack = airoha_irq_mask,
 	.irq_set_type = airoha_irq_type,
 	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
-- 
2.53.0

