Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B35357D0E;
	Wed,  5 Aug 2026 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933302; cv=fail; b=XOQ3mZxYog+3sQKRwvLTN23cTRPsQfhWjNFbl5Zi2wNb6jb6AemTU0otYxqWFvNbtqYzdOEMd+GXmv+sXOCpJ6/rf33SD4MZZOv+odAzZ35nL7e0C7ght8higWpfRMqr30w71aAb6hK86//qTgvjD9pzBQSaAwLcvyfoniXPZG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933302; c=relaxed/simple;
	bh=Q7a5+sTBA4khcx29ivjrQh+KtKYz3E5jQisNVbVvk1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=owWeYBg4hcGgFqYF3QOp2ToEvAdfjBRCzR/G3Aw2W1bQMIu3uU6XxMOpmdpEhlIXAjxmm/cCVQSNvwerQuehNI0YZmfwNxkq1qL4/qWXT+equOq1jYpU4Q+6kTg4FQ9audQNdpNpCv4YEUVYKDf4GJgszLLu5+eMlIFCZFcbVnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=lz8MZH9p; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="lz8MZH9p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBHAImJ+Ea9DH7UaX3ZpHfW1JS/mNJrECsmIYuLTcmMDUgp9PF13lFKbqjwGjIw8L/SirjFyS6EwJXMGVn7tavKQHtG5Qk9VFauFjT+2Os1gBmMRx3aj4Ujg/U/m0doROFdTMVS2EqqAIzIJncqRI1FFFJ580CWlWQBYGxVHpUOOitIF1RCcZ+1kJGqgdMQAkq3JBSPbyeT6wxEtr6YSfsozr19Blz25qqKyiSDUwxZDCQTSj4aQpcfRCo/crSMZTcc9bqnK66xQ8oj8EK1HLDfc0BQH/Gfik6V5bGL7g70rEqEtR7QSGXj4ZYqOpDwk7hrtH64ih1ayFGeNQTj7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+jBT+uWJBuanlEpVtrz9RycQApjs6zqw4F4Hnb+uOI=;
 b=Ujeh9/uXm5NwTEOHFFXBucOGPv7egbh8W1YLMidZNxIJNxcalzOANzxXx9QdUlZFuFWoxUfsherEoBe0KGAtVm5mEno+p628g8CT+n029Vrx27eF4piFgC7Jq0QsK/zuctTKv3UoXnXzH1NaF+QTm3ETDtZsRWjGD8jyGkEZmT1oSjmllsd7nZ95YFsmW+2e+imNLUKhXdzsQDDidmBD4nvCF3V3OGJdFk4HehANwV8B9t7Y/9G6neou9a08cTUWOhhFVWJt2/9F2keWZ32JhD2sFsT3VswM3uQfqs4wvPk1CmuUXdBhdA5Y11iD318Nh30CKB2bwOcVrAHZiOCZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+jBT+uWJBuanlEpVtrz9RycQApjs6zqw4F4Hnb+uOI=;
 b=lz8MZH9p2CuMi6L9phyDcBWW3hE24q/KmvqmKupiaUpwz/KRCHdjRXSUPiirC8FRa/EF3oEVUgACaqZm+REJnoT85q+xCYune99HbB2dveSKpgs19g1nz9O2WNWObEQs7/iOaIm9yNV/k9Y+C0ZK9b0zMn9BBmWFYYmCfOTAdlMs1b69IoWL3bVdbGl8u4iU/kBOo/ixeFoixNYMqwF+BpyiMNR7aqXLi01RNZWG2pPKzBsbi+d98gTs5GJZ/eWhHslCOk5USaEYGAj51Y91I5wVl+cuSyHgHpnWfCrd1V7VaGHFd/bQ4v8HRGm5ztTzFaUCieIzg+9Noww5vDS+Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:34:51 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:51 +0000
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
Subject: [PATCH v10 16/36] pinctrl: airoha: minor improvements
Date: Wed,  5 Aug 2026 15:33:48 +0300
Message-ID: <20260805123408.3767648-17-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAVPR08MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: abb66333-90b5-42a8-6d6d-08def2edf1f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AxfrehOJj3LsMlG+HvjmyoaEIDDfAUp1pUGNvxd+Kvpu0uG1Nsz7RgXY835xIzAif/oRAnsuW1Olt7IK0gUsRMDfe/OhNu4GDRkMj25Pabm/LHuSGrLD5cLQyUShx5pVmhP/lhFrUZjZXHQ0nYfFy8toqIoQNGdgJASiG+xCOZO2uNEG0n/NvTEzBE1ZSaVWYmCwObhNKKolOwxnhNs22johEfz7/3jWoSS/EqhgFdel3LvfSARMpSGcn6eoa74joJ25KfvSeQf/pmEGa/UWPP53L5yGNuhAQrCQiJZ9REEWasCA/BQc0Xwu8k0g/+jHm7wpnWRQK5TukFNEnqeUoNnMUqkRLe7lxnhuMBwhSPdNOfJRpcRHVAmVHWM0l8tstonYuIE+H9bQ2bh2Y8Jm0KDbYgWuMF6ToO/3c4Da+nw8IISelFrfFTUupfkOk/JRGD0OytfjuhZIYCm/9DozRitu01qPU5BP13Un8VAFfHavkCGqEOgTHWEGGB4S+qjhtlvAa9mOpbpXwPQ8bt/PT5McHEnf6/bnOXE385hBtbVYUXCNeWQcShuCS8yfGNibBgQvOPpE0ioqzMiPskad0SLngqbXLVhCnj/bt+gZm83TpDH3yIb8Nu6sk1E6110aagGCv2Z08V8yeMSSN94h1ByxBGFNfXHnhEXLtMxWQ0CJ/dS14H7p5ybl8pW+817kqvXvEdFade7LjqsMHjNuitqt7k+pfmiPyLu/1QeITHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YEnDCHMj7gOji+5k7ywML8kye9MT0gVVu8+SQnV8xFB5EvcMtf2QZ5eib09/?=
 =?us-ascii?Q?riV56KtO5bx7eoePS7eEl7eaFdFphOj2EZX0vXsQ8M3EszaKifwEmj3U90Xm?=
 =?us-ascii?Q?h9ff6x5JX1K6lAxyo05zje3JWVjaH5VBKd//nIzbzyPPxTyh8gpeCFkc4jWd?=
 =?us-ascii?Q?o33uS6nfjtOcMaz3BI7VlmUiemGZfVmwmVhQCV2YCpp86DKK1HrUdPsQJNaM?=
 =?us-ascii?Q?ZoR48RXgTMtGgWFqQevGxrDm19nI0c5zUOQxhLWQCRlTUUzFgm7TepTbLXAb?=
 =?us-ascii?Q?37CrmAGOsxjiYDDK31ywi2tNs60M005lag5vpBKSH3sleA2Q2g2IEwj/Xe5q?=
 =?us-ascii?Q?ptAG/7oxpN75i6sDWbLIPrC6dGmBbOdwL9rHBZ8Cd0TEX0AwlqqcZv3jE5mf?=
 =?us-ascii?Q?mgXMwQJE4gZ5jJd7ppeI8DgMiN5S6tAs0fzYGZw0ZtaUp3y74xlEbUR3ngbO?=
 =?us-ascii?Q?4xtYtghS/TFyg4gH6w3eWerKHk3cUUqBES5OnfAtdYsLVKxJEeCd20tFMwYE?=
 =?us-ascii?Q?/davHIzKOOFdizIu0WRW0pAcjnm0+wK+dqk1xM2I4SxeVPZZQx5/0SlR3sYd?=
 =?us-ascii?Q?ed2fT5hP5VI8QkYjUmcQNd9iqle5nFCBD5kZvRADOl+0/c1t9JaERpm9kCoO?=
 =?us-ascii?Q?pjX9csOrf44Ht5wbQw3RAh0TiYtKBiWBfJKEb724bjtsDLgk1wgcUllBWKti?=
 =?us-ascii?Q?cC81ch/Z2w4I2SCUqLR4LDZovgot6BBnGKmlAchgVEt6b1+ihapF2lDv6hPq?=
 =?us-ascii?Q?7/lYCDIC+bSoYJMlI5NxPZuP6xAFf+a4qjmzEuhYK8TJXzXzSY1fYxujwvyd?=
 =?us-ascii?Q?noD/aT7E6bpfGPS2Rn2vFeIAHufoh07Tozr8UpDb+OvL5T6Q0Vgw7ZGacNnt?=
 =?us-ascii?Q?sYM5Vr38VGk3cBN4jWGQNGASJHAWLTQcZcqnjN9dLuuqoPxbKuqj7Yz40gL+?=
 =?us-ascii?Q?qt2X+239ANawpm35Scj29xG3/w5U+MvVtNKDrpFnNCtXNjzYaG0xmL19s3cD?=
 =?us-ascii?Q?AS4WnfHYjymdoriXARZTyzABRsPryrjhjuvhn0w3jnBdbMO/uELLaTfkb+1g?=
 =?us-ascii?Q?UZH4lkLln6lQO3HUw08g8D584e34+YEK9KYiRQf5t3FbsZL7sAPuayTDXP4n?=
 =?us-ascii?Q?wPqFrKkgri6xZP6tgCMhJLCjfEgzgMLhNaPkWeSYFfAgytfPe08fgo4KV1Xp?=
 =?us-ascii?Q?RZKrJACg2y+qTGw2Fk+FbK321CN3C+LvHoFJfqAhC6TRDka4H6g7ysWjbu2V?=
 =?us-ascii?Q?5WoVb4HRYC8a1lOPlq7KEOXA6ikN80Lnppu5ksYkwqxEikt4765KE3N26yYE?=
 =?us-ascii?Q?20XPDE+TweD87tQoCDvE+MW6fWx5HOHV6O4hGCWdG1jS20b004caUbt56zjE?=
 =?us-ascii?Q?rUdoQl03+UduB4UDPBTMOM9jBT6plu9fpvODodk3ct0rfzIRCIYVYWY701nt?=
 =?us-ascii?Q?OHVjzxckEJe6HW0HVhmhvBmN0tzKPrr1o+yDm88pYji4PWsTFeYbe3MyRFA5?=
 =?us-ascii?Q?7RqvBvcUhvW7sqIx74kjgHa9CHXHkjKZXbeFYmWyxa8aAQzvZLwh5s0pw3C+?=
 =?us-ascii?Q?fwtw9FI1mt15BSVts6fMLv6oy3kwlmar8Btr25OiZkt0RWD+b1Z7IwpUxDHE?=
 =?us-ascii?Q?y/iF4vnq9CDJ+XvZVk3gFg5hFL9yMY6WFCe0CZ62AakZkdDC9MLc4OiWVk8z?=
 =?us-ascii?Q?Ny7vBH68Ogk+OwzGM5izy7P6fYAOuqKnwRGKaIQJ1MlRbSPWu7qrWotGXrw1?=
 =?us-ascii?Q?W1KI0TlRHAaeM1Wl5IXkxdkw8McE3Jw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: abb66333-90b5-42a8-6d6d-08def2edf1f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:51.5276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/lPw0plF8Mrp1/NRxSeugvzk1TgkRBTzF8z8bXHYDNNhHZCxmtOrEyRP4QNos8sItdJlqNgU17GADiryVFPBBHSxyOp/StK+evHVrIg6DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

