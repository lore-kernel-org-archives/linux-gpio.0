Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793110162;
	b=rL2N2gsfcl4WzL4kvIViNQ4iNpaIde8+Ppn0I/hLN6iy2xN7yW0puIFFIMtw0UeZj2ve
	 9IHxYiuMJoYV4CaDIFUrgax4OUdN7kpj4bJpOvz99UZdZ3ibn5NU9JjrDeW77+3ULNObQ
	 fNy7YL57huqGNP2jXYzGGhYpKlIGM6l06z4Felpum8hM/jdlR6ciOKAHHA+IkZx0dT+uA
	 GHe7pASmqdmzpNNQ9B8sRdDzarH0wmFMgSzGYROsdfSt2xhi6Q1WJFhenxwau7EZa9de1
	 cMiMlOczOYw3VgZ69MkBDb2Z+QzcG+V1SVu7A7UdcIW6BVY3daEmvAsCwN16LNLnEOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110162;
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
	bh=o1dOquPO3Q8giVnqwPbJ8EdU/orvsgyZnUYy2574ehc=;
	b=NW2uCExWJQrPLP7bpcw0RFG6sqW8pJj2va/M5SMe8Blji90VxV0uwAfpbrrLxUEi5uR0
	 B2UdtME+tjo88j0gZ3OZswOdd//gJ4zxVykxGmOoBVFvhgwliqeC4MpQPBpJnfQGvsX7x
	 McIcxykZ9/UqoPa9rImnOml4YYjhwuYGa4D+6affri7vSi9OKobNB//M/TQP2HCzdci9W
	 YjvPN8ClTY6NS+13JuvTw1bZBUJ5Pqv1fnSZJD4M14KgcFudryxIk2ZLCVFYJDLFWXpdH
	 2IcwLHpjr1XjwGliTRWukdX26B6PaqgX66+bIi38QhzuctzVnEhgvAy8FX3KjNsONqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EzHULtNx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FF5606A31D;
	Tue, 27 Oct 2026 14:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9FF5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EzHULtNx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXLQK+HjO9rdzsWs+aAa0J0lVCymdcb1K+RL9/ZF/pTeWzNewPceqtHFa0n4Y9RZHKHYcZ0iBQFHeahxuz2nbmvuG/90pZpIC40J/Gh912Cg9Ny0icoKUVaX/ZTAN/qiOIACvy4OmAjDr3lLgTPDSB6YObKG8Fq6iErrWpn8cLRbkifw/gD9hSRCsfXkKZIaA9J7P9i4fGkK/WY9+NQP/RDrlfc2Ty7Py0eSMJQovqWCLUcDbw8M+ihSpiKLurGHRyG6EAWTSDjJ4KrZ8CsdKAa6KukZ9w2h4pVnePgcGY+gDIhvnZjkEAAc1v4bCHKan44AKBzCToLaGF1agg+jbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1dOquPO3Q8giVnqwPbJ8EdU/orvsgyZnUYy2574ehc=;
 b=Sh2hwq7N5n7A8xy/qCG0g8eojC7h7WHVQOPd7pwkO1UtbD4RIB16u/6110YfkcgQh/VSYI0dmEr6wpZVEqmtfSl0JRpWASPpPXDBo3pQtAjJB4/rjuy6XXaYIHs5dZjno+gYCngcABntmSE22gF2oU6SUAGsAuH7bESCHvlvAXrKzveudXNKk9QrYtNinaOz5uoRJ2TYvOPivlke8rpTO/0bzWpPJJqZAeN7jtSMrUZiDa7qxImINuHOU6ItYmCikXTB3LwANpnA7jGhAONGfJSxmRymTsw5KeQx3yfLOllO/jNmca7vnmlq/lqbGsBlPMMuLa6/9+fkV1Ogbcm2lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1dOquPO3Q8giVnqwPbJ8EdU/orvsgyZnUYy2574ehc=;
 b=EzHULtNxTvgRP9fG+ZaiD5MHZmyMDFJQZLMo8X1+gfG1Ddj/MhTQ4w3jvuX8EczRYsTFilsfrE6UxLrCTMKXTCaQKKAYfh2tZJ3tdvdJqpq2pOi20pnn0tzj0nwquDBK+urowL6PmFIuAHa1PRYQjUFtt2bAMKZo333HWzHcrARkjnalfVypq1+UiznWe0riioTLc34C6pxDmVa84t0+w59oqvpHVI2mv7l0U4f+vFnVoKgXYzIE9gV8wMuBse1izOBwChF7XIO6VWLquOeiTTcH2Hd8y5LA5/G+IligL9nXAjMNymaKdVz27lz2VAK0hD0wccE2b2Q2AG4zbjOjKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB350952.eurprd04.prod.outlook.com (2603:10a6:800:364::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:09:18 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:09:18 +0000
Date: Tue, 27 Oct 2026 09:09:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 01/12] gpio: mxc: use irq_set_irq_wake() to simplify
 code
