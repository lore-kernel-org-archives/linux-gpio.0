Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792524605;
	b=D0KMxBPdN7CjJ3fcni4aDubRQ9KTKEAlOnl8zhKihDblv4HUDOHUqBI6iXoZXo9aJkMK
	 0VElBhs8v4MjmSyjk8i7EfWXuz1vJ58+WXW1YtwpwtDpGvKHbseLWoJjpT5XzuXanlFu4
	 vEwwKScP4eWg/3BUOf7urwF4G30XDj1V78pdcqo40Awo2T+WyCtJkXQOaQSS0RrXrXjCf
	 NDTL/fw/ovRQ73mI5LWf13ItDK5cLpkJJSCdGlaGix3WqsUXQA/4VPyhui75jIRdv16ka
	 Lu8+rURm2BcYqPk85KlL+4dRDJEHMRy8LQ1TAz6R+Vwe/Wh+PZJ7T3P8Cusa/LXf6EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524605;
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
	bh=eAabT72GYvU81y9/PIjArfFlUrD33x61+zrSsJQzlQI=;
	b=NmWE0lEMPHP1se86/Zhika2OfR4tT95IsnGrx/XpPcWtX0WDWGQSCNxSsAuxiic9cswW
	 u2IxNSZr7CrDfLm9ykSKwCQI1BeikvUcwJe4v7/tFwR74totYTncMWsGgOLuLL75TlPCi
	 NiCOadhXkb4HqNMSnLNhPX1dXA1xN82huJVSQ3yBEDKs3dD9ynSbORez01Kob0G4nCQcl
	 7j5yG5BGq5ylV4wuAuW2Ht5rmVpgeGi6kC/uj8xuxL1ObJB8iiCWySsVw7GA/mdqcPeVy
	 z4VNoov8JNMAgttuo025OT6C86XqCaF1NsEHC06OKEbh0L1oS6q3I7DQCl7aRn8/egg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="o2z/268y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.22
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60984606A31A;
	Tue, 20 Oct 2026 19:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60984606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=o2z/268y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeCdPmurov1NTs/184h+055x55DalRqYJgRqlTQmXjLICF6y+XFxoXDDfl0OrPkYDLKxsNnLkJ/MbYlIvb8zv8DDAwBwPq4kmOujqcN5oh488LnHMOhC+p+5rqf3K9vpp+cmKBQTNXDXMqILA33cQMzIBef0mSDY+r+z6hZtM+jRnmaCa9nijLMb2hEgzajZDQm0d0aRenmBKUqjzdI43/70gJFWq+rgoqzz1dEm5T5lSbEQHvi8o7v7v5am3DdQg/L3tZ+zN9rxszGRwV1q6uo71CGDWJXltoHw52kynSw5rjZA0/R+1AaPxtGfjs2nahNPZIrHa+bylBHQ5gjNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAabT72GYvU81y9/PIjArfFlUrD33x61+zrSsJQzlQI=;
 b=uOtXE+TWp8HkV4j94972tkgpmeSHNygLoXcpJipSJH8L964ojPDMgUPWByc2koG8GbvhNO/KxQJ2R7pxz+JAdxKnjm1XJkpKw8uAv3jszGZod+Z9U9k0RiRs14pSyW7TvT+0fsB217ZPftIBRXUQLyuR1ht3JZNWXhaTroqP5LZ+U4/TuS05rPGTXQ3syIRXiVlE7UiC0IusdnnOwnQHEmyKpTgi9Tarxm60yj4yRdVMxCKt71TvoZwzHdCcSj/kBzenxABxSjqzdi/MQMAuU2Kez3kRY1MfdIWutxH4kJb4rkfb+VcQaJYq5vK8CYpK1RpNCNz2e0c6cq+3og9Xbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAabT72GYvU81y9/PIjArfFlUrD33x61+zrSsJQzlQI=;
 b=o2z/268yt4cdRT2UNHHJmJG3bw2TYGw2YDhO3GI4EtaKbNAqQzcEDTU3E+EV+0+ofeYgXV4+B59aWCnuUS64Q8Ij/+kY0IlyelVXe32YYiILrRTeyPF02kRL8wtnfZc+7bgeF+cptzy48TiA2V6NTGe9fpnktnlPRm/baGIUhGPF8vSY6tIUPyspdlPa5wEHQhjbKYGcxfLN3TcI1KrpgWNu9jXj7hl1ngkjE6VKye7Rmmqhb+uJUg0e+INQ7y6LN/VOMzAYF3UB42++4lbKxOFVF+5GfzOdhiZi+jJVHZpq/ILHqWo5g9asNbSSMG/9gpk4Ue75Gw07YA3YgDWlWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by PA1PR04MB11263.eurprd04.prod.outlook.com
 (2603:10a6:102:4eb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 19:29:59 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 19:29:59 +0000
Date: Tue, 20 Oct 2026 15:29:49 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
Message-ID: <atfBLapPan0ucANt@lizhi-Precision-Tower-5810>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
X-ClientProxiedBy: PH7P220CA0107.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|PA1PR04MB11263:EE_
X-MS-Office365-Filtering-Correlation-Id: 19929d00-83d0-4cb7-712a-08df2ee08736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|19092799006|366016|56012099006|4143699003|11063799006|261009221227099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	pcy5GDoefhL+3oh+BUI0IQGMsddcySha3pItHlnozrGnLawGkTABgtV0S77ENHhZF0Y5Dp5vkzNTHUk4B/+ZQLoQOE76oUlTccymHxdZCCdrJGo/DHuFvwTa+hV8aMD0GdKXYtS2qFGKBmCPHpzebvV1pDEv0oISquoqMeaE/3ucrTk+REJjKtOpKCYrgwAldhQRptuAkP4GgWsp5vLth9wxBdIgtgpIDxb/81STp4Av36vTg7aTD+RMWOgt45TRU8Oy7n60xvCB3f48VMcDs6lbcSR+md+39kHSn5f2IJQzxLr/L06RuRo4AlRbBRErsp5saoTrX/M5XMTVZ02B+yTIXmsQ2DNlXhXPG8IumBsyhBh4WTZFpJ1+hNTwRQcjy/fXtKGIFMUFjgOKGIf9lj3vzm9I1kEd6wGCIx4VY0sWUbecB7r4HRdV5QluOgrzusS9rzf+Rm61qIYwNe09CprniEZwL1PrsQejY7d6yOR62uPSAS7IutfISdgnpSi6ISokI7KedINh7e5sbFP/rArOF0hoB2ubfvKegVHWgijZeUKaFUUvvrD6xt16H18cK+3bcZvmiLf9WgrhAzbBCR4yhrB1RYQlMlzmIEgt8RyE6ViybtbiC3gIxRP3ZdtG/59sXF5wfshLDPHVQ4R8FUEigQEu1WAvLXv4lJ/4xQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(19092799006)(366016)(56012099006)(4143699003)(11063799006)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?80A/c9lGE9Nd8NfdLdPma91gkuUiP/4pfr6Xk3c8k8Gz1OzKwd4kE0VKlRTz?=
 =?us-ascii?Q?OIog/y3nkh5YOlX2FsDbHSD2/BFTvr5oC6CNnPP+854kX70yufkhTAbk6bzz?=
 =?us-ascii?Q?f803aF+g9wxK9Gv1ZuSLO4DRwdkrfGm4H0KxWFtmM9kWsrevS3sO1+djJWcF?=
 =?us-ascii?Q?STRgx0+6GmV5niDzF+q0aT/InMCaFDzcnW/6+ZE0gdWyIJTLmOvuTszXnPF2?=
 =?us-ascii?Q?//Jkux9ykhr00iaqhBcf19erZHnohWFzzV62CpeNNFTnLyigFsip7poGF6lJ?=
 =?us-ascii?Q?9m+/ASL4W0hlU0h2NjX58D/AkbuEcxw9D9rAyiRce2ao5aeLp8Ra1JK284gq?=
 =?us-ascii?Q?m4ghEikJNUNE04M5k4QLrqD+jV2EstivWEMH5cqGbfu1RwwX2unyMuIY+hZd?=
 =?us-ascii?Q?049gpvyvpRNEakzGVWRxLYDfJJmLoRmIAShoxk/XNfkTpSYO81nHcaE1h1KK?=
 =?us-ascii?Q?c9rM6e0RTgSrnRv+bbDRQNcE8wkeOYX+QY7Wt2wwx1hnXk4DmgGHApUUFf4V?=
 =?us-ascii?Q?YACjWg/PdlyqZsaytwrlzaviyesabVCfNTl33CUj4bOrYlHWBMpPq98XDEOt?=
 =?us-ascii?Q?bW1c+eYLlXQCzjuvGXhBaRTd94clvxgljvjMiIVgHfUHhg+4G7gMphFBMmhz?=
 =?us-ascii?Q?vL4KHPrGSIh+ZBYUJWIm2hl4B0WQ9ijbDg0cWRk1y1ZzjnZGE38Xx9D3CqGy?=
 =?us-ascii?Q?R7H5TgbtB7sSpOrYRUaAb9UbeUqNTLwKt5E0nrJwW7KeZWKWma7he2pBwXCf?=
 =?us-ascii?Q?wAUXXZvmHyEAH2VtcT62AXbj95H4aQ/MKERT+J0OqrGJ6DPV8YQ/CvXeHD9k?=
 =?us-ascii?Q?/GhkfdxuFbsP1JUlsLvGNHwWuY36m5nLfzlxvoboWJYkwEFRx3NxVeAv8PB2?=
 =?us-ascii?Q?sMMYQddjYg6G7tAXrH7MiVFo8c8P+251+DJUSQMudmaL+wJMpOft/Mb0/Dsp?=
 =?us-ascii?Q?p6e64IY0kYzKn3De55avYk02rjuzsxyoL5oRJXVCv7ena3ixSW7kH49727VV?=
 =?us-ascii?Q?i2Ayqzjb92JHlTkC20rwTySqt5IO6BrC3ZS6mniMG5lVqSopI+SQ/o8kjXRX?=
 =?us-ascii?Q?O5pkQxw1Bb/BHSDCJ7Do01Q/gH6no1ouxub/EwWIoezwwbBsOBtuywRzNQZR?=
 =?us-ascii?Q?5BxwYNGQBRZEjzJLlFg4uge3pCFVs7fvaMkTAJY/6gQ0i7H0r3uxY37V76D8?=
 =?us-ascii?Q?Ri3t+HEBCJ2Kz5xkIDvtGxfoTTU0xlgSjLNu6HlXz8Ykc8Ge+CAxc5XxeBBm?=
 =?us-ascii?Q?T0vk6E/r1KCRwhDVpid80bU4pCH6GFMHFQ1wbMkiRZYuUso0xqEczA1r+uZR?=
 =?us-ascii?Q?OYLkCPugo9ieloR7ZlMQBUvl6aRvK5rGUwHwLBqvCbpJtD87X3Sj6x1vMhzu?=
 =?us-ascii?Q?QFlrf1ozfAGUEe5DMiKOsyQMHNbaecO6ZE47aIID/ZTbPl0pOR8PWt+AGht/?=
 =?us-ascii?Q?/IACmPpKIzhfOUPUaWa2Ky9ZxmYOqa7VRhKxCX4KZytWomikWMNJYnP1x5zC?=
 =?us-ascii?Q?uhBd2eiS6dH7NmfT5lFcXH1VAyPIZ6+44SVWAXyf/Ua0QBLa1zwrUJQ0YdkX?=
 =?us-ascii?Q?jJzI7BWlXkY6R3KmGdsBjfFBCANb8UMIAhfnxMxCxL97xAboojmszTbn8ieO?=
 =?us-ascii?Q?EM8WwOvT6vFvv/W0oy4iMsr9OosRpBo4d9Js5AfPSeaVYPQavhdXmzxn4qs0?=
 =?us-ascii?Q?fSNgjsIkzQwZolc76qCbA9Gxa//fM13ShJIw18wiB7w3Q//Cgngk4PS+y0iT?=
 =?us-ascii?Q?nRNmVvEdfr3xnQMES4gJFVX9VC8oHHw5saJZPzyeebiewPhPeZ2A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19929d00-83d0-4cb7-712a-08df2ee08736
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 19:29:59.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOtdIN99qxtu1qQasYGLaZDXoN3K9yBJBoLo45JwAQARap7yh6z8YdlIbiXR063mZRd0Sh4zABlRw6wz8pja8rmJ3tXVAsqcZARFxFFbJyMSIZ0qVGHW8zOn1cLW/eMi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11263

On Tue, Oct 20, 2026 at 10:14:58AM +0100, Diogo Ivo wrote:
> Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)

