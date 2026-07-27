Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23403EAC8D;
	Mon, 27 Jul 2026 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138218; cv=fail; b=PS+y9l1zLi39Ibyjc7tenICA3sKEQJXkIZWpCfEHTuAOsBhFNp+QeijVVE/s/Hts1LyH9G5z/gMgubaURqQVHznKJ4FSNCMKIJ3LMGLb3ZA5g3qGKf5I09atHAxafJQQQPGDJBqcaWUiUqJZ55v5/wR8tDO8l6oL+mYzaG3aoHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138218; c=relaxed/simple;
	bh=UmsayjxXrDUhPbDevEwjX2jNsznEkAxUqTelc2gKiS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FsrobN9zE8aUT7Rt9GrFW7fC/zCHglmTcoA6UWlNtUP2Tshcdux/oScQQ7+qay8ZTgc7ZwUAPuPxh7O7CeVcqztOlEUt6+tPWnwZBeYSTSOcB26Dkw5Ale29gfh6R9op42L4nZ5M8HsLvT2bTBGNViOAlVVKYr0ON2BjtOLIHDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=PAjQxEqh; arc=fail smtp.client-ip=52.101.84.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="PAjQxEqh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9ytmn69W0ll1JeiEoOUIsbU/xFRfKrW4UwnFiDu7fcN5YoajwSP021CrvNE4eiETuFAzsIOAvCMY7Iq086lPHSGpZJ5+8HjoWpg8s7qApONZY+l2qmx9lz+pCtIU0i/Qh3ncpjby/8PztFCQb8FWWBxF5hqtcgUa1BNljzc+q9DBfA0Hbz9zzEl01uK+yi1pbb3YcGlXRwj5z4VoDFdfFwUGiSZUXGyzAMkzLNtF8BXR6D0kgSdfFpIhtx7AOPrY4nEinf88Vvu0m/E5JnJsNaQIMF4EDhAi2zPcVOPApVakkDsxgDEyhZpt1F7p96WCFOeGxVWZamne/ge5VaWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD+lxUNPuCtHCMY+8aJM1Qy/t5a9qx/WpULHltCbXbw=;
 b=A30MKWFKSidmPwGTCPuuApxffuewBvnpeE57SFkYdrQJhh4y4/8G1jiERGyrBx00O/nIeBugAuwaHNX8SV6H58bZBfFYFCkCuXMBEF4E2fWtUTZvi11lj9B7r58+CZfybozB7EfLACUit+7v3zXAVYNkktTLvBJ4fdbjowZ+HvxAIICGJN1bI5uflDjQzPNJK5kV3oGDRxiP5++pOBrDk4DEqzmHfV5UtNN3ZVRFnAsjCWLnoZWnAN8g0WeKyCZqKRdwKoKwivzfwuHCPYHWnzulSf2zVIMYe9EHD54I69A9qOX9x7sIT3mYaFOzeaiS5+2xxiJBkaGCamM+JEsVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wD+lxUNPuCtHCMY+8aJM1Qy/t5a9qx/WpULHltCbXbw=;
 b=PAjQxEqhmBZIKEyhZKRrVz6vL7PGp5esYF7VhLzbe2G9/NCnqsenw7g9TIlWw28RKuJ6TVjxtMq8tZyjMLHBGOXpf6hGsBIgaYweY0VQeHIt3BhxWchV5fxZjX2mkJMPdnkuZ/a+lXaJjbjlM/iN2g1ArHwH/pNGrVLNHhSBGWUB6lVR2oZ8Yc8LFSgltDHNRDn860UMQSxIlC1WpiU3gUakXW785xzfTvRCHiPL+mFWm1LgSgXZsEVJunkyByn1OHZzaRZ90CIUj6CmUXxjPpM13Xc3N5rfzmyat2xlo8TvUK5yz7TDx+c7jcc2C6voIJo2E32jqmmW2U9pCkKldw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by FRZPR08MB11139.eurprd08.prod.outlook.com (2603:10a6:d10:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:32 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:32 +0000
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
Subject: [PATCH v7 24/34] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Mon, 27 Jul 2026 10:42:24 +0300
Message-ID: <20260727074234.3761170-25-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|FRZPR08MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: 30938a16-a12c-4704-5b52-08deebb2c1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|366016|376014|7416014|11063799006|56012099006|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	KglCeLhKKODz4gRL5gQCZtiaASPVo4p96UeNItz6G3bC2M8k3RnUSgc6Ow40GtVROCbrKxmVVWVfIGQ/FBNsw/NXguF3M6jfbSxgLGhq4GzRlRpt7o480vpECK00Vk4RVrtLF5f6KFmqv0Pd7IDF3qYqcy/I8uvzuAFUxDte/IPCvBcpovy/0kKaFUqDBPPKhTyCuYUGKAWJnsl2X2iudlP5cYOQ6/JkYfnbGSLlHtujovAai0IA12GuV0ei4RN0vLS5WkH9T49FgtPQX2OWYSuA7hIPN2J2HxixhTS5cf63b2AsKYj8lljmIKDSYkvYyKo5lUQTB+4lgocxHswsOYu4bS6HYlSp56P8j6zTNoAg6aUYX40htHmclTEH+rXRUClh8/HKepsYA9Qz/tKvtxU4EcMH/dqdL8d765I2cL7Pwbg08U9UAvdfFPt3Mk5ivEOFS3CYYVhLvgjjRTzXP3mA/wqzMc0QBIBxmPRwNVEgFCLvq7NSOnXxUDOvDHWMRhTEfZbFxoLbk6TL/LHSprZMHHNcewtcGgZjR/n8z44DgMiRH8cxBg/fVy9saayk34S64IDL+U7+Wx51R8Kp7lbeFzZmFm7NdY1Zt8U+e1q6ET9w6RdWbqOIZEsPs0wxHeQdRJVpQpb+rHbb1nvPDPASIkr5Wtw2svvmSBVr9b4G4nmMRtVYC0s6qWCvZeL0t0FEGiwz7rdht03bx0xn79FhakP45mll1LPvfE89XzUQlN6AQ3BYDNOtqpbeAWOz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(366016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zZQDADaZZlfDQRTlrI961PPJfhK123SMphjKgcQKUWjCywMOi+ytLy6PAJy3?=
 =?us-ascii?Q?e9irh5tnxs3HTzfRRznsXlkj6l21g+sq/8tCTuDGfnacB3N8eM8Tw1ae+VJZ?=
 =?us-ascii?Q?mp6tbKuQOjNbuhOoSQ/8EqDfqRt7SMPCVueukW9+Pm54MFcBJTOzmZ9pW8ZN?=
 =?us-ascii?Q?1OfBqNMvU//HGCP+Y8q4SOpedytIaYUXmCEck6qIH+lKf9r59n+MA04niFn4?=
 =?us-ascii?Q?ZDziFnBt0Xim7sHuSfQ863hL/8JF2a/VrfytOBjoHbLYKLk5ctK8erRTHdJv?=
 =?us-ascii?Q?gt6a+YG/nYzsNDlFmfM21m57horz4DKIi5SH1JTJovXXe/H7X++2aARu7Pvg?=
 =?us-ascii?Q?Rd+vJMvg5/lnvJgRoPLU5aq1kM6lEZnyIr1exjWZ59Z/Au3vVy9nyzDWwW7x?=
 =?us-ascii?Q?CIAHLRgprx5KHtMnUeJOxcxR33qh6/fxHShClZR/ErimPJDZcLRKCfPzWCqB?=
 =?us-ascii?Q?ZSZU7151nVI8t/AYysZmLKylDVGVR2VvaYas0xRpUlNbDRrqYndm49qecKnj?=
 =?us-ascii?Q?2HolofLDP5uGY9n/OvJij43kdp7ZlDpvHaqPHwIdiyCX/xs9XbihA19yixP5?=
 =?us-ascii?Q?atqmpZygygRGwOQt3ohlQ13cIz+JjeS7DOCnppF+x39kjocM0+h+NK8CsR2A?=
 =?us-ascii?Q?mOqVMXHgP+QmF83RWIGKGlFHNSuuWAwok4KutzOlMUhsraVSQlpTrSPfUGeE?=
 =?us-ascii?Q?kvQLv3kcwpNNGw2q9yLSTV6CFEClk0XCdBdSiOfpEJayRKT6N7uL3QPJB2yr?=
 =?us-ascii?Q?sw1dfYuCfEYrsxOJVcCZwiOVjA2nH0t7fiEakThMULUgPcYn9Ik2B3lvwygl?=
 =?us-ascii?Q?Te5QTdxM43XoGv355HeI8X6YazwFoT+bGdLCMBnPOZ8eorzDtcBoJs9WCO/+?=
 =?us-ascii?Q?paVnwV9JO1mCeuKHEte7S7i8nJPBWPFxLF42i4GQBMNXUP+/0dABdZDPHRP9?=
 =?us-ascii?Q?lVS+4DWrbakGZc1O8EOJBu8tVntMIs2tLr1Dq7sZCNgLSjyBi+Qk2UyrP7se?=
 =?us-ascii?Q?oaRXG6vRvieek9/MqUVm/CnH08tbHz+KsRZHMwRKTSKKIJSToopoOUKQTCOB?=
 =?us-ascii?Q?68vUTKQLiOmuECrfxBrlPxUhESZSbZCfnLMqWhRcX8xEsvB+zP3stM4sJSua?=
 =?us-ascii?Q?Y+ijfAMliDbYjTzy1pR95LVrAtuIkMR9IDJKEbQdrAhIQqOntfW3LPWM10BK?=
 =?us-ascii?Q?waadqewwp9Y4nomQKKNnD+ptKBA07P11ldFVaMIQ9/f2bbU+BiwlUeVxV5UD?=
 =?us-ascii?Q?qmsClfsiasP1B4PxR7DvVqB6SxU3vT1AbKJ/sWhz0a7cNtYbFEeQ/Nrpbplz?=
 =?us-ascii?Q?jl/ya02tZh9XNKwWVvsgHdyk6DSN4Vb3z37XaPI+U3qnKRfVP74+gpw0KPc+?=
 =?us-ascii?Q?pkda+NH7/YI5WjQZpbxN3GHj/xzQjzL2kp+k4ExDQSqZUmizzNiPhxCn19fL?=
 =?us-ascii?Q?Yyg6/JCXrO8qg4VrI2R7JOvHV8NH7q7agrrigAI0FOwxeb/W09vslUJCvqzv?=
 =?us-ascii?Q?36KBPOg1WrW8OifLT4OaIFSW1+H7H1kQa3AURN0fuXAaXN/9Kj9S4mGDnkG4?=
 =?us-ascii?Q?Py0lAXFyZKs4QTMHUXbsOle+8sfaypUwklIH+BPUaHONRxt9UyCy3AHGMG1D?=
 =?us-ascii?Q?p4FgzAOlP90qf8fq84Nm8OEwkUDKIqw254PTRYT3CkcscwiTD9Bc0dxfAlBZ?=
 =?us-ascii?Q?ALL7auF040dp2oX6eNtYiuUy06b3f1kGeIZ8Kz/EWC/7BN1YTJAfKiDAJY+P?=
 =?us-ascii?Q?xMdSflp9XIFb4BGT1LoeSmH85BHQhiY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 30938a16-a12c-4704-5b52-08deebb2c1ec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:32.5643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/u7lPF8ElrYzXSQJX7qzfgv9YYZe4Pf4jEYw+jLKpvB5lJwCC4dT72WWBUb44PTQEsr55otkdDJQh2dy3yfVYPbgz+4InBx42k+sKpQLmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11139

Add support for uart pin function for npu_uart pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index b0b1dbbb4d768..9b5c7ea5e5472 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -68,6 +68,7 @@
 #define REG_NPU_UART_EN				0x0224
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
 #define REG_FORCE_GPIO_EN			0x0228
 #define FORCE_GPIO_EN(n)			BIT(n)
@@ -569,7 +570,7 @@ static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
-	"uart4", "uart5"
+	"uart4", "uart5", "npu_uart"
 };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
@@ -754,6 +755,15 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			GPIO_UART5_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0

