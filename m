Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899426;
	b=EOJL49WqSITWIyc5WlZ/LRBYVTIuFJCb3Mg1UAwecQNWBZor9/p7UyySLhGGF+8FFTbV
	 PoggwSAd4OYT2aYsu5RooL6hfXkR4ZmLMMnF4lSB2d3epo9DC5hY734/v8L45DzhGzjfn
	 Zu132M1WaZdSM6wW4D645UF5MAJNl6Fdlrulz9qRQrm46IL6jOpe51sXyRHM/9G9WRJfN
	 zqPHHPBpayJ727nfmLZYWmB2t6HchgYoyo48ORtaNYX7Xkeo/zuLkTvsjx4ytUtfGUSDU
	 plYkq+oMacn0CsxlF5lPIa+ttN12M/Y4lNi/txKzkOfM5mEC6zKwBBz0XTxutYN7C8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899426;
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
	bh=CV7zfiS0QegoyEZORGNDGsDFkjgt2T4tVcozYC0e9eU=;
	b=BChgASq9h9+agizccNVpF2JAQlzLFxydJlEJuR3+YDSnDAF66OmQQ9rhfpGugKdu4eRW
	 vkUAkfRxckC15EgXpT6PPygR+AkgJqdhpO5jHrga3HAlGhJia/BAMlQYcZMImDWDL0pwR
	 5DCxBy8F9sOsqe73NsKI3uDPR1mwRPoD1fgGH8f4ppizTYBuqbrq3O/VPHWBDFNNpydIP
	 hWcJpMV0SEOkKZ/Rmy9kPt/9PCzOSs7NHwfhYCN2HaT5Ft2VkYoHvm0gM0XFjTm1zWyYa
	 3dgrEzVxlMtCsq81uTkQrLErtWWfURErH0yHi5pQNpU9UqYFKeaROZRDkKGB73lnzew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=W1ew8lG4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.65
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013065.outbound.protection.outlook.com [52.101.72.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B4D606A332;
	Thu,  5 Nov 2026 17:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B4D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=W1ew8lG4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9YSL9Nt78ybz7IbR/Os9ok0djWX27K73TzRo/8zkwGlQuJKRXOOhOJeHVUfxAW485UUY6tbMB5RFOi3JyCeCQxNZSrXlQ/n+8g5rbXd61+mp1e7Pj3K/DS8+F6k/XMy9PQF9Hq93TrRv8BFrHWLqZumO/tBAYhKhdyEX8pUbKyFMNz+1CtI3gRj5XQCoz55d2wBg9BskOrp7t15105dfSkRBqEUelOZBEtl7vCT7RvoBDs0vbDl6RZ/gH0XBBHaUWxBxu5G7jTbKnQhrt2Duv5U8Iqu2xFNlEBL8TwjSakWM6VMdHaV352usp1E5QoZ9NeuXmYEVVVu3tLxqapQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CV7zfiS0QegoyEZORGNDGsDFkjgt2T4tVcozYC0e9eU=;
 b=mTK/XR6S4XQ0KuyCDcZ2X8FHASdYpyPCaqG3eZLXWKiKLkYTDjZX4YnILqAlrkJHAnIPfOuA+gUGazBrVRehzn2Fe4zruS2PpY/Jq1/fYajC0Ua/6X0Xgx3/h0mTLibrxunxQeqt2VvSV2Cdixiab7JlRq89wfZ/xw+v6Ap26s/mwJzgtP/WkgcGqdh1b8DojeElTpcT1Y6J68jF5tf2yLiz72Kz52Jxgyw1q4/wxDPMqZ2tWXyJk98fqra9rD6nnClKaJQM7dyZQ2vg4bDXMVdMWt94S5TMr858lvWQjt2jbhmc8uUnwUY4tYaEsGpKSwUz6j9xZKyQUsqVAlKcHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV7zfiS0QegoyEZORGNDGsDFkjgt2T4tVcozYC0e9eU=;
 b=W1ew8lG4dmVVxgp0C+sbbZ46NwtawYjxoFohNwgVWGl0S8DxWLwsV+7OXo/WpR4utVvoMKl8s0ZqCEkfgU46UO8sGTqj/TdRuGNHi4wrrr45SMFPe4qUcYEjVfTgAq0AGnOEvkY9Qfs2mXveYIrBosOzaQfO0S2qhL1ARWu/VdlzU5AXN4Zvdbqzd0Bzh3O3h965CE6MAdBN1Gre5Rmsa2jfTjwpKtPGpqxPt7iCYIl6ErPecSvxjhNxco7jixvuTQBcoH3qzyV3ECBsWE32/FNvz+1tI1HVooUpjUZAMdi4R9RWkmJ65yQG9/WsTXeymWSqbkcU4rcaVQ85tHQJsQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:23:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:23:42 +0000
Date: Thu, 5 Nov 2026 11:23:29 -0600
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
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v3 02/11] gpio: vf610: simplify with irq_set_irq_wake()
Message-ID: <auy7kUUsaj0o_ssT@SMW015318>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-2-504e19de5ad5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-gpio-vf610-fixes-v3-2-504e19de5ad5@nxp.com>
X-ClientProxiedBy: PH7P221CA0047.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2454f1-40b7-4355-9287-08df3b6189d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|261021123027099003|261021121427099003|261102123227099003|10067099003|11063799006|261009223027099003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	zkvkyl2Eh5Qru88wjzVxxaZlQO/pH7N2U4RbbxZjVFhcfo2N/W5s9Ix1cbIRkdxyQwpL5WzXODEXxOjQvDOlHWuS5vndR1XpM2eV8o9IY9DBP85tilNP5D/NYSxO1s3mwVt6NgXcDLo9FfbXOvw310rdDWp0CG5rlliC7W0J4dLjDF/ze4HWvX6l0Xu0f7w+iHGkj5FogUO1cMpPYl6BkSYQ9he3yF6Qwi3AZdqES+fxG3Tm0lPc2tEpBGttuvViDxCIjPix35mrst43ODqvLrVEo+fU29aDwLKk8EN2fgJX0SwelLXPaE2krX7H66vAIdgN6H1I2/D8+iR4DsOIwby6yECQeSys1umkxTremwp/8ZLB3CjCYie2y4NsTFWtplmmvuphu5ZFJW6mjfGH+XdT68GjUvCFlmLMU5eeBHOzBME+v+n5X4evNg6ft3YZUw5AgmVKbX8r+AfQEZZwJtuV/YjFrwFx4f/tGKVPIfex632Do8QkIULV/MJTJoYUwgwnibozNr9cXMSK7q1q06w4cMIvFfS88qkbz5gfvBx0uAmL5fwppl5J4QvTj01UDl33+x/0Gj/f/0Jv9+e9GUw5ifRlTh8qMORaKI0YMgWhMYSRkT91O7twqvwnqTCZ1m4pM5ycfTEjIuXk7UJhee1zgHu0PhY4ByPtk5X2QJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(261021123027099003)(261021121427099003)(261102123227099003)(10067099003)(11063799006)(261009223027099003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t3zsweWsgLDoJcIORHF79RMldqW3G6ISO4c3lPUGmVsIwFltmoetjUH3s4FP?=
 =?us-ascii?Q?c5a4hFsY9shPOzdrxlOLCcqH11HMcIDXVdNAqWaF/F1OeevLYpgLZy8qwMpD?=
 =?us-ascii?Q?mF0sY3f8PF4QpRmvH4d1m6yZJDdu7N9zF/ggtsTQWQ+9mHVy507+gGpbDkfG?=
 =?us-ascii?Q?poKMsmXFk95ZCW5XtBKzC5qRTriLOOJY/sAl5TQeQNgu+X/qwfH6dwgFoqjh?=
 =?us-ascii?Q?Om+fRWzkAKUEHQsJq/OuhcIGsDCoJBigmt+tLsZBi/9WWVgAErgTIA3GlsDi?=
 =?us-ascii?Q?P1A48cEN1f8JqoQQxsMafB9D2YPaV92VWSQikJuknbVgnimYZ7f9HtFjoC6V?=
 =?us-ascii?Q?04gLUtKb/ctwSRaT1+JAcM0no9MBnTzGFYOa3PU8paWB5REbB7hB3BP3HdTr?=
 =?us-ascii?Q?6/mMMXj6zEYNlNxeby5uKzHzyP5GD5m8kvPuFt2eGsTolEqETe2VG1+Liy0v?=
 =?us-ascii?Q?kTrm2cOraDYvSNzPD11Bz9H9mFeUDXlZUzEBPZ9yQ7pp3oegoMHedkNzok5c?=
 =?us-ascii?Q?ZuQZ/zYZcmSHZ4crcReB5kkJJdvO00KXqGfGdlCArMwa6YX7ergqubiGTpKt?=
 =?us-ascii?Q?aBxN/FxcuH2MWlX3il9EZ++syZmA58LZ5+0YRdVJCA0tWfT/DT5bokmvDm8g?=
 =?us-ascii?Q?Rl5Ou1AcxybUq+Llbm/BOAgZONGUGJjrgamrkpIP+NMWiUnpwLskymfUcCF4?=
 =?us-ascii?Q?tBnnmmUsgrRGvMk5ET4mHj6nXqVSH4jW/2JWokCuTmCBXO1y5aJxG0zXW3nC?=
 =?us-ascii?Q?sqwZXbnkrV/isnz8em9Ilwfv9c4kVx+Uak1uAWBJNT2OmzBpTZYsrsoLrwuV?=
 =?us-ascii?Q?jTfDA3QBlEcGiVzyUGaGk2mZCMUAXRJOsY1tHe+ik90qNsM2UAaC5D1t2N67?=
 =?us-ascii?Q?BpQ0ZmKO9S4Ko2wp6VIWWE0jhQmsJpaS8ac1dHp6Qi8STBpUkKzfhqKX5zRD?=
 =?us-ascii?Q?46SyhBpBunhWC1EJ/Q3JnlocLEqSlVeWVDmUr8s8O5AAIhu/7KsVvmA+bPsJ?=
 =?us-ascii?Q?GuGIE1vj9b7wJ0Z0MjkJ0r+C4SDfKD/kr2fY9CXCgFxS3SPlZyfL8Hw3SdqE?=
 =?us-ascii?Q?qMCHHeoW3i5oj0o7fVjyulqjzJI3dmjBgaJid5dAfb7Mba/O5VSE6gguENbn?=
 =?us-ascii?Q?w5nm9P2/rtDLl3w2SjH530LE2FD8/AUOv541rzIqEM+8ZiwXzUDKMW7rnRZ0?=
 =?us-ascii?Q?9O9IKVZjpiANlASSO1ydqfYNnmF3GHu2tvjoffGUZtM2pUP/lpe6ZmFDyn/Q?=
 =?us-ascii?Q?BiLGrAQLw6G6HOb+OmiF76JL6iSsE9AfzSk28dBenkmSIDJCNM+OOKF07Xtb?=
 =?us-ascii?Q?CR1Q/1SBNgal3k27/u2D2BEfvNlJ10ZdHTi1FFMAO2/Wub3MJ3P0cTSNZNG5?=
 =?us-ascii?Q?LJ8kbgGG4dO6CzpPYKziO8l9crUJdt0t1jFlSMOmifwqPAxVFzdpC0LyISix?=
 =?us-ascii?Q?MHOTq0MZdhDovVuqVo3kHX0ew8xVwgC4e8zVpwa++v/BVfZ4HVDsn9ADy4On?=
 =?us-ascii?Q?j+RLI02wreEJN7kzLiOJjaREKEEbq98tsXWSQ4T0rkUF6/tXlZMWQVxvXd5Y?=
 =?us-ascii?Q?pDVarVJzZqNTfiNU0dEGtNmvZlLT3p7syqHcQ9ZIcVJ6wZTc0+rQFMnSsgVS?=
 =?us-ascii?Q?jg8ueiiXVNnR3TWhlQf9HHoS5NpMNID7cImJyZPtNEnti2IYi0Gztp+0OK5v?=
 =?us-ascii?Q?ljDCVPv5dRjPTqNbGly8G4cbJoo+vQCQy9suRGAovYNDz1j3Quu5mDFUtskD?=
 =?us-ascii?Q?o9HEHPYaEbUOXGnq/zV9lZauMtCwY+64usH7vWw3MnpvLsVU4g3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2454f1-40b7-4355-9287-08df3b6189d1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:23:42.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rH0t3bIFNlm8Puav8n4Iab/kEzvrsRhbQtqrLSEJMFBbZN/rDGkllZo6xdwSd2rL7xHY6ufcFusRsOzSMC9ul1+sa7sI6PDl+xqVqSoKKJBlz8zwNcqsv6zkvKIfF62J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786

On Thu, Nov 05, 2026 at 11:53:00AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-vf610.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index adfa2c2d5873..c1c562071c0d 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -189,10 +189,7 @@ static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
>  	struct vf610_gpio_port *port =
>  		gpiochip_get_data(irq_data_get_irq_chip_data(d));
>
> -	if (enable)
> -		enable_irq_wake(port->irq);
> -	else
> -		disable_irq_wake(port->irq);
> +	irq_set_irq_wake(port->irq, enable);
>
>  	return 0;
>  }
>
> --
> 2.51.0
>
>
