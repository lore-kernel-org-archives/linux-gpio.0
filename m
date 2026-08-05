Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023116.outbound.protection.outlook.com [40.107.162.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEC8472F61;
	Wed,  5 Aug 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933328; cv=fail; b=cpar/SyQFkpV/U/DFOkjsCdIxSigUEORkFxDq389o89oSHH54LLxfeDeZl0ZlkpCybUUxV6KQQZXoQvV1ni2hLPfT22Vk0yEnvtYL77Nx49bkCJNedoK8oPqmfNvVgX+x1vcyEmtSeu472DqtCpj+d9snvnshoJ0DRkaCTF/gtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933328; c=relaxed/simple;
	bh=rL5nvTxNqRMTY1eAG4HiOrCLx+2VNbMk9DxbbbEjvyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q+paITfTgIaAQ6Mhunq7eysZPKkI1EB56o6+z1I4rBoaCQbSuvr3W8Jln5ssBA3MoAWBBlwvr3aVCGAJjBIm/0TzHMa6pHN5oxvQUcgHjzaYmNB6/gfYF3rm3vUpgT4fH31VDIm9uxieXyVJs7mF3hcME9B8zgaQM8KBkV0BtB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=vkyTOO/l; arc=fail smtp.client-ip=40.107.162.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="vkyTOO/l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHLR/hIOIKJ9h/W+QNECPk86rBCWiP6eptakQOg+m8VnpesdkOYk2CFMmieEBilUvxQJQ7noCq+TYGBGe7ORKUAOaoVsDPCDiPEDBMQYjo64BRsySICL2528StOv0C0ZBQ34vhtuXr8G9lkecv+Y5i4l2CyqO1cb4kgNeN+SqdTwKOtNUjvunlCd3VnukmRip/L+/jUKpeFol01B/GzzY9m7A96SOSo+qUm2l3yLq8095+KP3U04slE+wg3w9a63t2kaoTkFAn/lOTszRc0R7BEFQL9nfVzal9rVtgIZbGGsRNTEJ9Zm+/5ZyLmdZTPPb4Hnm82pybjsh3FI8HKTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOzXzO751kPv4t39iFYU2CMScdEyrmOWSo30MsbgxZ0=;
 b=rxF6+WM/ZNvHuIGlEE9KDbJ5vrs1I2EYAzarw/jlYGYvL+KBTPwPkdXhrwBkHRqT+MwwZFUfGRDzgHelJoWEJhpL9WwFbu/yVBtxstHlbso0o7PJ8ufwiK2DJUrxxjkHnNxcVEaT9Xog1ktkZiAsJ9Q35/l0l5F8uwnYli16ND9JZ+3pM/MFeJZTQNGTNi5eyrkJ5/shrkEEjZ4Cc+qLvqdWUmxZhEfBsTLzq28dt5J+JXolYtEysOv02idCnFDSapOh0fCnyca3opBrkwqAZ5EH9O8sKCA8jUe4Ez7YC7Smx/LGXAX4QaFG2sPPcILKkjQikUPtfwxzNA3K0VcdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOzXzO751kPv4t39iFYU2CMScdEyrmOWSo30MsbgxZ0=;
 b=vkyTOO/l2FkegFCipDzAlU9+mGIEIvGrKPmLgt+kLA0WZ0o+ZfHrURCwH4+P3U5R1ybFFpb9P1KX4edEepz63n3xmVvwyArpxFpRpuW7a0ucg18FYUznyPkeQwNs03jbvaZZ8SbPJs0URxpaJ0HrwTzUnZpsaDpAkulF0NIymcIa4KaDz2pUi5jkKyOdmcERVSym2o+xrAP2Fk11ugcAq1qmDAs+elqG2VkxgNY9CT7c10pY2FZnkP97ZDaFLcFOqdFKEsivunuSs/sLBTeH58Bbl151hEmI6jjdSDUndxDRdWgKK/JnYS40/FJ13C9GJWwXqq4OXFoG3e7gf6gJqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:35:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:15 +0000
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
Subject: [PATCH v10 29/36] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Wed,  5 Aug 2026 15:34:01 +0300
Message-ID: <20260805123408.3767648-30-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: bc814255-8fb3-4456-c3e6-08def2ee005f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	bBTEUyLRxaXYms4/HByOSQmJBgwOgBtG1J8DEdbq+jJnwoRIpC7B0uVQH6ufbQxqqZr0j1S0wjkDzz0u1QWRTiUQmDSGCin/KiXrDkYZzaihxYE89BYhPMtr0wlz2XN4N6jv5BwjFxQnntBZd95GmQXoMhOCKtG1dp+Ry3mNyoblUPopXO8p3Lze6OQbaWQe+wbOg81NGTqqa4nahm+MSw2UwtxUaYDatjF1FSEU0vR3DgwrOiLxlMC2Fabq0mn1cfKlUYVNTlzdQ9FR/VkLSCqkIII2k5DMD+qrLP+nV4DRBM/miTfDDW7WrgTc2uLiKxZR4eVpcA/XzP39TprImmJ49HOy5EdYI6vh+ym2821I0/QqtwDcTksYoApBLV+GQTO3vKd9U/qqniaQw/2jPn6r+HxXBHH/KySwmFFpc2Z+Ji+NkrvnLNtUwQ46VYh8cygk/qCJUpmVHdGJVtHJXt1AncwJZvCnhFWG6E240L0QjwAv3ZpLYqJGrpKtH7yYW+qgdtCdKBnZ5qOjchqeERpcsW6YXdY/byGy0gIxftdbcp6oYyebOxHFfvHTw6kqJUsftphbLlhNVLmgVcdh5AT98suB9vwqN/9x2j7uf8iyrKuNcpfAn4BtihgJd4v+3f6Ru/dBrkpJ/+nlILIHhiRbkvSdqSlmsqFItgNOBzVUqZ32cqI/67BGxxr9k7taWI36ennAbUj11qO44AvBtCl7X2vEkRIAkn2+dwngZX961TNGyyxodeMhFOIWMpiA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AcHIwxIC8KSVxolr5cx0sIltg0e6wSlv1znbyMh5RvXVWHLkFzyr/UiptCyK?=
 =?us-ascii?Q?/p2MMr9OOjZvIVKfvTp4euf2hhZXdOOiGKjlDxhT8PdKpfLUYkMiMLpyJrAT?=
 =?us-ascii?Q?cPp39EmpzbLhRCOE3YCzICB9vVB8+tE+6kP0urlmreg0b3bTh/XungifEGXC?=
 =?us-ascii?Q?ayNqq5aYyDMn0U2mfofBs1f+bLTg5Ibweh08RTjKos4iephn1fiMW3bFCeT9?=
 =?us-ascii?Q?okIjYuL7Cg3WMFJBiLo7Qnntwevzh4XhWpAv8aLJJYknmcvMg33ngqGNTqwk?=
 =?us-ascii?Q?q1chYc23UloPvd4I6rRMNsi+nSQyYolWKYuQubWRQImkXIBBTM+8/U2uUbb8?=
 =?us-ascii?Q?F5tJpZFlCaofWY6J6w7bSfM6lcEqjY4WNFJEEraWMjC8W66VEQ1eZJHjqNxn?=
 =?us-ascii?Q?+Aw7usZwDfOBZeEQSzFWnWoo39wCrg4oiohjyGnWwvfVMg9Wsz+yeJaqXBNE?=
 =?us-ascii?Q?kqYOar0OVezpuJHG/Gmvb+ndKs5ShGZEpe+kY8sITsJNJkJlycdknEukAbKk?=
 =?us-ascii?Q?ERbRy9pZNgyI3zyqddu+XGq21v1q3h1bxbIxK2Ft54MtliJo7ZOR4wQTvLZG?=
 =?us-ascii?Q?GUQbWoAeTmW2qqSAigrRvMspp2nxqX0UqRBwLc+fWF4n2vYX1zResh/vWLTG?=
 =?us-ascii?Q?TDoHturytrFEfES+ti8qaB/6+tprxQg112Vcdr5hEHU57YvKs5OAmAAwiZZl?=
 =?us-ascii?Q?wNJ3XJgcp4+FuZoMbl1iTzxq83UkoOHfE+Xne1SBicn3HYJElk0beVwWd1q6?=
 =?us-ascii?Q?i60CyOlEOZGOh+1V5esRWi1mz5wUI9ddZIHXU4AC24aIYamHVIvdpFfJrL3T?=
 =?us-ascii?Q?CDcJ21CrbNJ09qVUhd+1AsA7NQ8kORbxAqgdHexJAhRpO6tDOKlFV8YGA79i?=
 =?us-ascii?Q?om2JUhFSOuizaDN8VoUjeHVhq/q65zk0WY+3GhEcmE/bexxlxVizA/Pqzd9A?=
 =?us-ascii?Q?j7+A/xvmH9TZwnRXdrMMVtj0uBQfGWhY19lhT9mX2k4XGB2zOW/08M04FpF0?=
 =?us-ascii?Q?GAOFu9UQ8ZrdSGZH8NHVrdatS8FCRKK/Gzo5HWZJqX2wPE+pVDsr781tR5No?=
 =?us-ascii?Q?NCg68to3EH59wTjXFR9qYNPArULPLn+H1aUH/dFoEPw5cZbzQHOxo5Yvfu78?=
 =?us-ascii?Q?94kJtLVgWJ4tv/tjrPYQTFYmpK74dxOOhxWFjRuMcsxCe4pZzMIoSIpBjDP3?=
 =?us-ascii?Q?41idlZ8RRSwvX33RSqS/rRVK1n1Rg4+ITbt+qvlYtdFKblOCpMhk3s1PYfAo?=
 =?us-ascii?Q?PwGVZgadtCOiuYA1hR5MktTpNCtHq7vQYD7VsGwQtcUy6AJUHs/JI31MmFdC?=
 =?us-ascii?Q?Lhk/m68H7mSkboXcQ7LuvBxYqVO0eEslXD+kZYAvqp9NICtVV3N0032VgGbx?=
 =?us-ascii?Q?glZrhiyBU8Ez1nYhsDGXIAPQ6TV9fcPOuStu8OZ95h9nDugV/JOQ3SESGvQH?=
 =?us-ascii?Q?1O8gnQYWvKBNbHpUlmIBJNtw3vgbtPLM/K+aCXPVnSak+l6stg81iOBFn0QM?=
 =?us-ascii?Q?uVEfTUTARGiapjn7drlHk/qMsRf+OynHU4F4KhpFLRRv/fcWt4ipuRZHlGmA?=
 =?us-ascii?Q?pfbkGNF02vY1v6uJGWRPBMqjnvssyFOjaaREfkZDJws9iOe/Coc5hLHTT4lU?=
 =?us-ascii?Q?vVjhBFtlEQoIjRC+D1WaNlVEtNh158R6C7Zn+IHMd5NHoRmnlLEgLHp1IOIl?=
 =?us-ascii?Q?whsSYM9x/POkXjYF/BryXlJIRK8eKbMLe92Jpmtb6PgKZR5c2MtaOLhVTZqu?=
 =?us-ascii?Q?/tzoNWG/6Da8DAEKeygnt+0joP+F4Y8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: bc814255-8fb3-4456-c3e6-08def2ee005f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:15.7177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ot45l92lLlABG4hQ9kCgSpIb9BE1q62rNj+kXiw2Hvq/Xzy+ITidQOdfrPHwc0N4x1RWbmEuT83GVN90w2U0OwHCcRD7++tBmGVN4wof5XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

Add support for pon pin function for pon_alt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index dc88cbd8746bb..2e145ef5a224c 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -38,6 +38,7 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define GPIO_PON_ALT_MODE_MASK			BIT(27)
 #define MDIO_0_GPIO_MODE_MASK			BIT(26)
 #define MDC_0_GPIO_MODE_MASK			BIT(25)
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
@@ -391,6 +392,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 };
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -480,6 +482,7 @@ static const int pcie_reset1_pins[] = { 52 };
 
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -564,7 +567,7 @@ static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
 };
 
-static const char *const pon_groups[] = { "pon" };
+static const char *const pon_groups[] = { "pon", "pon_alt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -632,10 +635,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "pon_alt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
+			GPIO_PON_ALT_MODE_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0

