Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021080.outbound.protection.outlook.com [40.107.130.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33844DB555;
	Thu,  6 Aug 2026 22:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054053; cv=fail; b=h9JtLnNlrvwF3E3/ceMrIIo0aX/aMzvl5SlevdC1OvQ4BXeY+GQRX5Hux4kTJcLBEDbhXIww+uptDKWkU4OexNZ0oKspnTJ/uuND4pG5ITngmAwid5ywatndivgnEhKgq0nm+v41IhWn9v6vK/P9zQEIAOBUhdwArtsa5CnwKO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054053; c=relaxed/simple;
	bh=Vo0fYB0BW0W5cQLvUvBAp/gRLCyT5w6W1+W9XuET5zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fozyj9eQfnluTt1W1fBC0oOsviePpNhC0pka8+zdJOBu8BrRJoNp7VkVHJ0scUfU9n887IYTaHpQERzz18z1NCAc4x2zW7K4ccQIE3ZKBe7OzDiDPHQo33GNMhMbwhPdKcEjRhJ61b6Q75ygyrTQ9secLWqxcKMYN2rI3AksNGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=3PlzVoP9; arc=fail smtp.client-ip=40.107.130.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="3PlzVoP9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d563iUobtpmStnHiRyZVh3M7pYAfOIap7DhAe4IqLODq+/yikkTvoZP7O2az1eK7fvS1M6k4U4nerDzw2oxvvF9f1s4tqHJ5/q6JrDvXZsaHI5uBnw2fA/NXMwfoXEIPRZjX5YelUBFi9eck0IM/8xEztainRVdT7POtMUpRCieDXaotpF1qTV14L0PiqGCZbLq2T0AeIUfTGw9olBYqO0DFCmqB/qY2tVNw7Sr2zm8RHTo+AcqSLhv8tD3nhJ0bPu7inb36VaPzS9PJomQrA2rRApHgSIKxvX5N2w2mGlQVEDU4p+ZSXb06n/fasqnzGiRRIh6kfBg1jqMId9e3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy2K2i0zQ8e9nKwSQd3DnmrScl8WMNqkY1SZWcwOzW4=;
 b=YKvBfpN01+XyP4cNYG/CxoRLLdDLN+qOpgW9a4iDutw0o/nnNhNNyYFl1i4HkDm/bJM1USe7Buh6iaPm9E/fu2IIXPGTWUpE+FRSALQypp004b3k/3fGzxNZBhYy7SIqCrZokn8rcEqFCeuAllTxAR+mjBT3G/FUWvxoFNyxpT2lG76x3pMUCkLfngsdpvYAMEDXbvKSgErh7wZlcbugxpLjarjGqnWYrzhrfJOGlprO8vvkMz9oJ6Ixb+OQwvglGakl9fWcr+v9kJ+fl8ZrRaw2PYevgwLjLimUQsfXn8w5Jr5LRx5+M3JqhIwN9fYCj9KEWi5pPeKZCy2OGD7Nag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy2K2i0zQ8e9nKwSQd3DnmrScl8WMNqkY1SZWcwOzW4=;
 b=3PlzVoP93v7HaK+8jl7aLu0L+rcOyxKd/LlHBoaZo3LYZiZGSpCUWWzpD5XbjhFy5orv8QhtHD34ZNrcrwU/QLBlIwu5vPVpzSFH7V9p+bgneRfO5U1WsvhGJokr+9cTdS7+VO3Gb2Ra55VE/1+ng0tRCJrdFjQ7PXNkwg9FsjlSqtLM/sASSCx06qZrUO35e7BkYw+yShZyKK1QT+BihMPagd2iemg0KWQmzvnsyQnbdUhxtjvQf61iZI0nByjDhe8D123hZMrBnIm+v8No60Q7RMAm1/sXO+iW/M2Hekw0YDP5U0rAPlq2AP7mAhxcGGxv5ScLtArgkXWgBPiExA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:24 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:24 +0000
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
Subject: [PATCH v11 32/37] pinctrl: airoha: an7583: add support for olt pinmux
Date: Fri,  7 Aug 2026 01:06:10 +0300
Message-ID: <20260806220615.4078303-33-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 07999855-2721-45bd-3cac-08def4071814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jL7dDOkY2k8FvqlL+GfM3C9WMFmsW6g9sFnp4/UyqGInb5sHQeJfg7cXtzAbMceX9yTQRARVO6uDVmkGueS5k/GyGMkQRFkqbyWdaw9pZJaxEXAG5sdwY8cUCDSKj3GNJZWrcxZQKxFsyVmkO/+NhsiSpcxNXCLaFJlbflt5hQGAWEdROZrDDQOCNnfo4QjeIxvRYpxyWCTGT1pM4C4qtWvlkdIOw4Wc/xSQ/bwVSkMK9Qpy6Fa2j0cWLeST7qiIit7Uo6sYZH98RHHBTHewOzsf72zov3McRCIhPsFtiF0LdIXadqX9I+0av/d8dNPlD5juLI12KMhl12b/iKjZHq9XAwAH7wwGSDPTp1CcWmFjcbBkVNwiNXD7hSzZ+CdWYrWqplIX9CGtW5qKuISKFV/ynX8gfInTx3dz0WytJj98UcfbrZhoVqorb3npHuY6JC+A+qUyjP/nMOu26indC8HidExeHu79kIxvWuxmgBGcns/wdWi1/0HO6VAVx5lSzPgvYuHL1aXNj8wLbVufqjIg2adGD12R2fgRhhq01qMuyLhCUQ5KWX825kkwFDXPfXXb5aNoI0c3ia7yA+MaacQjn3q3fa4+3eGFGeYg6AXjqatcK9n8Pytnx6MsXnp1/FLr+F6ayWvxacB4uTFbGOpLHIE+LSTYq74lquDm5Stkhh/rhCuVCL/fhl9t08Hp27J6y5PYuhblj9kCmy4mv2fikbaUbZh8OQIlkZblDyWplqKlBICTq6neeH/SWVB/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K+VH8804lsMe2BCoY9h7hCLBynQJtiD+pId+Md7LA9DIxyx9shEj3oEn6gkK?=
 =?us-ascii?Q?sO4c37Iu2Yudb7vHH8WJfoG+s/AZv0oXktLWwurqmMgTZx9I6MGuC/tQM4zP?=
 =?us-ascii?Q?dx+NI4xI6t2KqiFRC3ysDU7Tawwb3WotFt5BRIywqwRsjlD/BcMxm0tbbROU?=
 =?us-ascii?Q?brO8MFTaYAjLXVa0/MUp6nohhoKwRfFmv6CXXXTQado3snhllA9b+UWD5mTM?=
 =?us-ascii?Q?rGH3oFG/4q1rkHmZmdZeNkORnnNevfm/5o/zLBU/2o0JS/JJdZMmq5u3d/dl?=
 =?us-ascii?Q?/RgIt+fwyPvl2a700Vr6PGWA/4+Er3ecfFJzZ1eXhOLgCeU6rXWYfQZSimJC?=
 =?us-ascii?Q?0yA0plKHvJiiriNXP50Xfl1DpqVtvmqYJQ4wCbH6Gu7wdXcMewZCbfeCzrE+?=
 =?us-ascii?Q?lzstKGP4FkZpIUetO2/TO6BpWYTfhE4/48viaV7T3hMOmUH0WV4V5VrQTXIc?=
 =?us-ascii?Q?FL4Co9MpIWu4KHZpD3ysDhSQsGoFScUP8CpCLtZYzrtmVsyhHKib30TwaARS?=
 =?us-ascii?Q?kkUAy8z3ix/sm+1ZGeiYaHwiyXI5/0r1JPsIpn53+4rAIzVVnZTcm0Qw6Gzt?=
 =?us-ascii?Q?r24nstoVY7ZyZgA6D3sIZU6eB5K5FUsMjC2Z17pUDUOkA4hTMxMRdpCPpigW?=
 =?us-ascii?Q?lGmuoPonCllG0Xvb8hfe8w6f3poeNCqRNOj4OT/1B7gIBE66mCQmg/1Ap0kb?=
 =?us-ascii?Q?01rfNnkq31OOxNoTSX8fVuVszbgN0c49/BmafVAP2ZTfl1B1vFAbqRmulGEA?=
 =?us-ascii?Q?SjfrMJUiEK8W8sg+X4NP1dHos+J8BFEXZLfsTXteMh3sHTbsaOzOYXobUpHO?=
 =?us-ascii?Q?jfTDNKIRvq1LAQYMcbfOCZJdRf7ynkbOfm0QhGXXs9G37wo0Z8rQWBUqe74P?=
 =?us-ascii?Q?koL1TIHXun4M/Tbq5HG1grGZy36NfczEjt2rFDUhLOZ8+e6ng00zbTzbvZwb?=
 =?us-ascii?Q?go1k0Rbr26x9cbySZYYW5vBWYXQnewukG/MuopZz5i7tq6IuITlD1zB35PAu?=
 =?us-ascii?Q?pMfyuWVajw0s3A492SUSke2+6pfiDiuYIoFu+TOKaIse7gwQ+sRIZ00hEpE1?=
 =?us-ascii?Q?uCyCbNNN7ljh47EgKOKSDTtgbaw2iwTE2Y3SRS2qYOAitZ3L/hqB2yXiLYjh?=
 =?us-ascii?Q?npGWdEmqoES1eISoAucSMZ3C+aED0ciZ372efX4gDQsqsujbRbNGy8NpO0sZ?=
 =?us-ascii?Q?hmui/fbJXGXRPS0dQLd7Xp1r1DEUrFP0rsciCpA3decdNPoGHG5umsAZr2+O?=
 =?us-ascii?Q?UuE231jH6Ln0ovpTzVQIhjBsWoTsQi/AGPhQgpYhsPnrVtUUsEF5Wk1U7dem?=
 =?us-ascii?Q?aX5ZjHwxZIt7OwwL8o+e6nvrjQRDB+4EtBA2mvLipW7LZB5rmbb48chReGKT?=
 =?us-ascii?Q?n/R1bOkD++DIjWVyda47Qkno3T56yL9zg+oqh1QPe6TqT+OXB9iz+2m9Ap5Z?=
 =?us-ascii?Q?FIHFxFlUr3b0ZgsiqtRvMQPEMD/l+4YIuQTLphTvT8eGn64Dt+TwP/Df2dMm?=
 =?us-ascii?Q?p8+WZtq1Gswv40HEwxpuw+raAPpHFmJFYCgfqZuC3cMhqKTz58rFVnJ0LX9H?=
 =?us-ascii?Q?/kUnaMBVN0b4SRbtXlAgME5ODUbrYyzIbPj77yaI8aA5nFwdauH/RikP9lfu?=
 =?us-ascii?Q?aYE26C5bkQvDz7ziXID1olzqitFc0PUB3uX+rkGnF7mpvEhq26urOcM9tvw6?=
 =?us-ascii?Q?AkjzVs3Iq2dSSTMM/D0jl44cJqNJjJkFyHmPHEbk1UhOSGqwvHiikhL0su9m?=
 =?us-ascii?Q?pOY7WC/JtMb/ojJCPXt+kNlG7jg70k8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 07999855-2721-45bd-3cac-08def4071814
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:24.0407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANE9vwkChXwdKlM9dni+SeHi1rh/5aH9gRaxmj7opwuDS8T8WdKkCF7fLI0zMXED2yQNQa+BPn/8EaOaoOB+qvN6tYNpIWFXL/E3MG0l4AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

Add support for olt pin function for olt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 2e145ef5a224c..031a8b36e0024 100644
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
@@ -483,6 +485,7 @@ static const int pcie_reset1_pins[] = { 52 };
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
 	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
+	PINCTRL_PIN_GROUP("olt", olt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -568,6 +571,7 @@ static const struct pingroup pinctrl_groups[] = {
 };
 
 static const char *const pon_groups[] = { "pon", "pon_alt" };
+static const char *const olt_groups[] = { "olt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -651,6 +655,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
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
@@ -1190,6 +1207,7 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("olt", olt),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", mdio),
-- 
2.53.0

