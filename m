Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793285608;
	b=SJ8AiPArvhMQ5pQHS7C8S6lj0P5Dl9zlVBUaYBDnRCF+gY0X+zv0yUXbsridydN7efg6
	 XqpEgxray4W79gQfZw8ACqFq5RVt/xqPEEs6/blXj6ZnDtgQdwYzPh7mWMqvKzQ4Mb6k3
	 xe4CxP0ouE9RPgPrG3U3tUgW6GO8mchhmT0aRmLryOSGwA7sV2c9pZZZOUjJi1CtA2gjO
	 FHphyiiAPf3t+hZqMr2D2ZOZO0QApRRVT0+mGGQuz07PVm2YtZggoZg3lAbH8xUJ6VpvB
	 Kcfs5zyQBOLazGMG1oFvsY2geNewkXiPK6QA06H893B364JwvX3dGSw4fXm4JNdTOFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285608;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wYUsB4+hm3A6rfk9DOMM01YLNvsCtI8yxVCbgVFMYkA=;
	b=Lc2xtuJ2Yx3JRCeU+lh100L2H6eX/VF3mFf8EII3ff7unXqHPHQtUrSuCgxifI+Imw7B
	 mdY8f2TcMnlDa7ElYC5YHwyvRU7pWWC8SraG28Cy+0wUIXq47Lyymt1XGbVGM8ev7sAg4
	 q2NHGeMIrZPlm6Gk9Qp+OHqp3XNiFULNE5yIBn3imtmgwSU4ZQtoJlLMGcqut6fEAsaWQ
	 1IN62NPvT2rXfMySIKVYlahmEv1KWETT6e9PUslW1M8lgUzOtr7NMJpZKVQsnd3FyUZcn
	 VWH2Hi+IJMZ/5ecWJNwf/BADuWUKZ6JFbZ6BGiPLQlunCD5iBWtiX3OGqnn+MdG+bnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jkTRjqS5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.67
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013067.outbound.protection.outlook.com [52.101.72.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A37606A31C;
	Thu, 29 Oct 2026 14:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A37606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jkTRjqS5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psTr5LDWyBWw/qtQYAxHyQN40n6YwHcA0CmA5i+zi/OfyFTLcSVOPFtqY+m9w/FyboH7DGs28qWm8d+/isk9g2tZ16407A8oQ3ps6sYlwcJRsOYvzxf3oG7y1K/EjsMxp3WtwiiBl02oEG0PHI/2KaXU81wuWjLYXzg5Qoam3DFcWU4gBQnprU7POvw3HW+tr1geftWcj3s022v4THg96xHUPKcTtoJRuf8yWFxsiEPHvYJ/kY4Z1pm2YtnBGpv1SwCzYgHhZ0NM1NmeW4tPd7WDNVRyUrrGl3YuKachZ9KLskiP6nhFxy/48A6dtZufwOasbHv5piEhts3ay90hHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYUsB4+hm3A6rfk9DOMM01YLNvsCtI8yxVCbgVFMYkA=;
 b=BwhvlqJCgUeZvl+7Yxuojhsif5HvYZMIZKMVRNZDrKEiAPDWYzWx8vGPcQ0nvH18FKoF421gMoaV6709RflCBF0kppJa5KxM+g9QaepVbUNUgktcuIi4u1AFhvyVrXxd7x3WEOc8ctUKQZFgo1CP5aSB6YNlGpBISAKykwpVAXA8/mpCPC35s5w0ofhp3YdXOyr8N8ijsEvqSYddcIw6RkmBnQ3V3Boy7clq4OMj+Pn/xbcc2nYCvxgGlHnzwC8HRKAE+UIl0pzE2j7h4l+LiYaku9c1dAeJLft7wnFXkRtiUXqxPLLY5cv8CdnVyEu3iSVoNAy3nbTZE90kRIGzLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYUsB4+hm3A6rfk9DOMM01YLNvsCtI8yxVCbgVFMYkA=;
 b=jkTRjqS5IWxZNlfqojxS38Xbm8TCcLP/bv2NEhxd1GXMffXMle0qdlugNjGSh5qACG+LaZG++OTz2yVptHeF9Mx39STkBwM0Z3Zk6SynVf3l+ayeViglddQC7qoMnERc/M/Ei0ngaaScTY3NreLphuEj9P+5AvCeYzRG1DtvNTcKsDRtNQHyhvszI/HdXjDc0oMRzJ27qTe4fuyq2vL3A/kagHBOd9eZ8fZULbpNO+UvJLh1JjVPU0LOnbqAEwTXRRfCveCpIL9MH3Ci2djeFlECWYfvvK8+snf2oTW7E1K5hbAgxutsrLia3soeHxPzGk1D+EJeFUrxBjZ/PzWo5w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11511.eurprd04.prod.outlook.com (2603:10a6:10:5df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 14:53:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 14:53:24 +0000
Date: Thu, 29 Oct 2026 09:53:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 06/11] gpio: vf610: drop unnecessary wrappers
Message-ID: <auNd2TJQmCDzi9i1@SMW015318>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
 <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
X-ClientProxiedBy: DS3P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:45f::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11511:EE_
X-MS-Office365-Filtering-Correlation-Id: b4539405-c451-4cca-8e3f-08df35cc61a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|4143699003|11063799006|56012099006|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	zco5oZwItfJRDXt2QoeKnhMQyZJHkbdcMUd6iJ3BtwuxG6cPSXnZ8W9RqCjH3H/7iuPwc8006+0kYbg8OxHlbvm83g45o9QY2K81sDYeydFk39uMi51HxD5Ad69uf899EbgSUkCJvnOjA7Xhy85HpnUaYfDktQ1NjAi6qHA53W7bxe6PIlTBtRwqkGZJ7qpisEaochFb5z7WoL0cwaN2DXcT2OYGpRed35yBM6OfO3/3E5pyuPfssu03U5lMQROgS6jsfCYsGHpe1O048F9K4VKWqq8PlhWSfHkuey30rtDcApcsfx1HlbzJCP411S/Txf7nkhW/d5G23Fz9ydVXKnOtiGdXVKHOn/UKaW5adesp1qvSD93BLQEeblzKLRLDo3Iwyptuhbfd+kwtLu50+0l+ZAPeK0UHvNeLxO94cce0qeO1EFNyG1v0AA4f3bAEvqTN64A1Y8UDYF+I3QuFgkMKuz4S3ETdnrq+Z4FkzgWeHq8RHkTK1AonvXAl5rNtPI5ePJYr362Z2VUG94mCmHZcIYd5OftJt81yueufAXkNQ+o/bIyxndRyktOkNSMj7LtHYtdbBRrgXGkRyymDkJ3lwVPsGJxwNgHSbxEd1o16tHCm1a99XbP8gWnXVDm6w+HmjWW3bfh0UjQvjfiLKMwsz4AYNiRIB37Ky5XK8cc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cqZej2hmuY2wo4kvshx7PexaMJzcmY7WlJyfpeI/qR1JRLDKDlC5D0dbBNdS?=
 =?us-ascii?Q?tZO2PaqFP9XQUe2qJyTLNbxOcxzuD+VKOM2gTC0mREBdYnGby47gOamWho1/?=
 =?us-ascii?Q?dnih0EGLOzeALp3IhYT6Z0CjKzk+06IhvPKIcv5dCtOoK2a56aDPUS/SKSsb?=
 =?us-ascii?Q?jpksAB0514QXi9mSrZbieMMjuq+T9vtijQoVRwRwIX1hJX7W6307ZT1OIGNX?=
 =?us-ascii?Q?MzvRAniTkbyi6sTMqKTbAVLokvFLT5BWsyjq8umzaxyCl5EcdnmBdRXNBelZ?=
 =?us-ascii?Q?b+QQDooPgS2aIZFebbrjO2qwLIYUAeEj11vnrtV0UMZ9M2CsmWE9wzB+ZV7S?=
 =?us-ascii?Q?fS8u3gGDkU5moZ2jSKwDWpdE1Lt5uIWJugQEIsszY5MQezZ5zvtRCcmkjimw?=
 =?us-ascii?Q?GA6kUGWcYR2tboW22O0qTHJguhRiaSTvqGPPdGsdAabW+xWvsaspNDL03Vjn?=
 =?us-ascii?Q?111vvFSXArm1PfOU/n/z/bot3fisPmNG1bFOLjnaZtySLUrJTwnIVmLMsxjf?=
 =?us-ascii?Q?IyG+dx7Hbyei4HFVoL6r7NKs9tTVUa1hl3Jw10BXykzn8wq/jELUzNtC7j0C?=
 =?us-ascii?Q?BYM9KqXPGW5FPuwTEimF4iiP+EGP9dNvpWrRbPuHXdbsSyd+HEj7iVI71Ymt?=
 =?us-ascii?Q?7r0MoLK07HDF7GvAcwdghZmZb1bZFENPQlc9agHpR9Hd/52fYIN3uR2SJYHX?=
 =?us-ascii?Q?B/69w0/ZqScGODqbFU5dLzK5lqx6QxAlBPBA4nCNCu+jNSIcBtoYU9dFv4PK?=
 =?us-ascii?Q?F3ZKf5p9l89CmcDwC7rF7go2TBEuk/PgXVefK3MBgGdMsbvowRUi1gHqHykm?=
 =?us-ascii?Q?BUMWq/FqKIpLT7pGJxbP1mzNKbsdXioHZm82vqKdJOf2OxJaphbCk03rSyCg?=
 =?us-ascii?Q?DkF3yGoDYM8pbGprl+LP1Og+LlS+64/cmSXFuUOHjGMC4VIchFjEioURwve0?=
 =?us-ascii?Q?e8WkPlHHP2573pRUB+wFXLNXQjBkxk8mhTBVy4KTPdiyC43eSDeDc1caCZOG?=
 =?us-ascii?Q?VSgEO9HuSXC7UeP8BKkLYgD+cKSPzZm+seOy1QnwE1ktzzij0z5MNHD6dmTe?=
 =?us-ascii?Q?BKitLaDpVJhdOT0nrrngASB7FjisbeCPbpoN+4xL1lXQonEuyK0VWLjzaGN8?=
 =?us-ascii?Q?9ElvPZR9vi3rskYyzRbqmX985iy9uV06ASlJFFzWVCvsZgih+w8KWSwbEUXm?=
 =?us-ascii?Q?9L7TBcEX5o4V0VG7C+qKqIsuiYQh60eTEi6OlIRyCHjqbWeJTlnNUo3lDFZj?=
 =?us-ascii?Q?ObrzGQmBC5PIyirLURtewz5yOwg62Hj99BRnxcn4EXioIyERJJjLRF0X2Yf7?=
 =?us-ascii?Q?Hc/qmwGQAsEuwPKwinkZpDs0IK4FtzX6rGciyzlFLVtO0FX3yRK4kVeE69t3?=
 =?us-ascii?Q?lyWRVH0V6BA7elKBIfY6ueVY9j5+FLD8S8WNg8eIZTyl7R4UVD9VNO/DDIqw?=
 =?us-ascii?Q?R5ECw+Orphf9zlbZwZAfblOxHcHaxtsXLtFvoO5rYxfNkhZiFXfodgKrQUsO?=
 =?us-ascii?Q?1bz70oxV3IULLswh77f4K7ePF0pLLmu7x39HYdl5iznFty9/ALbI5WSdsAOJ?=
 =?us-ascii?Q?PYpMgVh9wA/OzVbFKzVzbMhzG2OrF6jIrksK4b41Wj+Aidd8Qu0b1Vqbqzfx?=
 =?us-ascii?Q?A/hE3ZhCWuCQJBtWi/sHtzG0UXavofhzEMC7EMO8LTd+CT2gktO1vpWA6OWV?=
 =?us-ascii?Q?s5T/feQZz6QnPSklJqJmJye2sLnpQP9WL31cM1rcQCbkcMg47rS9Hqq+I4Dy?=
 =?us-ascii?Q?SlzOZY86mQmB5lA4QAG+9n3/ygFiTfGhhX+OkWNItuPxvYiiIbfE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4539405-c451-4cca-8e3f-08df35cc61a4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:53:23.9517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHPnqNYggXkBnCg3X81E/JH4Cjlnu0knbbYXjK51Bnr3uOQE0RIo1CkGbLTxuo1jAyudkPikKMrG7s2dXC7U1t8sCS23NFaLp/8wy8xOoEIYTUu4ykTUNrmXYtAJRZG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11511

On Thu, Oct 29, 2026 at 09:42:30PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Remove trivial wrapper functions vf610_gpio_writel() and
> vf610_gpio_readl() that just called the relaxed versions directly.
> Replace their usage with direct calls to writel_relaxed() and
> readl_relaxed().
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Some time use simple wrapers is for adding debug message for each
register read and write when debugs.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-vf610.c | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 4c46342bc66c..f6712bb45841 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -82,16 +82,6 @@ static const struct of_device_id vf610_gpio_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, vf610_gpio_dt_ids);
>
> -static inline void vf610_gpio_writel(u32 val, void __iomem *reg)
> -{
> -	writel_relaxed(val, reg);
> -}
> -
> -static inline u32 vf610_gpio_readl(void __iomem *reg)
> -{
> -	return readl_relaxed(reg);
> -}
> -
>  static void vf610_gpio_irq_handler(struct irq_desc *desc)
>  {
>  	struct vf610_gpio_port *port =
> @@ -102,10 +92,10 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
>
>  	chained_irq_enter(chip, desc);
>
> -	irq_isfr = vf610_gpio_readl(port->base + PORT_ISFR);
> +	irq_isfr = readl_relaxed(port->base + PORT_ISFR);
>
>  	for_each_set_bit(pin, &irq_isfr, VF610_GPIO_PER_PORT) {
> -		vf610_gpio_writel(BIT(pin), port->base + PORT_ISFR);
> +		writel_relaxed(BIT(pin), port->base + PORT_ISFR);
>
>  		generic_handle_domain_irq(port->chip.gc.irq.domain, pin);
>  	}
> @@ -119,7 +109,7 @@ static void vf610_gpio_irq_ack(struct irq_data *d)
>  		gpiochip_get_data(irq_data_get_irq_chip_data(d));
>  	int gpio = d->hwirq;
>
> -	vf610_gpio_writel(BIT(gpio), port->base + PORT_ISFR);
> +	writel_relaxed(BIT(gpio), port->base + PORT_ISFR);
>  }
>
>  static int vf610_gpio_irq_set_type(struct irq_data *d, u32 type)
> @@ -165,7 +155,7 @@ static void vf610_gpio_irq_mask(struct irq_data *d)
>  	irq_hw_number_t gpio_num = irqd_to_hwirq(d);
>  	void __iomem *pcr_base = port->base + PORT_PCR(gpio_num);
>
> -	vf610_gpio_writel(0, pcr_base);
> +	writel_relaxed(0, pcr_base);
>  	gpiochip_disable_irq(gc, gpio_num);
>  }
>
> @@ -177,8 +167,8 @@ static void vf610_gpio_irq_unmask(struct irq_data *d)
>  	void __iomem *pcr_base = port->base + PORT_PCR(gpio_num);
>
>  	gpiochip_enable_irq(gc, gpio_num);
> -	vf610_gpio_writel(port->irqc[gpio_num] << PORT_PCR_IRQC_OFFSET,
> -			  pcr_base);
> +	writel_relaxed(port->irqc[gpio_num] << PORT_PCR_IRQC_OFFSET,
> +		       pcr_base);
>  }
>
>  static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
> @@ -290,10 +280,10 @@ static int vf610_gpio_probe(struct platform_device *pdev)
>
>  	/* Mask all GPIO interrupts */
>  	for (i = 0; i < gc->ngpio; i++)
> -		vf610_gpio_writel(0, port->base + PORT_PCR(i));
> +		writel_relaxed(0, port->base + PORT_PCR(i));
>
>  	/* Clear the interrupt status register for all GPIO's */
> -	vf610_gpio_writel(~0, port->base + PORT_ISFR);
> +	writel_relaxed(~0, port->base + PORT_ISFR);
>
>  	girq = &gc->irq;
>  	gpio_irq_chip_set_chip(girq, &vf610_irqchip);
>
> --
> 2.51.0
>
>
