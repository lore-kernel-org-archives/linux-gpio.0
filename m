Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E22C3D6461;
	Thu,  8 Oct 2026 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443691; cv=fail; b=J+7Qu6ilZ9E+c7gPJn0xBJBs+P0GIDI/ZBUl/0iigCCZXrjMHgMCVgvzBJZsG+yqZobN7IDpHepAD586zVBb9xcyaeBs+kCXJBPxszO7pDqUEjC1F0wU9Sn9XpFOyMbbHQySb02NwmC6Qjk1ezQaWWAp7MEWkq4B7drvWCWFVy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443691; c=relaxed/simple;
	bh=7DPqYVBRARM0e8bj7ctFVhplPLAUTLyAFGQa3Sz4oqA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Doa6F5H23DW5TDQMzWi5r8R4EKOCnM6PEd5R/DuJ0vur8nb+NksHz3xjRzsceyqSz+/NmjSMkVBCjQywxBN6ZCEXylNAYTj6RKPvzg8xDsm/vCj8wzxFKahcOsCSgp3MNunEAfnvd221N6Y9O1M0SzX+wjY+6lnq31RaHHGgnrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ro433VLi; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ro433VLi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfBaQp2oJ2FbwJwJVTxMgT+cSuGl6AeOk/XHHSsm9CDHgRiznHJHFJOtCY6EoUEjvGHB86ntZMx3Hw7OaXgtUWj0yVYyhtTpks5UVs1drtSRcEy4z6Rhn55mmriMU1doT70nTlAWXK8+sKi8xkTbnGLsowCuThizE7BAYUN4qKNgg6EAL4YqnxUL2S8PLVubhtfHGuK6p/a+/WtGLrCwSaEk6c+EwMnwu2De6926JXQTHlgqfceUG7gKVeyA2KNkYbvCh93AlZXEzzVbcnc/5ps/EqSOXcSK7ONc3mg80zhHugZrY424bylMOF5kbBYFo96FIeH5IDWk3gc+MQqj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQz4fTZSUFuATm1MhBg31pXVCrI1xs1LEjFxiYkqy2E=;
 b=cgoafXWeFAdwx8XxGXST6pKA/WXTbslghZcEw7N40UFjQ5Nxtb+Z8uFe6UltwvJnZ7XUpURyh92A1m0VAB9FnnXWmZ2tl/KdASR+clr1EO2SZT0JpxNoBKOFPRBAqF8XPcK+zgdOUF7MzfT/KRX5cpgnsOvlO5UCJXgDq+6pWT6jcxvq16g+C+9+MgKfrNF54GJnC84IdBJlaGQ9BrIvddY5pR0v5POSJaPxf4USKnynTp01btnLpDVJuyBpVLIc/JVG2otXKw5E+OLZNX5hvyN0Mt6x8aVE/fHFvdKHkvv5gQYnG1VBcWozr5zspiewJD9hPPFbhpTOEYGsnqJLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQz4fTZSUFuATm1MhBg31pXVCrI1xs1LEjFxiYkqy2E=;
 b=ro433VLilnCqsEF7hR8GfqMtbCIGIQcPJ1+bzq/rh/xO+KE75cZ4xqs8jzGPdUDfdF9TMiTEmU94M0QUTK3jU3ThnGDfGw0+mtPH+snl75wis3b5DbO0uJnEC9t3GfhHPuRhzyJptVweS9/f1KTw5BMEjANWcgDkNdNLIWeUociliA6KSr/DM4/suzBkLJTeTXuAuFmT4mlZo5wTPsgXZPfFTk6TTVgY51deBLhbxOtwuFJSfbps7C64sE0qtsIYGLyzggjHwuZ9VcCZALFUC75bWcYBlV2jk5st6QstkZ+LBr6gOLZ1sbJxxtRG7sKfWQrclALFH/BrLUrSgrLQzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAWPR04MB10054.eurprd04.prod.outlook.com (2603:10a6:102:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 07:14:38 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 07:14:38 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 0/3] pinctrl: s32cc: add GPIO external interrupt (EIRQ) support
