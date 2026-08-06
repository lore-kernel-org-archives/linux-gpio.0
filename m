Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD9842BC36;
	Thu,  6 Aug 2026 22:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054021; cv=fail; b=RNatfud2gqBnPv3vX0ofHI/9QqvCZyt0vLQxH1dU5WRtynwjGWrACh/m4YVlAlqFog1n76qhDHOh+TNI+mZ96bK2spOILjy4LTniWXlnYonqJrKTSs1JIgKCGBrOKPVy7RtW5PossQ4POIoNh00At7OD6Fpr6Z9Jjg+c9/9Hfaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054021; c=relaxed/simple;
	bh=4C/RMWG30NsNQGseHFbVfJY8KM7CftHDDIkUnb28Uyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NVCeyNeZjP0NYh1KFFbQc8b60HSvNkoIScpl165rpIyoQkizzQTuAFQZZPwN/ABx+Vc7ctO4F7+p8dpH2L9uFXRcKLSb0A/+g86MicCcmi9FO5dZoY2gLFAaKgGVGgHMHMGVqAYJqSASZTikD6hmv7hEdNvRHBSkOigDqawB2Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=xqP6uM8V; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="xqP6uM8V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVOYrHOFYl5QzivQcxhQqxdwr0NCxrNagiOyld+JZxe/08/7pUs0PjK80mrqFt00/O0nCHvDHtm9VdWqzl47ScqIfVzrHLaKcy6S8f+KiqdeSDvjBZQ69JG97ZB/nfmJPieNxYZ8jeR+nZ8OO1foonLowAFJ5+6TZ77Wqu5O9vfXvGWGZ80wriRWvLYgPWjwuaHmhORJqOVb8cFuE71A8ANkKALM+PuEohWXVV1DC3EN+oUF0t+iTNvooqWpGlsMz9uxlirFPsSPTEgEmHBkFnt7QM178l7UrwildQwmwJjD9QmD8r5fomqxHWDLlIXh6ZAV2u16lq58jKuZcYj5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBj0IHire2KuEO9ACnbQOuA7Xwq0cNeUv4zo1WsCD5c=;
 b=NtRKHQ1VKObGSlRJIrI0a/+flFthiQGVXVXC9EOJ6R1gV2CJMRipxskeSKvr3DtcHKSSmDxJHyyZ59dzDj3dFpFiRbvcxnh89+G5ipOucpwf5mFuetGgUDU4Edu3pqsVhkXkTo0Y6q31DWFu7mHRBp2o78s7eAHOsFngfkFeuL03u+y2R353Iqr1N3vE7s8SDCUERONN7RFJdhbYt3/qpscIQ/BpOsa6mi459x3Er8YOe6Wa+Dq9f5AD1cHUQ3d96Wm5J6wnI9K/Xwk+c4gNNnE+9wcHrPv4g0KDLg2X9QGa+ZZVandDvDk6MKX9G45aqlsl29lhk7lJMtFCbmE1rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBj0IHire2KuEO9ACnbQOuA7Xwq0cNeUv4zo1WsCD5c=;
 b=xqP6uM8Vmbax6Ci5D6CPkzSlaLWz30R0rOlCptwgIuufyxAqPEUt83YVp3PsxXfNni9AHg3jMU08k5StFdjkYwu014LhLGS4vFsg8fCCPnO86yCGcl53+FY14vKNmPX29v0Q6okE1p65T/Fac/YPnvwCYhmJVm505OdZ55SNxtS9Z01v1XhdrYSVZwH/8Cht6WXZK6Xjj9AwDX/ck7h0LAZbwl5Vhx89C1L9R1//XyCI7bHdttuu+g87LRy9/Od7uIOgX5N+kLLdOkS35lezjdBfvU+Deug2vaJQU8F2hSeKqJ87nFFiZH654H6NCCWEy+ryUi9XNpPbWQ6UX3DiVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:46 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:46 +0000
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
Subject: [PATCH v11 12/37] pinctrl: airoha: fix I2C pin mux config for AN7583
Date: Fri,  7 Aug 2026 01:05:50 +0300
Message-ID: <20260806220615.4078303-13-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf20f73-8436-4306-de70-08def40701e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	1q+wlAhqqAp6bPaFPp4ZSDtzCglBL6YQC645GyCsjbY2zoyL14wVeYC1auYDRthSru+IEXtz5vg+yMcWFoiAinMFJadijiD7cXKaoasiXtt05MzWKmQrsW85gEBUmMGRz2wjSQ7FACyy5aU5Oo94TEpDDqEAGAhyCVEyPb67YOPQ4yzfnntqIylmwhIIdfBK6o6kwwLQx7p5loEYp8kufQTiU4a6/5TZlYKO7ixAw8KAlf4TUnZB17dmU/FpZ2kBtAAffu1nj9P6Sfie846J6Co04MQkFN96YmOUuLYf6idM8+NkXHI0hdNcY9yB6K/Mu44/0aXv0NU9P8SLkek7B2BgJwcxyy5lU/KpH3yDuKo3AHzbQm1vf+uqiQmD0jUMu3UgPSdI2/nGfCFEXBvmkP21l5S168DMXxwR3ZQ4vF1/Is3XMXcHUbHwWWxDUcIAnw/OI1vIZ1nyA546SfzPnoU7d+REEPRtlMBCOzIsxbW8hUoiDqukaQsOf0IIWwL0KCInE48Bnme5QRLrIWpw6fPsrax5uOsh+dJ2jYAe7oNy98AcBWE5yl+v9xE79NCWCfuTTigKT+vyC/qLzpCS6MNqY9G9BEAt0+s7UCEUQ2k5yxO+NjYqPEELCVblLqnsZrmPgq6ykF8PJnurAIS4XrOdm+f3S9pcTQyPG2J/67h5kVynBRZxXIpVR9iljme/z31NQV+rMOdnPiqDXt1ZuvBCpeGv+p6NG7M6UssvsKFzsLaxFBrgyr+sybt1YHUx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K1NjOYYeZeX32Ne6o2OTCv9mtowkOc8+q5jQVys3t/s3Xt2XERHtYmJJq1Xt?=
 =?us-ascii?Q?LxD2+Mh6Qp+PZTA+TrAAqUsNbhMF2WvJswRxsr63IjUn9LL8hexAZngQ+g3V?=
 =?us-ascii?Q?o1H8DtSRw7Od43irpqdhdQQxJoY6n+D5m7tu2DsXuiqpkEYzVMCptp3yMlHu?=
 =?us-ascii?Q?RIOIyWaln+ONZs6N0gJyjVyQoY2NZPR889wNZmWXkKNRgJLx3vqXEU2k8ryo?=
 =?us-ascii?Q?nJCYXjslirlNY+QIRIZuAbZk7bwr4/JZbs5fvc8Pko7YjcnqOWis7C7ggQ28?=
 =?us-ascii?Q?2mHlVBtUTYQ09vxLoSFJjMcV2C5dDVd98p+9F+L/rWlDTAH58y0x4rCL98yC?=
 =?us-ascii?Q?fjODm9xowiKkS13Wh6V1x69iXgJLTba0Bk8hp7C69ROisiu2z71mszMYFgqR?=
 =?us-ascii?Q?sa4Tqc36C2Ml9nhGcbePbhCvuVpe9wy6smZtf+kD69D29wwfNww8Zxasztle?=
 =?us-ascii?Q?brsla4VLuieGSGOaouFFEBWWmN5bNjxVbq6dcA5WXL8QvcHG514SjrgzTR9h?=
 =?us-ascii?Q?YrX0tkdMJdbYPITIDBjEVd9DKVuCiXk6iKaVw5LMR+Cy73IvmPGMrUTftorV?=
 =?us-ascii?Q?tbhywLU2XS9cgv2odYgH0rouluuUifepSDryiO0ywbH9koZLmu04bq893avo?=
 =?us-ascii?Q?orZCX3biQjUT7Clu7L8vmvKWhyxq3KGw7TLTWEbiGt1pNQXsgRl4csEwCgm3?=
 =?us-ascii?Q?3nR1QNrmFN3pgKXHX36FNs3YP9RrFEm3nHx4kAaS22AMV20L78sWw1goz6Qr?=
 =?us-ascii?Q?ZyaG3/RTIXLB4WY3P+6QgxUVMsVp7pjDgoTN6AEv6DVYh0LgICIeEosXVjzh?=
 =?us-ascii?Q?F2SlR3U5+VOsIIHY/gTW9cGfwdkaob+XPrl+6LaGnx6UQkq8cYW2s0Xq2Qd+?=
 =?us-ascii?Q?aVoqqCDOgx0sN9eBrXXvuBetLisz7QNMGpy1/gRXFWzfJC/Ks/gPJnAHlJv3?=
 =?us-ascii?Q?hM4w4TtwVBGeTCEKxRXL1Z06pBBaddgszk1JnmF9ssfzCvQLYs9bxtRCvjkF?=
 =?us-ascii?Q?sOxrkk/VsFYJP+rlD4hu2EdiqYRIjOC2tb7NLB6YSkBSZYAl28rn2FXdUCUv?=
 =?us-ascii?Q?Fz0DmoxvAmurLoa7JoTWmdw/CuO4hbe5Qpp7U81g1RH06EfANxvt9S9i6kuM?=
 =?us-ascii?Q?6Yju/Z5Kq9gl2Taf5+ezN5DcJwEwkWGr4ffFqX6O7JYcQtje53UW4g3jn/1W?=
 =?us-ascii?Q?Ie35JXOuQF1oFLcwP/v2EADP7BXvn/BHd9k2tRQhgNiPDcOIbiUmU6wG7uZL?=
 =?us-ascii?Q?ck/YqfJG239CoZUxYxtW6x/us2dMid/FbzdtndtRo3WmyxTrwIaQeT2Ni4Ub?=
 =?us-ascii?Q?mR8OLgUYse6IHd0rlzRPlKnXB93Yfd81FYMUGhdPeqFewuNgWWOZaJWIHFrR?=
 =?us-ascii?Q?Ga3PeqpJZe8AijuSK0pdaf9Mg9DTVwmMyBmPeQWwEiHOHj8Zo6iaVGeb/2HE?=
 =?us-ascii?Q?8nBM+qOuJe89NMBByn4KxsaXWxQvrkFKTYxa7byGRgbC1sTVxCaaDgJJFPFY?=
 =?us-ascii?Q?YeUiWHNhS+dvcd207YM8ZLDE87U/Rs28qQd+x9e9SCYp/455We0Sri2om0EZ?=
 =?us-ascii?Q?1RFAfss2O+9ssRqbci2G80MfupncEgfVtgM9u64yZXTfKhyxfQ07orZpNLMy?=
 =?us-ascii?Q?68hTlpt8ysfdB8/f+mlm9164a22safYzUSkU5Rc1M/3gieTTgKcqu5jD0mlm?=
 =?us-ascii?Q?SgronQoEAcgXBuiAFGpnMUdrTimjQqbO2Pa4cLruFYSPXFNzZiyg9mUwKRpg?=
 =?us-ascii?Q?ppFPgtc19LEaw1VfsWt2yrlbXbuDS4s=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf20f73-8436-4306-de70-08def40701e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:46.8489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ul46C+HMhDrvu8djmTMLBCIG8pC6jXpI7AZtkmw5w3iTy44iYwTB6roL+TKNlQk9sLDeL3ZVIowl1APfddZ79v+LWEuXre6YjhMl0QwRobc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

