Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021116.outbound.protection.outlook.com [52.101.70.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13A47987B;
	Tue,  4 Aug 2026 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859512; cv=fail; b=gxPEcBjHsORZCS0GPMaxPNfrfpA4e9FkfPaBS71mlI1LfftXGFeN1hQU6hrcnXaXDBBkgXBMLiTNu0h8K7azlcSFhGH/TNOrHSVwnCi6Q8w3DrislxNzzgZPB6wxOjRW1vybV29JONL0WmlFjI4KYuKL7DwFLKBDC6Siyjyd+j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859512; c=relaxed/simple;
	bh=Hq2XwvTEx8f8uV5e73qX9C4HF7IdW6MRXG74ysmoroQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FeVSDlYOLBqKhnwG6Wsy+gCrpuHdEalNcujXP2CBoOUhe3cXe8rqzyZbqMbL6roYZnKERRH6CsdUzODXGYqMHhHmVjzDz57mrvXidvmFCIdQO9enOdbf4TsDqS6+Ke3Uq/HE9PDM8HNSFW4Z5iHRXSLijE0L2zTlqjy0cfZxTFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Zo5Yt29d; arc=fail smtp.client-ip=52.101.70.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Zo5Yt29d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAlP+41eKRayQLEu1s/Ntak4AB+ipqThB7wBHPy5Wr4hSOcEk0aLTXySd5SMNxXU2SPo1zveEyGBYTodNtrjzyV4qJUhPezuhVgEaJ+Ks1zAbo0qJVSafhvK+Mfhy5GGD9HzDxNboUOi9dju9wtnQyPUdrSay3GhP3A6zrLdfZPBfqlHxGSkgFUk9zID/YemNUQgOXab3WyqpiMyoLA3pqxHGtXMDwsvGjmuJ2jlVHeLXLC5eMfyM5VkLjocOlTx5tC77BsHzFNh3vXFLVPaSdy0SuHRAGBQnxqFWI8uLno4Kap+cGcV3mwdZs3+xgsW9UL07wcPPa4XAqFfXkLc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CiXNFWEVjoRLH7DkqfTPmruWn9eiYmW11EWzvD7l7U=;
 b=HgU0uXWZOaKOAIPzFOePt2cUTj1WO6Ec+9z3dSOB8fULTyJ067GSRZB6QwRTprHZzKikmcHSQE/JOyOAE8qJfy4ZANpLU46a3NLeGbaqzwIWvYX+o/3jFQ0asDoELD33iMa9tEILxzZnL8RNU3mJjy/+naVXIrv+YjVat3I7efbdVqLG2iEjWEZw4CegGLNnSwJsSxXPqTbntmyqklUJI3geY4CbbtPFnivFqvWPPoRhX3Z2WU3vjx3Sn9gA2eust95Chdo883vkIOkJbL7cRj77QC2MHpEmeD0IO26LDjGByrX3o/nLLy0z98dTiclQqMcHSkimh4ThlFHAw3tuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CiXNFWEVjoRLH7DkqfTPmruWn9eiYmW11EWzvD7l7U=;
 b=Zo5Yt29du7yrgA9U2oeyyM9BJJ7OdH8AR7nbtUkqED9zG2z4XLe2hDhIgCP+IAEcIOvEeTLJ1fXrNc8QN1WhiFdAMxHBE1qSC5qCxmJiATdu3wUAZCEj/ijkHKYtltpvtBbbEWfwYEYK2NqYJHWIHQm+AMd0DG7HHItD4lUABilPUkBFEIdr87ehTTZN/jY+jsHujXZYKmn6tpIbGxfgcW91TU3quueNx4OpmNFgfSFdfP8NKL+ECoGl1DJxNmt3Pir7PtfhgFL1QuT5XbaLJ/D5KteND416EFQZUt0QXPi5iobCEtPgWqoSRo6+9m3BY5suMFBwGXTCBjM4tQs+oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:02 +0000
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
Subject: [PATCH v9 18/36] pinctrl: airoha: add missed IRQ resource helpers
Date: Tue,  4 Aug 2026 19:04:01 +0300
Message-ID: <20260804160419.3592327-19-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: cd0180a6-6b03-4e84-9c9d-08def2422408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kGzKhRqEI08ewzidWWGEvLBqJHm/oHNLgiEt6Udig1vRRJg8VRxdyFh5AUtYg+QjjrhHtXTl/MLZWh3mH+MQdMq977uzb8vXPzK6C0GbX9Ge5OsRm3SkZo0gfjJbkC6kEgIaMvB5WTCYzAHUnVZBYBdmKmzAeeYQ9aflsBMY2J1A8gQQ6gKgGJTV9v3Bx3Wc/btcRKhCH4iEWE0B+7brmscqwsWJ/OJ9o1yswTFeDBGSOOSpf771cbqzzVtoMGnCVvBHSX6OmyXB4/USADNuFTHUuyaeQ+0eeIbtpznB+SnDD7sp0x12exQSkM8NB0cChO18AQDXstphGBvKcQu2gV8bxuFR/P4yTqm7v8yEDl4qbi7AX/2PYqhfGb3JmnSdC/F2cuCxj37YTDXFlWkSMByn39D4Zs47dHZ790u06kkNZBEfPaXhbqK+jzczebbPDfRptJP6/6FPbpoQft7wMjxAWnE/6W9bDKIzUbsMhatb+Oryc/p1ME1LRj2ZqvCaTO/fB3bcYIFQEPaokEfIVB6AMQ6MoAPJ4kRLa/9JHhysfPKBK/sbucDuFm2Wi1m98NXbEugKpXvg3xys8msT5cLVV4Z+2i83e/4AQnByMrlOOAG+Lq/ZcP+cf1L5px7xyf/va6IlH/K78BOqV5LonBwN/AC+ugHmXylh0HRzah7vjiKlWJSH1avt+VoVuZt9Rnlqy1NBke31JL92b23mxXS/dPrkyf+iyVGQZ3lTCthQ5Z8XWIv5cf4Q9sT3RC6K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d3CdAYw1EfhV+/jhk7dIUJc6NudjA9XYfZOdH4DgzOXdcFgve2ec7v+PM1wI?=
 =?us-ascii?Q?gluv/aZr6EkM8H//VLSZebNHNsLPLEgVC7Jn08WJ3oy3MpCHQTfwyl+nlqK/?=
 =?us-ascii?Q?AHN19TAV+RErU+HSM1ODzddRfzCatKbqPQasuQ8sQG+QhDnghy1v5yaD7U00?=
 =?us-ascii?Q?/ves0fn6akxviTxAMHzymLu8n84PjBR9EmH0vy/cAv8nCzldCqBXDJtW05Al?=
 =?us-ascii?Q?j8qoedgZEHWEnSyyLh/zPVV5rXd7jiBDcRezt/4h7dk2KdItLt1CRdzDIq6u?=
 =?us-ascii?Q?MyjARb4pgIEMHpm7QztWD7ouPFMc6UjCymjThUYZyfwDNCvp0tvII/2ubN8i?=
 =?us-ascii?Q?//dzIF5OaDEtoCblgzuVRnB6d9hAVa8Jx96F4psxa1tolHPa/nzwiMtV6ZeV?=
 =?us-ascii?Q?bmDR9HUsBG8O8Hj70guyUHsJYzcxaGRlycF82NfNmd9Cko/sARwQGxYCmKXN?=
 =?us-ascii?Q?4LIe241VrmrbEx974j/P/3gB9oUTKnietTxJGCNBRTsT9RYVUhEkCH590qrI?=
 =?us-ascii?Q?0riEBRmqrHfOKbkUVoLy5tgwpPAsKIkuFjjxtmwZlZFuosZyo6j3+dDfJ8BN?=
 =?us-ascii?Q?OJO/EbjUUv3HJqKJlU8cQkBRSz6sZr5+NtPrCrosncRW4FLd2w7DmNHE5w4r?=
 =?us-ascii?Q?imGzv7mGyRcipd8fWK0DBppnmV6UrJBgBA8NJF2BdDLxtNMOh3Fk5+o4mtD7?=
 =?us-ascii?Q?TMnetLiSUJYWzG/J6lxU3gEqt4UveV/aqSYFOdS3eTEfcunOH4VKPGlT7Tby?=
 =?us-ascii?Q?+kLJTPPKIRelCFy0mfuqLPeAxLEdbcwolfgHQq/eEYoSvKs7yZFEEb4GXrG4?=
 =?us-ascii?Q?d2eD/+ltA+P3AXSmE8AnUsDUUNbO3tvGLNbzu0ORLu8UouBnhFs+emUaWjrv?=
 =?us-ascii?Q?n1KKSw26b1qmxwTcJ6jvqY5k/h6OydfuUa3oPH+XnIfiq5nSpRb36EpdL1pb?=
 =?us-ascii?Q?eY9JZkyiVc+MzFE3yybDukxB16eUydbLSe/nxgW/nRLla3BCGdx+IcAqDgkF?=
 =?us-ascii?Q?1yo5GEZFeJEgKRB2jKZ+XwPSO3xZRQ2npyvb5jH9jHycyzan7X2SXptVwJkt?=
 =?us-ascii?Q?e6JQ+YDi/Z9GZIEnCRL3JzR3nzKDUjHh9Y50SJBx+xwtQyJPGlpJZBDgXhjR?=
 =?us-ascii?Q?8psxWAWOIfYj9pDHp7lPTJeENbOjoQyCSlFUYldQLXF6ImLD8Sa6nS0dzaMw?=
 =?us-ascii?Q?d+0GUpQpdDK46mONIDjusyQkflBrcv5/ZH9pflP5VwBARu2h4euyoeeZl4yr?=
 =?us-ascii?Q?O1yR5wAakCW9XYztm4Zkf+ppM375Odln8nVWjHPtR/+5ovb2JDKjbsZMtXYB?=
 =?us-ascii?Q?1EOIL5sGcIiE1KRpxhn/gKqt5kympdmSeWvWz2+nogO9dhlI0s5U+zWnL/mK?=
 =?us-ascii?Q?QcuvqrYdX9BWQUolhCNj8EMxrq//EOpdPWswsZDk03w7CGJnRazkSrEBfOpQ?=
 =?us-ascii?Q?snqex9OGOymEsJ75BHgq+lhrk8MEayWxj+v6DV94qGo/LL86okWAUyI6wjlf?=
 =?us-ascii?Q?1V3Wqm4Z5vWL1I5H3byRIx/mdd2P/hERrKK5Oi2uWD5OP5/On78ntIOkd4F+?=
 =?us-ascii?Q?Lin8NdcQQcJNRcB80feJGNgxYOqEVE0yIIZ6jRarZkzkX8zZTVFgg/iumH35?=
 =?us-ascii?Q?xGmOiawWsOF5XMllCeuAb7+dOCXCXNCWIEd8Ilt259L4cqDb6693y4y6g54S?=
 =?us-ascii?Q?6ZLWApgwYl8MsgHMAY3+hk4LBJlKgNdN9vnNeaNqrRdJGJxEsPV3RmdGxxwh?=
 =?us-ascii?Q?nsoD30I02rcJP5OnoyRabprMA5nRU84=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0180a6-6b03-4e84-9c9d-08def2422408
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:02.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oh331bmpY5xgGW8kJBwTD2C/sQNASG5YsyJtEktC1Ownnybdxc8edtm1v3fIYLgNZuLxyukUQdoC/YNqcneeWg9RuUXgx9JT52SnfPdsBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

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
index 8895a8123c621..b4c61fa811fb1 100644
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

