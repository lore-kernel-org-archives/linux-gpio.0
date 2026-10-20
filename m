Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792524198;
	b=vxQdz2hl8vWpMW2pmDvHMIgD9t2chXPUbIc9gnY+31gCve40NZT7k+N6eWeMPbZDPv5x
	 3TiYcMpxhPJ3+CoYyOq3OdHK1SFxv7btpmfj72OHFz7GMA5JFohHBowJRejPhGSAT1rpO
	 VpRDMJR/9HzqzgcAuHaYkBiiF5d1K6rv1r/+9YsCdpes9LKhF83ujH3R89KMuNzK8Mgie
	 29ZINWdOO5PWZuwV7nfBFFPduCgCNCeC2Ol3UtWsumvnrh9f0CGgg+4Td+LCvvmB3iBc1
	 M7iPMq6Dwq5dYUzuzY4AiSVAxjhEnosxuiZThucRFOhktArBj2/Kf5NsVDoSGJEhkfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524198;
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
	bh=khGr2jGPdB+8xukwZ0Nv//nTaJOh18ArktZooaPxEWs=;
	b=4YikAUZdFVi3VoWjmHTmu1rN4d8iU6NxbgiWWrOAG+CQERpG7EN0sNLkOS2HEOMkiekY
	 c03EwkZNF6gyX9PfzSXCjVQ6XVqOjyq2A9Pq+6qwnABGTH4czuvD1euWobcsH2ctVwnEb
	 +2PoouIdBmDsYsVX08E4WlkniyVoKjwCdqj0FBA9WwSADJ/SxJgmjYRiUtHdIvUXrkCR3
	 PK1PRTSA7wzeT2AVc06q7sfqIP9twxFfNYwGzdX9t/zGh7bOu6SmHBLmbuV3gCqBT1ra0
	 x1jvNoUguJ95mNvZvDZ2q1FEZyHx8WhBa/qP5WIM6cSO4miUgSGXcZyn4RquwdW+Waw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="AJ/gwyhO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.36
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C2606A319;
	Tue, 20 Oct 2026 19:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336C2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AJ/gwyhO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsCjt4a2lliq3giPBj/53zubn7kugfJE6vBXrAWfjduj91gilUjHgGOl/d33o8Z0sH89NManmYciB/ORGrAgeDvqf/mhMch1Kp1QR/UXtSxkIwkqJYdpW4bztKbdZiBqWeQubH/x0g53Pf/6eIZuz5lgQJL8QtzcBoJFg1/kkVu8vKrXBiZu7bXVoaCqrnBfvVIoiBsE2X4d33HZstjFqbVku3bQ7velI5+ks2R7vlY4vIcWwXs1BjMn7wEGYX3i61Szx+oZc+lfb0ZqQG/x+XhTUT4Kb4vRHfitpYK3YyZE0Y6+jwo6zkV3Xl1ePKGpfZUtPsj7k2HN/9S+lvp1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khGr2jGPdB+8xukwZ0Nv//nTaJOh18ArktZooaPxEWs=;
 b=rYGqZIZTjsKV42/2lxQ/o4RnkSuddF9sz8zNxTejGA4VLDd3TEUOxHbtfws/eO1YWjOjCMHjZso6b/t+x/OGx7zZ/pN9iRqrlybq1cKoSsgUwtwEo7dSLLX3v6Voj/qEt3laX2Hv+/3InckM3+difmW7g3SCh6rvpr+sh/0uJlXKtF/MUFw00jEZSz4cNaZZACZypSsoVJCL/A7kzz8jxJjrKZsR23wfg1HsGv+uvh2rxT3sdhHaiVAfaJ0rfw9fQI0Vgp1sUr5eAztbaxjhHX4r/7Q7T5LPKSL5VE8LSt4vvQoXbIICbrwXxz8bcwhdwDynbBtTdqIltoOQ6tK2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khGr2jGPdB+8xukwZ0Nv//nTaJOh18ArktZooaPxEWs=;
 b=AJ/gwyhOZrBk4mnf/5jyu2YX4rhoN9Aa1TIJ8pYIrNmSII9zrcBWKEwJX1r20qtFjcuTLgoYSMA1jz+4LgO9sHEkx5Vr+Qir6xVZ+7wbKm75PkUgrQobVD7vESMa4ghDthe8I3BtOiY3YsgLP8YUaqrDFEPfBev3RM6m2VEAzZdWR1gFnuNfC1OnD+OiUNg2aTPVhhyar9UM4e/T4iJpq607IdbjGmKEPGyRaWqGRuGZKE12IEKj6nSXMMLuncFCQSm+IgoQeUe1WL+89tYQU8TqT9XAFV/hzJBb0MZ3G+S+ctA2uhvdzW+NParaPZM11Lw2Pc7tyu6rQgLHs3hXEQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by PR3PR04MB7308.eurprd04.prod.outlook.com
 (2603:10a6:102:80::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 20 Oct
 2026 19:23:14 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 19:23:14 +0000
Date: Tue, 20 Oct 2026 15:23:04 -0400
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
Subject: Re: [PATCH 3/8] dt-bindings: i3c: renesas,i3c: Add RZ/G3L support
Message-ID: <ate_mAihhY_Squlr@lizhi-Precision-Tower-5810>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-3-30a47f25e515@renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-3-30a47f25e515@renesas.com>
X-ClientProxiedBy: PH8PR20CA0014.namprd20.prod.outlook.com
 (2603:10b6:510:23c::24) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|PR3PR04MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: d009c102-792e-4175-3daa-08df2edf95c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|10067099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+NuwTF8tINXT5dWNsqWngdqS4PHigtd3UOXgsXpKY1EfeHFmXXLRSDMHKiv7dU1XPPEn7bs62l9hOomkYFXePoMGQ65ka6iVCtWvCi1EKTR4tnfB31aI9T/Ppmo/BqQePAyyvgCR7DumBHQ+kKGvCs0IZacOs8xmGU29CQ0wHeJoI6n3rYUMNWmNQXgnpoNmt5g1fFzqYAUTXgzWaPNGW+Q8NU+Goux9PpQ3jORXdZnan3n+WYCUTbbKC0bbFSKJcpj+hW1NtXr8fT1uCQHtEPHCrNsiotMNkW90lpokTbdjKZtWRcC3jyuVWjcDsvyFdZXppawWqExMzEqM/72ME8rAa73UrbXJuRL7epn6+Ud4KeEQGmtgP2Co37Hs2xMG92qzbUMZZ6s0BPuha50D74VxLZHvjeSqTUhGa8cl7rwyiUpzytJrn0mF/z/N8fII6hwQZo0/1J316MQvabqRQLabzYWoDCwatZ0Yqj7h8nc2rpvUzWkcJZjGQKY2Alb/d8zk0+j/VxVRiAwxbwyyPZiEFukkOsYRATMI+P5mrbf/3Yjfbuwy9v5GmYLWpjO2kc1dk4RlUhtwPwScALqlZZnQpNQwhExnyqDrbWD1yRmXEYxdDBY/d4GKAEZV7RhzSgYj+AhTTX6hDal78KbqOiwpTfqH0ACV1Q3SWXJOTc8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3g5sAbgnJWC+FCh4Pqrb69zfwjK2+gPLHB11VH7/IKbBWMmligop+PrQazzo?=
 =?us-ascii?Q?OMHW3WV4cyjPwkM2PszmzN15kS8grIffvyeRBYRKdUj8yS6soFROAI61ArNi?=
 =?us-ascii?Q?IBPx6hpSN6ItmD6TH2GgwIqSnYyWDqXHcIYLDLmuydYX80e8FiuUPB3lJgf+?=
 =?us-ascii?Q?b6zl9O0uCnQQS8uJ1E1+W75Ow79H17PbOprlPO29S2511mCQU6RawE7WLy+/?=
 =?us-ascii?Q?YzDQ6RNkPMoZpPSoszidv7OTuyiF+QDar4aS7AMvfeCCePPSq1JIJLo97VP0?=
 =?us-ascii?Q?yszPKcWOLLc0+h1DBY0RSBpxeTkx9rSZwjXKHxo9AwVymYJnmGbMLJIJWeuD?=
 =?us-ascii?Q?ZlglFse5ouVnAHFC0LpktevaOy64UgSSeQHqUSPrRoZqY86EClKw832yzsVE?=
 =?us-ascii?Q?OW0SIA/6GmbF1ZpXREoXL3OBSLWPGl7rErRPlwmvPgMv5xK7VhClQwSoJbY9?=
 =?us-ascii?Q?P7ZeYlVxVT4IRsOVheXgN4J4Wstf1vOl6i0mXA0nxmCoscB+GUO9T81Tommd?=
 =?us-ascii?Q?b3z5gT8M205CXDeo3hM6LJa+afpgakU7z+blSVx/jzXjpXwaDa7A4BYl3g1c?=
 =?us-ascii?Q?YVSUs8hzqFfmj/xmyHlCaE8ySJmuu2rJxK30r5007EiAHWuRHPXKgD2lk1gN?=
 =?us-ascii?Q?pEZnXNYcuCWKfZFN/wIETdmndjLHfgYrD1tyRjpn8ZHxA72d022Qeljcikal?=
 =?us-ascii?Q?UkIj0wU++nj+Sa216s0Q+D0NGs46Y4/MfybhHDyBhMULxZZMgrZ4bvaKOFYX?=
 =?us-ascii?Q?8dybhgAo1k70Aj6e72q6BU7TFQU5YiVUzjOOqGtZ0O4F58T0gRh7b8QbyazO?=
 =?us-ascii?Q?uJHHVglNAcVg4P+d9KkRXbadYbs3XZDxAiuJpwG/58dQS+93d9xsK6noh2HO?=
 =?us-ascii?Q?3DgRNi40w+KBEl00yjOkfQGS5k34MBOYBk3O2oVFzf4kajm1LsG6CMGIlfZG?=
 =?us-ascii?Q?LCekW898nFUUOzzRZ782suBE3Y4KeX4PNWwrK82ihgIcJ+3f2wU6OjejAs3X?=
 =?us-ascii?Q?EuVKSJVu7w/TCbqHKuc18/FKUzy9ebB1GSPE3llV5WsFfQk1b40yHdH/YUkg?=
 =?us-ascii?Q?6dUdKWfmNfqZmb7ULPUaHtTGuVNO6++qLzj3lCF04h5tMA6dRQi5TTaOEkHO?=
 =?us-ascii?Q?BmbRKpI9Qln8Uik0PSxiWOWI0aK/00LfSYoNLfJiwZxpd5vW2XQzX7SARmql?=
 =?us-ascii?Q?zfBDhrxgjB4J2IJGkm/vCLzniolyFOitn/7ICxaTENjJ0c8ANJWtdz5JnzSk?=
 =?us-ascii?Q?aWRrAYKiaLq6S1ZFTg4QDogbvX3EIhEz5ytWlnOuLNSuTB7d2f16oiqUEFnN?=
 =?us-ascii?Q?ggdS5kAxmnsG9+9iV4ZmYIs69LeAdQzXovNegek+7chESiNqGPKpQ+DCyU1J?=
 =?us-ascii?Q?tiN7hZ1dTQsS9KkxRtu44EdktXxFKxrOHVKFJRR7rI4cmEQEte5eMEz/64YA?=
 =?us-ascii?Q?yjjYIbuFxfrVPgXx47TrTvKHZtjryA2rB3dL5Ydqgf9/X6tPoBA/VSzlsDg7?=
 =?us-ascii?Q?26NqBz0Gm+uKHZaBD51QTjFd7aETxNnHGyvqABvtzHSmx9iK4KzUuMzethCr?=
 =?us-ascii?Q?nKu+7rOT5YRIcmlFGDsd/QPtWfzhclUTrsvyp99vpXiXMXEw++rj7uvBqDQm?=
 =?us-ascii?Q?gcFyu04PsX5v/bs6qTcu2qt5B3GsyiKzYtXDNVXiIE3LO9Ug3IgUYhy34LLT?=
 =?us-ascii?Q?JdVY4M9Jv4C1oBr2C6NpsOI61dme9Sjt8VM/kMDsWZyNgMNzrU62rU7Tv3lW?=
 =?us-ascii?Q?xi2WxMPJNwMhxMIu4AxoRBYJUo2UxPiXFwy4KjxhKm3JnqjxvBuZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d009c102-792e-4175-3daa-08df2edf95c1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 19:23:14.0057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7RB/ZbZiBFdZGowz8o53HqEZco72B5aNoXBYoPfmUFinK1f0gtiLtEfXlM7pQtmWngYkgBpXaoV+wOMF7jfNWOZYPlD8hXX9Q+LreAxttgS5l6WOqtzJ6XoBDjXv0HO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7308

On Tue, Oct 20, 2026 at 10:14:57AM +0100, Diogo Ivo wrote:
> Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
> SoC. In this SoC, the controller has no HDR Exit Pattern detection
> interrupt and no SFRs clock, so constrain its number of interrupts to 16
> and the number of clocks to 2.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/devicetree/bindings/i3c/renesas,i3c.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> index a20d875086d4..08fcea89a015 100644
> --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -16,6 +16,7 @@ properties:
>        - items:
>            - enum:
>                - renesas,r9a08g045-i3c # RZ/G3S
> +              - renesas,r9a08g046-i3c # RZ/G3L
>                - renesas,r9a09g047-i3c # RZ/G3E
>        - items:
>            - enum:
> @@ -125,6 +126,22 @@ allOf:
>          interrupt-names:
>            minItems: 17
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g046-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +        interrupts:
> +          maxItems: 16
> +        interrupt-names:
> +          maxItems: 16
> +
>    - if:
>        properties:
>          compatible:
>
> --
> 2.56.0
>
