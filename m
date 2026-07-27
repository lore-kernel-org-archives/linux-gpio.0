Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A3435503;
	Mon, 27 Jul 2026 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174134; cv=fail; b=uV25akDB/4bf+TM83A7RVfLi3CjcDlhN1M+JqjtuYUvhk+fzLNXEFGp9qGs4JG03aTopPik/E4LU4X9tAZ0zzIqWwtWwcpbAesug6fHxxLmTNBVI2MPAuHlWDn2SDiUxlZMIvnbZ6s+VGD7xeem41aNRabzYaplmjXpZ9IxnQMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174134; c=relaxed/simple;
	bh=QrLwmnFkNXJNGd5y1kfXaMwXS5WD+cdqjVdgg51seTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EYFeifHJolpjGXFCcZOkOeKBNkS4qqSveBClfnBkSi4BgzgJxP+yK/dOGcD0O/7OOs1myFU8pEsn/NGbQzWpi5T4P+kEdeb0baDg0yxDBj3lkXQLZdt9SJYWQI+TpJnDd11rJ/zx0fKwV4fj6w/ShZjivT74/XaytIePdqu064o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=FPlsPlq/; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="FPlsPlq/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=im/13SrdLzjL05OHBALfpOH/nDonoMKZW7YqNQdy/nZrCRyoHI8kRgn9iba/sIOy4RqN2iOJxJjBzbB9MjW6fszP5lcTOF11N153Lqs6BxklURg+PXyFpFD+6zZ9R8/XHCNpvmgIdu6cCoMuqLQzqo5D1h0gl3wuTVH+IZ3D+uNkb3grshheDIcrIf9mYWjL/M7xjk+eLdajzvZGx1KlK+SUO5zi2mJgtD12WhL8FsYsJp8Z9b49xwvkmYmza6NLRVPqbDi9ErEEOq5FZ4GxO/5DMVu/Q5gC1PuRm+iySKYW/t99+X794obHCGIysm55PZ060HzQ8PC1aaOtabUoRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WW0xviZRSVn2RFAQG6Jbpotx1vwc92tsGRlXay9KdzA=;
 b=TPWlfFgkXowjqLjh0/buY4xYojskwh5L+d3umIW5U1Kh2g3HfuvEhYy4VkjdR87luy39CiSuVpUS93Rg3NBkMiXIB4ZDC3WqOe6GRxS5AXlO3K5zB9fdUF7n++qVY54nwP5pR2IggNMBtnz/RVWAAo7xsFJqW7R0PCi6I+pewZiMHctd2fvUC53skYGMM4LocACza0/t0uDozAwTX5B2PjcST/rKbGOhhhtrkQ0m0WkKXTxxec8Whm5jT+vTIapGCgzGQNv7UQYRSXrRr7iclv6L0XkfromqpbSi9+S+2NSbqUxBJ5IeOAP+WRTq4rvf7drewboKOR4gaepdNXXfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WW0xviZRSVn2RFAQG6Jbpotx1vwc92tsGRlXay9KdzA=;
 b=FPlsPlq/K4/2yNSblG7cd9YzuxDUuIjoclzdbqAnclZPvIvlYGKYLh9YqV3zgXJi8IQNBohuvRR2E6UszbshqrX83Tz6QzRe1kY/v5iYKlPZVL4Y+xidMUv648H0DIOzZcxPodmaXWKp3IIpF9AhJZw3JRD6QKeP/IIyNl8ZPp7omKMdppDttzpmmxJzt0nI2UT2+XBwA6Y74vKC4qqDYPtFQOrpQDAwhrhkaqpLpJZmc3fz6kkmsUm0tcHuBYcq92RqS+AGACS7VS8Z5JDnjsdl/BKVSu8AZGBNDsMJsBAU1ImDM8YneL/88b2Eu5ZRhsgn+8QdBMiDN24Zy0ZqVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:07 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:07 +0000
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
Subject: [PATCH v8 08/35] dt-bindings: pinctrl: airoha: an7583: remove i2c pin function
Date: Mon, 27 Jul 2026 20:41:14 +0300
Message-ID: <20260727174141.664933-9-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 76c2fccd-7487-4720-8ba7-08deec0660d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	edRK0I8WNCBDd3s0Qfbpau9xG5XqbF6Ku5h/FVPqJURLp7toximlIWSkkpAZtR0OrcEkighmbUSgxiDV2yeHqDwK/LQAI8RAUgGqhRVcLNGolJ7DZsHuM6Ee+yQ/BZHHtG99IxiuCnZKEyIgWw6a+hL80gVk+LPCXEu3pDjLUJpfZ9myOyj4xx3azi9Ym/JMKbjILvA89wgsVp7SgL9yrM/68PhiOL2taWOvg+chOhJWK1Kc0fdBmZI50BOOXUAbbHiiIqlRo1cf/xnYGBfx21YQq7vGaDKPxl0D1pv9uMz2WDgRDXG40mf/KLljloQs+ijWJS+Evk2/THDFwhxZRR+5Yr0lfBJDFeRxvCMfAO9b1s/06fF5e+1ocdUhLsmRXoPYSiZw2cOAU3NEfLg0n5vxjtBEHcxTzYYHVSFZZcc3cIy4jK9u11v+p04gsddkh3dgfPkxeKGqBq/Y/ZbSjU0Wv1VxTr7XLxEA9lv91ulziY00XLI/fa51BPwVjKn8roO14RFJoXS4dzu83JGpPX2sfkDnNsgyxy+ooakIhpY0xdpAa2oCLCqewftDVFsAXnIlGusNuKu5us030kwOLM3tHm6T1vrlkvXr3fWfXaOceukMhXpi4DuLGpUbKSAHzwbJPihNj6XDJtJFiC5bipCjXKbC0vOMQkahEFZ4g6ms4i2ev3cAefEddrkPo9kDN+KyxiCovSZqSVzg1dA7AX1WwmUzY9mlWKiesEByrPmO06lR4fR8HqEBBm11db9R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rrHiiFqx9vULIv81XThYaleNr6HpReSVN+75LfSVA43DQSCmyVYStt86F1pB?=
 =?us-ascii?Q?D6onHX3RVdOIJ7uX9nph+fd8p25HIvQ3f7/9WxvPKOH+D1pbbIcrjxEWG5Gw?=
 =?us-ascii?Q?t7Pq9YAky8MFA6529WwHOSUHUw6S38ueMwg+oXtEcPhdM9tbHQL/6mh/tso5?=
 =?us-ascii?Q?DxnkASji+Bs0K1vWSINwjLqfPGd+twu0lulJtjrQluNR2VjAoPZlr2+QSNKw?=
 =?us-ascii?Q?5w1IaGQilbIKMUYx6/MJu8iBHYC+0lnF2XrvnGZuAQwdX8iW6H2o54eblOeV?=
 =?us-ascii?Q?L6S1TjgbcnK3N1nxxG+gByFrtVUo1aztU+L9Mf+qz+AsQzCIlR8R8OdvP0rB?=
 =?us-ascii?Q?zfC38/Q/AISqE1Cchdv5bdVBXydpyA9+4BHQPm8vyZOaAOHBz6zwyiovURn9?=
 =?us-ascii?Q?FIil3Sq42rnw8KG5oXKosuRMizdayvwjL89a6uDjfvrYPV7q6WG+LFQMjIQq?=
 =?us-ascii?Q?jED+Ysric03MkIB1JVORCOuzO383RBJoIMB7th1SZkbBBfw8e97doi7xtTUt?=
 =?us-ascii?Q?cUjBNS3F3zQaxwKEX8QwD6flCmVuZQKBmMj0la91LbUXeMu1VivXmHG28e5P?=
 =?us-ascii?Q?/AjpgWSqyTd/l61dQCbn2J2ElRtyqZ3LYCqNttSBNgfEb9AEaaF1F0OsliEC?=
 =?us-ascii?Q?T0yw73X+hrwiBWTXeMDMJ3LzqSwkULalGTZcCJS8FS7+XxoquBYeDWZQFws9?=
 =?us-ascii?Q?Nuea6Vr9SvXmtlIliUGF9sG8afvWBkyix2i95BlXTmwbvnUXu09qGzT6nLdD?=
 =?us-ascii?Q?gRAz9pitUXqS/ekl+kJH5NxTnXLAOc6A5bF28BdfDsf0UH+2SSeYRNNz8M7k?=
 =?us-ascii?Q?SgLnBiMF4U5vsZE6rCWbpOpX7h/7utACJ8bsyRNpktwg+GEtfEIr6ExWjVuE?=
 =?us-ascii?Q?9PF/40LfAmuJKGyRrg2P4qEZJrBb2qKzME50rVUPe8Lde/9AogNuq/4KFRAB?=
 =?us-ascii?Q?nv6cTSbzQzNFl2TgusZeWKpZrY+VgHi9mZXZKHHGBKLziLDaD0oJBqMM+hIV?=
 =?us-ascii?Q?sViDxKRHJ/EnoI4wM2PQw3fE6R12+GeUx/P3WoL9UrRflbAAmhMUJK0Fe09N?=
 =?us-ascii?Q?0oFuvfsOImiOBU1h6ZrZ/XlqFBnRqnnwgrmaPQ6wN1KhhuALQVXzAX4n0+6r?=
 =?us-ascii?Q?Tr7HCHMygWCDpMaGjdP6QYYcORvATuyiXD4F0orLzyPKqQTDUms+sFHrHcXc?=
 =?us-ascii?Q?8nPrw9fSDGBSn0AdIOF7tfwib3p2vrLdDhFTdzKGcukjbjjEiq76JbFCuHP2?=
 =?us-ascii?Q?7rr8aErbn8DGXRPtr75GAeeysTjyZm3rIk7OD4c7DX/2lplLNRxJpqJH0ATM?=
 =?us-ascii?Q?LA6gRUybOLwXv3oLBXnLMO6RkgXenUpZNxiosu0Syig+VOSpbwGUOqRMTjVi?=
 =?us-ascii?Q?4EiwRzmlOdAnYJxHBNCaqnhEo48m/02t3dyoNarf5fKgSKPaXIMdyvAuBaE2?=
 =?us-ascii?Q?FHeEWA0ELy/2KaebSBY2EqYd4gBrlmiHuDPVpTL+AbqgK5M/bTGFDAcMlA0G?=
 =?us-ascii?Q?98wGZq0ZU9inrJPfuQQw8rj/GrJmJE3Ye29ySeqzdWSQj52EyQUga/5ejHvX?=
 =?us-ascii?Q?SkOTMpDqz+Sm2C5KPn9X9diYoBW7Cs1BM6+0wbXsDtGui3o/UhgCt36Fb4iJ?=
 =?us-ascii?Q?xjONKA6/sA4KMYNJjmdBabI8vw9ULFlO4kp6OsIfeAwLKivda+YGKtjKOZiN?=
 =?us-ascii?Q?qZCeyuLO/ozaFWDYo19prysEusIoOT/VCQLhFN7DW/Hf9cSB1EdFLgfGUsW7?=
 =?us-ascii?Q?0P74WaSM6c9xKvTnezctVm0KuQQCZQI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c2fccd-7487-4720-8ba7-08deec0660d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:07.3058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRN+3BZlxa32SZ3C9D43Tgmz3FDzQw57cmaZM1jekN/pqKcQgb/Pvzy2TbFNLGSISjjwrLPYym2ounR86J8cyaZCoWBWAP5bnOC+bOtQCrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

In the AN7583 case there are no mux bits to enable i2c buses, so remove i2c
pin function from device tree binding schema.

Fixes: e6e47d31d3f8 ("dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index f52802a3ad79d..8d8ec6adb97d1 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
                    pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
@@ -117,14 +117,6 @@ patternProperties:
                     enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
                            uart4, uart5]
                   maxItems: 2
-          - if:
-              properties:
-                function:
-                  const: i2c
-            then:
-              properties:
-                groups:
-                  enum: [i2c1]
           - if:
               properties:
                 function:
-- 
2.53.0

