Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899529;
	b=JkTQiPam5c3GWlGfGD7coMvQIryUgGy48boHpgUnU4n/Ml7LJS21p1d6bhN+sp4IvW2D
	 Hsuu70kw5ppNhddLigx7gdfUj7d5KwkM2k4s15/dxb4mX6oM1AM6aFA/9fmaeCPnY2QBW
	 MdHA50V81EsgVhSeweUlQAOnX4a6+xpIY1dzsHh/SqZT8tn90yVv6k4TyfTRc9Um2WZBc
	 PMXmKWCAAg9PKWQbq9mKSYnmu/CcWWb5gLzYvrSj75D3XH0ZBJeJ5OdWPdGo8d/97yTcV
	 e9C5EQPmgysZiM1op7wj7cuSiZ0VikvC61lrkq8Dxn/BhhJPlWMCQzNpocejJDeR1aA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899529;
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
	bh=0XkGBVmjiw0L0rKMSOtKqsyZnXPGDZXs626tkop0CU8=;
	b=aO31aiw2fUFYrN50NkZqkxf9f9/hgYe5kwnErn0WajEXmRF61StZ/HORKvrv6qB3R2OS
	 Uxs1lN485M8ZAY+24/Vt6za8zyCeMg59xIHX+CPcGP1Vompk78tZxvSnBbntF4MCJff/o
	 VRk5z2F8DwrWcjdwcaMpzG4/rz8jlMCBn94MTzVHRT7FGGE/l9K/VxjsKJ+EVJXqGA1u/
	 SdyGfagVg6hlPiBKnhdtQyjaunTXAYMyU46pWQuJcj5oKLVHGuQ2DFfkv4f9tawn+UyUT
	 INPbKPu5p7hkQv9XSymgKsoXskl26PS2V5Pb+dz4tg4saPNVcJ+tjD+YDfoxUuA7vaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="p/kf2YSc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.16
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AFA60703DF;
	Thu,  5 Nov 2026 17:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23AFA60703DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=p/kf2YSc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4dT536oPI79zhLGKQfYlPJtYMaS1rAvTDmbBKhRUDXWckaZlAx48sI5xpCaEVytJ+Kf+AZUFCSxo7jZTZvwnpXPIYGFTLf+/Zq+s94P2UQfJWBnRrqAuyIeCUrqKeVZQPeEEmspEz1p53nkyD0nVP3Blpp7UuE7bofMknCnrrIuTl7Dh7jUDnG37KCf3AvsMJfYBfcUBk+QoNlLJaKSMZ4F8Qn/5yP94UxeC1FgKRv95VBS3hhsIp8iO8Wg4CG1iANcp9c7ftFn3EitqGQ1DG+6hr6uvSoedhAfNkFfxxADoJ0x/E9oUbtLHkshmzXWBrarxZM87MP0euz+ZE3Bvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XkGBVmjiw0L0rKMSOtKqsyZnXPGDZXs626tkop0CU8=;
 b=Sc/GuSZi87k20bNf9l9GaWwlxkE+hx8LcqekChv9ZXPDOybKKFUn3zdSSkikvUbV/raefXRdpXE97O2XIcl82RHUuCYdxLGdnB08aFhY08U3hYrX+jDZ1dGlRQEB36bZrHJTWwBMRGdnen1lGYcsShhmkIALwv0F8aMuGjfEyxWbu1rW8ikIIz11067Oi/E5QA+ok/G6L+lxwmmIBAbkdHbyOYi4p06FUDVAuGuHS6R7Me48S6UusftgTEL5bz+ACmL9ytX9fx5UzgRXk2TJY/jR3vHFDRgb/OFOY/CYbgFwqrpQjAiBzVCtYuLbCevaQJcHx/+87d21aS+ANfF7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XkGBVmjiw0L0rKMSOtKqsyZnXPGDZXs626tkop0CU8=;
 b=p/kf2YScbuUQSoeDCyjZACD5dKgiwX+95y1OSTjf8jzyEBM2YzB9wvdbrDNDzdk2YPO63+Ea53hjsoMPsASTx3nacLbBB+m1XQISF8FyQk91Go0HP0T+J/3SYuNE9yDGYq1GKB94zd6jFiV49JZu463EfHRRyEuBkNgtRolyc4V8XUlqiUWVgfXWBlfofCe20bqKHN0TlvMzJOwDhjrC7w4qCUmpBxBB3u2OXRrXbU0RKjjnq0Vn/pT11ow+swbtNr2ks2dPANdUuu/kdRrjpQYgOlumT94snvAm+nN9JTsxm9ra43n38pAOuu6kwM1jFAlB1O0KEiVorhCMSOUXoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI2PR04MB10286.eurprd04.prod.outlook.com (2603:10a6:800:21e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:25:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:25:25 +0000
Date: Thu, 5 Nov 2026 11:25:10 -0600
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
Subject: Re: [PATCH v3 03/11] gpio: vf610: use
 devm_clk_get_optional_enabled() for clock handling
Message-ID: <auy79qnZiyKxLvy8@SMW015318>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-3-504e19de5ad5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-gpio-vf610-fixes-v3-3-504e19de5ad5@nxp.com>
X-ClientProxiedBy: PH8PR22CA0010.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI2PR04MB10286:EE_
X-MS-Office365-Filtering-Correlation-Id: 8530b551-dd5f-46bd-197c-08df3b61c75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|7416014|1800799024|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261022105027099003|261022075727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	NzSPrFXUoTtCP9eW07N8U/vO5CtCbjS9CcjJ838IBi1am7f2KfDXB32rpjv++79l5qRdZVDOj7m1Q7YFd4qvDbnexn06XmUIownblF7H5nmfxV12RVzx7xMLGkRJyEvIHAX7F7CGlaIE5/3iLleQ7KXkBNAzn9K2LzmPHD7FTJWON1IOR132j5oOCWEWwU5CXq4zCxol3LKdU6NeK/ViFeXHD0x6zf/4IRYIgG9m9eVMD5mmxjwiqQt2ZSCHZ7hVddA2ZzamMyfJZUYZ3sbJd7iYjhUBK32q5k8fNO74lC16LlbCmBj8PL84r9dNR2PyHhj7rPGMKTn7IHfsU25t4lzJwZfSIOqxMKrLrIeZAnkgIcoet5XTES3WQdxNPFG2f5gMLaGMm9zihp8Vi0lmWfbpH50VABsBFaz6fU2iaQjthKaFR3oK1HmbZzZ13sfBOpUtv8P4fkaDfFuL9hlMt3hytdQ4MSO7vbH+Zr4pOtlHmvXQPVTWlvvhsviWHmanFmfHvu+vlw/UoSABf+yPcrnvBY9JoWbREyo5JqF9RVVUU7sj11enOgLm97DlOPumGcE5IKbCKK8wDSR9rsmFuo6t/PKlZ/Ae44OEjU0OSHRe8cp94ueoo2D9TurATSUTQxbvETirfYc22pUYJU4jkRwkoLUXg6edoCrWpsvHCXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(7416014)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(261022075727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Okxk+PRzvLJO6kBRLUF3PInfdVmG4uKLQXC7APROW2Laza8bGr8/j9d7gT7?=
 =?us-ascii?Q?u0Lfw4oHy4A8od2oCrQw3Dn7t9NPTjm1CIXA2aUp1OrkMQA4xxCkwEIQZFZp?=
 =?us-ascii?Q?PBEYOHDPVh4rsZathDwrMGJjPoF4jk69cXC8xaOi/Vz7Q+OKxtXBrqnP5rU4?=
 =?us-ascii?Q?jWyyBfI6oJ5wtK14GBOH7kVnh7WQHnsj2iA/b8pLJhIluQQvnaXNTaEhDytx?=
 =?us-ascii?Q?aJOF2xIqwgKko7FPsBqa4vdl5U9o0pChZfh0x0N5WpgWLQ8Oo2BM4cA+9bIc?=
 =?us-ascii?Q?vnkDVEo+W6l+E84I12pzzbvU+vu+JlYXJHS+5yMucTSItg/jcZWqJM4uwqGc?=
 =?us-ascii?Q?u27YCyU3eiBYYF7VcVIgSkaRISl3+IIk2TLol7/SewJ/+CSP5iS70tFGVrbA?=
 =?us-ascii?Q?uwEN0K5wmoaNR8e3/WxSp+cb3tLXBTMdp9h0Kv3uTm/TUPUU1Ryl+Gq0V/vS?=
 =?us-ascii?Q?GxNBd50u5+vhFCHpGFV2pC8Z82annxx2hb08yXDVV6oaMiCcgGBNXIGRvpDq?=
 =?us-ascii?Q?dqFHrxBuZqbQMgn/a65s683hf4OG+oMefeKVEome1AIJcLJ70y+1+yyDhzXg?=
 =?us-ascii?Q?laphsNlsL9Fwhb+u9wcipJVNqspprFwcvftaUV05zB+54b2jNyAtyHWHdjcC?=
 =?us-ascii?Q?87LphdUunrNTLir8dtPBWQnTaXMxg6Uudl2Br8Cl4i5jE6ws7Gq+CW4Us1/O?=
 =?us-ascii?Q?Wlta6KZunDgv7TJHspfQiSPSNYNppAOL0Nxf/hSX5oDWfBQTu33Ci2U9JBbN?=
 =?us-ascii?Q?jQlFZi7Tzl963W24yb+hut7lp8p04hfeuITBng3QDpDFmb1s+lHztte64fn+?=
 =?us-ascii?Q?hAtH7fi4aI5RQf6XK7RkJK3HQsHiiRh+6WtilYzycbwr3EGpFAmBLg87E4T0?=
 =?us-ascii?Q?/p6AqSZBgV29b2V/bgmRHjjuanK/MrmRtkYZytdQa7PmL7BfMbhxMUXd0/xX?=
 =?us-ascii?Q?+jVWondriXa9V4Q5IlIOjV/SlFhlKWTyCjvO+oPfUK97piMHbiXiL0GPnWtX?=
 =?us-ascii?Q?OkXkF7BmpJKx9/i7RZiheb9CqqmNES6AxVByHrxSuD3jP24tWntWQus0jFDk?=
 =?us-ascii?Q?/pDo7N8+Y59SXUrUN+3QhqTZQ76goxS8DOo12o8d5ZtS7QmdsH9ytWO8PbYV?=
 =?us-ascii?Q?/Hp05Dt1CPtuYWYmjAH5RaiRH5uRtxrm557zG9O38b/im1RyThEbT8A0+lQl?=
 =?us-ascii?Q?vbEK2rASgXwQOA0qe+PD8kZFhxmGS+2qISF0rXD6S9NLftAYOk3rKo+CKsel?=
 =?us-ascii?Q?QOvBbrVhToxgGdfVUpVe/FfjTizp+TP7QKW/kKiO7mSh7s+e1XgUsjnkNkO4?=
 =?us-ascii?Q?GnwWpls1GapkFXZ+YW63z05WWh+kqYUzueKcHkCuGAK5zRnLEBQ7U1UYntGm?=
 =?us-ascii?Q?3QSDJuxh3Ro6SKvOuHWb4pipBXmugy/biNr4leIG+FAtQWgkFqg5SDfHJlHb?=
 =?us-ascii?Q?0Ir+FJm/7LiaAybJxKNZAM/J7vjobKrt+H1aql2BN0UocYyvlJqgmHz6LDMH?=
 =?us-ascii?Q?CefB3E7MEhP3bmsd1JPyrc0Px5thKFBr1QXP/zb+w62/DliKAomZ1t28Rhsy?=
 =?us-ascii?Q?15WnpG0rMaXO69V+NIPTjM5GzanyshZy9crclkJ4pSW+i44FETbwM/CLLq5W?=
 =?us-ascii?Q?CcoR8pJPAK5WxdELxKBhcohS28Y4Qa0LRzPspTJHDA0rtu9z9Q6R1VhIzmil?=
 =?us-ascii?Q?jyqeppUCBdVHq4S7ooUTBAHZy1gEWdnZKTQzdU7HzDeYZF30M4Pgh4hkQNcA?=
 =?us-ascii?Q?rPwas0h5YJW5Az1zHJVWnxx8cAe6l8pVH1XNbyR/5SSDK9xLFnDJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8530b551-dd5f-46bd-197c-08df3b61c75a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:25:25.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+l+FErVmaeQ4qbSYar9HN0nbSV4WAUj9SXZBptGQSpJF/UJtLwG2JmUCAxXdqjesZO20zGMgCzaPDEEnQyJABy1Bv1saKFLm8LxWRuJHU28330ZyywFmn7hJAr7EiQq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10286

On Thu, Nov 05, 2026 at 11:53:01AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual clock acquisition, enable and cleanup sequences with
> devm_clk_get_optional_enabled() for both the port and gpio clocks. The
> helper treats a missing clock as NULL and automatically disables and
> unprepares the clocks on driver unbind, so the vf610_gpio_disable_clk()
> helper is no longer needed.
>
> Unlike the previous code, propagate all errors from the helper,
> including clk_prepare_enable() failures. The old code only tolerated
> lookup errors and failed probe when enabling the clock failed; continuing
> with a disabled clock could fault when accessing the PORT/GPIO registers.
> The optional helper already covers the "clock not described" case, so
> there is no need to silently ignore other errors.
>
> The clock pointers are only needed during probe now that devm manages
> their lifetime, so drop them from struct vf610_gpio_port and use a local
> variable instead.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-vf610.c | 46 +++++++++-------------------------------------
>  1 file changed, 9 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index c1c562071c0d..9ebb4469fd15 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -34,8 +34,6 @@ struct vf610_gpio_port {
>  	void __iomem *gpio_base;
>  	const struct fsl_gpio_soc_data *sdata;
>  	u8 irqc[VF610_GPIO_PER_PORT];
> -	struct clk *clk_port;
> -	struct clk *clk_gpio;
>  	int irq;
>  };
>
> @@ -206,11 +204,6 @@ static const struct irq_chip vf610_irqchip = {
>  	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>
> -static void vf610_gpio_disable_clk(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int vf610_gpio_probe(struct platform_device *pdev)
>  {
>  	struct gpio_generic_chip_config config;
> @@ -218,6 +211,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
>  	struct vf610_gpio_port *port;
>  	struct gpio_chip *gc;
>  	struct gpio_irq_chip *girq;
> +	struct clk *clk;
>  	unsigned long flags;
>  	int i;
>  	int ret;
> @@ -261,37 +255,15 @@ static int vf610_gpio_probe(struct platform_device *pdev)
>  	if (port->irq < 0)
>  		return port->irq;
>
> -	port->clk_port = devm_clk_get(dev, "port");
> -	ret = PTR_ERR_OR_ZERO(port->clk_port);
> -	if (!ret) {
> -		ret = clk_prepare_enable(port->clk_port);
> -		if (ret)
> -			return ret;
> -		ret = devm_add_action_or_reset(dev, vf610_gpio_disable_clk,
> -					       port->clk_port);
> -		if (ret)
> -			return ret;
> -	} else if (ret == -EPROBE_DEFER) {
> -		/*
> -		 * Percolate deferrals, for anything else,
> -		 * just live without the clocking.
> -		 */
> -		return ret;
> -	}
> +	clk = devm_clk_get_optional_enabled(dev, "port");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to get/enable port clock\n");
>
> -	port->clk_gpio = devm_clk_get(dev, "gpio");
> -	ret = PTR_ERR_OR_ZERO(port->clk_gpio);
> -	if (!ret) {
> -		ret = clk_prepare_enable(port->clk_gpio);
> -		if (ret)
> -			return ret;
> -		ret = devm_add_action_or_reset(dev, vf610_gpio_disable_clk,
> -					       port->clk_gpio);
> -		if (ret)
> -			return ret;
> -	} else if (ret == -EPROBE_DEFER) {
> -		return ret;
> -	}
> +	clk = devm_clk_get_optional_enabled(dev, "gpio");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to get/enable gpio clock\n");
>
>  	gc = &port->chip.gc;
>  	flags = GPIO_GENERIC_PINCTRL_BACKEND;
>
> --
> 2.51.0
>
>
