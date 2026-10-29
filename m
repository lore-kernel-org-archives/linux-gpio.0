Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793285230;
	b=Fh7xfouKzd9U0nb03dLjomcGOs9HK/4uHKkfmHmxbXqtsQXZas+ZxUyTf7szg1PBzYmL
	 4X21GclxnPH0D7TVOHlSBVUfIwF5e0BbiT2/IPyTYKv/q0va0tfSWJWSDQzsEAmF8yOAq
	 4nyejtlRJSFWoK0aiwsutL3VXBnnnxQtR3xCXBf6vCwpTr43oTpjyMSDlA41cPE2Fa2rU
	 oJTcq2w+VbQoKRb5vrZFi4yKS5X6aA4fp+QeMQu9u4q2DUPPaQlvedvUC9wh+zDfuWxkq
	 RfuH8m0jf3I+JY3pbInUNL6YC8KhqaoqLvITgq+m6f61vtMMLV5sEFmt6EUNaJXERoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285230;
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
	bh=+kYNaT71jzZr5ZSjBxXnHzDnZDBDgBGTxuWKibuzugg=;
	b=Ar5IgCBRTgoxELohLiN3X0gT5lheBSUefWc+CEi8wYn1/vMXj8/redLUMYg1wMbFp3gX
	 R2xWS1JNrLsT8MQwoLObTfYRkfZuet2IHIKeDMhiLGF9MDLQYl9h5sjFJoJHUmA1BDZaz
	 xIBTegHH1UBsXR+m+JEc3dsB76wN1YYryo+r111H6CRssxMKgl9W6Vrv8EL4TY2IRqUPs
	 IC+fOs3SK0j/ZfK2vHCWMkojXUN9DRsx8UHWSK+SRB9osRTR/oLnw9q/O3IY+Ql/pG7Mr
	 bttn8O7zIRXqyOnto4zOmOVccUsWrkIxdJPmlgvbOH67X64SV+MYwTSzox6wKMJoNpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=C24RJi3Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.21
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D74D606A31A;
	Thu, 29 Oct 2026 14:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D74D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=C24RJi3Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MW4qEf5DhgP0LYc9n1eQyYwt9dWKEuy3cvRjIN/rs2g3hv7Xur2WZ1aXAoZgXrwXcnp5B2aXHL4nIkJTOeikSVk4bGfDksY0YXqszZvaNTFeTOc7sZdlS0BGLXkB7DND/Zt6xz4VJlpyplLaWVFb4/O32yLMSwbHbb7dMYyZAldSQdEAg4zUQ8n3bu34di8d9H4Ced+e1RtnE9D2WXGdRcOnCOcFhP7K55/va3JbAU0+k242hfs0GosIXU5ncjHdebqlygoIm7BEueZ+OibvBECJXuBw0ABceksT6oPgf6Gl2f3Vv5DZsx668pE8KwW2jQCLJRloAg7LWd6N6JaYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kYNaT71jzZr5ZSjBxXnHzDnZDBDgBGTxuWKibuzugg=;
 b=k7FODVbY3TuKvez5KmNclwNEa9+ru0uviOzzI8I2Md33gqHpk7xdQyPnPBeC0fqhZxa/yOlc0KHBOlOujKeONlXp6NWGiFwYUJ/tSAlzcNm26b9RD49ba//NhMDxs9nj1BK2inn5eQN7H/+Yo7Rjhz5dpSLi/UaP+8+a7yt90LNJVDYUV4guiP4yYeF7p8UCDY4bRbhCXSmLKIA3UubePbvzjQv/yWAbVcqWdLIIRZ33iZXlJKZsqzRYucsVjYvPM1wSqkNkXORI63SWf8LLJZw7po4vqAZLUqOUhsyTZKIr9ZNTX01ktzEbZ5YEEzPn0xFQaxHg2L2ukZd0wrJ1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kYNaT71jzZr5ZSjBxXnHzDnZDBDgBGTxuWKibuzugg=;
 b=C24RJi3QEaTkQ5n4W4Q0a8QD669xg0S6kp/OPNnDHWdCtiCFSKtXWth+hRWHSpiFpGiwKcnriwaVL6yCiiKssJcZC3FjEcdsIrkLvHnIsf6/VjM0bSJOv47GaiBax/HcqJqQ0Dy4NfBcxH8ZC79DyiXegn4hgmU10Qj+JFNhh9qi8CIsmXzPNzSEPpJuvRjuvAIKm6uIJW++zef4u1opXSJ4vmk91SgrGgdtN/jAS3MYIep1AbZVxfuTCwMMCI1n26De1efkc/bHp6kv/eGRjP+RrR7F/ykeCd5t03/iFSPdPKGpZ0HZSYIQV7NxSuLQFUDGgzXNXu0aJgSl4eagCg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI9PR04MB882039.eurprd04.prod.outlook.com (2603:10a6:290:85::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 14:47:04 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 14:47:04 +0000
Date: Thu, 29 Oct 2026 09:46:52 -0500
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
Subject: Re: [PATCH 03/11] gpio: vf610: simplify with irq_set_irq_wake
Message-ID: <auNcXJ0uLC4cLDum@SMW015318>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
 <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
X-ClientProxiedBy: PH7P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI9PR04MB882039:EE_
X-MS-Office365-Filtering-Correlation-Id: c390a5f1-6289-4b5a-e0c6-08df35cb7f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|19092799006|1800799024|11063799006|4143699003|56012099006|261009223027099003|261021123027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YqP7JU5G5+rpHuOlO/2XpchuGUbt788HySjtmXVa7fvlCCQl7IC4jRuG1nYzrrYNBlHn4q3G+czCX5S3cgdUwh+74nKzzFpV0R/SZUDRl0eJ4Fd6NsSB0UGa9aAz1QMrdkX12+orYA1DXIn6yWfrBDdxAhsVns+UqYyhhgNdFi0IqBb184fqp1a8qtNiIVZA5Clx93DVVN4nC1GagH1O1Wtl7wqNgC3bNclKa+bAWXH14FGa5cw3F3jICkTreDUYuL59qs2FTePjkSkmlmsA2KeBecxOf/ZTJNTpZdmMTxE0twWryXEjJzoIJhO3FMNKDQOzA5yyWRIhP9CT+i8jpfhz52oMv23dU/H7p9MMi4gqebAXVjZUyVsnf35rUkhKJAr1anVH+H15DYjRqQVwExe7ibgUgoLJd0k6AVDqlAP591DaaeJvLr5eD+eJvDLIJhRvmcb+mtF2aGoogqLuHw4S2KiDTXgA7NolD0P/5djMEV4VORTBAyYwNluZ25UO4RnSB4jeJCMFIyrgrEE5OwwtF9v18QXllmfeWYW7LOlMcYrqL7t6+mRqOx47XxcxH3IJfKV4H+cKwyIS3l8qVKtxMy4aiJ1AT5TeN/iwBg4BsBnhVQI4sCUSdDqYYDmZFkhEKLdc2dKvrScs43S1/TB8sxpTpwl1NjV8+9AB/OQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(19092799006)(1800799024)(11063799006)(4143699003)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FKgiQOI+jA0F4kFWtVy7fX3WRF10537mCgXK0fShZbigIsGsBv69BuFP1eIb?=
 =?us-ascii?Q?9O8hKkTNqnzmy5KFfep2ckgMoc5fejs/g9bE1szhjPHvEorfLdHaGjKZ4We0?=
 =?us-ascii?Q?TuOENgPmbM3pyGj7+r+w8Y/q+jXOWLTR9YMdq3WTPxj+G4OW8HxeiQD0yuDU?=
 =?us-ascii?Q?b9/lydUz9xh+ePKrvacmD3Yjt4ysxQjOdZ9j7fYsxKPU2bQWAVz4+w1BXeIr?=
 =?us-ascii?Q?DZOUwP4Gs/QLsJ05oYLI+XPb/ERwCyyfS6mr6mf9MwoNfOmsDpHSUp9Y9d0+?=
 =?us-ascii?Q?Ldrt3okZq1Awve6+kuuifgnm3VRwdjqKYfeMVtiKgp8zareXuAbKE/wiffIi?=
 =?us-ascii?Q?r52okDaDMuz8PC9tjLEa5nIH9vp7CB157IciGs0rx67VlrwBlC7UPnrsJW4r?=
 =?us-ascii?Q?0RMXwo4jMAFpPcxOeVAQWiC+AYry/HZJqzTyXNcD5WEMXcv9dH9qXkENu74O?=
 =?us-ascii?Q?4yoiR5RE0svlvss+gXcJJ1bqY5Js+i+u7Q4Ib/BxQGS/WezFlVLCMNfvSWZL?=
 =?us-ascii?Q?sbNtfG69GqpGSE2hZrsw+jrFxTWQ1KH6hOFxntSENkI0nofEMw1Yda1yueq1?=
 =?us-ascii?Q?/jYokmFPKr2xJG8wssQl0m1GBYFfmAkcdLBSo3tV6GNHgm4aRFoaGT41mLq1?=
 =?us-ascii?Q?v1PZLmcyRo5oD+OjdwKgr9ras1jtpXGpKfrr+heZ8NvDZDvTkHAZ0DDULUoy?=
 =?us-ascii?Q?BlIJ3o/IsQeluPSBRRupVB8geFWQNHB+7ADfrhnRT055ojmeILPHN4gCqvLm?=
 =?us-ascii?Q?jfVGPWTPYEgVxst1f8lM7MniDJUPxl28dfKNqKW0Aado/H60LGWT9r6TqigN?=
 =?us-ascii?Q?RFosqjidSmMbt6MV+MvwXEpdVbydGIxhHtSQK1XwTu09wXsWIVLFuxNJeB7U?=
 =?us-ascii?Q?nOaFRSxTzvhq6mANeN+1q4JPCEYvT2M77mK6Q4vgFW5pJuWoSCeCTTUA9r6I?=
 =?us-ascii?Q?2ERFWN6TGNVbANJ9EkgJ32yY3dy6fIwyu9+fEhI2JkwLujrSwa/GST39WjTy?=
 =?us-ascii?Q?xjV0teDIzrA/Lac4QLYKp88LFIea/L9xiZKWetG31UVjECxN/V3NTn3/fI5r?=
 =?us-ascii?Q?094Xec006nzloC/C27zfyplMs6OWRICkGK6qGzZGCcdawh40LOQopzNTJB/Q?=
 =?us-ascii?Q?kYkKcEEgq4pFZ25xS2r81DKVtpEFLS2Ny6+sV+qPD9oo/yfcddzKDHwdbTLG?=
 =?us-ascii?Q?OAxgbaWtC2vnYEeo05uk3jspBOj0pbqCVqwM1EJWSp4RUWzEcPsS3tfUPys1?=
 =?us-ascii?Q?bYdJEuLR34HYAb0by0/mP31wj2GuNKiDxZpQz4nK1i0rTaNrC9/uvfVQ+mNc?=
 =?us-ascii?Q?/YIc3879dEANmrVyE4fT+PS4AaEdM46m4aO4eq6ksz3Qo38qY72cD2oWzy6i?=
 =?us-ascii?Q?oN3vXzLsUSRpdQXuWy9FTQrAIabZO8RdXqXa6cyjdpCRAfItMCn9zvIvrjIU?=
 =?us-ascii?Q?I67A5HyJwMciuiBRZoRf6VSnRgETkF++wzxTT0mYMvZzgp+NsAKSpChXu4MK?=
 =?us-ascii?Q?Fo99DHzF6AM2CSo0te1GuZy+3EdbxTwz5eoXAwaFR2XULix/3mmcRwsZWbO5?=
 =?us-ascii?Q?FZtTF51jrxaBS08zzG/Q1pJIE/UJJ8T1imVFKjygxfQCL7/6LLuXKrEK/vpu?=
 =?us-ascii?Q?bltsHaSdmAW3OXUSy2c+7CcnJ99znAre2bsu04u3QB+t+kGdUdY2UlR+kcJO?=
 =?us-ascii?Q?76zon7781/3OmfggkwoqFyiyVZCkgiBHUAV7Kppyx9wCFw80mly+/ywkexnf?=
 =?us-ascii?Q?bf9O2BsxcusDOq1HmqWA9u3tvVE7FgHSjUL4DEyp4PYI4zQM41r9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c390a5f1-6289-4b5a-e0c6-08df35cb7f92
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:47:04.7431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCuYC/rofdHXOU65b3oITvCYA9+o2g0XguW5T70x91Lc2JjEpiuuBxybx4FjDT9jw/tesnn3vxm32rm544Dy7QykSxlw0nObUR2I8lT0/J357JqkhTh1+amXZwSLZyy4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB882039

On Thu, Oct 29, 2026 at 09:42:27PM +0800, Peng Fan (OSS) wrote:

subject: need () after irq_set_irq_wake

Frank

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/gpio-vf610.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 44b846ff1b93..eccc79a4d96b 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -188,14 +188,8 @@ static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
>  {
>  	struct vf610_gpio_port *port =
>  		gpiochip_get_data(irq_data_get_irq_chip_data(d));
> -	int ret;
> -
> -	if (enable)
> -		ret = enable_irq_wake(port->irq);
> -	else
> -		ret = disable_irq_wake(port->irq);
>
> -	return ret;
> +	return irq_set_irq_wake(port->irq, enable);
>  }
>
>  static const struct irq_chip vf610_irqchip = {
>
> --
> 2.51.0
>
>