Date: Thu,  8 Oct 2026 09:14:33 +0200
Message-Id: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAWPR04MB10054:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7b60dd-2df1-4f5a-c3cf-08df250bd02c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|18002099003|11063799006|56012099006|10067099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info:
 vDfccr29KvWk60BFWZbbQu4UCJ/WffS9JayzxBr4xQ3I2PyLXl77S8UPJ2zxr3/CVQwgvie/wPEj8P6IbpODKL+EoFjC+cRnJCCVIp0r6A8Np5FoMwXu3kN13wKAvgjJNj++0Wwtzs5Wp//Sifl37YTMslLntBZa7HrXl/ACJdpwxKNW6yTuG4T4C/9DZKwYVQeIgX5+Gradh2PtTZu9zZihptqFWpvmQ9agWnffzrvgYgV46dqlfDvQ21+uTDG0UUZXw0jeAewVZaL0EZw6p013NQcs0nsS6NZm9GY/nt1w9kpBHqnbHZSX4E9OVY4yU0IfGy3BCfTCT/FH3MdC/rjW+OztUQmZH1eBctu8PNCtJYXrT6clWsbmBTsa7w3PMqpOGyjqskYSCIbmNgOdVV2JGTiGOINIhFPMrzIZM2IHGMiRlrldc5ot8e18i4qj0DVnt2YqOi7Oo2yYB/qQOyw1MYXcwuWWqYllAzphEIk94glUSNEtLasHta7r7jTGq/42bIJ++FBWDNe0RMMTqy+OI4bsMcNXeCHUrDVIEQMg7U/l3TVFZJwo6K4BXwzO5w9dMob+1pj0RCEmCEz0BPkkb5KCahv3VSTcIK+tkDnjzxUttizkdlXMWt4Tvj5HKtmSDhI+zoEn01H01tENz/P6EdP6uqgxQH6U+jiZs7k/WGQ18pchP6cBbLjidLUG7jQSX11WkM0+EQcqNhnWEA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OGhnMHZpYWdsNDE2SEI5Q1FCLzVlajJxT2EreTZqNnBwMjNIZUN1aDZ4alp5?=
 =?utf-8?B?WjNwazZHSzQyQktGL2pyc0JRS0xmd2p1UlZOZnNZdHY0SEVaOFRIRnBwdGRH?=
 =?utf-8?B?SGFYMTZFbEtHLytxN2JKQXdDdXBuemhFck5Ga1JWTXV6QXNUUHd0dG9ZVGxU?=
 =?utf-8?B?dVR3R1RWZlJQSXZXYUs2K0FiMkZhdjBJNUxSYWxWbWwvNmN2b0hISklwMXJB?=
 =?utf-8?B?T2R4RGlqUHI2MW83V2lteCsrTGppZVNWZ2RpNGhUV3NUeHJFaVBOV1lVbmk2?=
 =?utf-8?B?UmVDanZON0pqa2FoazRTL1FVSTIyODY3M05JV083UXR2TDlHaGNBOGtCYisy?=
 =?utf-8?B?M3c4QkpaVW9GUk5xcDVjeGwwYmpGcDBTVFowVWFxUnBjUmVwM0hlZHVZZVYz?=
 =?utf-8?B?ekQ3dSt0SW5ZcGFWdWZTWXBOWEtydVpVSURJSmZ5SkR6TVJZUE1aeDlERHBQ?=
 =?utf-8?B?UVFhSHF5dlAwd1hzeTNQenovZFhxVDM3azFjM1IyYkZkRWhzZ0I4ODQ3cXBW?=
 =?utf-8?B?L3NTRVJZdTl3ZDBRN213V0JFM2lUNkdMZHBTK0pleS82cXR3YkJhdVNmdFNN?=
 =?utf-8?B?RmZsQkt6di9WT1J6SE43VGVZd2h4TThsUnl5b3Y4Q1ErQWxNK2s2R2N3L2tO?=
 =?utf-8?B?UzV6SFAwU0g2eW01TWlVLy9LdVpsUVJtOVpzbitvWUZqakw3Y0l5N1FqRVB4?=
 =?utf-8?B?ZEc0K1g5cndDa3ExUVpmMzQwc0lBRmE3UStzWVE5RlQ4S0drakw4YjBSMWd1?=
 =?utf-8?B?MjZGdjNQb1huRzlwRk82cjRuN1VlUG1KdkM5bG1ZRWlLT1VqWktqMHJJTnV0?=
 =?utf-8?B?UFNDZER0WCtjWC9QK2JmL2ZQYW9FY2hISzI5YlBIQS9TZ0NJUWVIQzlaLzhJ?=
 =?utf-8?B?NHIvblJ1eFdYK25aTVc0V3dPN0lSaE9NRHY1OEZ1TGg3SWlybjhhNXNFbG42?=
 =?utf-8?B?QTlOUVJqVzJnT2syN01lTFllUW5CSFRQVFlDalZIamd3cHh0eWtHeWMyTm9W?=
 =?utf-8?B?T2c5bXduTGZmT3hGWnYrakVoMjUvQjRrZ0hmU2Y3NDVOL0V5QWVYYmc1c2xT?=
 =?utf-8?B?QkVGYnZkZXA0WWkwdkhxSk8vS3lGUng4b0VzbmdSa2dhZDNtdmxsR2dlNHpV?=
 =?utf-8?B?L3Q1YVo4T3JVMXdjUGdwYXpEWDBzWlVWQjZuNDdQaFp4clpJSS8zS09sRE9V?=
 =?utf-8?B?bGdaeGJrVlRXbTNNTVlYSXhoYnZXZysraFhnK2VUb0phUGxNZVI4cnJMUUVi?=
 =?utf-8?B?NXVFQUJjdUhCblR2d3ptRDVpTnJqaVRtbSs3MHJqSnNaSU1hOTM3QXRZd0pN?=
 =?utf-8?B?dm5GNGN3TzdjLy9JdTBuT2Q1VTJraEpwZE5pT2IzNXdYVStUeld1eFA3MW9U?=
 =?utf-8?B?OHhWeWxxR0lOalc5MGhGbFZPbGJLZnpNQmZTWUwxZnJPdGpFb21iRXVybExu?=
 =?utf-8?B?Y3hLeU84UFpHMTN0NlZOZXZXV2w4RVpNVXBRKzJ1SWkxUFRUVXRWQkxQdEFy?=
 =?utf-8?B?eDgrTytmQWhCTzZ3WFpxMDV1dkExRXVwRldDbVdYYnZ0amlHbGVaRTBESHh3?=
 =?utf-8?B?R0dzNVNJQ3hkQWpUL0l1a3BkV21OMDlicVBsL1BXT3Q3YkpKWGpEK1dIY0dZ?=
 =?utf-8?B?TkZ6cDduWENRZzJaQ3JkU0JFS3M3WHVHd2doNFpNdHg4RzlnU0kyeElVRUEz?=
 =?utf-8?B?OSs1T2pNK0dwK3ZUbldCM2hCNWRDV3l0cmdmelRRUG91SjZMY0YxSlBRRlhu?=
 =?utf-8?B?VWY4WW9ERFVXUVB2anRYVXVSdkJnTGNOOGJSbnROQXZHdTFiWG8yRTRrYXVT?=
 =?utf-8?B?SkZzbVNtMkwrblV1QWtGR1RBUkVtdXVkMFhqbnI0RS8yR3lpZ3BUdW45V3ZI?=
 =?utf-8?B?WHppb05FV1hlUXVVRHVRKzRpQ2M0Z28vZ05uOGhMQ2psZ1RKQmQzaDhSaFhx?=
 =?utf-8?B?RCtSVzNhMDlxTGpoNFFGN0lFYnBLR1oyYlNlMDNFdjJjL1h6WU9LWGJHWnNJ?=
 =?utf-8?B?WXoyOHRtcVBiQVRNcFFhSmRJTGN4bXB5eStDQkdxcUNpR3FOeDVkbGxxWlU0?=
 =?utf-8?B?YWxDRUpCdURXZTRDVEQ3L1JDRVdHYzVJOTMvRXZSZHlJc0RhTGMyK0xmOGVk?=
 =?utf-8?B?RHoxQjlKNU9hVUFkRXMrdTY2VTM1eEpUTlFjMVBSN2hscVZ6Y1d1a1dVRDh2?=
 =?utf-8?B?WlNKN2ZKaElDV0Q0cElUaUU0cTRLMzF0SmlHejRKVnMwNTVtNCswY0xSaGZW?=
 =?utf-8?B?NlBvakxTQTBqdVJKU3BVTElGeE1NNEt2Smp5WWxhSEhNandGZElGZXFpY1JR?=
 =?utf-8?B?Y3RIa0d1Rk9Rdi9vNENvaGQzN0FoMzZJVllFK1pNUm81Y2dDMHNveSt4ZG91?=
 =?utf-8?Q?gvKmf2vE38EefchhA0IimB0BW/CxbnZDv5Xpd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7b60dd-2df1-4f5a-c3cf-08df250bd02c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:14:37.9760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrMDkFET+16fzT7auL5oEwWWNORZ0dTBsuY77gLOifDLK6mafxFiAnUx2nqTJYXDpl4RhFjHfPTamMKQVsDdsOvyY1isYOA7tVhuddi6GSQP3u5ckYtm8du9EOz/acRK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10054