Needn't "Bus Interface",

> SoC by adding the renesas,r9a08g046-i3c compatible to the OF match
> table.
>
> The controller is very similar to the IP on the RZ/G3S. However, for
> instance the RZ/G3L variant has no HDR Exit Pattern detection interrupt:
> RZ/G3S exposes 17 interrupts, while RZ/G3L exposes 16.

> A RZ/G3L node
> therefore cannot be described with the RZ/G3S compatible, as its bindings
> require at least 17 interrupts. The same point applies to RZ/G3E,

cut this part

> requires 3 clocks while the RZ/G3L requires 2.

RZ/G3S require 3 clocks while the RZ/G3L requires 2.

>
> >From the driver point of view there is no difference between the two

remove ">"

> SoCs: the driver only consumes the tclk clock, the presetn and tresetn
> resets and seven named interrupts (resp, rx, tx, st, sp, tend, nack),
> all of which are among the 16 shared ones. No driver changes are needed
> besides the new compatible.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 4fddc1b4fdbb..80a6df1151bf 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1625,6 +1625,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
>
>  static const struct of_device_id renesas_i3c_of_ids[] = {
>  	{ .compatible = "renesas,r9a08g045-i3c" },
> +	{ .compatible = "renesas,r9a08g046-i3c" },

if there are no other difference in driver code, it is compatible with
renesas,r9a08g045-i3c,

you should change binding allow fallback to renesas,r9a08g045-i3c.

	comaptible = "renesas,r9a08g046-i3c", "renesas,r9a08g045-i3c".

Frank

>  	{ .compatible = "renesas,r9a09g047-i3c" },
>  	{ /* sentinel */ }
>  };
>
> --
> 2.56.0
>
