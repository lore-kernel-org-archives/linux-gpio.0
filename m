Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576684749CC;
	Tue,  4 Aug 2026 16:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859506; cv=fail; b=uWqhX0S02FsTIPxVZVtqLxibc2S6qRYXLnCCPNoBnGMjVwGIV6v3o0tcBmz8fjJgDuhY0UOY5YyFHR3vuUiPyNTBe9Ob/GKnOArBWndTOJFv1s9/cnMXm1zZENSn1EpEjHtMMayHJmerPKF2CbD++WQi7TzK6G3+P6UdOWBuLvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859506; c=relaxed/simple;
	bh=BAsCM3N92C5c0rnmgRcslqwNOYFW55WlnXRA7htKQ4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WNNCGNifCJ7h+1y2A3sLtP69H43qx1+uTcE9pHwxdqmbizpy7RHoaog0CWo5YCod9SlEsM9E9tRJ7GVpeVGEE8N/yCBmYpqD+vnUsMYFWsogqYLHiuHpwpJJUep1g28BaTJTK4mNqtSX8gq6OPWlV1KslpAnOKJQbd+urADKa08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=a2TCNEPl; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="a2TCNEPl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqqrQqWjutXd5ht40wqNezkg1k3UEV0JtjVZ58ww8nNLMn+QTfhg6UNJofdndNEVlYlS5HmuU/0N7C3igOeRmvEGeMSGcmYD18PzyLOGc/NrniTiH4mFQ1WIrd94ahsgs63X0M9R+DOyhC1+RR5Cr6dLjyw75AthQaq5lMSoE1ceUp9ShM0TwR3iGpi5Fbhlb/M32XuYMhp84dVFy+GO/YodPTD3Id92MIBMccuQlYYRUOqN81aVPDKBh2yKpWqS7RhfWuh7Kc1dHVl3wVijGctxs9UDA/RXhKiBcdiV0sXhTktt0WuCzBvtxvXptCa9qWVP4Ag2L/s+sKP3PMLvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxJCudCEXiaM1BIJLlyKVb9lJoh8TqXUo+AEKzbvyA4=;
 b=TOg4zIqrhE6pZqL3YfNls2D4tXOVlUuirA5JHX+o7ceN4ulbGZLTDfk71SUONiltTxAKCCIrV7n1lSYArJSMQF3OxrmOM7GNXse3U5UeZHNHD5Gotf04yGwl1hFjvxyhAUUj95hyGjDwmrFpaJ5aik8n0vt8BV9ucFCHJYQFU7XzIOjeoHYdJTOzdMLWoztlu6u1IibS5/2NhcsHCTUwdqoIYsDjTyhfFIcOppWQqpAG1shoBKGaYwnMm7rhA31/7PTjtr5E4xXu9dt/PtHr3UvfofIqpumcxyhLnMwXtxYiy8A89HxhipD8CDnOT+xk9C0vCunu8jWY2u9d/C5zEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxJCudCEXiaM1BIJLlyKVb9lJoh8TqXUo+AEKzbvyA4=;
 b=a2TCNEPlz2io0jmvcARO2/iwZDSp71+3gdJ4lDRasKwBMSnTGY522MwLUTfYqZoZrTqCKys2aOaJ82qHuyXzxmwh8Jqp7m6QcptoPTAAjvvmRNOqM9WMhqi80wFIILH7Tm061ED8T4gQnxT8QFWrgoKgWNddivvsLDlppTdyP0q4vwhXt2Ij6Y9OyWvGuNYILGq+yHrvZsVg1ZnEw2jtbT8tOtme65gv8RWcJgA45aiZo8HGt2PQeyU7tX+epDc08XBQ2qllCJvoVBF6hTVoohdDVR0GXLz6FcEJnkmQRIGTg8Frz1XfcvfwZniCpIJk+K8rgvVBkV4/JGKvb6SwhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:58 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:58 +0000
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
Subject: [PATCH v9 16/36] pinctrl: airoha: minor improvements
Date: Tue,  4 Aug 2026 19:03:59 +0300
Message-ID: <20260804160419.3592327-17-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 882be4a5-0ed1-4514-cedf-08def24221df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	40LFrtYNdLgEruVRsYSrWDyq2DhN1GXVwYxw9/BC+s7L5e6psLRewTqqykXYgE8WqkrL19Hb9P7KTBSIMJkZuGw0RDHm9pBmTMvh2FsZAXbtLh/GmPGEQoXjk6uJtkhUuqiuHNUu60iX3VFHuhsjyvXrM3BfKtYUi/LIv8bTkf8nIQ3/8qSbSMg7qr071nR8sLySjC0NDkGntGYGordSb0Dne90ovqKBMHUaG3KRS068j4uGapdGpXBMbcgzMMtazaDlNo3tbYsZvu34XbQt+8Ooe2OjsF7jaLW9YzaICAvhWIYQifp2g1el1jKM3LAZvMsH0B4sFwg84ypEchkaKP3agMhhWVLhMqm8QF/+uSk7BNk4+8ghZX4gwhobYJDuZxexc9ApL7JDZ+8aUQzrdrJhAWvwfGT0aRTt8Ke9ZJnMa/v5+ngozfh3G5PKafDEVdQmS9E3MHNzi6Sbn4lkBSpdkI8bO5EkUd1yj2r8GPURjf/75SUqHzdBqXvLWmWymBcr7jAG2H/g44Lp1UQOednMc+AHtEUMV6hRXqsfyaRiuPQdzYB50wuWKhyO95/wVZv8rCTMsGgPBLE8F+8yVsCgYS1mUF+JNg0XviNl5DrX10mJQcaPiChFE77V3VPL1ass1tNF4ijeca1p9saiXdksPO3bdOZ1vmK7M/waaBFIrrgn25TOZhdxrJHguKYf6FOJb4eKZ3c4cA8I1sYufJATH7X4LTkP5AHnZ9R2Hj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VBi9pw4ZVoFrZma2uISRtKlvy3ZJbdMPtWIVpiV7HALXqm+K7uUwgvZiGyVW?=
 =?us-ascii?Q?h47sOWyOh1hiycB7SEzDYdZ3CZKelx7p3olDWCUyLdGnerS6USNvfGxnVr9a?=
 =?us-ascii?Q?+hptZytKstAvZ239QJYG9znWWDXUkqIipUmDdNEkpVAJBVBSHHIiQ0QF7X/S?=
 =?us-ascii?Q?IBhJafhiRkJ7QZqawAqdD2w/disSUBibwfJUcMhSr8cRDCQPl53ioY2t5DUb?=
 =?us-ascii?Q?0ek6sJlCY5frlHzVBsqXOpQwSn1rnSMCwmuLEloj+MQWcSxAV9Y/TAhrtM+c?=
 =?us-ascii?Q?Tqkp+q9ZjPd+yUcIUru+U0Cm4CC2F4LwWDinksctNolrW1bHX6NO59TS0G8c?=
 =?us-ascii?Q?5Q7vCY4hZRZT1NGeUP31k+VIvyf5w0UpInRfknitRJ5AwVqp3t/BWj/mFhtR?=
 =?us-ascii?Q?7BkmK/c20LNwmUFCpWbR0/H1KFmlYqCagQFEj77BDK1vMuuPxbBlxdEwPKky?=
 =?us-ascii?Q?i7qKbjzT+mfMg1m4oQLlFtHOEWMGsR1ME6pP5j+MTuN12E8Esl1uxCyfX/n+?=
 =?us-ascii?Q?J4WHa5orrd54ghHSSOkJi3PX10nrHXd+AyLqJrFUiyIRz4ofSJIfmp0WQbVX?=
 =?us-ascii?Q?wrXfANr86hxLhfsOkYCf1G+mY29XsK3mKBvrD1KGdOHWG278ysG3vZqxeBCH?=
 =?us-ascii?Q?0cIVPjOETCAeQrYWA2lviMZfi3KxTZgOCCKrBsqB0s7MQ1stmbTvpl/JNPr9?=
 =?us-ascii?Q?lqS5Qh9QnuyiIAWxor7uyfJr+zj/vXfSZINkFklOGT2IQUN97DbmVj3/4vGU?=
 =?us-ascii?Q?apLVUMvR945+IIkwCDqUN4AvtvD4/pHO4KGnqw5n43dmHwGmLe3adS+n1QWT?=
 =?us-ascii?Q?XdbWhgsAoiAMY2jv4pDAPxJPROweE2TxcQu7SN/PIzbNVeM/1Zd2kQjxwl9w?=
 =?us-ascii?Q?PSqhRxbs4HVbQ/2wP0fUyluHzwYBQouw5PienzgZcpZIWo+ywHtmTRQFPocj?=
 =?us-ascii?Q?Vfj5pQXsdRvtoElKIGA7KP2gGExE4r9U6yNnLQLAcr/Wlu6AZVJAudyA7lKV?=
 =?us-ascii?Q?nXHnL0G56x0WSMNlPRwxCVpFN531vb/4wt1aWctztFLfh3GBqP/S3upn9Vg8?=
 =?us-ascii?Q?cl/FGM1zt1OzYqibP66HhNKdmrf9z6pqHhgxeLlp2DZTn7M1tHUdpYzgMZ8t?=
 =?us-ascii?Q?BcCyQoHpr7qZGQOHG6ENvQil1eW4xe7OFWLgZa3CT3ZT2OqcTgbt4cyaedCd?=
 =?us-ascii?Q?3fFe4YBoY9fQF9rjKc8qJL5TGM3KGTg0klewSBgwUa+HU/rBCsCvsR5LtwR8?=
 =?us-ascii?Q?Chj54nB2mKC6W0X+qt8/g3fL22DjpWz8nFNtR2+bLTRTJTDNFm9CdM84KaZ7?=
 =?us-ascii?Q?3eqySC7YrNEvnGrYgcK3p05cSz6h8GLt8WZ9a9CGRvehnXqx6ZeD5wLpqA0f?=
 =?us-ascii?Q?DGbVx8WbgWpGrKRdpLd1B+LYHafGdq3ClSke8J7/QpbHf5/Z7XYtbRQMQuSt?=
 =?us-ascii?Q?WhDxNpNG89sFnwkTYaTLB2CIsHmUKCCqja+59EITDkNMsfCa9QNEmtc9B+n2?=
 =?us-ascii?Q?cVRqxE5hIZvyh9QafA7ARPGbG832QOJ1UIRDzK+N/Yzz0nKSc7R2sxkZXNe5?=
 =?us-ascii?Q?0djhE+E9v8MGnKnHJVPomNwg/bGpZAV8YlIf1wCflDu+Vksg8WwaYfvy69+O?=
 =?us-ascii?Q?9zFpog64BNJZ2YEeDFsijYs/Gwsl3F1n6JYlEALbE/Z9Im/S/Qe2PsP8gWIK?=
 =?us-ascii?Q?BkfU7OS6HppGbLuYlsIlaGrjnXEwRXGAagWrnuDbqDxCVraosyaQ2LYKeHtp?=
 =?us-ascii?Q?Z/VY1vepz8RBqalru2I9QZr8zDQW67w=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 882be4a5-0ed1-4514-cedf-08def24221df
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:58.4740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEvUbbs/7cjTtwr2vK7RcfV0FGKtQ/dzY67nle9NIq1axPh6rV63lY6DV7POdlahzTbG6KPDraTSdFCuk0gQRogfv76CPFYzetQgWSGLnVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

Changes:
 * use field_get() macro instead of direct bit operations
 * improve error handling

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 37 +++++++++++++++++++------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 746728d3df901..9a575e22dd562 100644
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
-- 
2.53.0

