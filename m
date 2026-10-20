Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792524068;
	b=QumWIug5zYmcMS+egLUCJnu7d5yawpSKxVmw6WphLzkpiZEkyk2mqkdbqo+ALPlbdYWQ
	 joaYuv0guuXuUh0H2AYDLBEPGHKL32STzlMxhQHgRSS6RuUqOsT7AK8cBrmBBaTpHB8DR
	 OCHLGfX6vV8gkwudDaH11UitSLjK8fmaI4PINung4tsxQuLTPwoNQSYp43hQ6EN09Um7C
	 YzY2gWQR4meD/TVL5pFdzzmfJ973MfKE6GIKViEAGqYDePdNd817wOZkSBa5BgSZyzOI7
	 8GtweiehxsEi9cOLRefRITH+p/uGzOHk/DE7rLtO6GOPZh+vHV1F0Z/hWbl5CGeyY4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524068;
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
	bh=AHEaPIU1UYULKmeDvhX0FVru538aVXupQCtGZHe4dEk=;
	b=x1ioGUq1GhW0cq5a5tGSJUdZ30ds1Qt/xEM1XlA0PsJYZpd1TJ5AoOTzSaEiZNZWZe94
	 yOOO0KKRunexrbT4h9vpoAxiCLAZO/cF+KVpu4MmV6XkTNp0JdoNyt/IcM1g4SySx+GxE
	 rY+d4KtchIMKWHWFIlqoIOKgctcy3inpCBGhIC/0kA8je0bKOMIUMWDwv4cdeP9/KPa0v
	 RlO52rDZmTnu1jGMRh7SL9tNT294EWjTP7SQ4Mk5Rvs5zdiHh8e5UAqvftoNPD4VVBAy9
	 NiWiTsmzwn37xu1KO6Bd95iLO/HRj9w3ZqodClqlD0NI3s6r51nnkK67G+iombfd5AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QMiv9Gs2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.54
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011054.outbound.protection.outlook.com [40.107.130.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21F8606A319;
	Tue, 20 Oct 2026 19:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F21F8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QMiv9Gs2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prtGU9Ei7JoZXyxzxFbW9k3D2ohbJwLiLwyZTKehwSy5R2V3Y9mLKY1mVK6RLlY1XL49thk/QO1E0Mj/25biBz19ef+y3YEDH6Y83KOUrhiW5FbXi8gb7jmu76kkSYLvU1tq25aTfeKAenKzZz+D1Wd3aHzlcBiTBCN6qM7gyj/IqTrdfrRS5jMdM8mEKcgZaAuGOE/jlEU0iNC9i2oI2zibZC8VQhB2WC4wmtqLblqtzu6KG45O6f+h2njwNhyZ0VB6rQpkZYd3PVmbBdacfZW87YOEUymy43TEtO2GLaYjT1E5xdDAkRKm6ghsigVQv0/JoFkIzYJ6wfvlB5w8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHEaPIU1UYULKmeDvhX0FVru538aVXupQCtGZHe4dEk=;
 b=vhRwi9vrBQmpFvrUt39V3NeJDNgsQXGsTWV91szZx1KATAifrI3xcYuVdwHzsaiMphGnfGm5xaENEBQO1wDUjnqOYZDE/q8FZJPRNkulHppbwG3LQMUMA257tapAIHlgV3v08iOP1oJCt8RH2LJj5zFbnKZhWT+GsQSktmAfUCXNAr+jhdy3t3q/uKSMA+zxYMVrUjnlB25s/BnRfpZYMwqGl6heJbqiIE0KELa48hNj+Ovc1sgCfnKPnIXr2EHrzq1aRm7IgPdbO92dD1UA6alMV2JVFMsnsXYMSM5TK5Tn1dzsk3DL5ZXC7BlQTKQ5u4GK3xKa23VRhLEQB232rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHEaPIU1UYULKmeDvhX0FVru538aVXupQCtGZHe4dEk=;
 b=QMiv9Gs2lkedP5bwybftleQg/Ci+UtxitHdLFpJfeDyQw46149dfgaquVdwNCDTd/ukdmin3x7fwBVjo1fdTo2ZOdelilIvDks35GjpwFZGeDy60Sb1M1zy/1JQS86BoyfDo1gHqmqhBApbcD/cSBDRB5KPCBIyZqSATCASFtoZ2YT+lS3EQGnnd8JTVMfyVQ9vUY6xwzp9Tb5Keis+IfD32w+Rm5CUd4+3NJ7/J2wSNxrr+sVnH6W68Jr37pfBuANvWc+x9COyRJ50D0yYEAXj5HVkmmO6Thwoo/+68qN9rw1XY9aiGihZbe8iOQjM9zFZ4KpgUjDw9V699+/3XDA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by VI0PR04MB10372.eurprd04.prod.outlook.com
 (2603:10a6:800:233::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 19:21:04 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 19:21:03 +0000
Date: Tue, 20 Oct 2026 15:20:54 -0400
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
Subject: Re: [PATCH 2/8] i3c: renesas: Drop comma after OF match table
 sentinel
Message-ID: <ate_Fq-QygnGwqsK@lizhi-Precision-Tower-5810>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>
X-ClientProxiedBy: PH7P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::17) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|VI0PR04MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: 71451c8a-ec16-4d4a-0ab5-08df2edf4844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|56012099006|11063799006|4143699003|261009223027099003|261009221227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PdRqA0ewcsTTDlbZSk60Bg0M8eoHmLiGzpxFNLkORrWHYgU63PYyogaPzu7llgWuX5qkrhGA/vUqmw+jT4OqmNSacBY0K5+8YgigL3QGu1qYFGeUq1U2ZHQP/EHK4OFfDFvHMSoBPZUSmLN+Ud6XSH/4EFAZQhoObBdUHjEsl8HYUj8Tmz41q3eZc1fB5kdXIcG9QKOgnpdMH7ZQEXzqUUIhpewMUaBj7Iqz5V2gdsTKrUGTrVVNhScbbYomD6kZBHa6iBpobMs5zZjYvhNvzBPZBZ4ijHIlF9v6ydQSxBBS5qheymD1Z7rG1GN+31po7QOQ2dIHrXVK6GDC2CHUnaD1ps5vYu1BIRfkBFx7ZjBBCHJU75ZA3l8wSsby8gBJcgL3HbNG1ia9xx2GwsGzH91bQAE26iwuVU1TpjRtUcp1FQ525egjy9RrS3DKZnWEA9AqqPZVPVBYXQU++2lHQtjxz71SZw2qvNi72UqJdgS7Ytdz4L5paZs8XfaPd19cK7VMq1MQIEPbCzDpoJSdcCeibsyTTXGetehDYS17NtHN4civIn0vPMWRpHIrO+HZYRSLd4fft5+eW1cxV6owHqh5qJpXOrZnqrpKWMfpaW/zLlwl0SMJoOgXOzIgYgFGrnXVFvMpih5FJazP6XGdmFkHSNRau6u5SdVl0fKjMAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(56012099006)(11063799006)(4143699003)(261009223027099003)(261009221227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iXBhWqpaONC5/KDvTypcV2WIeDGsD4d33sYRX9YQbWVPxMZ1n1/WjDE8Vixj?=
 =?us-ascii?Q?4bOWqhXaeTMZ7QRaZtyhZMoEb+4ttgWWPAAnmIYR0bBl4vDa89HB0QIvc8kx?=
 =?us-ascii?Q?xtc7QXLZLvmtyYmWcGAqTWvs9Z95fclnWAQ8xOymr0dFJxQMLdvgLmJkX3nH?=
 =?us-ascii?Q?YflxjXae8+LGfVlJGWViTKUanzukeSA21A/oz7yhshuuQaf+lYDg/VDGwgWL?=
 =?us-ascii?Q?oSL84S/w9eG3U4KDJqEwhvqzg8EFN0Oqemnjm7bHS2XIfwChCuTx4qEx3QYq?=
 =?us-ascii?Q?+PCaM73XhkPrUAgQN5pLnzbOLLIs2+BwBQLOOuzo/SjU6AvN7zcz5iM4jF8C?=
 =?us-ascii?Q?9QIyfL2JNj66fbzetlqV3SyqsOkvUCuZGLYXEyMvpcDwIZQo92yfxyTIpP5M?=
 =?us-ascii?Q?HcXWCMYNVSnxySUe8glU70DxLi61mRyKa1UARTr8YhC6mg57BSa7uR3xNHi+?=
 =?us-ascii?Q?Zxyuxa9SY1y3rM12BCEJ31xy/GAuscfUMICzSirZ5n9mFNtDb1SbNd+9Gy2v?=
 =?us-ascii?Q?KFcDfMq4tQvukitPAZfWZL6C3yVri7b51mm7uvvp2ZVEDa6zEUmaJaihk1PP?=
 =?us-ascii?Q?JtJ88cAR9CviJgAQCxZo1Z0wvv73G1tVG1OH/9tuS6PeHx6UwQhZ8/uDN97o?=
 =?us-ascii?Q?CC4ENNL31+z4OiKKP/BhlbtmobsWPRv5IGtYZ4CP5Lm4ssB//+zuAtJSySF0?=
 =?us-ascii?Q?f9b3MbjHFuGVo+2A0dLHH53OGspoaK0bYOLm+0ulqQszAGO7W2iBb8cIrT+a?=
 =?us-ascii?Q?/mWe3y6zPwL6ZHenQqarQvT8dvxBkJcsPPZ6Y6Y7SxSu0pMiIrvYf7JCnBG9?=
 =?us-ascii?Q?uIY0AMM3lDoW1qdvgs8GiD9rJH40v88j8TuHUnQT8f4Oto4dOblvlLKffYo6?=
 =?us-ascii?Q?DwNBGTDwNVLZcxvgAJkmS3m4H/UDqGYubpNHsV4MC6cGxqxPRV6jg2Xgn1Fs?=
 =?us-ascii?Q?5+HbDQE1xx41pmvYqlz/UFT7BTLPS0GrsNg9yUpz/0GVL+lLzysg4KiPopvF?=
 =?us-ascii?Q?G5O1CGNiRf81APooWYATFhkUaXtDPb5manJS3oA+R6poTjvdDYYhOvzToTJN?=
 =?us-ascii?Q?NhuloXnEUjK4fRjXABzZOEM6kxCDuTWUlJJtkZoHwX16VBluhC6WbS7zmWWE?=
 =?us-ascii?Q?AVJNLvb4FFXRwhEMlP4klUJ78q8OdkttD9lb/6Qw1bTsyzvw5dMKW40uy0lo?=
 =?us-ascii?Q?wp8VOL81IDA6JL3oXpU/N7tLA2Yj9R632MZGVWUwWziMblsIbZbIQ+ZQmdHY?=
 =?us-ascii?Q?o64EmHmnIJkMx6Lwqx/GKGqK/E/L+viSUcz+ekjLuok3+2CjU6cYpMxn74GV?=
 =?us-ascii?Q?W3YxeVr4OaW8UG5OIp4Ue4MICkdTTqQPh3/fz0jN9GYgY0XKkElZx5uRq2A3?=
 =?us-ascii?Q?QQhlAzTILhUM6+eqw2bo4zc4mS+dLveZn/Fw5Sj8hIthadaTsttuHBZJ8ppr?=
 =?us-ascii?Q?R/q6cZSULv07gn1yRVe4CJ0kNFjBth6MVNepw3cL4JoRF6IXSb1ZHPYOYYj9?=
 =?us-ascii?Q?LNtFJPKiJNlAUh9YvP12AWSPsfRZiiI14UWX9chmedMuZ/mQKDt/w/1VqsU3?=
 =?us-ascii?Q?t5OB+L+7Hi/ks/yKMMszYZe5AiJ1uC5cUl8ZJe+fZOwIWyO/ov7l3uijwzNr?=
 =?us-ascii?Q?kL9LL7/zRjE5JsHVCFhpPOY7ySLIN9mdKpvrnVxwvz9MX1D6Jje8L2Adf9Bb?=
 =?us-ascii?Q?GP7w2KIm4OGIFGpfCSX5g26xZ9NLWNLgiybNfCeSFtWxyPKKJn0A9Vdnw07Y?=
 =?us-ascii?Q?f/JiIb+0jVhSuoOhrMCn42nZ0oxtAYRCJUd+oBml0r4Z0/rvkd3Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71451c8a-ec16-4d4a-0ab5-08df2edf4844
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 19:21:03.5912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1m6qPtElkTOM+GAto6fFs9cBNuzck0IiWO67ug4iu0MQ1oysyIoqmMtfUgY+7/I01IZRCIRufpRyQjAeLBq4HnXaqmFN/j+29FHapUwTdCmmdf9EGIOPoBagjnqM2vl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10372

On Tue, Oct 20, 2026 at 10:14:56AM +0100, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 1fa115bdab6b..4fddc1b4fdbb 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1626,7 +1626,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
>  static const struct of_device_id renesas_i3c_of_ids[] = {
>  	{ .compatible = "renesas,r9a08g045-i3c" },
>  	{ .compatible = "renesas,r9a09g047-i3c" },
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
>
>
> --
> 2.56.0
>