On AN7583 both I2C busses have a pin sharing with GPIO. Also the pin mux
setting is done in REG_GPIO_PON_MODE instead of REG_GPIO_2ND_I2C_MODE.

Add dedicated I2C pin groups and function groups for AN7583. The new
groups must support i2c0 and i2c1.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index db6644bcd3aba..ff77a7832d11b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -896,6 +896,7 @@ static const char *const uart_groups[] = { "uart2", "uart2_cts_rts", "hsuart",
 					   "hsuart_cts_rts", "uart4",
 					   "uart5" };
 static const char *const i2c_groups[] = { "i2c1" };
+static const char *const an7583_i2c_groups[] = { "i2c0", "i2c1" };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
 static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
@@ -1165,6 +1166,28 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_i2c_func_group[] = {
+	{
+		.name = "i2c0",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			AN7583_I2C0_SCL_GPIO_MODE_MASK | AN7583_I2C0_SDA_GPIO_MODE_MASK,
+			0
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "i2c1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			AN7583_I2C1_SCL_GPIO_MODE_MASK | AN7583_I2C1_SDA_GPIO_MODE_MASK,
+			0
+		},
+		.regmap_size = 1,
+	},
+};
+
 static const struct airoha_pinctrl_func_group jtag_func_group[] = {
 	{
 		.name = "jtag_udi",
@@ -1966,7 +1989,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
+	PINCTRL_FUNC_DESC("i2c", an7583_i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-- 
2.53.0

