Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4404B3ED5B9;
	Mon, 27 Jul 2026 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138226; cv=fail; b=lMRLpQQuRG92PLqeU4ndMmxcPU5U1HaHOgu09HfipN1gkrV5LqOL92WN9ZTP19iHDOortaFI1BPo3//7RKHuQjYjcHei+NbeaHO0HKPt0SnoItsSy7a5VRyYI28iX8ONsDubGrRjaRIYrVFoFjYxFV0z2fArDUEQTv3Xqw24T6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138226; c=relaxed/simple;
	bh=zO5rmcAL/Zh3EfCXZDwl9piDOYoxQ7GjtSDNfG9ljI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G1ebcnqlAzXPHnBEXli9OYIvubvwv05H/m3MTm1BDmHIBEQYG30F7UEjov7tPwb2rSYQATchxkGhjk2QiSzO/gnfUzcIIFoOZhapFYq93sA+Jen7pomqskOtuz/Wkzj2BVGVsbsBAJa+g6lBEMuNb1oozLQQVCVmQ8bC1Bsh/bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=AyTTTELa; arc=fail smtp.client-ip=52.101.84.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="AyTTTELa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f//yMQAAx80F0ZB30Vx7Isnq9Z0dxnyXQWmKaL/g/TbEpJoomefsx+QsWVUEe3T0vjLut+8ppWeISzF62zRgDmrf4SZs8yGV0B3WzJMKHrKsKNB/C9CiXvaF1XYdpFrKxinKOJZZDF7ksQ8uH3D+ed+iCpMsV5CPYfqSnreZVEYm9CNUw+tMe65gAgVizYrv9Q7nv3Bpm196RZ8D1VzA0mL+uLp5siABF1dzP58BoulHrhx6JXUJp52UvjYRL2GsL2QcF5e90wBwZKEc6i84lBkDMXb5wKxMeoT7UrQ3w4YXKAv7awCsmuVRwFz0+f0fYgS7dyuQUBV586sokr3FIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrpT6Fod8O552THAIhKFu2hbwaeWqitLk5oufI+Tnys=;
 b=DCCCSTtqJ+UfaoI5DBLAuJUTL4SYgPU8BmrwUFeks7gFreTjAjKICbGN+UwzE7egFOHTGVmOMi6iktabiesprANlKCPBmlad1n/mxJb/KmTm3/0GpQ/fc2vrMkyxDp2icF85jETyMDRNkBvVGFbf6G9kMHk1N0ANwiiI/2IkBSkCN3JBk23DdMFDcRczMWH0G+ubtFwna6S2Jegz13iY1c3mBmpkiXha9HMEXFbNeVn/7PMkhtEWiZWI3GYFJ39Knoi4M+z2bgYKpzvjp0W4dk7yUm9yOwMIon1xKnAmrnNERjitOCdD7kZe0t3aQGmLAXfDkz3YdAYaHx+LG4XxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrpT6Fod8O552THAIhKFu2hbwaeWqitLk5oufI+Tnys=;
 b=AyTTTELaCm/cwIuughMdCFKBP2qYm7PDp4y0UQ2soBueI82v85vso0EdSab8UNKh8W3aAAcEFFHdc9nXrqB20fKwuiG6Di+WWiYjjq/wLx82dcG6CTRb8pLYRtEZUAD27s2Wdf14PHB66YlpfGyCGRWiD2/Bc7Lc3sdEmi6BsfJvkDH1UHitQkKqt6FiyclMlfZqSzjVwvR+8jcOsbZt7TJC1YDhT6hZLKim44wPbJaPw2aCIEqc0TQsmHkUiwd6qPIoSxuLomeWYQv0Boi8aEcX9AOKv3SOnz9/OUJVZ1Muu6xkNnPA0Q6VOvIq9WLUl3H3E49Xwvpm2WsoezbSBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by FRZPR08MB11139.eurprd08.prod.outlook.com (2603:10a6:d10:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:41 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:40 +0000
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
Subject: [PATCH v7 28/34] pinctrl: airoha: an7583: add support for olt pinmux
Date: Mon, 27 Jul 2026 10:42:28 +0300
Message-ID: <20260727074234.3761170-29-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: cbb199ae-197c-4383-86b7-08deebb2c6d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|366016|376014|7416014|11063799006|56012099006|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	AofIqreOSAeoQAaRSZ10oaYEVFvJumCwg39tlW2e8vKnW7rsAP5u1bOBSqPT7u36beBfqETZvG0V0p6hYYjF3Mvbb5dwQbn0UZqFi0SCmrVECEHjGYBcTAiCofk8QK33Y4gImThcC3I4x5RR/hbc7AaNvUncsPniBrtBBApnTKIdt0/IozochMWUjwFaRq0SGRkBmsMmarjSbqySyjZZ+NWw+SUi9ar3DXkbwasH+CHJIS6twlmiF5uJ8+ok5gIw5UfdvI8DbU3fxXQrGwuTbvIXNk4nJEBS7xYU/T6hI5q0pbey/banbbE2qlIBUHejRbjD9Xg+4JcJq61c2bLYD0fA5VWYrCSpwtvorp9lTIsPbSTe36PLhyBFwt1UEBPRhuVpI3evIYAFjZfb27Ho8fdNoV+UJn/fCOFRIQge5GfzWgKqJcpecN0efypnpZEr0pEBtvear66501fy7H7dS3jeBnTo3ImRvs9NmoYhDDc8LnnWdy/byhOBvyskkhXFvl+Qt0MGbsuEIqHLlhOW8mTrFwmuhQ0QmQrinHDItTQtAyuaL7qdLlCHZMwZZBb7N8wW9RcBMdk/oQUeC7qRnxOtGN9ldbNI0zJrIW8IkXfOT4phtnKNTBImN57EXBzRAFyPc8sxk+v4BToR6oIpFNr/Yt5Mm3vI8kgjOBduWFmm+UvXPr1Eci2xpI+SP60/NzUVdSRAeUvkecHJZvfg5wQQ8CLgxAvTfkQZEE6xecc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(366016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8hV/MNjX9my355lUU7DtVdBqw1heuTBBU7u1daeR+SeOhQGbUB4QI9grek3l?=
 =?us-ascii?Q?Bl7DBOslzUXxbEzYAxlF4tqvlYG9CLRLioDYN4BvIlg4sHE55PKyT/CxomoL?=
 =?us-ascii?Q?5gIXpE7U37K4fXa7B2bVoQAeRrGypU/iZ2gLjL8Rn3/wuoUMoNIFu8Jmy9Xw?=
 =?us-ascii?Q?RJIErAsQr3oEurtIBnB5EFl4RVob5wnjmYEgOeHpz1utjWymsEmsajIVANP7?=
 =?us-ascii?Q?J7GWvRfAYSShKOdFdBe593tKnajUq+4O+S1u7SVwvWK6+8D6+siMQc4vfFtr?=
 =?us-ascii?Q?XSRx2cLqB3ARzyi1CDoN6TkXvGK8CQgT89ECueKvMIcrL25DMyAXQU4hDvuK?=
 =?us-ascii?Q?88b807IrvOwkif2X3X0RCnnKMLM1aW2wBJNcDRcICWpE2crm0JYi8ikKbb/Y?=
 =?us-ascii?Q?+GOlyIyC3xozDUjKvIv4DpHkzB7q9L2yQZuwRz7c07Xi2vN2yKY2huMc+2Dg?=
 =?us-ascii?Q?xyHpdC8R93J+bTh3dxhkmUyfS2I7NKYedlTcLit0UKvK2/R16t3ZL5Ref+eq?=
 =?us-ascii?Q?z5RfidyJmaSDk2cSPNrAtglYnDS2/JnaEiGha0Zc7eGrDMnEhmXP1c88fhEi?=
 =?us-ascii?Q?xX4Dw733NnbiH0+emOYoyCXdeju5Ij2Vp/5al0yv7Z8Js2s+MPi0U/9lwdJy?=
 =?us-ascii?Q?qaRqGqf9LcLuFf0YYhC/8/3FyrNkeOOL+JCWN4dF3jNLyAjFDfg5Q9TYjZAI?=
 =?us-ascii?Q?0It9TjtmqhWlaH1/+bncNC1J2+WyYhCYvNVF8ZFqe79nYWJHgF9TnWGryqll?=
 =?us-ascii?Q?Y6tQwTfOgsjNqpr+KBe1Lxi2JXmHkQNI07zwGTIsnFLq681ITD1b8bveJx66?=
 =?us-ascii?Q?LYdKK4XBvRBg4iffVId4vxsWzbYjsMMN4wqIv8LNtHRicItv/0NdqlSn2EI9?=
 =?us-ascii?Q?W7BKmeDbxj24o6wGKNasK6DP5mgYqnyDIKfkxspFEvjigjU6BzduwMlReFv1?=
 =?us-ascii?Q?F3ZgkhgsbCyDTE5aNlx/QOsjUjV8Aqyjgc5JjLRSENefPxJUzDG51sW+GNbQ?=
 =?us-ascii?Q?bf6o/XBnA4ik3keDPDVK7N1YC10p0xi1a4wHP8YbSElRgCn8qZ796MMOEPoJ?=
 =?us-ascii?Q?VkdTFvekW6anwJnjLrUL4i0W1I2FvSXaMlayLlT0wl3mYDWO0gAwMwqarUP4?=
 =?us-ascii?Q?G4iyfEJqLCivvhOMOxtkEgkLcwQIWpRIMFg/4yJ6HhTAAPq+m2pP7fmlV+sY?=
 =?us-ascii?Q?ChXgi5qReGh1iXyg7bry+VkFSjFoxbCbxXCM83YQwYiId18/MoqMCjemUsr1?=
 =?us-ascii?Q?kKWW3FMn6Io8v0aMldLynQzVrvfSUZzHx+JT/4pBk3tK0zeHIlDpZahQnE6b?=
 =?us-ascii?Q?m44FBokDJ8M2V03XSvK1fK7GfVSxfxlKVEquD9oW5hvqp+/MgXA93Bzegp8r?=
 =?us-ascii?Q?K2PedV6Wk5Gl8qHOMrdAnpw9qkNAV1b4zNjgf49JP8wiIMBZ035FbSwc5Pl1?=
 =?us-ascii?Q?5qDEtaH9NXG9gSwNW85dKVLxe8n8+G1zd5Zt3IoL/N6UbDEERD7qx9zziHz5?=
 =?us-ascii?Q?BsTku8AsHTyDChWBkJ/QJFnggq5rLUvkGPzZNfljNsH5toVIOgbrvtw3AaRT?=
 =?us-ascii?Q?ufP3ARRFZcuugOUseyvORHZ34PTRay7po8D1Gr2UNE5N5KYtbiA2xbGxldnJ?=
 =?us-ascii?Q?fBeEJUGW7Bs0XLDa0lmMW/0qR1HE337LOyRXM9CuRe/9b6FxnW3Yc6nXVJVR?=
 =?us-ascii?Q?K7TXrUfR19I4GZunmV7O+X3Pnt2LZNOcju/MzYDBAGegKIO2gmKikpUPtqVB?=
 =?us-ascii?Q?cnFhHBCo9FooRGGybRn17JVGAGE4r1g=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb199ae-197c-4383-86b7-08deebb2c6d9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:40.7899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4xm3XXvN892z9ohdykMLx3DW8eqF617fmZzFIez+gm9J9ATvvA2ALLDfz+IJaw0MtqUoAtYHIfBjeG1MZ4TIQKgRUj7W2yjqr6yswliM+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11139

Add support for olt pin function for olt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 7e94dcb3b61a5..74f93327d41a1 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -53,6 +53,7 @@
 #define I2C0_SCL_GPIO_MODE_MASK			BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
+#define GPIO_OLT_MODE_MASK			BIT(12)
 #define SIPO_RCLK_MODE_MASK			BIT(11)
 #define GPIO_PCIE_RESET1_MASK			BIT(10)
 #define GPIO_PCIE_RESET0_MASK			BIT(9)
@@ -393,6 +394,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
 static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
+static const int olt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -482,6 +484,7 @@ static const int pcie_reset1_pins[] = { 52 };
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
 	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
+	PINCTRL_PIN_GROUP("olt", olt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -566,6 +569,7 @@ static const struct pingroup pinctrl_groups[] = {
 };
 
 static const char *const pon_groups[] = { "pon", "pon_alt" };
+static const char *const olt_groups[] = { "olt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -648,6 +652,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group olt_func_group[] = {
+	{
+		.name = "olt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_OLT_MODE_MASK,
+			GPIO_OLT_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
 static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 	{
 		.name = "pon_tod_1pps",
@@ -1171,6 +1188,7 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("olt", olt),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", mdio),
-- 
2.53.0