Changes:
 * use field_get() macro instead of direct bit operations
 * improve error handling

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 56 +++++++++++++++++++------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 746728d3df901..e4bfbd1571233 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2840,7 +2840,7 @@ static int airoha_pinctrl_get_conf(struct airoha_pinctrl *pinctrl,
 	if (regmap_read(pinctrl->chip_scu, reg->offset, val))
 		return -EINVAL;
 
-	*val = (*val & reg->mask) >> __ffs(reg->mask);
+	*val = field_get(reg->mask, *val);
 
 	return 0;
 }
@@ -2862,7 +2862,7 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 
 
 	if (regmap_update_bits(pinctrl->chip_scu, reg->offset, reg->mask,
-				val << __ffs(reg->mask)))
+			       field_prep(reg->mask, val)))
 		return -EINVAL;
 
 	return 0;
@@ -2994,7 +2994,7 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 			      unsigned int num_configs)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-	int i;
+	int i, err;
 
 	for (i = 0; i < num_configs; i++) {
 		u32 param = pinconf_to_config_param(configs[i]);
@@ -3002,16 +3002,35 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
-			airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 0);
-			airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
+			err = airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 0);
+			if (err)
+				return err;
+
+			err = airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
+			if (err)
+				return err;
+
 			break;
+
 		case PIN_CONFIG_BIAS_PULL_UP:
