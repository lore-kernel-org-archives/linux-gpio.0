Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A3C2931EE;
	Sat,  3 Oct 2026 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791032754; cv=fail; b=MOEcdaGhhiE6AlrEKelFIw8I8c4jSl0t2L2PqXrWnzBjptQuplX8b0JHN4Caide9doIVWW8bTfI29BFFdB5ILVqn3V1OprTQmQRsTrW76m7c5hoWLixk7ylRLflw0YDg+SnF25Bl1LYd53h8yT8Y4MzTCmENgpbiz1sxDAXEIfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791032754; c=relaxed/simple;
	bh=sgamUlxV067vwQjY/Eg0QX/z2/4etl0/TyPw0p0hDt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VaPun8KmAoEBJLHrJJ6eO62o9HC/g7E5R16DWI0HdOkwdz2A28WNgtjTM2kaPZEDqZwz7WMO/nIeYwvb68s27mDUNrT1BdJTLumQ8ZPmMNlpeTapuZU8rTJX8KrTfmK40Ya5KYhfx2a0k432UECp4Y5lKnUEm0NkHGSe3dP1OSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pA7su7tH; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pA7su7tH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uk2tWLehfZ4dJJtRtFEQQicHZSvnWl/UDRYLExplqclXIedZLockE05ld6c+Idauwn6qX04DB3ihP5q3Ac8m/j+4u//VpD+8l7+ltS9UmMjpJ7XfwyG1SO+6NmWZYVzERj5IsXrbavlald/mYq+8iTh5gSkEEUxk8hjabS8vnIYi3lSic29X1XYBDvx9fdDeG4aAUmIyqUDelfsVw7aeVB8qjVzFwXzehCQ8u2xf4DYGPV4CGSz5HVei1CPJxdMWg3rntMs9iSDhX6uBVUL29bpJ96f2PLwMl0xhiZKYZkFNnsse3jMhq0DNMkLr3VQ1DlDuqd9YZFbdEr6rsEsHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgamUlxV067vwQjY/Eg0QX/z2/4etl0/TyPw0p0hDt0=;
 b=lAgOGjlWCI5DCena6CeIYw6D2oa/hmHqSKroW+TqN+7OOdZaggZWVPTl939YHDjxeynuRhkCkk/GNyTIxIlomozM/rzpvCfehG/LTt+TYd4fZ4o8mBL6GS1Z7cHyDKCak+zZ5O8tVxH6oBDyw+RIrL1p6n8UFYDWWjhhpk8hM6rJOJ6GLUz40wFchnBpAxr++F1LwMo0yTVcHji8OdlvuBtSwJnglcT/2zWGVzV9EUIS/otYhlKAwuEVxQame1J5Zc3Q69lI2bKGul6cYrpckzlC08ORuGDDIfAhYEfr/JYmL0ZL163MtKrSPQRjmD0+RPhZ73fZuiSpsYsgPQzskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgamUlxV067vwQjY/Eg0QX/z2/4etl0/TyPw0p0hDt0=;
 b=pA7su7tHp6cJfPr1v6HbgKBSOJbnPEkwjIrF+icvqX3Grl+Gfx6HAuVaQp3BqcY2/7VwsA8bkC5VuzHLfMArPMk655kmLqWivBvOJokeVL6E3uHJCYmNc4en2887lzIZU6aoQV5zxBCtD/A28fSgi8hyivOohakOKhdH5vBq+xvCypOb4B7pcWxn/xKAMfnoBwBPg9caDHm+EjQCdwQz3IUObFjUcxDzEvEuxE5+NnOgriYQMooGSyoYSl8ZDU0h9FduOQDqtvaoRqA2661PNRog2KO4uBoVi9VlYoVR/5j8M2k4UWT7GaFj3iV2dZHaV737w4H5tYs/JvGmTcticA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV4PR04MB11970.eurprd04.prod.outlook.com (2603:10a6:150:2ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 13:05:48 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 13:05:48 +0000
Date: Sat, 3 Oct 2026 21:10:16 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/4] pinctrl: imx: Match the standard SCMI pinctrl device
Message-ID: <asD+uOubP673g0EB@shlinux89>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-3-8695cbab3fe7@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-scmi_bus_fixes-v1-3-8695cbab3fe7@kernel.org>
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV4PR04MB11970:EE_
X-MS-Office365-Filtering-Correlation-Id: 976c13d3-4100-4934-f68f-08df214f0ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|18002099003|22082099003|11063799006|4143699003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NkF6Bc+V/0siiW32wjA3V1w0rGFQ8/U2tH4Z2FS3/MuvbBHon+ThtNOhAHtOzx+bGsfNGuN6/gP3fQ7MYJRBcVA+R00QnmVSAv9k4iiFtAfLk7g7pi88Dn1Xugwi3GoKeDViDKYzQhZE3xAF9XCUDvciBkFXWID5ERqQLN0+r0CZWkSlHenX1YuqWqZAUG2CUAcSAeLaXsuYNDoOjkqHNfMlc1mpvuOps/0bFG2V423jWosgdPBMAX3LZX2qMH1x2zPSFrKID5j1+8q7AWo2VwD1mgZmjZ6apbXoVDKB9m4lvISP1F3iDbbbXFm9x8PFFavxzuYQBsf+/CtwcDkK10LQZgHLw8rUxZ7u4hDln5yA71q5nwkDJ7qKiXUp9uZdRRuocmClhTLoKjryn8kNdoYGWYVLyUieKZ2t1eG99c3zG7Rv3k6TUTFe1bb4pZDiEp8JvcTSqdPGRjZduiL2HvPJyDHsujC4p5ZDZXx7M/abkscylrfgEk1YSYB/jysqVR/bSgVpHiWAcDYxJKAz/2m3JjQUaj7YF0rvM77yx115Q/2TaxneFCUi5GxQn0bI32IdexySD1awJ1d0KGuOAZnmmbO/7kep2Sf/Qtx5FTX5DYM6wG8Xfw3TOuR9cqotAWkwLucrpBovrfUcyrJoKifky2eK1793ILFDGBD5Myo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YJPGCK+p3EIwba//4+7OJRn5PC3KETv8PafFW2Dh+JE3HxUe/FgNGaolXwHg?=
 =?us-ascii?Q?+WCfW4oEolosFQoFJS6EoRfFWsbYFdaGEHVW1xbGKJKmCijpRoxNa3K23OEt?=
 =?us-ascii?Q?r1radvKXLHUbjd78YGdgcywG8iJIlB7deefSG7O969yOW5UN/dTaWp+V54tL?=
 =?us-ascii?Q?kqQllCC2ZdyPl/ePy7xrcfdw5Bff5jXuaD2jG35kkg7I+v4HEsws2LY6Peq3?=
 =?us-ascii?Q?zx7/3LL7EfCZYmP+O7MQcumG1tTTLUB/4GYXlMocgKEeY13qgoJnMyqFt7iZ?=
 =?us-ascii?Q?xOxfF87ggZwOWXkHGsQT79XjnGAFzImmOOnaVOXqfex6FRlzDEmp9k0y1UBo?=
 =?us-ascii?Q?F57oR8avJJmbmzHpbY8eVo+jUivE2cISGYKMNUcPk8M/nFtxM90xG8AhG/C9?=
 =?us-ascii?Q?wE0qQzUNdI5I/cHVWlb1JCeLljLtx8DWApjFq/mAWOxDrxV7sIJViktk3zDx?=
 =?us-ascii?Q?d53HKC9EurNitSfe17tT6fAQHDowgZpjh7NiyFju6CaLqJBXFBG9v6FyLHIP?=
 =?us-ascii?Q?0NH6vXF6/3cl6F73zBuDj1jUuCZbT4QBZ2JctDayUtMFzPUUI8uvCm/hQVrr?=
 =?us-ascii?Q?kA7UhhbZnsRLQ7ynOc1tqQsZYynmExyacZGt7LKQSaAbLU5sZvEwo0WLlLlR?=
 =?us-ascii?Q?IIyyTouOq663Ub6Zn5Vu2ayiAnac8NvlYJSpg/54w0LH53K+9GQaWn4A/9eN?=
 =?us-ascii?Q?3nknV8Q1ke0cTIhx2JZSpwKYGJxKOySAmLHQUZEDkvYBaDPN6ihNvG8pm5f8?=
 =?us-ascii?Q?XxLC7C1gslxqZmmXxlFZdv1e4vgDY+4XyMTqheH69tFewG65axbGItpRI0r/?=
 =?us-ascii?Q?PZfXZ9o62N8tKCoVBEFT41FaN+QtglLzGDLLG4b55a2Rl+GdEYhsfhBLajO+?=
 =?us-ascii?Q?PvdD0g48APjpDyA4RQZXQCpJKOHzHEoKJ2pxAFIAdABwwibHwoYGtDP2JVgh?=
 =?us-ascii?Q?AABaqWM8cvQzlx3UaSmU+kVJQSjf71fymTnXVD91vu+eN3qsA2wPjQBR7uOi?=
 =?us-ascii?Q?jmk41kLllwRIn3UVGDvEfV4j1KrM1/lZ4XtclQGQEvcczPO9SGzaHLcQSe3M?=
 =?us-ascii?Q?4bXJpAjmJ8bsxvPg0u7+iuKUo4wmX8zABjh0dB2VHdLkcKTD82CabIYueuRH?=
 =?us-ascii?Q?ApJJCc8zEPAlIj5FD63SpxMyQ3kbOVTZ14Ta9q9KKwq9RdH6o6mjrckhLr35?=
 =?us-ascii?Q?r60evUEg+cUKOEafVAMPcMypNO1cFp6Nr90cbn28t+5NGaNIfuwpPnygHTWf?=
 =?us-ascii?Q?0ZKDaCDaxy1jpvdb3Q060LQ6KR+23cnNjB3/Zd+gPETSc0FWos7cVVNrc0DZ?=
 =?us-ascii?Q?SVILFTASm2cpXSeOTmtcEyiEfaGlaSr4/HSMuYX9nh7xvuU9OF+6PMxUMzJU?=
 =?us-ascii?Q?V0aJk2k3s+a9agXrr4wV5m9wr8YZzGQPFcZV8KFBeZTDzzcIYv8iLB30CBsW?=
 =?us-ascii?Q?DaodC4zYu6Mx16Xmo9Ja+6Wabd3KqcqAM/P34YryzaNzuwQuPrOWw/tby30n?=
 =?us-ascii?Q?dDVgenhFkmR/SpG8cpOXhHD3wDG9h1gIxVGpN58Jwe0toOtPrE5KLCVuRyZO?=
 =?us-ascii?Q?SRADPGCbfbtOyvS0D3nbxxjn9W5u3eOKWBYcLTJ5RJX0k+Q+dW1A87wHXxQY?=
 =?us-ascii?Q?OMF7S0EyYiQHcr2bo/2lsFwjVoMe/meXeQyk8EpzUkNDO20KLJuxqZzCDFtQ?=
 =?us-ascii?Q?1fcAQVX+h2LwEXvpwtIBhN/W0E0eT4qFxKQwCoyqgtP3HFlDac4xkW8RKNVM?=
 =?us-ascii?Q?TIzOQcpkNWmL2L1DPIaMalf5Mtusm+US/cyDzjFpdxoZ+gN703Y6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976c13d3-4100-4934-f68f-08df214f0ad8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 13:05:48.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yKQsmF6TSfucMOfrzPwjfI3rQOcq++8uMoM3QFOfScKv0SOqjfY6IbXTPb51A2v7FuxlmdS7DD3AY6JBulbEi2OdUZ4VH/E/RyqEF+uHCW+qrkOoN97A5lsP9WJ+Bva
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11970

