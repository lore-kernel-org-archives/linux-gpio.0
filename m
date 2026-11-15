Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794742314;
	b=cNp7MsAP/Yu9DaPScZbNYePlAlGsLXbztdsyoXym0xv92G4QCL7OsGHn5kBQ86QAhH0k
	 zWp0c5++rgcFo8Nh9bMVuQOGyG3lQPp6C8y8XwdsQSjotZnplCv63fyYcDNZG9F/vKVTV
	 xPVAxotx55uSqfwCc1MV2oti2N4npX7x3+ZJnMi/udFLdfqItqzVQWWjmq5t5SFR9lfrR
	 U0+o+jWZF7hHhM9trucdlVHS5zFMkm62elkjdZmy6i9XxyJWa3rQfn2eElUXh3DF/3vQo
	 lvPqTiYF/kl150n5Q8KsUa71V/deuLrzBh+pZZvBmvCyLAea70YC66uNIG3idX96dpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742314;
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
	bh=Ac+tMfvvnyaFMLOKx8vwAC0XPeEEZCC1gbJDEn0qKOQ=;
	b=ufUS2Mw6wDKV1dWcZoH6GBmxNr1wL9BDcXPtNSzrSm0zbSyJQzkvdjkrRo7iWgmMomKl
	 WrVT+PtiUcpgrb6Xf2oS2M+xKHJKLhn526W92D4cwtVKpSvbFsg0MjdcdOVLKh5YNgMeb
	 /gxEa8xqpwx0Iot3y/0wbV5fRDUDxKB8IOdTZiNSVPFpJCuh7ic2eOcAAHhXidwkQt66v
	 hMddT8Qw+3dpCbnlsF/3MFqZVGqoHLqzAd4IBS1i489KHb5HcowYQTY54Xbc8FKFpSXqm
	 78UPSG1L4qmZobyfjc5ueGxKaUZvyX61S2h8y9O5DhhGvb6jSjsY14/kJhpfjR+hxTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NDG1JN3m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D006F606A31D;
	Sun, 15 Nov 2026 11:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D006F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NDG1JN3m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4OHfq/2ui0G6T0/ILyCrLU+tLmialDbDT0VbtjJ6arzgAt2fkJEbwSBch8/ujsPGKX6z2TdSdU6urTID8YDtleeZ24vmhl5fWPxjmnSgP0SX1Qv77TM2QZvbqvg6ehSMnqNe+zW2u4+w0QwfTCecJCMoTiVMEQ42hed1nZ5ZEuoKjzACNktaWmOS4k+tpLfLRVfMR5QYUScspwY70C6iOca8d665sdTXtCf35E0WbyRFXEJ7p3YZGlCg9h12r74VmVX1t6LvKmWTMW8n/zVabt+ZmkWpvEA4/IvBdbLsjqMwW4l8U0irIPmihRRkxtkUGs2ypCaEi5V8vDTRWo/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac+tMfvvnyaFMLOKx8vwAC0XPeEEZCC1gbJDEn0qKOQ=;
 b=XibX1AvfxJs2cd4d2eZF1+caPP+pRuj62NCTyUjuerVpP00h8VxNWk2NgN66vymqah2+/p632IPlBPvqbhXIJDPwkguIfiMbTcRs1zFRE1TBhZzWco9L76DrlntdBIRmK2EiNwAfQOhoJxCMhLUffnwNY6CYxb1fOVZWL1ckkgOicMXjmP03se+HnrnqIJ7mbs7jTSUgse40giCV3b7I0anffXbTEN+ICBbNZE/bizKb55pere3J2GoBh9Gq51EvI8c1SToo0jqWSoYxfVWYNk5LIAtSGNkMBvMicWwANo+QY8rV2xvRF+v0cVMiKPMaVGbOOKBN9QFlrSca38pzHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ac+tMfvvnyaFMLOKx8vwAC0XPeEEZCC1gbJDEn0qKOQ=;
 b=NDG1JN3m8qR+lJG+9TRrYHvCuAVRwU1oTgJ+M/5n+wiVu1JOzmn+7jmmF0P4081JwE+GQIBLZuGMcuORgxKrFCMro0Te0tLTRtihFi/D9kuvtyP63MC4KQvKwi3W1QWPa9i/Nk1/1+36w4Ig8GFGhrXpuUqBiixxvwTIWvxaLSnMYlifbRZWsM/iKopCbWVPYsXZkyRXJVxyCYU1CPdBCqoysLsm8GtY4kiiP8YyVPXjI8SNo28qWCIPK/iZFivpdOB0M1XQRCiyy4l8qaciQP3viAUduQI0iMFUWMohqpNgIaC1cDY30r46MLTjFnezg3v+u5E0k4Rp+yc5cfUHhQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AS5PR04MB11419.eurprd04.prod.outlook.com (2603:10a6:20b:6c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 11:31:50 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 11:31:50 +0000
Date: Sun, 15 Nov 2026 13:31:46 +0200
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
Subject: Re: [PATCH v5 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <avmX2HwOji6MBuhj@skbuf>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-0-d246166ea469@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-4-d246166ea469@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-4-d246166ea469@free.fr>
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To AM0PR04MB6900.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AS5PR04MB11419:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9b08dc-597e-4b83-e5b0-08df430c0a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|19092799006|23010399003|366016|10067099003|4143699003|11063799006|56012099006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info:
	OLOtCWVsncpmGJwizzVWNyY+MmowS5dzE1Q5PIb4NRbxYbJBTh1Y/RC7v8+6xxrsGdudL5n8a2cvirSguRkDIkL9QvgTyAj9Vm1Y99jibWII2KkAIXkrwCIVANC/vO3jzaHs/WdSz0dGrBvhrMN4tAnNVxcg1dMuY4MmjUTi/a3X3hdckFHRbjSik8Tto/tSSVGxQ7YEEe7LJmCAcBo+sN34z7NRJ/UDrJZ7ytLBL+O8zC8hBw96xPdie/t8bX5kLyeB0oYGnyOIvbuiuxZ5Ey4oOqqfufz/W9/kNngZR6mconA8+bF8rrXuGKv+Nm3muXcb99bQDJXAERqpQ1eFgw0ucU/KzjeiaYMNgdsiUABcyclOAAGoNKExa2saktZmvGzC2aLIBbIAo9mdPFfy5eWhKGD7zJkwlh6w6g1O1jTyAJw2STJ3oY0RMACwjZ5OJN2hNj9cw3GVfw218h2pNSurVHZHVDKl7QuE7flYtppo9uegGTxJHMbFqsDW6V/BkNm36NGG8xjtPO6M1SWcnjqzzEnN+9HjPWlepOnnGuejiXpmDQP9kgPvbcW6wXp7Y2gaBTOgESUmDN/VdJjqlBwhyUSqGnRBCMkKaAR19QXyQC+Y52gYIfzCazZG+B4WWK1oPTtTzdVAGUMM5+wMoFK9OBv2cGAvi6V1NaXZoDvjxqskrUBOfu9BO9PPexwOd9WMUsug1+EFykqoQsaLWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(19092799006)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007)(41080700001)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WjN5M4QvYUP0JYwcuYtlCxuhV52UlYIJRwY4gErDxtNMIKVtMmzBLSAO/hlY?=
 =?us-ascii?Q?mnnAJkFMoQ6McpAoG4jWS7YcmcAsxAtWMO+sGN6qMNcu1tfXoi8mlzZV5sMG?=
 =?us-ascii?Q?9QJNq3q4ptMolMPA7p+f15QHxlqy4kMkJcDQ4a3x8XX3PHgFdD/MkzmHjWIs?=
 =?us-ascii?Q?ycwQhY0kNCU2a8D8SvL5gIocGS0sN/y5pvZG78Vrz91K8Lb4niuvc4gxIcP5?=
 =?us-ascii?Q?Yk5otgk9VC8q1SvwqZw0mXApFpgmNOTMhc/o/EJvjiB4tcBmEzce/qDEIAcO?=
 =?us-ascii?Q?VukPtr+uTgZDv/lGYdYyVFFv6uabwoE1VtJ0e+yMUBkvLSTdsetsBoVbmMxc?=
 =?us-ascii?Q?euIzfWrv0+WGi2XhvwzbVJaPDxbRfCtHW3OtqERxXJFnydgpHj44yG0YPllQ?=
 =?us-ascii?Q?1T/EEPqzm2oBD2I66VZ5DHanT4KpMDgHqJWOZ6+7+91EgLs9yxEftR8Px+Jy?=
 =?us-ascii?Q?OMHZtBFYmQgTOK+VAbYrlj4hoS+gNiWiYQIhNYqrgL8YV3LaOfdqQdgJVwzS?=
 =?us-ascii?Q?SkOQ0Tua8GXG9uAAES4yxj55v3Oe+aRiIv5frxJLbb4OpHkrYA4HguTBZRz1?=
 =?us-ascii?Q?JhEAUcfSEZ0LA+B2kD+240aKJ3ewErdwInwPGHFR9o+hJB49h43Y0b8nxO9K?=
 =?us-ascii?Q?A85/+MVCKvv/tOGDV+76pwtPBOsLb3YgJyK+orOfUK9rQMSf2tptkZ8dZsWx?=
 =?us-ascii?Q?O1c25Szv1vZ1w5RE2yvQK+2e2+dtQMjNmP/0lZmJmfIDGJLhHqcTea8qufer?=
 =?us-ascii?Q?bUFCyVPisfOKslOGqgPW4a4FQQLOjyUpJJwGvmIKLP7ixtqQW8TfQhAw855U?=
 =?us-ascii?Q?ZTMJEhYDpiBfmk2RhRTaHelYvWVG5PuroAIzvNSFTW71o3Z5yp5IaygPawwl?=
 =?us-ascii?Q?H8K7XJd82ohFCcGz6iQ0gMP5MZ0vok5mZ6drcMpNTHgbUbsZaeNecwxu5kBF?=
 =?us-ascii?Q?mV80jLwtlXSrSPTdYcVYhh00BQWVGmCh2T6cdpBmHxfaywp96t1ixl45P7tU?=
 =?us-ascii?Q?iEJ2YxusBy7lG6H2rXpDzj7UXAEYjjxA/U19QbuuqvlFmOqmi+RgKRTvMWhe?=
 =?us-ascii?Q?ktpLAX1bIsH6OTLZfxzjRWxBcPQ6BTlIzLjr21CPZ4PouzoSqb6W8X0ZmX5o?=
 =?us-ascii?Q?Vcy6bqMcqINuI6oIKb2N5oFEofsgd6aCv6a1QjWZQf/s9AekJavSEJknA08B?=
 =?us-ascii?Q?6LuBkkxowfNRN9qGnGHgyIwSMQEkmXdoPO678lxsCDe4mNv6w1ASgPj7dwa0?=
 =?us-ascii?Q?AWOSeRf7FzZDvzKSRMS/WkCGwAb1+jcGUqVkFyes/ArPnhENB1bmr2kmDDYf?=
 =?us-ascii?Q?uFn6YmJ9SJXXuUqi6hxchIbhjM/SQcEb29lmpzCaRbeJpTEFULZLgOrDc8pH?=
 =?us-ascii?Q?f4JwuYUD51fe/gpNf0zJ3euX+Y0aezzgpY1ig3XmZy5X3IKOdF6hP8B/zDm4?=
 =?us-ascii?Q?+TWY+7hhyIj/DuVRchKvnpZ7kYxofe0c11FX65NEo7dPOHa+EAXrCKLU9Vgo?=
 =?us-ascii?Q?OAUfF2Lez8z5m5A8WWxU2oY27hh1wdyiIMTghS/jczJ2kkr9bXFuRb0I2wNp?=
 =?us-ascii?Q?JM5jPS1akF6kDDlHAP6CMlyf+wjAKTjCfCiq0zob8COiDsj9F6DxYdTMKfnD?=
 =?us-ascii?Q?EWoyI5TDCbmY3AphyuI8pcZ1RZIbijBZkkTtylBqAdpIUl13HN6/p9Eg22vI?=
 =?us-ascii?Q?sYIPl1ZJw6TG4wi+kFvA2299bGFd5Qtr3wONqtaFfmN0vDbefDP0hR9AHO4q?=
 =?us-ascii?Q?UxerZyflgianeGopovtaq2qhTBeOXjTRW5evoo/fU2zf7ydqB9KgLw3T2K+q?=
X-MS-Exchange-AntiSpam-MessageData-1: W3AmNzCDn1RXew==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9b08dc-597e-4b83-e5b0-08df430c0a54
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 11:31:50.3349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSoDWwini64ja3Y0afxySBwkJu2lWSydwrh1fSzErJSXIG4PsVt0Kf3mnP4ySq6wu0uJLRi4KlYA1VhtkLyUKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11419

Hi Vincent,

On Sun, Nov 15, 2026 at 12:05:40PM +0100, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW, read-only in RCWSR12..14 of DCFG and changed at
> runtime through the same fields of the override registers in its DCSR
> view, which read 0 until written.
> 
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery") Linux drives them with pinctrl-single on
> the override registers, so its first pin state clears every other field
> of the word: a board whose RCW programs a non-zero pad mux loses those
> pads at the first I2C probe.
> 
> Add a driver for the pad mux as a child of the DCFG node: the fields
> of RCWSR12..14, the EC1, EC2, USB_EXT, GTX_CLK and SDHC1_DS ones of
> RCWSR27, and their encoding.
> Then pin states select them with the generic function and groups
> properties, and every change goes through the RCW override
> of fsl-guts, which reads the status register, writes the override and
> waits for the status register to follow.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---

Did you see my feedback on this patch for v4? Comments?
https://lore.kernel.org/lkml/avjaK3cOj3iQ6G6w@skbuf/