-			airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 0);
-			airoha_pinctrl_set_pullup_conf(pinctrl, pin, 1);
+			err = airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 0);
+			if (err)
+				return err;
+
+			err = airoha_pinctrl_set_pullup_conf(pinctrl, pin, 1);
+			if (err)
+				return err;
+
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 1);
-			airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
+			err = airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 1);
+			if (err)
+				return err;
+
+			err = airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
+			if (err)
+				return err;
+
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH: {
 			u32 e2 = 0, e4 = 0;
@@ -3033,18 +3052,29 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 				return -EINVAL;
 			}
 
-			airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, e2);
-			airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, e4);
+			err = airoha_pinctrl_set_drive_e2_conf(pinctrl,
+							       pin, e2);
+			if (err)
+				return err;
+
+			err = airoha_pinctrl_set_drive_e4_conf(pinctrl,
+							       pin, e4);
+			if (err)
+				return err;
+
 			break;
 		}
 		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-			airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, !!arg);
+			err = airoha_pinctrl_set_pcie_rst_od_conf(pinctrl,
+								  pin, !!arg);
+			if (err)
+				return err;
+
 			break;
 		case PIN_CONFIG_OUTPUT_ENABLE:
 		case PIN_CONFIG_INPUT_ENABLE:
 		case PIN_CONFIG_LEVEL: {
 			bool input = param == PIN_CONFIG_INPUT_ENABLE;
-			int err;
 
 			err = airoha_pinmux_set_direction(pctrl_dev, NULL, pin,
 							  input);
-- 
2.53.0

