Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE24657CD;
	Mon, 24 Aug 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587107; cv=fail; b=j3NOZa17Qr3vY60c4Y3E4ClhOssRZTvqGXwlCwvG9phJXz5CFUlEN3/I5+qLDArnlVBvreMiwASU31U2bsvGspM75/vmX2tOUhLxtqCjv2tS/GGlIAy8CbqDl6EkbFiz0BD21097LBU/pSdFivNlOn6Igh7ndZCwugHkBJ2AYnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587107; c=relaxed/simple;
	bh=C46mg48HpqHTot5o4M5Ib3TTqe3+Uty9HV7VT5cCnZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TLnuDuQ12+8n3NQK2GZOo45P0A6Pl/gT6GTkouU4wXIPe11exQMQ0OScbY+mHrArnDMyczYMfCLhznHoQbrdmafOxR1gDvkO9aoVTmc9e6U9vc9zpLA0w8EVzXGK1fqKe+HilCbZft4nTSLFCnBWaOOf76P/6UsaYstkLQAfdIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ekplf5zh; arc=fail smtp.client-ip=52.101.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ekplf5zh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY76fwoB9gH0AwZlKdgCs8XMXIjTDziBrR6wESA7zoBljV9bPE57kkIRZ9eNAbJHvUC886EkvHrmusoSlma2HBfGNNiCf0F5QXquD6/dJ+AhA3cNv8ACug7RbnNaj4mEJdBxNbNqfqYtAOoPh6Ow+/XSmYqiV1xFzAIT8T+Z60QZdxnu0UK/KRKD5AK3WkSxqDly5zR1xH5d+p+38UPTLMYMOC2luyvXYDU6W/2pLke8SQoPOf1CslgFA+BBJhQYymHEvLk1XR9cG5HPz9oZGVvRMwSMqIeN6X2eP81U2h99wbk4yfdMi+xUSelgbRyZx4+nR06v28fcuxloOdI9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQ+FnxL0SX56lYO4cwihRkd5UKZJN2kj2HuFakDr8/M=;
 b=Hrcm/Kty8PUD9ZqDzTlz3lc2SGSRpwYGXiNnh4EIiEbkvJTOO4ObN92zhX3mDIeId9WfVZXwts0cT98zdKbbfB8zn260QTSH+z0KX6MY8XAFDz3Gl91fOMNfqVHLJjElwXqME+wr2Ok1z3hi79837NvntNVT80pGf1wDoMvfckyiY4tEJkXxaN6gXWJA0v9+qkuilLh328Ki4BWG9H8JzQmqY00QpoaCN4jpLyb6EJV0w3UKqgy+bIxZwgkRIIQREgZazMaYpOYn0iXhpUDBPfvP4IYlARqivmwNch/KwELTIbe/p9v4UcKhffhFPvJUQ10DuHsZ4SyAxitopXOSCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQ+FnxL0SX56lYO4cwihRkd5UKZJN2kj2HuFakDr8/M=;
 b=Ekplf5zh5ftuvtMZv+eANEF2NvejFYqY2iZEXmsniVV1rsEREQ5CY0W6WcdUen0Lir10TOBmxstL0BOWnJQXYHKcAV+c0xUMnIQ8/yb4bmcpV8V6VRr/27FCuUHXFURS8kAnrEMZtJxuY9TW85XPA5iFkX9HneAKnL7q+Zi8AZk5j1+gHk3Sw1urb1UEBg27xMwPYb4CmEVaO82Zc+OHZh/dMH1Gb24KVKfXeDTSz5QmhxShdPQF7bxDof1E9X5dSkxmoGYJici5WKrrxWVrvKgsvYD+bJbkW0Tko+rO2YCBlVVKrryeeMzmjzP0ESKl+s1bss6oKEDkRJSsIXUB3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12020.eurprd04.prod.outlook.com (2603:10a6:150:304::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:58:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 15:58:15 +0000
Date: Mon, 24 Aug 2026 11:58:08 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child
 nodes
Message-ID: <aoxqEAi0d_hxUxbA@lizhi-Precision-Tower-5810>
References: <20260824-for-upstream-dt-qoriq-gpio-hog-v1-1-d75923bcecad@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-for-upstream-dt-qoriq-gpio-hog-v1-1-d75923bcecad@free.fr>
X-ClientProxiedBy: SA9PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:806:28::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12020:EE_
X-MS-Office365-Filtering-Correlation-Id: fb961bb5-e17b-4251-c3db-08df01f881c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|56012099006|10067099003|3023799007|22082099003|5023799004|11063799006|18002099003|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info:
	IXH0gZ+kmibstKN2xz8YeddCtpxpTLqJYhgMonmnHnh5AkqA1wupO3ZtRLfP59/lJxgXlwrrKrPHrjTxV2N+OvLEdtet+lkjsoJbjO1dAEVfRkxW+2UnVb7uBETpzonfLCGRwF+Gp5rbP0b+M0tX6XbVVLFNmOC+2w8xjg4t8VJuQ4okFCdngLmd8O3ZeabKWC+8Gn/Qaitympudl0/fETxVgjIHukz8fbczqJv9TlmblCQO+vjc4EzudXJqF4sf0p6rhOnTcEE7j7ZWT2wLdRFSJo1gwUQOZojXImhcpMLZ6NPmgBctNg6FPY83tUcgUrQAG3X8Z/x644NpiQLc26MGzzBnc2aj7fXe5K9xj8qXRqoGe/LXgaU1JO+lsQghhhdPzXidrzN8dXEy9UV8BYDJUGmVvPnWndML+dHlG7aofA6CbVx6Pg6baq6mwhXIAGthPhwRWt8+8zEJwPhFTuIgiKttoo1P5bpmY5kgDyHMTS+cO6GsNRyTlozFpb4KU2BRCaQ56aaJMFp5q3+0ghc+AzFS0GC5yI/C8ZxJ6TvmCqkazU1piRcFwX3sX5IEkYbBcGnqlKbiA0Cqa4VRL/sx0g3Ekbl5+FoNWbSmABz08rhibRyv2FPl3k5T3yE4N2ivk3ir4vJH9xq5wSEFp5KsrA8hSGXlf3sIc9uyG5pxSbD98MRXoWuuJE9WXHDGfAgQui1T9RbOh+5iI2AV1+ky87HvgmmlzuEdfXJKnxGgSQTlormksbuj6fdZ0n0Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(3023799007)(22082099003)(5023799004)(11063799006)(18002099003)(41080700001)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xO64YzB4uCUIc+QFwF2q6t5VqM2+LVSwp8Tdf00XtTadJHSaLE9yhgYQo0mr?=
 =?us-ascii?Q?ZxzwVUNni11jq4dZjyVlItGQpCvRq2uCV8i0VvqQE2Krfm9Rn1Mh8FgqbBL1?=
 =?us-ascii?Q?gtMapTSlpuEzlw2SO3h63ZcSXhlRmpaPJEOcEStVM3dvqELqHr3P9jDWqgzY?=
 =?us-ascii?Q?I9xfweT0LGC62+1gEIxrL4K5/FBg2dNYG814q4UBBSuSJ6pNcxxtUeiDTK5o?=
 =?us-ascii?Q?8xtq7jNsWM0B4Vu2v3xYBbns+iQKqPz6WkGnJUbj4cbQnYB/bbR78eTFefMe?=
 =?us-ascii?Q?G65iANNoR57nBRxKx59EiAF34FApLTloYJVFqFVm3mONIEvbfyIKOld8tqMP?=
 =?us-ascii?Q?odkjlwATvYOR1y2I8hy+VaKFwM6qvxDQgWUFouhAkcdN02ZfcLjO5aBvZVJ+?=
 =?us-ascii?Q?Sn5teuvZLSILQrQ3RQx0m5breMZSe9q+Xx0c3mGN1N3tC7sPKM/XGytspN/u?=
 =?us-ascii?Q?nk4TIiHbyEp1rqTpFEQ35SryKflMiBpVeXt3slHlAfWaVnx1Srh6coDSiUqF?=
 =?us-ascii?Q?KjWE0aqAvJ08uzUHyfTLEfcfQUNuAh7nX8DL/5RPwB1PB6olbvYx+35bR2yS?=
 =?us-ascii?Q?84F/ioQh7Aus+NEUoGY9V+jDsy9G11tBHsyMHkEUG/RixezcSLJs1xXiGfSn?=
 =?us-ascii?Q?LGg8RkjmV5CwFnI5ljVPI1t1s/glTgP+AJI8FruPcOvFYJ4/cPGQ9A38WSr6?=
 =?us-ascii?Q?H4oVVjfw1pJ6nAU+SD5aqPh4SRAsUVqZZBozcUXos7fj40EK26nhzjEYBmN1?=
 =?us-ascii?Q?jntwgBwKZBGA2nMZisSOzDrEppsmOxspXgZR0xPcCPu30iQ8cfdOttRzPYyC?=
 =?us-ascii?Q?/PwWtr2emINLyhejca5NwjRQMONAP4129u+2l/LY5VOM1UIELRXdG0kJYj71?=
 =?us-ascii?Q?NQhnpiomFFBq2BT/Qfy0Dd6+g503qRvLc8T7N0TLjfIzfk+PNN8A72vDgVfQ?=
 =?us-ascii?Q?h7XZUUmTwFQm3hPxN7bsem9GpLzYh/L2YQ5X7DrNNNpQjsB4fICtplY7CmN2?=
 =?us-ascii?Q?7aUCeoGTxH1Sl97eHg252RALPXYi3rInMGEVjEL2/OZQG2cMxyEv3dxtRTNI?=
 =?us-ascii?Q?ZbxBFHRn3Swo6W+iUklsSVngCaV9k8WhZN3ElPu0aTJnj4Uq7oh2ODt2VDly?=
 =?us-ascii?Q?HPOSjzZkvnTUVfziFxgyCRF2ZR01A0V2NTuY1w4u7sESy2LXxJttSxq7AdRa?=
 =?us-ascii?Q?h9f/eIe4lLXsBJahWbqV7rjqSiyhaX1Eh2jacZFuHdz7j+T2e/xkr2BQlNwW?=
 =?us-ascii?Q?LwhaQ0czQ8DFhyTkvut/5qyI40yBCwxzVuL8+V4W3WnOTgnr7cfy8YaE0nbK?=
 =?us-ascii?Q?44xKUwWpIqpj6f74HIP4Y9Q43BXXIavmu+9t5EhF/cwfqu6Q3DwErWS7+wwQ?=
 =?us-ascii?Q?C9sqEyhe4swXLV4I4v7bedQnLfytLbomn6J589aZwjkCzOrDO+iLxw17Tkld?=
 =?us-ascii?Q?Ubq+MPkM0nN9AAZrj2QZJV2nG0UieB+x70Tuht0Y3LB2nFxSbifz6gX8TPTz?=
 =?us-ascii?Q?yjzv1L9nt1ZWGqZTQe0TKSv/23DYfYuFX0jGHzkKD0eKnNKca5z9fLWtwLbP?=
 =?us-ascii?Q?kuhgu4dRKw4Th47dsefd/PloJLhJDGdec0NzLyXUku+ARYp2/R01BMZC/VPA?=
 =?us-ascii?Q?nIDCjcIBF4KV5ZihBAEGVva1EMSZ69s+R94mROwEldAAiw8C+Zwppioo9ugo?=
 =?us-ascii?Q?Q5AsDDS2YbsUCJyl7kQ02Hnp2KYDX94YJKeQRXIgDa2J9ZITDIDzb6QGPTrK?=
 =?us-ascii?Q?wZfJEmlKDhpRkR00lfWYfKrREmdY68TUPU0ojMRi2TiVaSxsu/4z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb961bb5-e17b-4251-c3db-08df01f881c1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 15:58:15.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BY1wfUO7YDDlqZ/NJy2bORhpkKJhRjh5OBhn7InODYCnyrB8H/X0j966YG64vqpm4PDV+MIKxKG6c6OokF0GNUf0nCUaXPb7PByxq1s85ojUSITVfGr1ugIvwNcq3dQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12020

On Mon, Aug 24, 2026 at 05:48:51PM +0200, Vincent Jardin wrote:
> The binding sets additionalProperties: false and describes no child
> nodes, so every gpio-hog on a QorIQ/Layerscape GPIO controller is a
> dtbs_check failure:
>
>   gpio@2310000 (fsl,ls2080a-gpio): 'ethsw-reset-hog', 'flash-reset-hog',
>   'pltrst-hog', 'thermtrip-hog' do not match any of the regexes:
>   '^pinctrl-[0-9]+$'

I agree on this change, but I can't find ethsw-reset-hog in upstream tree
yet.

Frank
>
> hogs are handled generically by gpiolib rather than by the controller
> driver, so they work on this controller exactly as anywhere else, only
> the schema disallows them.
>
> Note: some other GPIO bindings already have such pattern:
> gpio-mvebu, gpio-davinci, aspeed,ast2400-gpio and fairchild,74hc595
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> index 4cb2a6b9fabfb..a6252440e099b 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> @@ -63,6 +63,13 @@ properties:
>        GPIO registers are used as little endian. If not
>        present registers are used as big endian by default.
>
> +patternProperties:
> +  "^(.+-hog(-[0-9]+)?)$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
> +
>  required:
>    - compatible
>    - reg
>
> ---
> base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
> change-id: 20260824-for-upstream-dt-qoriq-gpio-hog-5092a0f4d089
>
> Best regards,
> --
> Vincent Jardin <vjardin@free.fr>
>