Message-ID: <auCwhTbPC4pkCsMA@SMW015318>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
 <20261027-gpio-mxc-cleanup-v7-4-v7-1-7b602d70c149@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-1-7b602d70c149@nxp.com>
X-ClientProxiedBy: DS7PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::35) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB350952:EE_
X-MS-Office365-Filtering-Correlation-Id: 3741f60f-be4c-441a-a0ca-08df3433e3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hd1AKauv9YMtpqGdQxyuk4cZPtzRTU7YZ+YnQzEBPoKA16vKWnpaZZhHi62G+SH/aaWSpXi/D1KHmFxvPZwH/O98SGCuTCnGMrmNiO9bqyMF8RVLB7CsuG60DrEax0yTRWOGow2F0I/Kz3VCLNYtBpXcfVdYXG7QfJNPiMnAxA4QYd7/PiDugiBh2lj+TfdqkeaUaG6suUnEUhEXuJe4mBMB76veRhQtf9LzR3lr/ZB6s5wA7wZlHeTYjvIG5UhjCgoPW2pwXf1Xrb1+clnvI6305ERk7mY6+MwlSPotmegmAUvo1hm3h0jML50CUwZZANjKBIgJTxkBjuLDOHqC4PEO5aitalUcq7dt3OBH44dYBci76ohhHFzsHKj143iICpt4AZrzL5iQfburpmN8oXDYNL3V0HUEdzoMiSoBn3Tuh+/+rGqwDuE+KHj/Jj8NS5h5V0Bvccvhxka8cvPAQM/6AViiD3jytAwK8iVQLauPuyRHgXJfitoUYsCNPnvzFU8vauJ6t1qAsWQQ8I+Sp1zI0O2EtmAtAKUvnqjzK98R3857+qU80oYpgr20zVZWGC/l859dWnsM5r/fnrxsqVxnxXo4nPCp5ocTV5rLz3RWnl/zDOvaMxy/Q3jP7f+A89mr5K7M6jEJJhAQeFquYWHzPSGxvNNESDWpIQ+G+5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DnsMVtakSHCua4HiZ4wj3XjQxBf5uSir4dAa7wpcRFK0pFUM27SX/+yr2Q3/?=
 =?us-ascii?Q?I7VmbU1KcxDJuQzuNOuXsNvu8TUJg3ujnxIWbekc7XPVXzvMflsfPET5o2jR?=
 =?us-ascii?Q?iQLDGg3H9cUYHqJ+NCIYx5ZONXq2GKrV8NRwEEfTsQtphZQ6eKZPX+3lXJ1o?=
 =?us-ascii?Q?s+HbcT9m721MmShS7T1GpxA6ix/+cpm0jb85wj3/LLrXAWb0M65gXPJcQuXo?=
 =?us-ascii?Q?N6HWrz/PovogFD+/Fm4CmNQETx4khpM6XFv4lYJDzC3UnCxt4hx+Q8xEcT7e?=
 =?us-ascii?Q?nJWFXIqGI9JA78rdFYiV/u7KxL/FH4EZoEr2NBEqhxfmmGOjwuBoDjTfq0D3?=
 =?us-ascii?Q?YeIjFARbCOSr0OhCYe1N/OscoBYORFV7BOK7oJnurz0YC1LPMxHSX+k6+yo6?=
 =?us-ascii?Q?Nxeq8Geo7rqFjVYrDiu5FS0yzNvcZty/wig4FRWRfQyMqizvHIC4+6PS6BFA?=
 =?us-ascii?Q?A012+WMupg31Kgn8Bpx67fENMJ9NT5RYuwfxzZHE2G6Co1ggz/JtM0G5wAcO?=
 =?us-ascii?Q?WIv7tnNzoPO+9U1+TnAse+Txau7c1Nv9B11yGsDC4ldZVRH1WTfCe5YQ1qbn?=
 =?us-ascii?Q?bJu6Dc6DZ82bQPComaiZjRMDNInDXpcCr20gTj1vqkAAiIcvMSiOxYVryrgZ?=
 =?us-ascii?Q?GB5QxFw/C2P09byJvf5AN7nQZtpLP+MEEJokPV8pF0TX1K9xbT1spO+QpAbe?=
 =?us-ascii?Q?QexGfeHYmKKc64yVLcE1Ck8CddZbmcbcsEVkEeW+oLZuLskkYuf2BwK0WpBh?=
 =?us-ascii?Q?ytPo22K2LYfijx5f4HAzuJxMyI3qsrtyvv5sey9jEeLDqK81+oY781fPJmLL?=
 =?us-ascii?Q?FljiShEJ1nR1K3m8R+XdHIimAafeAwGWzUGPPP3ybhT1bsaciVEgmaCllZip?=
 =?us-ascii?Q?euAlCvwx8fDLpPqNkmYrrfOXHTH/z5CcJIYIlZKCcu0gR8DGRPM1S7EgHvOQ?=
 =?us-ascii?Q?WqotL7/JURGgXx/HIJja/3jxs/SAAZi67/XcJVO5TZYcfkGZSyWpjrbTIV++?=
 =?us-ascii?Q?Da4ZUpvkfy5zHzTuWRAVKaHgqSx3RbB+C0Fufi41eA6CMenVTPYQ5j7rTmvW?=
 =?us-ascii?Q?ykHKoeM/1tCMr73QL034a8LAZoTk+HOZGqiuWD4NBK2LOGXqUKB6JoQTwYPU?=
 =?us-ascii?Q?h8zkNtEcnDDU1enedg1vJbUU6QualD9qOXwHCPWJdBgb/9wLMcLjr/yCZBM7?=
 =?us-ascii?Q?h3kWLY7Zz5FoaCaT6lhfnJD4HOrIflHOZElRtTPIyo6pow3u5xJR/jZu6umr?=
 =?us-ascii?Q?tYvBP+TqQZWM16N8pm1k+Wx4t6ulWEryB3Hc6BJR2k/IgDo6wAvPNOPy7Njf?=
 =?us-ascii?Q?TR4eAY/3A1kUiGF7pOMxH/DCczx61jZyymuJF/taaueHbDr0WAVhtKsnJXDI?=
 =?us-ascii?Q?W8s08yIXbkQMrToR3oXh5VmNLqDSES1SMNflX26tU6Y6V9GbAeIRW0qZidhW?=
 =?us-ascii?Q?Z0rRP7RKNtUSxVb3h8Mv+2fMvyri31l5nAl/+SrU86VeElQi6BxJqJG2vKdi?=
 =?us-ascii?Q?Ng4f2jkfu253qxa6UvMQ+UUjmqwbEttUU0raaTxps4FtqW21uwENfKIxG2PI?=
 =?us-ascii?Q?Ix6wXW972VCOQiVbNM3KcJr8qCF42D8Cku5FJgo0/gnZeHQ61slpqhD4byWa?=
 =?us-ascii?Q?eG7JFXCRqG/Rr95Knz9AhUVmt8vRHWSeoQsKN5lps95M0oQJ68MdcAWmy/LH?=
 =?us-ascii?Q?VVPlysM+GbybGa/j0xp2sp9P2IkeT1uc3YIGBRLcpMsn2Vho/me9Ie/lDS3M?=
 =?us-ascii?Q?mhRZsdXCcReAIO+BtZAr2y+ZlnfQWjGyUBglSwW3zYGBg9t01LTy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3741f60f-be4c-441a-a0ca-08df3433e3f6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:09:18.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nmsxn0/Uv3wSkpOLmBFxd4yL3T4aeIiCuBrLhP8RagtHhZOKQS4/x8RwLVZjiPG9S09k4wCSuf/M+E/m55YCFWeTtGQ5PNxfm79U3QcdXDoks95nPhfu699Wnz9qmaVI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB350952

On Tue, Oct 27, 2026 at 08:09:28PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Simplify the logic by consolidating into a single irq_set_irq_wake()
> call based on the enable parameter.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-mxc.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 32ded7b548fb..95dfe199409a 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -326,17 +326,10 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
>  	u32 gpio_idx = d->hwirq;
>  	int ret;
>
> -	if (enable) {
> -		if (port->irq_high && (gpio_idx >= 16))
> -			ret = enable_irq_wake(port->irq_high);
> -		else
> -			ret = enable_irq_wake(port->irq);
> -	} else {
> -		if (port->irq_high && (gpio_idx >= 16))
> -			ret = disable_irq_wake(port->irq_high);
> -		else
> -			ret = disable_irq_wake(port->irq);
> -	}
> +	if (port->irq_high && (gpio_idx >= 16))
> +		ret = irq_set_irq_wake(port->irq_high, enable);
> +	else
> +		ret = irq_set_irq_wake(port->irq, enable);
>  	if (ret)
>  		return ret;
>
>
> --
> 2.51.0
>
>