On Fri, Oct 02, 2026 at 10:36:32AM +0100, Sudeep Holla wrote:
>Use the standard "pinctrl" SCMI device name instead of the i.MX-specific
>"pinctrl-imx" name. Standard devices no longer have exclusive request
>tracking, so the i.MX and generic pinctrl drivers can register for the
>same protocol/name pair. Their probe checks select the appropriate
>driver for the platform.
>
>This solves the issue that occurs when both "pinmux" and "pinmux-imx"
>devices that share the same fwnode as only the first device registered
>is assigned as the owner of the fwnode. If this owner device fails to
>probe (e.g., its driver is blocklisted or missing), it never reaches
>the driver_bound() stage and the system skips cleaning up its supplier
>links. Even if a alternative device binds successfully, the system
>still looks to the broken original owner. As a result, all dependent
>hardware components (I2C, SPI, UART, USB, MMC, PCIe) defer probing
>forever, halting the boot process.
>
>Note that the solution doesn't support same fwnode being shared by
>multiple devices and associated fw_devlink feature.
>
>Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>Cc: NXP S32 Linux Team <s32@nxp.com>
>Cc: Linus Walleij <linusw@kernel.org>
>Cc: linux-gpio@vger.kernel.org
>Cc: imx@lists.linux.dev
>Reported-by: Peng Fan <peng.fan@oss.nxp.com>
>Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com
>Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
