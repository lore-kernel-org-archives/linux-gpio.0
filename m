Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794951153;
	b=5EDhvlawAqsI0MusxfQDKUHi0I1nzWEJ94yDGkt4FJ/i0H2TJO3l29G4jF/x2BYfMNkq
	 gK40uMAFKJPRgH8+KjV9IjljO9JtXcQHuMh0inB7FlJOWPvv7q48bN4WT3hmiekiRwbGx
	 oLPp1CKBJF5KO2ZMD2gjrjhdwx4Fm250/7AQBx6Ow9MRdFDGKEuAcsuob7wpOR58k0/UJ
	 UkxQVxtJqB0sSVrfDD+cj3zg9H3JHGkqhdZPK5D9TG5Sta2+fkjYpqfkoMO8kWid8T3Oq
	 U2cIZf6sVrJIDv8qR3MVzuddZRvlQDIm6NjXKx7H9sHfgXt6qbBJaGuDMBSH0+89Wnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951153;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Qw4j55Mfr2ziGuRrQ6H0SjibobW31rKl/HtHdw0fmMM=;
	b=Hu69nui8Ti5scT7jYXGrEKv/fe9qoYhvBLow57EI60n6HXkXZJP/x1ASmQbRoOEnI17/
	 NzYVdP/N4CLMbtoMz64EjDbjI/IXkubVMLuZLvcqnyMpzHqbdsI6Dz8XuTmMxk9ap3XO/
	 A9wHumXG695dwwdRqRakgT55nyMA6/st0PDbVkwDPoDQ6cVSOxR+7pab1m0kn8EZNV/5t
	 zD4iwRjFYA7y7Jak6aqXy3aQ6BUMGho1Iy00v+DRFM87dh1EBoh+W/2XCGh8BuhLRn+Nv
	 I30141+F1JMmk11B+3TJ8f+dU8S1hA4HZgnIc1To6SQr6zxOeJsGWrvEsp45G9kSQgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=U0qdgMNA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.23
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C7F606A32A;
	Tue, 17 Nov 2026 21:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C7F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=U0qdgMNA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQsJRcRtAC4XF2iQj1PKRWo0zheUO9odPep9LaAzh4ckP5sDhwxYWZgajulWpIPYW2VGVOJ1tFe+gEQvWfbZplJMfJkQDcMFck23bRpFeXaLD1fp5RBG15Hq3eh4Ffa8UvQef4j64cJTs1FtDkIlmPxh+noSn+OTKzJGTF1ToDt+UDIUnHvhFWMhFA8flHuF+B/wmlWhVGBdpZ7EI/ZoscefEB2b+aOmUy3CjVE+cZDdHGE6ZApRwDL+2RU7jGESsJrHy0lXuzm+HA7IDb07xKMmxg6z0DIK+lQUjLTIkS6zSuv+ygpeKO4No5/S/0uvAQz8MGYXP9IteG7q2dwuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qw4j55Mfr2ziGuRrQ6H0SjibobW31rKl/HtHdw0fmMM=;
 b=L0sk8XQIb8LW0jIxb6lUsfo5ScwPgYcNea5JIytS0PqTlKzsFS8Dn5hgrZZVAn4xARHKsKBeYhvLM76wizUCjSQg2Kc9PTM220+L7rMnZc4WEeLwiDapUSwfV7a3xsfmn17Qj7OTMmc5R1sMrs9Ui+rAmQ8Yxr7Pq9KPi9n1OyPFT1KBe0xtSVp8diBelMhMN9oX+njgNhn4JraI56UUten/ujFUBLyEGh0nEYSyno6YibeXqs5Ys8YQZAIc9W2fEWaE2Q2iPiYxHUhwyd/nqVDMrwfgr0gId0ej6VglQpijNqPOlnysYd3e/sf6oDWqOhcXHxdXPfKpJ9L4XyCi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qw4j55Mfr2ziGuRrQ6H0SjibobW31rKl/HtHdw0fmMM=;
 b=U0qdgMNAOX0+HWPChBtk1kBBoZ24V6p6dCQ5mwEi0/BQCMobWGiiYiNzmIkUl88I8IAAcNd2USMaFaz3S4wNqqEe9jPDQv3hdyqh9i4LRmntgB/qD34d7F4HhCmu9twE9POSWSlKgL4e7AqwNx0EAELRKEqpRanBMhSXrrYtphTRaDsFDJDj6lLCC0jBpdIib2Ntn2pp7DpSZkU6kC+9gT1eBdcFozco5jJ4C/B3E+VG8KKeKcytuU64W/KK16mvZ1OHhmlMdQMSR+vVQcAULWEfSkg3c8HSjhP3ClCvbmA+SI3C+1kQpKTO8Aj6ZSmaWMyFmvnsJVKXd0oMF+P6lg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by MA8PR04MB391102.eurprd04.prod.outlook.com (2603:10a6:250:7c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 21:32:30 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 21:32:30 +0000
Date: Tue, 17 Nov 2026 23:32:26 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: lx2160a: drop the I2C bus recovery of
 i2c6 and i2c7
Message-ID: <avzGrorxOg2GmYOl@lxl00025.wbi.nxp.com>
References: <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-6-5d7201970629@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-6-5d7201970629@free.fr>
X-ClientProxiedBy: AM0P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::28) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|MA8PR04MB391102:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d89bfc-e154-411f-8b25-08df44f2487d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|19092799006|366016|376014|1800799024|7416014|18002099003|6133799003|22082099003|261009223027099003|11063799006|4143699003|5023799004|56012099006|261028144727099003|261022075727099003|261022105027099003|261026121527099003|261021123027099003|261026140227099003|261021121427099003|261102123227099003|10067099003|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info:
	4gNZwoXrCZbV1oQ0VpcQihgjG0ATpnGQrjNJMbtz4shulGMH9UrprJ9sJeOEmEhfrUchh0i8E6N5Nxulx0AdrmsTC1+dieohE1pRiARyy9h8P0J4qNV6WgOWKM8e34z5uQUOXbQTOkNl/NPDv0xl3aw0MIxaMJfaiaWoVAXIEtmHWmVB3EE/u8750FZy/b8y4VVHtMNZeoaQSqcjKgAWTlWDTcKyzcT5cPMH5bqfa4gHNGtZDNjdjFe0zrBfMfuq9gtop1enDWOryQmtE3p2WHaZ4VifMNGNeiPnDCDM7APblEZLjoxUB4TnaikcgYPD1c8MoPZWLuVTHi4mcP4zQnH4Ikq2Q9u7KZr9UP4Pi2zgdfQ/lgWPbPfBLVUimWCjeljp39e5cJQihspLeCyILGYWJngcbs8VScga3A1ZU3G3R+Lq1vnRD34LjEvvVNL89i253/NnWiF5BYhDFfDKBGg8OTgmyRKZAYEuGdcLWXEyRCRKQe5OZufWd7jpQs9KLVmHV6A1lmIzvbo0WeDmFFIxVTJ/ursjYdYViyZjrnn6Odi6PGdxoUHAE4vTaKW+Qa+51hkRa9lVuCSlO8VJUCXh9NlBGbDRBzI2u8nSyUUiEXVmnuYkNRWaTQ1qgErQ6ImLVqf1UIqz2EhmIE8O6elhKDgYVAi+kx4Ar9HYKeJ7+JzqsTKpg6X6oP7aV9H7cd+DNpyM4cbcKpFI8G5F9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(19092799006)(366016)(376014)(1800799024)(7416014)(18002099003)(6133799003)(22082099003)(261009223027099003)(11063799006)(4143699003)(5023799004)(56012099006)(261028144727099003)(261022075727099003)(261022105027099003)(261026121527099003)(261021123027099003)(261026140227099003)(261021121427099003)(261102123227099003)(10067099003)(15866825006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GXKT4gIyKYUl011sh9g5vW2o5lFKc+G45KBOB3lTrCi7lqLOc4MmcL6fxdXW?=
 =?us-ascii?Q?UTT8pXl5yNIMa7BcyhzYVoPDaQ56pnTAU3SlqYsuvVbgRveMktd7Mq5C4/VG?=
 =?us-ascii?Q?JfOoy9HGJjP2I132CHLyWy3aGPakxQvQ355+aTf47CH1mGPKOSOub1Ol0xTo?=
 =?us-ascii?Q?QiwjjORuCWJmJXG1a5KJ07Ir5Msa5/NN/Tk5pzi8oRny792tUyOasPCxwZu3?=
 =?us-ascii?Q?iIL0Ylim9ChEjp0b27zHSoPpXs/Nt+b9FKYkt54Q7t8wBhr8hoQ3pdX2rIK7?=
 =?us-ascii?Q?6IHemwNEdGfMKVkMgdVa/D/Ft46wRktpalT5TCwhhtZIoPSBnA3FezXpGVLN?=
 =?us-ascii?Q?LaLzd8tWWSNCh9m+cVMJjPx9GCAYcfULPlvZrLrkmSH8QvIZiNWZNP3v6cbZ?=
 =?us-ascii?Q?rjEh2XeP0fzP6XTieDsW+hazRdN6hBusXmxzOHSK9lCFd5ZJOC4NtWpd8dAS?=
 =?us-ascii?Q?fkCtu0c4jujWOgHNAsKA/zJhVLEeUjQ1K8P+DHDxlEJSrQ3eQpqr9/Bq6dz5?=
 =?us-ascii?Q?djJjlGv2JzGvVW8Y+QU1JfFr7jW38EBUj/Oxq/egoaVTQBM7Fg8UoOwGUI1n?=
 =?us-ascii?Q?eR0tuALRwCD07icwbZpJQouIbhxultXeK1lYOyPUNggYuMB7O4tDkyPN/Qhh?=
 =?us-ascii?Q?Uw6baGmhaHgdwNI4TlfsZCzL9HT+3PENZK84o/O3CDZU5pZJxGkkAV7EpJFJ?=
 =?us-ascii?Q?aL+8Df9uwZ2B0RSUKdAjcOn8yW6hD51wja48vXkJ10VN8pH86bhW9g5OCKLf?=
 =?us-ascii?Q?YXTSZIx/r+3kx5HAXRx9aryHGJtOTqSlF3k9Cih6hjyU1gNvEq1UgicWIgMi?=
 =?us-ascii?Q?2bpLQzPLC/wBo/ip995fMKxfA02JRRkefkgrhia2eDaEc/B23LMRJKyz+wvc?=
 =?us-ascii?Q?ehi6Usal7kSYXa4J+F/o38fm5YzSAMsSI4AO3pQSP4bC84z4dZwU4QUlbJ73?=
 =?us-ascii?Q?w1i6rKnIx58lM7CW0/Dcggo/Qa627rkqB0fvTQtHBawHh59jRRtSlwjn3RDc?=
 =?us-ascii?Q?8idTLGBbrhoZgugpHflpSIU89nZFpdfi/ucdfRzfNI74O6a7xUgdIdgASalT?=
 =?us-ascii?Q?W9KaoQGdGvUZMR572J7dfCtWlBP8CP7X+5YaJxQYim9IWu32u6tL4YStNq0T?=
 =?us-ascii?Q?Q2yYXIj3IzKdK1Tkk/Ml/AkpBibKzCZMp+gyC2BZxn7V9VojOYtUzU6J5f4Y?=
 =?us-ascii?Q?y5wjCHAPvQjYgTf3PFnWYQUTmVoxSh2qiawRpCvmxH7u4efvbltufWDmPe11?=
 =?us-ascii?Q?qMlfJVB9ov7aOjJLw6eFNUQt8S8o5DDn0wV0nr7FMbuYxNAUR62O78tFP8N6?=
 =?us-ascii?Q?JmA871fXZEORH1uTbClT9epd8sJLxTEY41AxxsjnsVlT06fDw3SZBl2FiJLd?=
 =?us-ascii?Q?DkaiwGObDBLKUTrtZLniirCNz224+saTYAKN1/PFkyCbYIca/T+69V++LU3s?=
 =?us-ascii?Q?+dKVDf3m09uZf7qsmXNlq2pvA29HOUyhUpZLhRb9/a4pU5939tSC12jFbXx6?=
 =?us-ascii?Q?T1MzCHdnSOHsRc5G8xDwt5+5HOkqJCVReTYnCHmDv+b2isMgFbtKccOpXzSg?=
 =?us-ascii?Q?QNHemxk8JMaYyMFnJuvMdts3KmUiTg7NHOdOO+ytndI1AlotHOtxc1UNtNha?=
 =?us-ascii?Q?oCf0PPGE7j+I5dLf6AvAoRz08g4eS3//qBuS286D1yTXJpBhuELOYrZy/Gon?=
 =?us-ascii?Q?sliKsL0MLl+Jk1Q7s3HTiHkfd/VbntZhVTMuWzjxoAH9dIjJMQyapC8Lbxwe?=
 =?us-ascii?Q?Z7Fjs8dBJxEEzZ1yo7AWpOU/V9xJWOOyW3Qczp+G+Z5bVfxeo6cnX+hlgG60?=
X-MS-Exchange-AntiSpam-MessageData-1: Hf5UScD8p58VQw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d89bfc-e154-411f-8b25-08df44f2487d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 21:32:30.0285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9aKnepHK6R3gqK4kMTwXPALxWM2PPABFhZ3+4C301AwM5qQ2IsOeLa15biGpzgc8sGqt6CDOqldmpeBnuVlzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA8PR04MB391102

On Tue, Nov 17, 2026 at 03:53:16PM +0100, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> IIC7 and IIC8, the i2c6 and i2c7 nodes, exist only on the SDHC2_DAT[7:4]
> pads, and one RCW field, SDHC2_DAT74_PMUX, muxes all four of them:
>  - 0b010 gives both buses
>  - 0b001 gives GPIO2[18:15]
> 
> The bus recovery of one controller therefore switches the pads of the
> other one to GPIO too, and breaks a transfer of that bus, or its
> target role.
> No lock shared by the two drivers can avoid that.
> 
> The description cannot work either: both nodes point at the same two
> states of the same pad-mux group, so the controller that probes second
> fails with "pin ... already requested".
> No board enables either bus, which is why it did not show.
> 
> Drop the pinctrl and the recovery GPIOs of both nodes, and the two states
> nothing else uses. A board that uses one of the buses can add its own.

You bring a good point, not sure why you didn't bring it on v6 prior to
sending this new series?

As you say, a board may choose to use just one of iic7/iic8, and in that
case, bus recovery should work, as we don't care about the pin states of
the other unused bus. I failed to see this yesterday and deemed the
entire configuration as deletable.

Now I think it's pretty strange to delete the pinctrl and gpio phandles
from the common SoC dtsi and to tell board authors to duplicate them
themselves if they are in that situation.

I think a better alternative would be to add some comments like
"Bus recovery functional only if i2c7 is disabled" above i2c6, and
"Bus recovery functional only if i2c6 is disabled" above i2c7?

I'm not sure whether maintainers could just ignore this patch while
applying?

> 
> Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Link: https://lore.kernel.org/all/avtsY-7-I7_pdyD0@lxl00025.wbi.nxp.com/
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
> index b0bb7bf944059..64903e935131b 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
> @@ -852,16 +852,6 @@ esdhc0_data75_pins: sdhc1-dir-sdhc-pins {
>  					groups = "sdhc1-dir";
>  				};
>  
> -				gpio1_18_15_pins: iic8-iic7-gpio-pins {
> -					function = "gpio";
> -					groups = "sdhc2-data74";
> -				};
> -
> -				i2c6_i2c7_pins: iic8-iic7-i2c-pins {
> -					function = "i2c";
> -					groups = "sdhc2-data74";
> -				};
> -
>  				i2c0_pins: iic1-i2c-pins {
>  					function = "i2c";
>  					groups = "iic1";
> @@ -1038,11 +1028,6 @@ i2c6: i2c@2060000 {
>  			clock-names = "ipg";
>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
>  					    QORIQ_CLK_PLL_DIV(16)>;
> -			pinctrl-names = "default", "gpio";
> -			pinctrl-0 = <&i2c6_i2c7_pins>;
> -			pinctrl-1 = <&gpio1_18_15_pins>;
> -			scl-gpios = <&gpio1 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> -			sda-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  			status = "disabled";
>  		};
>  
> @@ -1055,11 +1040,6 @@ i2c7: i2c@2070000 {
>  			clock-names = "ipg";
>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
>  					    QORIQ_CLK_PLL_DIV(16)>;
> -			pinctrl-names = "default", "gpio";
> -			pinctrl-0 = <&i2c6_i2c7_pins>;
> -			pinctrl-1 = <&gpio1_18_15_pins>;
> -			scl-gpios = <&gpio1 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> -			sda-gpios = <&gpio1 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  			status = "disabled";
>  		};
>  
> 
> -- 
> 2.43.0
> 
>
