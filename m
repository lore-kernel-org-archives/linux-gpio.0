Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023130.outbound.protection.outlook.com [52.101.83.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E03EDACB;
	Mon, 27 Jul 2026 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138227; cv=fail; b=rs/a0IHF73soLhuk9bFZtUjD0jGtxy5ytMkgH2w6bBrN7J8DoGlH6ykqjYJzhog4k3ssoy9kbiEn0m/s3mRCcHbBqFbQ4F+p6FQQiLuK8MM0ugwp+6fbardcQjRMeL/K3parMaXgLaPj5BP3+eX3JsEb/KgWTRgQEVQ3R31wLwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138227; c=relaxed/simple;
	bh=1SqXE503qSLGWbVRWFWuy0RHLLSZ9wpQZ9Ad0+jbFmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ArF8aH62Il8TdVnMZ8yx0pUJjkSAqxHZuqfGNOjCt/uTb1MAfCo+X1vxDLUhJf5igkkvXdcY4o41zgxh7F+1W0IPTsAi+UYClaoFLSpRdkpvUVhg/DR/nN5mkp1Ohccn1FXh8QaCkJ7M2ZQ4gAdnnsmVnWaXfFLJ5BMPYrncVnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Xp8Xs13Z; arc=fail smtp.client-ip=52.101.83.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Xp8Xs13Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EB+rkuikT4qJuyR8pIBXzBouKwyCQ7mzXv3eZY20JHq4AMEpzhTZu9ssMrXTcnb5zbH3FsOcdnK8Rn5VapQrtFi6XQsY4ubXzRnTEtXjleSPIf89oKRHeOnX0V6IvSz3wcLlIEcMGVPSlP6aabY6rNpzI4/P8IzUvzfMu9IKnP57SIydLZcm6rVMhGWhVVf340LilQbF8ncq3wU6tc5Tp9JsbILlOU+VkZObpJW4x10pYFwqOrtdK+TDTjm6Uicai6pooWbSR+ZdmQ3nKvEQxLVuacDSRb5hG4bOQNtRGM0lh7b/F3SNUxno4TuPr8nzK+gRfk6cAJnYK4EcA3RxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3SuXE1btSQ3inCvpWtCmdqZ2Bv82V1SgemnDaB+awY=;
 b=XOcvhvvJFqpV0c3MLy5HXsShTJiJCgx3tXe7lePcXOpWtp6TdwHDDHzYJMG+x9vw/0/pnQ9u9wY2nV5Lo0IfwjYrN7urbXwiAlhx2yK9B2ONCHwP0rwUjg72yUxdAVbl5NHQd2SXEjTs4iCBC8NTHfF+O4kmiOMr8M1m/iLU2HvQBEX7jj0fFYVyO/BcZNT6z7e4O9BFG9KlJdYkWCk2oKePZl6Rs4Am/bd4pA+3p1pe/7ilixe346okxiH8v1yNAt6gCPTaCddekMamtKEy4vVqMywOSLOoXOcijVWnwy1BycJr03W37yH8Wkar+ABw7rUZ8E67hAyEkvzEjHlnJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3SuXE1btSQ3inCvpWtCmdqZ2Bv82V1SgemnDaB+awY=;
 b=Xp8Xs13ZawS9sUS/QqvRjoEv/534/6Pj3NFBqhAe79INZePX+UvjwNHIMUSvI9Gg8feYCLFY81R94QU/eKi2NUS4SGV2BQArnl2gC3n6z/gNPevQ1HYI5rteDSujbmrV6LKVyG0u3eXjyWzMXCKyGPNe+Q20e/XkmpIUlcl18QSO3Orw9JOLyEzErNwNPHkzgSL9YSg/K0lJmDivVOHR2yLmzR2RpxKP+79yHnFRXzs1dUxBn4G8NaG47iPFx7UHS75WViRjshPNIscv2wiKxR1nQ9WgR9pyIpaHimbgfGfL0yMgDU2dIH7QSfHPdOQnPBpjxe8RwohXR+M+Rtc22A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:30 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:30 +0000
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
Subject: [PATCH v7 23/34] pinctrl: airoha: an7583: rename registers to match its an7583 names
Date: Mon, 27 Jul 2026 10:42:23 +0300
Message-ID: <20260727074234.3761170-24-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VI1PR08MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: ea98d508-c860-4e48-7f8f-08deebb2c0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|52116014|376014|18002099003|56012099006|10067099003|22082099003|11063799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	/Bnxsr33QXK7rWZFuS9s7ZZgUe9lr5h9/pnGg6H/5Pbs4TwyC/A7nW/To2rLUmVciULAkEzmJvUz8Slf4YvGYvmnBUrSNRY1tJyKMGs7hHucscant8uL6MhINyJlMynVMI43bGkWGlHXoO7YGos1k3b9WEJGLOoESvurqohfHD//ZI4cBCk//3+O7htVsUhnpNbI+G0Wh6Cvel+0/WX/2NOli7zUp4NzwAx0r7wvvwmSDdrrwwwhnuSLHBI99ipQHo1zcwEAXnuVwpEVQ5aqeffpt104O0eS25LTIS1UfRwuz4ft1yIxIB/U8wZ964x5FREeCa4Gv7E3ng3U/9EyCXCUWGMYg+cw5z2CUuQembr8aFJNGop6DcdzNfLPdVVisxscdBl6WgdKSVRPVeY2UJvq0WUkUfTiyTU+neG/tjBScPy+ZBivAIiNlpfDzZ32Jg2yRf+63eK9eTOECR24d7Et/M/umTZwyIQXkt86Ppx37xYCk11FBwSNI+dhF8uwBxn9ozS6ssRhR6CKY20194lb8nbq+LQCBBBGLKJKqCWNoPEkXII4A+hd6SxKESrq5Lu1NaQmzR2HApljhiyYDfVM3F8jPHlw/CCUMedas0hLjZ6b69MPUuvfE2ockw26edD+OsRIU6QwKwjQRlpPqQ0Fa4CYo2rZTahUs1GOVFiuaPmAieng1lk+efBNADlnz5WutrjvG6HMNZFPXalVb/FGP5Sb7EQeEe/WFvNAo50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(52116014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?chLd8zbbGbJoBJA6gKvJbdas8Kqlz5qLnCjuXygh+Cd/0zsuPH7gxTPFGXUl?=
 =?us-ascii?Q?vgmOIUXwZdvUNCav2el/FqUmQPlePGRCh9eD6wESinBb9/lHB9AwjSFbnnh4?=
 =?us-ascii?Q?8ZQK5tZGAThaeMy+gc38uO8VkqEydYk+I3l1xzhdVPMXlMrWS/CaY6YKTBJG?=
 =?us-ascii?Q?Qg2Sq7/+stSoDn4sOiKDti4DVkD6pZVc2SiaRNfTbaQkKBYutGfoaCf16aj2?=
 =?us-ascii?Q?9vOdRM2/b/SsNUfGlZcFajdK6nzShOs3x0di612pbDjT0j1vWCLcBWmoY/J5?=
 =?us-ascii?Q?S2D6mGo/cypdBNj+TOhmwF8YZYnwQafcLD149QJFgovT35a18YT8vNGwpgBb?=
 =?us-ascii?Q?gJjUuSD+bIMK6BRTUytXmeTJTzk9xBJRmvgE6m0uDY4Gy6rEnPD26wx7KYgh?=
 =?us-ascii?Q?n8/VKOyE3V2vBKPAAemLxDy5sIEBl9iPoQ+wAyr0uskfTGOOLYovwpzwqv3f?=
 =?us-ascii?Q?aGHFmXkRE1srOC398c52RGOa9dPMXM9K6YkFgGiOlluK6P5nCNaj86YKycFN?=
 =?us-ascii?Q?ZOx4bQEL99BKQjSRiuY0L8B2kcrkYkCnHXjGFzf4ixyDqZjG7lniz/EvJmG1?=
 =?us-ascii?Q?h4ehIyO2IPlEb5tDke2XtemW1andcHviOdyJdz7AsE00f4my5Z4z28DP1CaL?=
 =?us-ascii?Q?VjhWJ0wTXr+L1QtU+mdw0G8wt5pweaOvfO8KlaMuog0ASm0te3k7W8xfQiNx?=
 =?us-ascii?Q?I2D8M9imT/a2LZQeBw7c/57h3U35yKsZV0oUDqIFbbYOsB48U+abj06vWrIz?=
 =?us-ascii?Q?z26vhMG7cpZTV5QKm+fPBCe/DTm5g4hUPdWKJ9olVUkkTArdMIF825k81KPq?=
 =?us-ascii?Q?9kMWmMCjKRHpqx0tt70SryRb/pK84ukaQR1KvfdoLNjsW0tOz5wCSOG/JBb3?=
 =?us-ascii?Q?Rjy6V87nZ38gSa9nKqvQs7X4zPjrQTunkwMRgSJgQ4Jsq0vLho3AnCLxw/y9?=
 =?us-ascii?Q?frMHpNPAKQV4/EvCtyDTzMby0cVWxFMXyHO5ce/njK82ma8e+BY3NyrS3bDN?=
 =?us-ascii?Q?SNUfqHHRSQDqoc2I/MHxd6r/3xWxdugkvY3u3pS1VEh7We6eJ0TeLrB7boMq?=
 =?us-ascii?Q?Eo3AhHtvAKZQYbG/Ar9hW7auJCkhoKiTUfeTxrYhL2ArH1BxTJ+T+g3nv6Ua?=
 =?us-ascii?Q?eZrGYhC6jp1X+fRneSCgybwacbZKxWVnCXBLYsHC0vqtvf7cU08z/AOq98K4?=
 =?us-ascii?Q?IZzwz3sphDMkCVX6716we6Wz8R3DzNGcnTF7EACpf0Y7dI7pmAzkq9Z3SBVX?=
 =?us-ascii?Q?315Rxfqsqq13tFwkfnyFKP2QBcUWk386tYKO2RKMbPf3hcP2wCBhNzVJF2al?=
 =?us-ascii?Q?gUsYckgh2F0pwWvEZB3awuUbOhwVl4bI+0hREeWsZVxuKj5HYkA6SjTs7JFY?=
 =?us-ascii?Q?4m+lASvwq0ORFPE7gPkZOAsaMaegkVG0MGGWuNAzLkA0oqBRj7Jhfr9D27Y1?=
 =?us-ascii?Q?zFiKREJnG7Ci2bUCk4UYE7nZttItlneCH/txDDLMt5HFBhCOVPYU2fFKS+e+?=
 =?us-ascii?Q?uBFXTFw2P8vVHjOiXB4NFqdUkL6BxVNiRDm3Ram58WsWqxl6GYvWq/U2aY4s?=
 =?us-ascii?Q?fvwph/fiqSHRBTeB83qld9zXWCX4YWY594vIIRDBGNO9RSw1N6fwCEzn6cj2?=
 =?us-ascii?Q?a6alc7W9dZUgNvzzeMiB/i1R+AsVPilPBmdHf9NG2weLX2bvGHWcyRFe+kyd?=
 =?us-ascii?Q?eQZrIwNw3OczAGgASpJG6BTfhE+nsyiAULXFn20F5vtED0qKdfnhHEm8t3xE?=
 =?us-ascii?Q?g5pSwlIh9M3jgDLr4wm9vFGN2v0/2ZU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ea98d508-c860-4e48-7f8f-08deebb2c0bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:30.5974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBCJ+Bp07e2WWis2RK9xV9+/mgb80d2VANiFDT+2oE00am+O+3TPXL5IeuB43Oe3Ava8ED/19x0me4laAGj4Uz3ZTL7oWqeTuWlo0Nf+gqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501

In the an7581 case the register at 0x1FA20214 is called
RG_GPIO_2ND_I2C_MODE. The same register in the an7583 case is called
RG_SW_TOD_1PPS_MODE.

Let's rename this register to avoid potential confuse.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 637b9377ff8fc..b0b1dbbb4d768 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -8,7 +8,7 @@
 #include "airoha-common.h"
 
 /* MUX */
-#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define REG_SW_TOD_1PPS_MODE			0x0214
 #define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
 #define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
 #define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
@@ -302,7 +302,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -320,7 +320,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -640,7 +640,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "pon_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			PON_TOD_1PPS_MODE_MASK,
 			PON_TOD_1PPS_MODE_MASK
 		},
@@ -649,7 +649,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "gsw_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			GSW_TOD_1PPS_MODE_MASK,
 			GSW_TOD_1PPS_MODE_MASK
 		},
-- 
2.53.0

