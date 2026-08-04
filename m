Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021116.outbound.protection.outlook.com [52.101.70.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E8547D928;
	Tue,  4 Aug 2026 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859544; cv=fail; b=TwyRooSfv8CRLqkPDdxs/I2MlCbZ1ki0TqinExHEEO5+PfjZYNZI7AfhzbJJEF2V2oCGTQZ9UfNTtXcYaCjueoYvyZNSsKPVktLxUJzeS1SgUzf2AsLdtolYBHr2YUjpJzujD05teDNWm9G84hkRoZwXdL3Nn1QX2a8jJY0+4Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859544; c=relaxed/simple;
	bh=ya1oMgh5HTKJezcqEPOrwwYknDsgzwY4zi6fvE8sU/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dlUXQ/KdnmT1Xa9SAajsfzSqIPAHphnAyn/EsymtjRKA0SpM8q2ZbC2T3KvKPOuouzZVqZU1eCebPugL9fnhL6SVNye1ZjWgpMV8ykAkP4yKfUHw6OTeqDcmjlc4rZSaH8IDmKOVUx8AcvINaT0CWRYZNfTlSCbrKVFOtQOJj6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Brdpj3LC; arc=fail smtp.client-ip=52.101.70.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Brdpj3LC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjiGhPUE7v847KlCJyDzZSeTs9V19Sf8vKEjTLPTabhJzVGFbeIGpqqyqlTt07Thk0Pn/r93XFSgy907553/ns8NUoMGwt/0xzJRFnxSOKRxu5CDcra8IQR0o1+51i6OlvVwWh+3GcgZbNk355ruwaDVM0H2TqmV9ciY/1Ea2GO4ILrsFnTcKCFKQCOb9nRZbFNBd80vaayIBejMwfngGi8YU9WcTmIwiAuUfXR9NQ/Zgl4OeAuevBUw3/uvMsefhMcHIsFPfHYWCbZffIapTKKHmVgewnBvdyPfebKfUXo3EBI9WHoRpG860RJO2aie6vLZ0IhPqAdoiQoB0tOa2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpWmdyuMgM0eYalw1U8BbBX43r3OZEflJlj/EOeyEks=;
 b=DEzhIbW1WMyUfQcSlHZYM3lwCB1DSFICDLhfiDqEqfnREV661cvtnVu4oAsfiKO/lhkKqqLX+eIFb+HquFIHHPqiKctJT5vv1yMqtOpbVDrBc9CdWwoKI6xc72s+Ls5HHrEgXGnQqrXuv/9MmvNGzCka7CYjeqyCQVbjgJPbo2sBwB+TsmiiHuiXf1y5ZNNzeWrVFKkgc3yQ362wW2y6PGJc0Wh/jVRiaTpAgCYirwLPdjtJE1ddjZBAqgK2pHX7Ueb44ElKc6jsf7rrd1pzOczYHldLRHnXYqR46o0x8pazoR7L9tnrmGJQ2gMqJwza8+wt2NAdOTVcDVKF6+mDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpWmdyuMgM0eYalw1U8BbBX43r3OZEflJlj/EOeyEks=;
 b=Brdpj3LCNL45xfaF1Ea6wpzPAdS37tFfTcFZR51pRQ/Parsj2Q/6CYOCdZCjgk9gem+KohzOQxpXASlvqaGaC/fJt1H7dbOXfQn8vDgYG8ZUKNGdN6A+TC/vD6StNyAAYmlXfA3Cu5PXdqHd7mtS68k//tS8bpNNjAPqOdf4GPFZ/c4fvcXwJf2nNd3GqI1fA0KN9BVVPqGpaZP98y6/JKVa6Vl1Cis7AuM5BFRp/swaF6f4VgdSDZEtBeKAQ3MR2hIFz0jq5N68XenaRMDIYebGXaoeb5kS1npkyjIQISFjXTZH6opXIo21PEWt7nmPV1CGnFHmqCYB6st/WU/9ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:31 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:31 +0000
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
Subject: [PATCH v9 33/36] pinctrl: airoha: try to find chip scu node by phandle first
Date: Tue,  4 Aug 2026 19:04:16 +0300
Message-ID: <20260804160419.3592327-34-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: fc2c1b71-ccde-4019-74cf-08def242358b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fNq/bYluAeVBCi5sppkKRsZJwoD0A25nxaL8GxUonh6pG7d1McHAoKQH8S08H7svrJ4lEk6YpKBSoVj7+hwbGy6XKu3vlxGDXDciGthFKQpVXKue6qHX8WVkRHA66hBBjUUkLVqGJqRF1b2V59VtmcsPc7GLtSoYCdVjPteh5hQFKm/MN7fzSoVQ+LIgDnPG+XAftjwpoqYoakHHIT6U7XKD6T3lVTgFzvltglK+In2qjsSYHXTN+F758cMbdFajkquMTyy8y3WEpiWpy03oK20Yh0h/0KdzrckG58KNxHClCKc9gjHn0nW9xaHaoP+FBx8cTBXZHlACQT2RAAlSRqd7JKPSNlwRQ6f0mxRjZhrEYFiQxwtHtRa2lKzJNIy1x10oM9r8bKDsNb4LxuH7OiiaszskepLqwUcwB099E0EZdU1P2hseWeCYs3O5+qXylK8ei4G7Au/Z7EEnwbl3uZnujLOYpDecKOEyvf8+FWb2j5G1x+tKZUZYBXmefZqt8SmlQJkkunraI1B1NunHJsVRM0NVoZXVMq/qrRouQnlcBYoEgyqSgOfHVYme7AdZ7/vbalJy2RE4vl0EgmsidabaIJRU+jM2AZ/6p/NNRHn0nBDHzIv4HG0msWcD5u85QihXVA+AhxByQPvgG3GNyzDcPjlq+qIQZU5N8zZQWxqkU5QP36Tk5cC7Tm5z0qFmXQSxIVNZSkY2f5bNSAnbbzfMOfgKwZO1Ff/WhhgZZWzabhZ8o7kGoX6hCZyKsHPk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PMowidh3AJH7OHY8sZABnv+WIZH2z2TZeQtHzFiQYosDaRELi6LaM2QVbgEf?=
 =?us-ascii?Q?Jl0IY6oZaJ7FbF+fW23TvSaxiScImfq+jFTV9onCaWmPxhuGTWcxl1QAS3KT?=
 =?us-ascii?Q?ie6sBaGJFnzUCEbs3FoeDYAwJVxp/nREA+iSYdcE3zomzi9VQNZm9F5PaYUQ?=
 =?us-ascii?Q?U/k+7dL6nMlbAt1cFDjapXtD0KV6nL5eYwbrkR02UMlYymbQuwHBt+Cqq6p5?=
 =?us-ascii?Q?LTTx67+7y9jW9JhdrCUKYRf8E1PKWTGQW3VxaypwCINSQ7TGbfuIip/Hu7HR?=
 =?us-ascii?Q?UVdllpXAhe8dIM4Oe84Un14nuCzn8FefmAhB6mTngjYbI4TKhUyrdoA7KVb4?=
 =?us-ascii?Q?ysZfOPeWLgZCxP75DdOrfiJzqcd/qlLg8OySx2Ma4XwDSjDOZYWPF9IsHIrZ?=
 =?us-ascii?Q?72r6RWI/mT15ofOzo/wuZJdvUf/dCL/47Pi5rltw9xC8JN3kUD1WdGyNel+l?=
 =?us-ascii?Q?I8mybMfhiObY/ZPbDGVM7Ff7pToJCJM/tVf1Rrh80bEBLTPfoRRUdm0Otnt1?=
 =?us-ascii?Q?rtfbhObjfnEtK2anyyZp4LZk+DQM8EVyccqqSUFSDuvB2mRAs1QwI9ED7nxt?=
 =?us-ascii?Q?3qmIhwwqb6KBmLy72WEQz5YN5NsiB4hSHLGQ2z7yGh5f93CEEpZylgCxxk5P?=
 =?us-ascii?Q?Uf+D2BrVyP9WanMvHOZLmnFlzvy+KfPNk+f1TMyGKtdNGK/lvZgl3Gza6m2V?=
 =?us-ascii?Q?5jUEPeuKGH/XBB79E15UJTvljRf5OEi68zKq1ecU1ZyHptBr5wTvathvySgl?=
 =?us-ascii?Q?Giw2l5Bv/NWfQ3vMWyYbo2Z0e6FeZfRVWn469+UJCjCygH8psdix7Pa6khxp?=
 =?us-ascii?Q?cvCYgVK3kJresxRcbvH3nGdZEbPZ4/uz7uoPJGtmINevU6g+V6zwG64kIbp9?=
 =?us-ascii?Q?Rq9vFeuGzsoIJ9iKHBhFsnwxb4KfB408Ssj2C+1995yfKN8KSffHlGbnUg0v?=
 =?us-ascii?Q?0Rxtth0J/cODslDCPBQ1PB6hPrzhZVpvfSyTwyPMSFtbL9oWAI1jrLWDpJsr?=
 =?us-ascii?Q?jk4pNRMvbzLjUdbwAmW+X3dajiuual4YdeZTKOTTkjY8LgX4vBKOO0qLMACt?=
 =?us-ascii?Q?aJy/voFdaroHkQgImhTIauEd7TuiuvSqg8x6+F+wCoXZmouAdZvwKdjZIIRE?=
 =?us-ascii?Q?yis8ukY06W9aaka8PyDbjoVbaYyRppYpFXfsDLdo9BfFttYMEsPhIghlPP4X?=
 =?us-ascii?Q?1JYqGE1mu4rBxpXiZW4E9W6Elrc6n8/rxteV7HWOw56CIAYdxTkYr2piMea2?=
 =?us-ascii?Q?jSJZWg0ZXBJmnLshXifUiGwphSQIh/nqqP1OWSxw9C1BxCfm+hbAw69M45Zl?=
 =?us-ascii?Q?bVFGbz5eDBPHR0uB8+RA1zpNc+gmiza98MH5xC2HeItWMX4OFa2QhW+vvAm2?=
 =?us-ascii?Q?y/57HfoOT/WP6jQJ1olIXAIVKDsSXq4PNhv9Kr3/Oj6qReUi9ZK/BZDWKhVo?=
 =?us-ascii?Q?ygxBHiQAK3qvHC6ryCawETVsDlit6N4SavXw/OGDnygyxH8luHJwYcrkQf9p?=
 =?us-ascii?Q?r1j1mL58GpVq7KqFbDGkopqmQJK8oW8YP9BUlA5dgpi2XEFaUxQ2XQ6FIOV2?=
 =?us-ascii?Q?/lILjH9/9jNfGW6bKsSfL7UZMdb34/MvOa0eCMBrdRvscZmkvryYfu6KSEJ4?=
 =?us-ascii?Q?lSfbxzYu9gMhrw1kNS0i0MA5nnaY703a1CzSwAmi+pziGNrulW/fG+dIVSBB?=
 =?us-ascii?Q?EkhGayEtHlIjsUNs50AdTKWycXQrSRGBGa3w7ymPp5SU1m2YqHaBOpUm0RN5?=
 =?us-ascii?Q?c4FEhw+Mhtx0KHf4mupHsSYRrcZvlmU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2c1b71-ccde-4019-74cf-08def242358b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:31.4858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rvT4EVn8zXt0pBKCAN5Bo1e+uRlTY/+ctakGx2VbUNThJxj279kSU/tK+phSJAtcFQpcKMUxPvjMt1CxJr+A3J59sf/4GOJ+thTNnfliNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

The "airoha,en7581-chip-scu" is not a good compatible string in the en7523
case. Let's search chip scu regmap with "airoha,chip-scu" phangle first
and fallback to SoC specific chip scu compatible string on failure.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 1 +
 drivers/pinctrl/airoha/pinctrl-airoha.c | 9 ++++++---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1 +
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index e6b60c8f9fa73..c1acbfb7426e8 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -130,6 +130,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	const char *chip_scu_compatible;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
 	const struct pinctrl_pin_desc *pins;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 83aba3ba735c0..6ddc4b8765602 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -779,9 +779,12 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pinctrl->regmap))
 		return PTR_ERR(pinctrl->regmap);
 
-	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
-	if (IS_ERR(map))
-		return PTR_ERR(map);
+	map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip-scu");
+	if (IS_ERR_OR_NULL(map)) {
+		map = syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
+		if (IS_ERR(map))
+			return PTR_ERR(map);
+	}
 
 	pinctrl->chip_scu = map;
 
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index cd2a78382bc6a..2fcf88106e11d 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1432,6 +1432,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 031a8b36e0024..2c3a75c35915c 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1462,6 +1462,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index 91490418e9ab1..5aa39bacf460c 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1104,6 +1104,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
-- 
2.53.0

