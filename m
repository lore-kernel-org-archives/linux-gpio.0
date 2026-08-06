Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D6642BC25;
	Thu,  6 Aug 2026 22:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054016; cv=fail; b=gN3SNJziSziYXNoLzV7P4nr14eD8hBpTOPgpm16hn/s+ZCmroqX5aTXI/hOUK1d9NOeA96CoR6xx6k5ipjxHsAWVfAzrXEN4EliORhX+CTEIKh05ZoaIBKvYLAo1drlb7e/nV5wl21aMo5xruD5q4uGawKoSObIRKMADLnuWIKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054016; c=relaxed/simple;
	bh=sWcgOtxiCWl6HY4WcHhbA+5/kzl4xv2uud4K3xDSmzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DCFCHRg3XPP5ezK3oP/TbxdRL55xu/9vUV+0KtRTWKWKtjMzfHM6o4n06/T+MyXSgpKFwblMCJDfYfm2kco59o71W1xMIcgCU1eLFDbLqC9X9qmtxFBsgTai9m/FTnY504v+JOO6GqhGzoILgaICIotBSL2vRzBXGAmYCHJTLbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=dotskm5P; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="dotskm5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDamfDfTwadjCest2TXhtYWDVr/bNypEFxEiqj4SXmNkLBcAK0L40l5ot6W3nFkRQfbzvq1mpDGq1zl29NFXXzEVFTb72p0yTRlywYVWTZxcaQT1iBOz7UwUykiyTdS6X7y/h6jSQVH7kTyHTNo8SN36Vn5jK4bfhWPqCmefWSVwFtk4kgVtueA6rxHSnHmrLFATBFn3z2bgsgQ9ZNWiPb1r5mJ8MStV+uGsflFQNPc0qLEBA82M1+nUOE0jSHjhnlJYZilud0C6vwsmciADYhV9uq4qfygAWgaEvL4Sr6c6PgOJr6MRGjqJCYUq2ONpC0xSTiEa+oT9vcmjERhOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0/takWekuElp7VkTaptQV6qzA1vbvpuLWAzrkCcv14=;
 b=Q2uuv/OKjD8tgjMOl37z/54B33h2SmApadukBkA5SJI6ufkDCZgFzdmf4uzzmJBk/V4TxDbptJVa2mpj9Zkd/VXPQ9b6DEx58gr/x6fan0IHdGfOyQGHgNGmp57urfxRheQcJTVTMi7P/+5tSj+u/IrhBHrbGubsV0uBV2OyAPYJxZR8bUTRnvftTGu51DMn4sZRvGgQb3+9o+dIyVftwMPOJLSRZ+OsBlmQZMS2okNtKsuBdzttXwHvoDoZmosc5zO2mj+sMI75WUbQfYMqHQq1SM85o8Y/qNA/UXPhQfkmabdiPrwfHEkC4Yotcw1RsqctJ+bsBEw4BP05+mjQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0/takWekuElp7VkTaptQV6qzA1vbvpuLWAzrkCcv14=;
 b=dotskm5PzfHeJjRMPCuDheGOAjHbf72/tMB/KjvfnSwtkFHr2tUJNbIBjiuJch8+PSGAZHIs68tW6AH9s/CtROAYWPa8ANb+WVPcF/pOO2J5QbUboiqMWuaJchxaSgy3l1GJFmUd+4OLdKVvTScldHSdPbKb3cxNhueMoq8MijSjAkuFZkm23mdCQT3Z4v2KyyyZH6GIQTR1VRiF7+WZ2rZRx62Nnq4HtG/dhuPb9b/vR3dO0CVYj6K2MlhVyPWRY5qSGlMRt0aosgWDucl/6DFbN+xMtUbhkyz5XsWgDgxQgAU1S3NxFd9/dMuD+XqS9tJc9g2qTjk1e67XJS2rsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:45 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:45 +0000
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
Subject: [PATCH v11 11/37] dt-bindings: pinctrl: airoha: an7583: add i2c0 group for i2c function
Date: Fri,  7 Aug 2026 01:05:49 +0300
Message-ID: <20260806220615.4078303-12-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: de82e007-440b-4f85-bff8-08def40700ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	XWihy1uABB6mvfYeJxQ3lSm4uuDBjyAFQZ8o3LZ4QRWwGV/zi2LKAzqzkOjirzk0aoSK21mW/5crOfbh9k6clu3X0DNibKLs4jcVpP2t+EsKymYkGHFoTV2/zpLBLk5rqtsGF9N5ydEqFIxQQkLbnIE8FcCULGLA5LBHMaNaOfb2XcwiyFYhJMi44ZwCefs7hjFOxMdrN9/zP4Hl6Xw2lky0EbZYnszYZaMjLp6RCkh5e6zn7XVDnC1S0UftWkKP5B/FoTMwWXga1XV0fgxHdBNud08UBI9hkSop79Q1CfcOXmLrsM/cRuJZjyUqz8Vt9E2XUyOIaMpHie/mPRvLNNzVaDJSJTDmtbIHbtuZm9iTrclLkhnrGdyFfnKWn0cgzST3rGlMz5RJwoGkpZJzwGVftsKJabHIBohYrRkTKR2k2uLO9ZRazn4imMZoS2N9A1mq5Z0HhD7XhMarDak+whv3BWAFAdR4ji1NYFClaCeFnobphA0GUhneizoWBwBy1qNrTbhqthEJdkwonUo2TMkXhIZ5inqi9sCFo1KjY83c83qOSWB+MIUTb4viQlyrPKulepeQ2ijyLXwyy86k3B8zVc/iMa0l6GN4aAbwqPvoa5iwlxtQRsUK5GsSTafvc2kXIfCTN84JnrazAsCUZAkDBhhzYe6R2lcYwuEI0BLnyQh/4z+imFdIRqPXyReUJ0DLNIj6AYGmFXjkyFahByGUEzy7aGwXLr3RpBYd8AKQRD+gP0nl5ChDZ1QH35L7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Tf++n/GJlJfzGW6Vt910FzaTWIvKSfOdmgso2YrHs9J3y536NIuoVWgxATf?=
 =?us-ascii?Q?PVkCOcHkfI5YovZWsa0R/QqIJ0hafjuCN86QXOHkufgyNTNhmAVx6DK4f31Q?=
 =?us-ascii?Q?sS45LNmrZpcUOELs46ZcaqZz2gI4CdrTd6ym1Iah2XhW9l9voheuZbTEiQtq?=
 =?us-ascii?Q?43WE0EY2Kwz+ilVPu54S7KxCS3vWyF0IuEGd2Keg1fBOPvpwVFLm79knj6W1?=
 =?us-ascii?Q?U58XrxF0o4uhMugAKR00HmaPK5avtWCQabB4rp/pqkAQdiNIfKyIdm3mt4dZ?=
 =?us-ascii?Q?94mXuMLoTCmu+IB4Ym0oKVmZ0NP7r6uq3I6bfzt1bft5ISOCJqGI8x0iMuEW?=
 =?us-ascii?Q?Tz0m62oRQzkpNoubPPrQDSUs3Q0Se0QkI/bQkDx+73YS+/m6TUT4FIxpRV0p?=
 =?us-ascii?Q?T7meXl1+8vl1c9WHQNBPImoA10uD6vMGSrRqcj5g1bdIyzcnf/4Dec7vzBBM?=
 =?us-ascii?Q?NyKua9L5jZu/3WLydgrQPkjATbsvWYcMJ7UZvVhowiRyfBHtC9yDmcvUxhyk?=
 =?us-ascii?Q?lsseosc5RTimzDozTP7G0PivSwQBa1IFvFisvOvjXHbeNzbUeVKaTNc+SZw0?=
 =?us-ascii?Q?Ug22x6U7GQjdCLiEWmPGaZvQVlfFGjiSpeW8mPeJStocpeJUhWkeE4f313eh?=
 =?us-ascii?Q?KWYLfulkNqGjvEShZpWOkMx58sX86TARlYY1ynCrPdsjVrpYNTY65k82zRAU?=
 =?us-ascii?Q?uESJTtVhHwKS5IPCNFemD8rO2ACgAMdsTDM0hEsZ11Mptdm7nlbxDRHlYVAS?=
 =?us-ascii?Q?PyUO8rKsLHYK9kfDarYiWmNGaWsJmlPgKCopRT8xU2VKSqv1SjU98vHk8gng?=
 =?us-ascii?Q?UPYn/MFOLMjtHQJ1Kjf09ycwTCoCXXToLknLooyM5HG8a9fJv11BENhHwSZA?=
 =?us-ascii?Q?ZK6MIqHlKF1HtEKa02tFgrTSpGhwSJA4HAaU1+P253BgjUSaAfN/28ZdIO1B?=
 =?us-ascii?Q?0DJ9TmsEU2kfzJ39g3whboo3ajyaw471ETsb5uvn/mooVkMl1oqxfWzwhThG?=
 =?us-ascii?Q?to+5D8J03+XpjWmwmoDQf0ZVriHNBqy/rQzoZdSk/7Fu8XhElD4QJaafmakH?=
 =?us-ascii?Q?AoWI46e/tIxZ0ha9KoUtXOGhh/tx6f7dkJcVJvQQA4FfrkmHlgf61kUEQgcr?=
 =?us-ascii?Q?7ydXoPMhl/H5MjU9mSbeGbNtZRsqYqjlG0qnMxuJp9arn/pQzC3zXJRmPmmW?=
 =?us-ascii?Q?CZu2CM/wzjovkWj36n5xVEq0ZTxVvJGHOK8HUeebGvjGmIXkTng10CV/uoha?=
 =?us-ascii?Q?zMyAKQ1znZcA3BM4X6yppyfbsWyG+zVLi1YIB70f43cbaAy0M/CP0uPi1HOe?=
 =?us-ascii?Q?3KhYlkIp1lGEtxS+ZuLFBiq2iXuMrErt4qtbHI+ztQrFjxlTQ+MNjU09pO7T?=
 =?us-ascii?Q?hL4INgFCx177ffTsJK6a8IW86IIo+a3gvfts+/6SiRwxPhEUGIdAC6OEgt3o?=
 =?us-ascii?Q?5tFqgAvsUcKdD2JuE5NuNeUiJ8FadtZtAl3dYng+d3eMZtotgmOxkfxoRNRf?=
 =?us-ascii?Q?X/EagccHYSMV18tJGUNvhq+mCuSdDjuZgHaJzRFs0bc9BqLeJQiwvKAxSk9J?=
 =?us-ascii?Q?KL50havYrdfjZ+mmPgjojKKOz6hYJDffQaIE1cTQf4U9bx8k0ZX1wmNVYTZk?=
 =?us-ascii?Q?/4TVzgtIZWRghf4JI2lDkkHeyYl1ObnIIi/p8bI84uaGmAXPCOd0ljzsMVds?=
 =?us-ascii?Q?uqeL65LiSJWY8GzjhlL6Zas958OB+OiB/4aLFtwwVzVjyDenwnnF6gYvQjbK?=
 =?us-ascii?Q?IJPP5+S7JR0/jaAdEAzNqetxfd6caWw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: de82e007-440b-4f85-bff8-08def40700ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:45.0150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnNjq7bDHA2gT0M6h4YRaygcFQV58a7sv2VCngaCUlqYH405qafe1oylXKXgflOijbWTKvlDcSWkDkjiS7Ho2Jj3bc1WhJAeLY26oxSV7NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

add mux to force enable i2c0 bus.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 3e680c997fe26..24f1ac60eea84 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -124,7 +124,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [i2c1]
+                  enum: [i2c0, i2c1]
           - if:
               properties:
                 function:
-- 
2.53.0

