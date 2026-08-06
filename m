Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2334942252A;
	Thu,  6 Aug 2026 22:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053992; cv=fail; b=geIJDYOtufoAU1bcbecwdHeCWkUbzhPFsgm548OeASwSo0mmyZ1ueZPzS3r9kSsyWTkJtMOjNFjNxy9aPJ6sa39qTVHwcn1ETs1YlfzdHaaogbrqediajgIyXdRVii2h/Y9/UFhPuwfKuJJKTkzLn3YzXYJ/daU/HRjkojLzVaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053992; c=relaxed/simple;
	bh=ntkT8byvUIV+4fn8kv2PxuEr259B86P7Z4LIK7w2Vbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gYtZIGBJZ8v0YciYD5n/FwrY9UkMGLW1hDsiZlauleUlFjHUFnRwbrluzlKI2CjaKryhGcZHCSxL+zbw/vSS3CyCcpLawNzhC9uJQSVAqDy4yTxLTqPlHTDSN3T/cREUTU5zlDWfNXuebWJ7P42LI5828xPutOt93+SckdyfQcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=rwURZ4GO; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="rwURZ4GO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCyZDCeIJVaZowrCxdpXbvSr9wUun5KcBg1PCvLg6hzVL2kSwKZoeNZgCdjAivJytoQTf6hbA3klCidXMB6C4OgCSpbZfcaESkfcCg/NCpl8270zWGFUIEDBoNDHXgPikmSswiEo0d3zSNEypU1A5lfZsKPagvlXoWOkL9JhhbY6LAKwYXUbynRe5ONEjCkPYuiUqQcN6d+OFyF6aBurXt2l+cwn6pIq5TTJWhFjnbrs7jIRx49xGeBndd0WSuSBmBitZ/RMAdWAEcgGRmFvA6QdheNWxJ9EEy66I21I3E78jTuw0P1TpxYLOkO9VYIveJJ1WTPf0mu2oQ8Frs3+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdsZMFtMoSwdZ5hVBcB02Uej4I7wtGSsPovHi0mjBKs=;
 b=qzLl/cap7ojT6DrWV+llYyiHtIg5uc9endQ+6MEaA7I9n/00uo+RSvZhzW5ckZdj36HDpBhfvwCoY+5y7qibJc/e2X3TR4t5IK5P2rR5YfM/AHoFAVBGCisccbdPCYjM4GHO+abvhZhCMmdoecIPl9GeNs6RPb5/XpC6BnWXt3Ag0TpQkEKjIgj6wrBq/5SpTejaVgj+JYbnVqDL5oqN++s+qmdrGn/lg/+btU+DDMR+DVPJhkPv0bkMphhZK0NAKAuPD1Kl0oCJKT8GAPW3teVF+XBjbHDYfCwgg1lw+/bkB5gw9P1jSmtYh4ZsO+qkCbbihKoA0ON6xJtuYIALeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdsZMFtMoSwdZ5hVBcB02Uej4I7wtGSsPovHi0mjBKs=;
 b=rwURZ4GOxZKKLvUNhT9c6CsrwRBBTcfTeuouvs9YQzrFyjWvm4oapCnciiMN3DEL0xEVhYYGoFJiKEG+CvES7sRyO+iMM+xnZnkojd2MMgh8VlJ+GIMxhIupzJT1HcaqN0aLz53AEyUH7ZVqjYSKXFmnKf3/v+bdlwgUb23gFXgPw295Er9VxXNiBOlPBT0mrhIm5qcVAqLHdCHQrpYwrIqBYCMs3qaUp5vVQSDH+XuuKTo05r8YQvk23QD1hC+mWLqSfluzZfO47J4sPiJJFezHdTfCoGuEp0OblgBS0FaYS/hrkn2I9ND/fY3/vUd9Q1fdpbpX3w7AKN04Q57Npg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:26 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:26 +0000
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
Subject: [PATCH v11 01/37] dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function name
Date: Fri,  7 Aug 2026 01:05:39 +0300
Message-ID: <20260806220615.4078303-2-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b596509-4fa1-403e-0778-08def406f5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	CDQek07QynnBPgd2KtUa9DiaBipW4ZSwKj0WWxrTm64TFYJnVyc290heQreURA8r8Q+BXk6VlBD+Qobuv5vEoF+xIBDI5IjUzCRHuzeEAqz+WKRcazs/bYSA7Vgl2FuSE/sO37XT+fySGRzVEiNpNp5s73U6ygmx8zo5Lw581tb43BOFqoBdpq/dWyxxVXDgniJADb2LXrhPqu0cF9ijNYA7kxE1HQI8j7OOdqB6W/RO1IfzSXMYPvyvarrrxFxy7Xg432gO3s8ljhuHmsrrv9eR0fBIvXM+nKhzHXMU1u1wBf5qwB+CHZy5DpqqWix8w5AUpZKV6hybdsTylpdw5v6AU7KhZAQW/EARI9ZOCcQ4WN85QQmTj7NLBRt/krCVY9LcvR+zfGrbnS0iwTjZeLkypr21OgCJzml4aOwaVtwBE+E+Q5ZW9drvbP16trQdOlK/mD2i/jOg3P7PmQoyCpb3JsUlTFz9kZjYcLjQdv3aBQ7tSUKExIqItGOxGz3oW4U91/oIZYlHBh2M4cVNhb0SEp6sT3SrhEW7kg6Mw6xHaLao99qQxNd2EYfYPaoSBuMEr9r7TxPTo+eTfYUsX0pXmogZdW3yxipKnpbHeUYKHWOKq+CeIiAaQxuHyHd6D3pEo37HMy4TJQDg5uVXZ1I+kxwuZSmHBlOb/ATRxd5V17D5hi5JnqN2xb2AuTOYlskA6RV/v49qwq3V0PuVQQHcIUAJpzePr5pYZrMONdKAAK5cWHzc0wxbJgQuCcW+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SW11zEriIZMolZpCerxCod7BG8bwUy0ZyucVOQkJge6X2rFF8xTw8cPtAWHE?=
 =?us-ascii?Q?zAk8UMVlmByUtsZJaQ+fJgEJIRf55TR/oaFx3N40iZDC4EPha3yp61+QWe/S?=
 =?us-ascii?Q?c9iyAwzCD2rmTZvGibUwtnhTvfmGSTwy2nrRCqPwBM9bCHyOd4JpA6a9HYc1?=
 =?us-ascii?Q?PqhxHZmrljUsocWxpfdi3lJNhNRS1o+H4r/F57gL7IRsjh7+0rRcRjeENK0s?=
 =?us-ascii?Q?B1uCot6lyDXmS3wjFwUolKdU4M1OpTdD3L2utgh5M7bpejUfcVUNLZ6OVXmd?=
 =?us-ascii?Q?alNgYi1sn+HGwt7tAxBEvZbRWFn0emH91Uf7nBaw0Ql47bYv2gReS4W1/D2k?=
 =?us-ascii?Q?kJJhpgUgaI2eYwZd70iBwTpB11gIZAfZ/noKHnmJFDxtkSXnuUo3ZRIN3tcb?=
 =?us-ascii?Q?pf3bZXXPcsyrjnnq7GW36QjugfowZ6GE/q3KqFAPtRDOBHJ6NS9tMo6488Ac?=
 =?us-ascii?Q?3bPnFSGcNW1m0b7+ztG9ib019jMLXC/tcP7bEYgF4gdWgEVrx2E/OCJbQEDk?=
 =?us-ascii?Q?0XhY4z8Ge2vaEC4Q67mUO+9z/QlrXEsxxyt66Gt4WAEceZEOuoSfmNCPg4e1?=
 =?us-ascii?Q?svEme9zBEYFsfIZX0gBrrXsvT/isMxnvxnxp0dcUXmYpuwdeEuOCFkh0PREU?=
 =?us-ascii?Q?h4iE7TulR4ztwSnKEp+htZzmtLw94PpqnQ+wi66xqpVXrD+4mG1TOimH3bLs?=
 =?us-ascii?Q?w91IP2IeRxXz7ix6mkCdz5vse8Ne9oDy4x+nHlYZdauQnD7T23FnIlQdASrb?=
 =?us-ascii?Q?eajXoAjIVk2RXdZo34VYYyF09pqdNXG51WVK0kqHRTDTyDsM8avzQZqyMqOE?=
 =?us-ascii?Q?Dy9kJxtHiZ4RRNFU9HVb+SNVFFOtt2YC+Y2367E39A/1L3CC12jvR4GO3CUK?=
 =?us-ascii?Q?MqIxXvDj7HADdNr76/UPOIM4U3BlZ8WCW0hN/inPDlmCvAwqIwWTl7sy3vJt?=
 =?us-ascii?Q?CQWDbDZV1yOlIZ2pZXKdC7cj5bBeIOnmAtewnm3Xfnajfj3pFdyn3bdqbLFQ?=
 =?us-ascii?Q?iZyv2agSwXz9gvXFyTt8dE/i8aFcwROsZHGlivFRw0Ypitk25Fm+44HNLT4K?=
 =?us-ascii?Q?BmaevXvIzUXlPJUMwYW00+Mz2DyycjWeHlM9aOMZRsP80yfZyMNLWucb++0j?=
 =?us-ascii?Q?5ZJw8aL7sd/vIIWWex44VMAVwjAl/cPJngL7UUSIF4uhAwCQ6nt+zivfSup7?=
 =?us-ascii?Q?RWX9Ov24whucHGafwXfxt15sP6aSFChIXKtNkQSDNe1hGoSeMYFPwTEn3nS1?=
 =?us-ascii?Q?h/Cnrnf88ruwafyDE0UfVbBeZ/WLfXzsbmgSZjInaUtVaZbkdBPSkOZaNS1w?=
 =?us-ascii?Q?SWAxEKGIGvj3r5YXD49c9E5ye1seh8RNdA6dGHccpdSVxVTmCsMCeC1FPJkQ?=
 =?us-ascii?Q?KqB462pmb+yORKMqdMwuQSSfvdtXjHRLrL2Fr+A1DG2WABRp4T+Mr1InowRW?=
 =?us-ascii?Q?ti6S2SE6mb8lF4naUhXjvendk1gIaCAsgXbCi7qvayYNA64NVUgaI1RZ15Z+?=
 =?us-ascii?Q?3Ux4EQs4CeZDDvN0GHDEEbBR4yHOT6m2tMBy5IJ0fnuI3DHFeaUsz+eF//TN?=
 =?us-ascii?Q?cNm3b+6qZELxldRhIEBJn+gqneD724xJbnnoz0ELKLcNh+Kt/Db3eNi/EfKt?=
 =?us-ascii?Q?1JNIN2hxH2zS7nZzyCB/R6qAOcLP5h8wyhH1aXiOJHqbcoGGLRrYlePIGQ/+?=
 =?us-ascii?Q?W/iXpIPLesKUvxJWxKkkINJ4sAbXqnSqEeKc00l6a3dGp9wtzO2ZDz3mCR3G?=
 =?us-ascii?Q?1VZ9YzISK801HpCnOGLAzuVFSTb4hIw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b596509-4fa1-403e-0778-08def406f5b8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:26.4104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD95wJJ+k/y7ejF2hQEeMzltrKPTCYYRjn/x50H6Ho1F0KIpouEyKvQKzaJAewrG2owej0ci3zh2gd44HSTzQ3l1JICXLN9XI/zDdRjuzGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

Due to misprint i2s pin-function is missed, instead i2c pin-function defined
twice. The second of them operates with i2s pin-group.

Let's fix the typo so that the i2s function is defined correctly.

Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 21fd4f1ba78b0..0c5a7eb6d563e 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -166,7 +166,7 @@ patternProperties:
           - if:
               properties:
                 function:
-                  const: i2c
+                  const: i2s
             then:
               properties:
                 groups:
-- 
2.53.0

