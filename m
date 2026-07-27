Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A833DE452;
	Mon, 27 Jul 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138183; cv=fail; b=Zz6oLVI2KngmNAAKz1qawC0Lx+qVtpgBnhWl1pXTMmBHGyL9LtJi0sGyH0XPJ6fHsSQ+QnpTj8NOa2DIc7DHRxcMqJ1+vO8iaGG+w88zU5n/fShPNMWkRoIEVHOQNJ6aShRc6kddhGbEASz8g9HxTmKKUjl7+RnW59FxRDF2Z6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138183; c=relaxed/simple;
	bh=c054HiqiLYEm6PitZGdrSNsROVSyqQlXyQeVdUUSfxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mxTFcTFFbAq21562fzufkk8QqhVlawwtY+eNAOkXCQ6qOWkvp70CzmgVA+Y2eAzipwKNQgE3jib2XupQ82eyK/UMhGkDcmhSFEumUkpvu2exZfBs7NJHIoUbOxfotlT6H4wr5MWAsfNquKkxmAWUYc7x31P7xZWs6iqAn/wFz8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=RfzhKHq9; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="RfzhKHq9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Syd1Qz3hHCLHHep2WfqLwq84U9hIg4h/gtAkCP0mAZVJJuS2kKDqRJecTL6YS/1yaafBLcy4KOkV5EHdv4ksQSF24zauF8ipuZenT2nmiz4w8vBIjQOUnTcoGOOKtKfQ/v3dnuZucsdR4djWtm2lwq8NPv1MsXywR27e50pBWlipkDj8YmCHer7XUWJWuIn87Ow3M4FOYiyR9ZIvuduHl0Lf/76rk9u837esUdZq9Ofaw7FQleI9a+bqd4YTbgLU3U6sH6p2wYqywv/pNgRKphPe+CUdEaCKxeUQnJmyXJ3BdWx8UgJQroAgJ1oGNx3fhiw8sZVV+KSRY4TevGZEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22+JghhHBT55BQ13jtGJefXIzwN8oatFqhTZVCompLE=;
 b=cMhTvxzv0qeIk5D5n6S00FdVsLEtJxZBh7YZCYbJmwP4aSbfSkpAa5cIcwime2T6r6bgw+aOTW4QRUfuhyFlqTDGiamU8wbtWj4vfDX6uvit5WefEC/NhCrltxS7UCxgEu1jHzHvOKfwu/pd0yx97l+T0p007ywWAf845iLmYt8nhpOQUveWKEPJRfFa0RA4o+hCCdkZVhLMlprPckw+d+Acs5huAA7l1i+KO0qzBIvT5rC865+SIsDb54ikqIuK6Twrkgf33NG/ygvwtICqZYFBuEd07D1gVySOGFIGGtO1jTN4CuBWt8RFOVx3/1e0HOxb+1O4aqAlRsj2u8eKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22+JghhHBT55BQ13jtGJefXIzwN8oatFqhTZVCompLE=;
 b=RfzhKHq9ZJASx7gWu9NV/qBPkv/gpVk5Fml0LwBnTnjMCjnCUoKnTxznK9TzXM83p9GQ+PXAqrN7+kL+tc0nWEO8VoOE53qiNswt0+SrtqJoTRk/hKeXF2uS2wDM2Q22KKZ6wyMT1UY3CXQmJyRfT+BwXZJ6xgeDyI8gRjOT89tM1isXmPf6gJrEC92N9A+vL07iUzZvI2Cw4YeQ1mCEg+g6telPhMdw5acs+A5HIv3AyDQqNRIuWtbModqbTw/BvCAxNkQyvt5EU1o/ygbGZTTjhiGYkZRmtEhPErLFNp4GW0xA/XM7L+vHV+DvilLB/B3IpDRW0UeAlOyICsZeQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:53 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:53 +0000
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
Subject: [PATCH v7 05/34] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Mon, 27 Jul 2026 10:42:05 +0300
Message-ID: <20260727074234.3761170-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d541be4-2363-4a43-96a0-08deebb2aa85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	eIUgqadCI2QclxYNoHOeW3E31RD4P0pEi70YRYHqCuIwm5iO6zwylzigAS5Jz7WPHaDkzK9/irE3v3vBBKs9nyv2g1kDd5DZu5ztlaVMqfBgJreL077aZ9vJeJhpsBu1PZodH+XECRmc2XLb0qAdqw7m5KtcSn9/g5Qm+sSQ1xpB8b/pioWWzSaqbuNRBq+K6cG+eagT8a+DpAABPoRYTmvIr41+AG/Wyvs+w4TFRP2N7cfvkkEY81aHZO+8Tsy8s7Iz51kQv7gibT7sUdiAicLd7cklW0qnJylepUSvI+hLVcpyR43qWRfiy+hveG5Yt9paWb+0nuUbPD5cfmoJtDYQxkqM/EPO/DmgxXQLiyGuy6m1b4BILD2ntku4p8QPAYlJRYJJ0mTQ6egs4yKIENeSVY6DiE+3t7f9IUDf1bzArOPyRwWLG3u0v240lZ7lnW36FgIkQJ9q9sgPk0WV/Cv/ec+sEuQ0CB+a1dVKQ+8R2T1g62YXG4pr/7r1WyNkVwQNOOijOngilqdtJ5K6U+ai/iQTFHQ3QwleeRpUSg3U06Mm9f+MpMzmyAyyl6/Aalerd3tnG74AI+XmtC0CXlOaHzNP23OwIj6xZrjd2JAGkvPGLoK1YNTqqcnxplnAaVP2v8Fpyu53PW994D5TwtokJIGVJYIUdws51nIPfuLpLWAUWF6Qx2fjFO+04r2/+Prn4ruJiB2IcNEW61tmtJtY+tvWbllYnfo2gkXUKrE4gnlA0YJXN6GPPWXVwgHK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FcWcl5IEmKctCM8wfePKJM5XRVOInAHJ/h87GLb7PpennzCY8b3iwpw+GpV+?=
 =?us-ascii?Q?4g1QboDXQrruS82hLqWOmn0CV6iqh6AkSetfG9D1qvQjdiEoy37p4GB7m5N6?=
 =?us-ascii?Q?NuCgIA9e6NA0IEABoLOY4eSfJxh5RzoOwlO/XqqkyX+NpUa8EqrhxdN5EwbS?=
 =?us-ascii?Q?Tg3Ts0aLbb0idsfRaNDxV8JRFDnX2A02TOLgKrPT9N6BazJ1xeAkjD/1TDUm?=
 =?us-ascii?Q?bRK09sPBQGv7ggAV/1fGIz6ORn7pW/9TvLRUXvGnAqH3BAXqh/EPEiF4rtVR?=
 =?us-ascii?Q?H1Fv8xvJQSNX3ViRhjRO6Ke1xaLE/Bxzgtt50FDC7D10qpJUdJfQOsQF45qC?=
 =?us-ascii?Q?e5wJ4haRuPkM91uVDRQW6pESE7R0to/OCVpwxW9etTj5gbGoYuQPK1CKWO1R?=
 =?us-ascii?Q?b+JyDuiK836bYJ1+o/jUCkMVbR9hub39w4M/FIzT9oLM9hyrvtFJbgHX16Fj?=
 =?us-ascii?Q?O86UVFGUwyMsR7LoNC0R3I7dZCOvi/2UOqdlS6eOUgkURn48ENuGcNSpDk6X?=
 =?us-ascii?Q?2ZJxS0RL5Hfs7ALtTLMVkGnRlLUzzX6OO0rnIqo/5nj0kUZj7sn/iqBGzSC/?=
 =?us-ascii?Q?MxOOcNa02nk11JP/bbXHKDQKavZBgeJM6TjXXvDvKKz7hlCzCP9bxlysV8PD?=
 =?us-ascii?Q?HgEUnLqTyYNHKgJPH2CS3uEsID/gwjYPm+3+CW8AH5x3kgtvG21+P8xKrhcq?=
 =?us-ascii?Q?bB6MfHW7G+HaceXioupwnflgXmRqVGVUc6b6DlA/qEKdUTk49EM1wRo93qEk?=
 =?us-ascii?Q?nM+kFC3wF8xW8W8Er3n1FxsAeNLCj6jFTV9EaxdJEchrhXrodYZcNnnr9JuN?=
 =?us-ascii?Q?O27xtQF44uPkUBvJcAZ9usFxSzTozRPgMI0yrTFTXVEGszLhadxJcQhpvVYV?=
 =?us-ascii?Q?tTn8apL0Enm45Mn3k2Lx7vKOfA+ADCG+NXUZYyaLqFtdoRBX4ErT3YnGUD4d?=
 =?us-ascii?Q?PMfAqLR0+We8iZEYj308GFGyTEdtRTbuJI6sL4gKsinubuJrrz/gpkmo/Ezx?=
 =?us-ascii?Q?T+NsmgevO8pfbp/FGMZvm7AgRtkJx//XnF9RBRzz4gYQRJh2TNuGLXVxOJZr?=
 =?us-ascii?Q?Vqjo57BuJ6+q7yDoHfj7XMb9FBM0xDGurcuF8WAeucKBIzF/1OYuYYhuQ9oe?=
 =?us-ascii?Q?kHP6rltlp8cOm9J+/p0QxkL2Qb7mPLiHbb3gZh+Nrf6BeurFb2Mvs9GLNJQ6?=
 =?us-ascii?Q?Q5eJ6ruOOfTqogg2x/5D8rRIrlSX8iB8L4J4lloH3fJEZJ2w9T5r1OXD+xrS?=
 =?us-ascii?Q?YBLa8fsTCrFTvEMjYSOJWviToMuzDb7MnsNQL9ti4dGwGEBC0br/WOmp+TUc?=
 =?us-ascii?Q?VZm2OOs0W2gf8rKR5nN/1i9nW+t0UDaMgJ/20p65iJcipjBiyP21rpEd3JGX?=
 =?us-ascii?Q?Jcyj7eP+5/Notm5h5llQqw1VTJFcE8I1BOt5QS3sbfNW+aThEP0ZKe076lZX?=
 =?us-ascii?Q?3Lmxlh6oTuGl2/1mWlQxHP6QGZriItdxYIognQsVse19OBbUXOtVl/Vdbuup?=
 =?us-ascii?Q?rHRQMXmKyEAQpykd/UmNq34rGr8MLR97lnbEUI1E0k7dakccUr6vi2JsrQZr?=
 =?us-ascii?Q?Z+7qkT4qX1miwetqvGpWeD+w8MGLxuJEAVVQ6/tjgyVlxA75J5MC9cN/Fpez?=
 =?us-ascii?Q?HETBF0KjLoZ33hQgj3+UGH13BhUMFHFhAUhh+dHXKSruo8//RDiqej5VP8Bd?=
 =?us-ascii?Q?WZhps/X+xmtvhVBa37ZIHoa4yJN6gthBPC1kJ9qrhvo81ESgzJl9mYr1MOPO?=
 =?us-ascii?Q?MVpnAi8es1df9m8c+yvSKU3fYn9fva0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d541be4-2363-4a43-96a0-08deebb2aa85
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:53.3308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcyoBHgTE4tLnbUqy4IkU7Gg1Q2kPfoIOZ+JhIvN790eIFvOKonXCq1gzPi1M1eTG7RBvTQLjrtE4pPJnHWeH+UmAnFC2XY+ZbGL0gLb0Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index a3cfee6ace778..b5cd4f476caea 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -184,8 +184,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0

