Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023116.outbound.protection.outlook.com [40.107.162.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724CC471D1C;
	Wed,  5 Aug 2026 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933324; cv=fail; b=W+zwLSkNxXjuO3hsLaaRKK/eAa0noNudzVn7gVkE3uhlqi01aF7NKYTYUuOqF3ads5HLq247+Htr6VH2fEKn5NCA8fFCfyVyD7/hq9KnjYNUCQ4G+RpQcCdR5Qkdoraw9kXwsEihDlx9JvIuTzXll8fs8/yG7bbhfRv9oKootHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933324; c=relaxed/simple;
	bh=oL0BooMamQG9THpgFtFWaDraOpwSFqU7rdaz4y2jxCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sTyF7UPmCshBkyFcwKx8BloqkC0Ja/WmRPgS8XBL4ZdVpHT+ZvjbcaoL1avfMbDQ4z2FFiLB/wTU1egT9ekKRTTQCeu6bHlgjo0ClRCy+gh1LLWf5rL0p49oEtPquHLUpPAUdiVBEtLbV67k58il+4b0zQg05XRg9PZsN4syCPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=SNzLFMfX; arc=fail smtp.client-ip=40.107.162.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="SNzLFMfX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktRt8YFvhU6NrdJfveqeh+2nJ5tAuy6aQIxM7ch6T7CTZDwHt+q/eMOkjH5Fe+VNPwQUn9yIkktFrPU6j/4IDog9fsJSyHXNChlmJLNujYeyrdVz1s2SuJhXQbHDqcXioviHHGuTeU68OFY9kP9isLYizYiwG81zTg84FpUM2vMuEQIxhUth/Y+fH9fDneuTCbXaatwTBvEV8rgpmIL/xPsAzYKqKvpeDpLMibET7JRmqYzBU3oQ0IgGRZk6o3t7Qa1m1/XWTnSr/pX+IrGb3ewTq7aoVHOViMVk812bsKNcdtRV2j6+KeDjc/EN3kAUl+0fv4fbx743raky14BZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSGWTYGUz+p7AU31oDHQoLQ4cPUghCcaqPQeA6lbcQM=;
 b=XxjDgKmSBTdLRhvsg9NCbl45ZZ4uivt18fkDevBBED2Dl/tfjR29CH9kchwSb/sJax9nuKGhNUeChgj21Iqg/imJ3O7FO7laxs2CDezhKpc6IfXJCbQ8CBJCe1Ubvb156uXANPklFfY+uR2seGr/BOODCh33w5qf+ma1BnTOfSxC3H0jIlmCkGCY4LuLwCrGlIqEWyybtVk0Elcc33XwF4+4sK96/uvqBK/Mj8q0DfgkzNWJ1yu22efwoiIaUtsPxt8wNf9uTFMIqxkLT6cNXxkzZ/ilFBYr5gFcWsqInfpE056V1UhE31LJnbsnOmQMIWLdgM5hQLM3fF6wPtECOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSGWTYGUz+p7AU31oDHQoLQ4cPUghCcaqPQeA6lbcQM=;
 b=SNzLFMfXyt861MXocoH1i63ybjxrhhHx6Oz0mZmZI7IexBD5Riy/hNxump1T/WNp7y7VNyMtr3dyexSkArArrbMx3dM4XXeRsXcIKCgrmQcLH6dxcIekbUYLmbKn4rt6yEnooqEH3jnDWSnZVjZnj0kHQqKDd45rN0H1UwJ/kKcaNndN7lJz8xNWF5OnWX8dWfTVaV5reALpaSdMUuF45wpcFCgmS+HWjI3rQ+t8Jegw27fF2eqpKCBqPaKxJxJPZD8lsQtQCZ5GXSNEcnKbmuRwGdU92PBTVRBgrnxzZvQkxjfzpipmUY6dZkRZq8r/KO/VWfKnEBqOvzOYJjBS0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:35:14 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:13 +0000
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
Subject: [PATCH v10 28/36] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Wed,  5 Aug 2026 15:34:00 +0300
Message-ID: <20260805123408.3767648-29-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS4PR08MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 101f4d68-2669-421e-bcbd-08def2edff4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	aXdfbEgi4tywY/lU3ffPQdWiyoSFGbC1fJ4SLvMV2Ibbv45N240fF7LNnhdRLzr5H+8trmmxlv1PJUqO0m9T2BvfFId/TKgUB9hF4WG6IX2U7U4pAfRqxJ75UOBlfcnq60VsP3rmAHCBCPOBr1dozEnHR3um/7sSCBJ2lMTazzYV1A5RR/0nCRQAbGUdUfCQ1z7Tuz/RrE1db6P9CefVXSQPZUTN5ZNwDSlwBdJVOtzFpBmv8quuNR3uK2aOz8rNO4aaIYYkH3DyQY/Rji6a/8kYztK101LqA4I+2riKMVaggRrjJG/urGuOV30x2bw3SQLpI+7Drx9prehEKsVHfWQ3QpCFBik0hrfykWjD1c7v0jXaIOcxDE7hSKtw05b2oNKDs49+P/EtGe/ZWlcWvONx7SWwbCTeWcIE6p3azUr9tutkFfOlTQqe5epF3pcaRpzKIWbLTEMS6vxSfUZF+iTOe7mT7DNFWXgi+0KUZLEqLGPBWP5V0GAuRwg3PhXSAY595oJ64hTOG3YUiAz+xC2Jz7OMG8N//gBR/YoId1HYCxG/X0oT5W+23Ituij+fn5I2nwQtYd9kVT6EACWD+1k3rWY6M4h62pa2vD8lATFdmAedsk79ehzb6Dz0M8jfvJ0fJFLYSiXYIev0sn2d3dgYFUWx862Lq8P84NgzFabTfWRjy2fYi8Pa5uDCvwawBl7cBkpNne2WE1NMRKsjGTNwQJLpLqWgSWtDOCWFIBttCJ0LzMBTtAER4XAaqdK7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KN5zbcMDmDOu+/V867dt2abNt14e8vl+WRZRnDhNE4GCfTIQbdnnrjG2ll2c?=
 =?us-ascii?Q?GVV/38/cs/18D63E9L8JSXNybgkeIajDW0x12gCUwxAh9cH0hRCBn+qKNKag?=
 =?us-ascii?Q?yh3Fq9ehdK49GXXij9OrYNuq9eamP/RGbMeMCfb3qqF+5Jgq2pVqNF0izQTq?=
 =?us-ascii?Q?yvLPmkncI8ft5I4SMQJAFf7dqiNxNoiyjg5tcVxnKLSUnpVaqXI9eIdgY3Kn?=
 =?us-ascii?Q?dTqcWCfkd9UfBUEAn4mn3VyOkvolhN39G8dtOPUNwtTwi4gfImgyMRH+JzfN?=
 =?us-ascii?Q?GAbnlgrP3I0LlRBryk35TX36WuCNc9MjKFSCzuLXxM9mbb0w+xnS/6GxpCmI?=
 =?us-ascii?Q?4yfe5pjF6Nu+aqf8v8MtyEDLYHzCvDAPcah5km9toozoBKSysd/GfF3dIVfU?=
 =?us-ascii?Q?15+MpK+LrBtpBDl1hY5v8gLtWwUYQRJNmDwVZHTEcY5/5alHqrv1pd2HPerb?=
 =?us-ascii?Q?EEyipH4G6M6MESKRFfauFF0CvytfhyxsZbm5rRAiyzXdJKIYNvU6Ro2LeRMb?=
 =?us-ascii?Q?NarLHPpLEdi/DslDjuxWJ8+E11++Tliu1C/6riVXsOpZwLtTvWhpI87k1KMe?=
 =?us-ascii?Q?guG5xuMFS+sVhKE109Bxpc6bV+wSwMEMV+1Uu8ewM/OnvsTvjfELG+76p0e7?=
 =?us-ascii?Q?kNHceUJyhXwVX1CBFaZdaZNcNZqW8pONLT9rCN5YL2wyZbu0KJzIZQLnrP8X?=
 =?us-ascii?Q?9UhsNLZZxCNwryHkfLwbg/PMk8WBY9pNNHgUN5xiGl2p6/Hag/RhyzwfOjVi?=
 =?us-ascii?Q?6LkMYOG4/uuU9SfJe09WbHLXTharOGX4l/9l+5H8lNQ4jtzmLM2s78/2NbwB?=
 =?us-ascii?Q?zDRQBSSuWJSv+YUIaqU6Hru6MocV0CusCkeqwh7/fu4viuS/XiI1NBMtppDR?=
 =?us-ascii?Q?SQciJerzxa3M3iaoGz0Nm1U2nDazoVTleMuMo2ki/sYYnZew/+EpR35kzud9?=
 =?us-ascii?Q?dUY2r0SFjYcAtlkuyx0KJcYG0toPjFkw497G6X0pGvJX6eNYnL84Xv88SRJ5?=
 =?us-ascii?Q?bBgCqnMxpJqTJB8+WcBNPAX62jCOFs4240IfVFtwcrFXncyWmwg6OPDsjc7o?=
 =?us-ascii?Q?3JkiuG2gTWOOxFyO1ns7QwEwYZCvthwvXD5Grusm445Ap7l73jyLqH3ADsQD?=
 =?us-ascii?Q?eVFL7EPlrLxlzonmQsaNQ0YPZUcZDVgYlOWc3mQ8cA4jJG4h8v7yq7ndANRh?=
 =?us-ascii?Q?JXpVMCHJ6556vc3D7j30WHFa+p/RGLZsooxu4KjW1HCKqpeOHg4MdS0TnlrX?=
 =?us-ascii?Q?QOKK4Xy3WuVvbY21z9rJpoZn0lxAtFmwwDbpQ3PapZZ9BHXbQooFmgCd0Fsz?=
 =?us-ascii?Q?VkRLEpGySlRi5/TPhwK4n6/UqlqvulMZGbQXo73k9EsWnLyZAQCb3+StFwgV?=
 =?us-ascii?Q?KQ+i88YHTbi0vlvR3VGajziz6jK00NzljD+bXjIgrQ0+AShQq3rNfKV95jvm?=
 =?us-ascii?Q?TlyHkK1QqH0Tt4blTPhfLq+06h2ibKOXNRjnyxpR02hJzTUwT8PjTcUilZfy?=
 =?us-ascii?Q?N3dWR97tgUITiaxjvLFl5T2o+4z8k04e3fhcFnkCg13p2JhD3Tvw4bhDc/9Y?=
 =?us-ascii?Q?bBGbZoaEM9bsE4i6k1UzUuzs2uIxNuinQYbhUEYAX0g9BJviIoA68cRuX9GO?=
 =?us-ascii?Q?ptlFTqtPlTFYsqEyr9TFdg71ome3LzdylOomW0B2USuH16s8soexrQv2d6VH?=
 =?us-ascii?Q?ETF+weE1mBMGusmzlgqT6KERagIjcbcQU+RgTkMLR4TrxZx90m1oE5tT6woA?=
 =?us-ascii?Q?HTKlPX3jhm20KQ0jAM4HY3bn3QaWF4Y=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 101f4d68-2669-421e-bcbd-08def2edff4f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:13.8974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuXLHELunJKLFqzU12Y6asKTMebeO6jcyRJ7T+pdIePG6HAJzljglAT62VEr3gNdNPRJmLdSibVNaR+D+sqtY6RU4zjA/NcrBxGlZxRJyZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

Add support for uart pin function for npu_uart pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 44efccce78c55..dc88cbd8746bb 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -68,6 +68,7 @@
 #define REG_NPU_UART_EN				0x0224
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
 #define REG_FORCE_GPIO_EN			0x0228
 #define FORCE_GPIO_EN(n)			BIT(n)
@@ -571,7 +572,7 @@ static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
-	"uart4", "uart5"
+	"uart4", "uart5", "npu_uart"
 };
 static const char *const i2c_groups[] = { "i2c0", "i2c1" };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
@@ -751,6 +752,15 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
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

