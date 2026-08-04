Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021116.outbound.protection.outlook.com [52.101.70.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4142047D928;
	Tue,  4 Aug 2026 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859537; cv=fail; b=recTGuj8S9533yOSgDhOsGM7WUKc7W2y2C0IyJqW9i/jIcAU634jLbMnhjQBmTSV0yUhh8REpTVwYLBBcA2AlFhyAjzSHFfzs2vinKtMGcktVMnqgx2gC1ly5E7QunmXClVFKT144qV80Vp3My2KYw4b/dMWSZ8G5AssffCnqdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859537; c=relaxed/simple;
	bh=oL0BooMamQG9THpgFtFWaDraOpwSFqU7rdaz4y2jxCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pl/yB7rd1vqFzwMuoZMaqrPMBlilmNHBuaCKHC+5kJkvlhEFjeKaWuPRQM6p32nw3YMmBB1mU5GS4mBg3V22gqEP0uxYMvUnsRG8ylWaXMIb1RBSxUnv/ig17wCEOvrLlowFQ3KcNvfPkha89xwRl551EOjP2EjeKPmH4cA05N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=bciexDps; arc=fail smtp.client-ip=52.101.70.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="bciexDps"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLIq5gIF8CLwgZ8rZIkKvc8f0XeNPWqvxbnw9XFvEuwcHZcZ3ONjobsonCwh0TU73qmikTFri6UXHAbz9eYK+zdYRj+P8UCp0iwub93MVBCLDbmd8ZQHEOjKOaeQ6t9HEMGBwwKsEyRco25Ds+swumuqTSCUCdyevhjyqW+4pNpZzQzJgYD1qBWeW0io+F35PGbfk9fBZf1iMqcqJjVeTs0EQGwS5EcVbkhNsfsuCxS99CBXvUoiMDaWxyGgaHI+zi6nHOsCfbB2Q6oy/DgYhW8EiK/HlJ1ZfLLtKg9Du2z6zaCaCgbbuHxhV+aXpBKB3RDVQnQBFjG+eTU4ISebFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSGWTYGUz+p7AU31oDHQoLQ4cPUghCcaqPQeA6lbcQM=;
 b=tvWdJONFcnjMICd1XnoXl/bsL3sU4fXKKSwZ8wsL20ukcE+fsIL9WtE5wjbZ7ecH+GTFOxKDZgNtxSacAF7lCsjfj+PhHIsiW0Lcfse8DTFzttj96QuQCgVqkejb2F99rnoCK7xAFUEoOQxLe/hsFB5wiWixjneZS/NfS1bsl1V85qaSQwO4iuDo7sjiuD8o+s7fKX5vNkWkRk4NctMNhUx4EoMboVWiP0Qbvi+1RncMh6zRRUDhARSNlx6MeguYZz5cGsPGi37APlH6AwWLmAHDXgvGybWpqKh417rv8GyRPdChb9MNPPRszzoptvfMv1+CL01ROuYrXV25gVpBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSGWTYGUz+p7AU31oDHQoLQ4cPUghCcaqPQeA6lbcQM=;
 b=bciexDpsMpp5w7Sw+FBzX7MBLkFZuZuV9Eygq4/zucHlEB86f+1OWRlyuJarQBs6fP/He2wuyXi7M/ZIFVmiXxYaboiK/lAK+ToJekqZv3as+99KTcqij8JFRTIjx0fVidwTz3dMn3hYkzie7i4qx0GOdIKVx5Hw0qH8jDa/kM11kp61UyPDnkGrke3N28zn/BN8UXk9eYmY1af/sPr3uNPzuNUe6oQkDZCVAed78bAzg04u27PX4NaZlBh7ma05/J601rGG1QhoqT7ZQE4vM/Kc7WNMXf4bubudT1CTQf1ec/zhlMzqNU6X2hlYxrxenGKLYrSthSs/0wXhpJqIKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:22 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:22 +0000
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
Subject: [PATCH v9 28/36] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Tue,  4 Aug 2026 19:04:11 +0300
Message-ID: <20260804160419.3592327-29-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV1PR08MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: 852e7600-0e07-48b8-6372-08def2422fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DQlBtNP6/KXMkBzvkcbAIMqTejN0wCanbO5oRTH5b6aXTb0nbfxTJUU2anjiNtX9/DprdP7vQMxOSY6UU0b8ORq/NCjJeL9kMyb+oioW7DM/NozdXEwwojHIvbdetroJe4a/zMk0IoHBXtmzh5tdpcnJoTiIcxwHEQPiFrBaQk9uhu6NXB3GFDKbBFtFZ5D/UOi2DrhgDmNp5C10U56q8mdNGPkEDSZxdpbkuZeKtBG/Kk5oiC1jA5Q/h5lyclEQqoptBbXECRJwuqdSx+XWRTAHdhYhO2j/ou3GgFE/OiWPSv0uYvsUfHbNOXF9dXjsFMHnuls7qvNredz3xtaGZo7mMyfuJsUxshn3MtIXYFGLu/6mVrtc7z1RsHImwAlF0Rnw6oebR+s8RE3ONA0HCyrND169FjG6yNIVZCDy3fVzw4ti74g1NXAXuChY0hWXCp8f0c4PpXvy/K3MX3C0qp1m/fBD0BqXcDndhd1o+kQ8Kp6urL705QLRY7s9xDdL79HnqoWiDb643/hh+oTMc2x/6SqFwqCfBZvT3OKtU8KA13wbvu55/Yr713XKiSV8QdWQQ1Rf7GrTkJMGpxVjy1F1183UdSStjqvRxMtQjzvTCGbJ9azgE9F1DAJltiPqyJGBJTUXOeYM3x2c6SX9/F12cVlPHcVT6kdKDq18rJ22JJkrhefTmvJHQs1cIuU6obMrG786HkBwS00PWdyIptq7FhMxvQQAyNilVOAR89ReHp68AXvITCpjaXzOuxeJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jmbDYAWn/wcAb25eoJd9csmS8AIpFJyTU8KzUa5vr7bVQPk/E/Iz8EAGWHPV?=
 =?us-ascii?Q?6BD4tY9dH/bBvaIK4wJY3MPQmbOyANwIE/GUtDfAEXmaVkN40AEcyAcxSiou?=
 =?us-ascii?Q?Yok0jyntHfI7JXgSvfoSntm8mIGkP9+cOFtl18DC2lTgci2sYZlXhMgv7Cn6?=
 =?us-ascii?Q?4AMrlWCyXrZypJn4cAwMwxo1N2HI/wnHQA8kETHSoJNE4f9YmHIfwQSYYwH6?=
 =?us-ascii?Q?p/GoSBY8hDLtCZO9bZUhM/7n7G1j3Oacs/FA82BUT9tHP7g5j9z57+OUNlG8?=
 =?us-ascii?Q?A+UHrChhY+ZAuyWLId3qqsFukiMb/cI0nxNGe0KawUxkChgw2IbctToWvFZe?=
 =?us-ascii?Q?WEoN0WyVuCI6EJm/7u+DNqMsIyoI3qFAopzOAF/uZbmwkfJApnsFSKy4CgBb?=
 =?us-ascii?Q?vth40+Y/PjJl1oD2Wt5A/JJS/6zaBeyYbHY7xtus3N0giB5eTSj6uo2DDnNH?=
 =?us-ascii?Q?uMH/l/czBwZChkym6diJ5YK6ZSPji3KONJHxg8nSQmwJYxdlLFWk8tJY+eJt?=
 =?us-ascii?Q?/xULsXXCTTrkeCjNzHo02qd58yg2wZh/wsTlF4qeV6ackh/wwEhD9+k+tcbZ?=
 =?us-ascii?Q?32QgF848SK5rnNJCwAYvPUGQtkWQqkfbK1o18ovZOhCA3zvMKkFjTB6BPpeD?=
 =?us-ascii?Q?13pFO+kuHSKWNCkH6LveioYNOMpSzMBDtf48NmXXsTc0BVYr8tg+MsDNB1U1?=
 =?us-ascii?Q?KEcJKLAR9lh6cnMtGHPF7KFMYGHbx1vPhI5P7+QJQucJf7Rs/QFChSOJODMY?=
 =?us-ascii?Q?5Kyry+DZrvkcHZAsDuTuYl5+tmCzT5wXkU+YBsBDlBuj1GfYLfCfqTjySfz7?=
 =?us-ascii?Q?YYjeFC+a2B7g3d0HDzYr0xm+v87RnPiG5L9fyI+BLrurHwPBB4giAchSPd4r?=
 =?us-ascii?Q?PnfNPOMGwxQ0UMMd+6r+cU+2lTX0P1wODut1udCxfBjzgCwth09wedgQ4cE1?=
 =?us-ascii?Q?Mb6TOS/k5SnrvNXtnFjfGVkIIA+bZZjmzNgWnhoX7RERORM7uRs63ZG1I0LK?=
 =?us-ascii?Q?2HlpYIXIFNJT8Xja8QU42UfIS4Eb77MIbvy06ZSdsp+onvqZ6v4/uu0qxz7q?=
 =?us-ascii?Q?SSZL4n0rQXLSItyWG/AnAEVUbOxDTNo33rOYKlVdrdRD1isaYmhoHVAQqcz8?=
 =?us-ascii?Q?WwSBVuUzgyjzSKOqCfePGO04p896mZ5JydPbJEuh8gmfKs3WIoOTgsXM4gch?=
 =?us-ascii?Q?wN/ChfRbNWhttnK9vHd8Qe2Efbw2L78/pEUYbPQvyHdXjCPqajlOUqfUjB3T?=
 =?us-ascii?Q?3rk1rQpuQAkr9mb0TzfxhnHSfLjB9FvfU5BxT4NdncHhVyCqSSnTGd4KDLd+?=
 =?us-ascii?Q?N0w9Qheph1qZUf9h7sTdmXBVZYncG5bWoT+Jf/C44Vh47TrMbh+JcdzA6EU9?=
 =?us-ascii?Q?hZMMr8VWqUDiHTp8a/kzZPIriWAYJbCgDr+GMIMJkNPmTxa21/YKDKwKlAFA?=
 =?us-ascii?Q?NWgXPeVilVi3Gd8pFDW1XVDBa1v7/ule2UwYmrxTBuS/1kUnjZMxeY4jCtMd?=
 =?us-ascii?Q?2/T0/WKeBNjjW/KWvllvCnZ+7bwLnbAzWRwu7aC9FXLhSJY8soBLLjBjvEBR?=
 =?us-ascii?Q?OgaVNjAHbPSoVY5cqSCI2FPP14ZB0eevpIsCbJcW34QCP7qBoqzrp2HFuHEI?=
 =?us-ascii?Q?7Yz2nr/Rll0lQ+bAQTx68934xlGL8Oofe2pirjTR/NIwIf5SVdcT2IXo1py3?=
 =?us-ascii?Q?LxsMQuzH7yFq75iAD8MxcPB6Gf/7YKpZarRPtQ+EP4B4pNrxOjU1xnBRb5TL?=
 =?us-ascii?Q?j5bMsdHsaeLqKs9h3qoYFCpjsecREg4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 852e7600-0e07-48b8-6372-08def2422fe4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:22.0317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agREMyUrwn+IuvuwoK9kAvRVzH5jj0ss7mAMJ0+8LqEaO2MBal4nBISAYZHyY/flP9lq+Q15o9aUeTClv2WLMMXoD/j3ogOLg6xl8O7+69g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

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