This patch series adds support for using SIUL2 GPIOs as external
interrupts (EIRQ) via the pin controller's IRQ domain.

A GPIO wired to an EIRQ line can be used as an edge-triggered interrupt
source. All EIRQ lines share a single parent interrupt, which is
demultiplexed to the owning GPIO in a chained handler.

Each EIRQ line is selected by one pad through the IMCR input-mux SSS
field. Since several pads share the same SSS field, only one pad can
drive a given EIRQ line at a time, so the driver enforces one owner per
EIRQ line.

This series builds on top of the SIUL2 GPIO support
and has two dependencies:

- GPIO commit 94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality")
which is pending a rebase to be applied on the GPIO tree, as referenced
in the following commit 04b3818c3bbc
("Revert "pinctrl: s32cc: implement GPIO functionality"") [1]

- align reg_mask_xlate callback with commit 6c53312b7e2d
("gpio: regmap: Add gpio_regmap_operation to extend reg_mask_xlate callback")

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=04b3818c3bbc3f68b6e856f87dca752af2cc34ee

Khristine Andreea Barbulescu (3):
  dt-bindings: pinctrl: s32g2-siul2: describe EIRQ input mux registers
  pinctrl: s32cc: add GPIO external interrupt (EIRQ) support
  arm64: dts: s32g: map SIUL2 EIRQ register window in pinctrl node

 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |   9 +-
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |   2 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |   2 +
 drivers/pinctrl/nxp/pinctrl-s32.h             |  32 ++
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 406 ++++++++++++++++++
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  72 ++++
 6 files changed, 521 insertions(+), 2 deletions(-)

-- 
2.34.1

