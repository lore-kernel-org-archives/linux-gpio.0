Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7753DD532;
	Thu,  8 Oct 2026 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443699; cv=fail; b=iZMFCATTz3IebYGC2QvWF47vjhTfRTMtSIVcohg/omBpD6kZlVM1N/Oy4Xclw6aMu08GbDUTMRlE/uZ6Zwn9dj+1yFOiuE2+IJwZD46gIZ4Rp5/8MRYbkhMaS8jR3KGg9/7RL+cvjOqWSXfBw2a8q80sj7JaxmIS3pseMf5bhss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443699; c=relaxed/simple;
	bh=Z3qFVW7ncUI7oedYcC5DQhwDPi0E5+DMJf7bZUWUb/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eIVGHHfMyKpkN5gB9OU67FPi1kTaJo4UcjYXzsqOZGCod/74N3oQYIltOwk2i+bSptLPC+vZO94wmIA4BUkC9uKpiY4D0xgNWA6wjDNrhGoJjpDnUujRtwQmTbYN1Sz2V1rGL8IjBDcQpRHJgJ4oaT1doHP1zw78uA5MNt96xC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fK/Hkl05; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fK/Hkl05"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miUjtwv4KLXUg5hl7LmiuOb7+QRTXW7fWULST5EEAvmKwNMx8oo87fFXUwEEYpjb7FFNfppmWVBydcF4pLqJYvXOuE36tFynVBiGSa7DfWE8izI2hicbHrb9MSvqP+qx6g9gNKuz7o2MCSU9q0AoZcF4Bx/JHm8mxm065zWGK6Nr1kUfF+zYCVJEp/ly/AtilThaPGEhqjpC6sjB7B7uVWT77o0uSYxutSNC1WQexwf5GNk5gK4hkFWXyXKt2N/QeEeCNENxX5GAtfPuTs3HG2m/C+OWxrpnlOzQrEEq/JM0H0KI9iLuS1T2lYKRlyo3oL5z22R0wj0AuA3GG0co5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnenZCkIO7dsVPRKfZDfUJwE55rn1EFWg8VJPtF1RGE=;
 b=JvHBuQYWhuTMVGnnvDj9PRZtQYMgCtebMhZmqqG55iKVQVQsquIe+0VjNvYOwHU4/XZ9Tdxuj1Ae2Y2LGTs747UKDQGQdz4zMhlGbnVJJjBiOisgjt13tCvzxNXkXHTIXRxMT/IXUOCys/drl2JjJX37pU4oweAJSTXwHHqsHOtEkJ3uGHs9sRP5SNJzNDwjESDd1p/0x6Xp/JaS3UC+8/I6nq0GPWNA+qIT+Pt+GzyGnKmTE9PkKa2z3tgekdozBo5tr3zhZ8zOMNoVCjW+hxu3fZu2KI66WjJ/qb3N5Sp4gBUcIyDIDKtTuPJNfZgEwBSpvVIQPtcB3RHmsYIMzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnenZCkIO7dsVPRKfZDfUJwE55rn1EFWg8VJPtF1RGE=;
 b=fK/Hkl058xkCduD8lcJt79ATcItH6FyT7KVN46Efkocz7i09620C0jVGlPrAUqxndCC+3RjhbBJdSLEQMUiBlsLxzvqN9UlqneU6ZH6AYx9m4IW9j6CaPD873OTn8HA+PnPP8nndB0oZ0d5wEep1OqMHfcoz/JsKRXxPjESld9wnJQ2v2XocDdwlbfWQdrle0RkBctKTB2gkDmuTj6TAO/C3QBZUHRyy/Z3Zh9hrtkCgJrAkE66P7+Cks5PXnQGZa5yf7YdxbEL1Pl/DFKv7pln0n2tS/YF9Z0Vl2ftEUzzcwYqQxYYuljgHTMGMsddDsfDQNMQg2vSQrlQ1rfpNdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAWPR04MB10054.eurprd04.prod.outlook.com (2603:10a6:102:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 07:14:41 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 07:14:41 +0000
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
Subject: [PATCH 2/3] pinctrl: s32cc: add GPIO external interrupt (EIRQ) support
Date: Thu,  8 Oct 2026 09:14:35 +0200
Message-Id: <20261008071436.596651-3-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: c0359469-0b9b-48e4-e58b-08df250bd235
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|22082099003|18002099003|11063799006|5023799004|56012099006|10067099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info:
 U7NnhF20wY0yXVMNGECw9rOGphlZ9eqQIAY+Opubs7l4fLYziuOJD+5k8OjpdWge8TD/hsNRPabPaIXrrxD36IJzHrVRgErbYw7tjip6mXh5whhzBnMPafvEA/bIS2AVbla7Ok+Zlw2ApTgmNMLgEKMO8Z2xqOWA4nWfRaxh92YOACESooWOQhEovYVLKEUQnPD1gF2VpkQqg9+5qH+f30RUuxc5H7RPnUZSzGT61Qx+QEEbzFIKw8EN2WiTl/czwb96ZO1hhzhTuWX/83e0y0LJxla/5+h6Hq/enraO9TccEBQqKhzRbtWSix1TFgf52BgzApOR2lOYPT2Ku3oNJQ1mXGW/mbt3e2pAOT3fbbjHr6QQYZ37PK4pig7otUzyHK5BlW0EC3Slz2aHpiIv/NB1KMUAwF02j2ldIy2JC/VAcxweFxbBs3Z1VUdlWo+SE3czz9Oe5UwuzRY6/pt1s2HN86QG1rxs71Xi9+WX7mz0Tge4bJAfntAmIBqASc0Szc+wbAI6dNRjMsvPeoW/1OWKVqv2GWXY1UDla9KsHhRUk+D+PvanfWLAerTXxN/Nt8b7B1P21xX3BU6CGbAAaYB23Ozjf6Se6mh0tw+Rtof64kmBIzNTMdFBYqKuXlQwA5dbGaKpsIyWmO5ME2R29/NE4rzw9S+tGDgh3A9iuXk54ZbHL5tvmUSxbBYVGPTpoo6ZHiIrbBhBcYl5m+BHsw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(10067099003)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NVVQU2JGMExvbUM2Vno3VEtTdm9CYi94OWFmYkh2V0dqVnhMVkJNeVl1czl2?=
 =?utf-8?B?bnh5RXJnTkduTzJUUTJFT2pCZXFXL2l2ZEZzNTd0Zy84WnBSc3Ezb2diVGI3?=
 =?utf-8?B?QkN0aTQweTV0ZEh6NUszWmZ3REpzTGZvY21oeTJDSWZ4bHR4UEl4MnJ3NTBn?=
 =?utf-8?B?L2ZCeklLWDdCQXRHcDhPYXE4U0JuelJsQUoyaDJLNCtBS0lWa01mc0wrZVpr?=
 =?utf-8?B?Nms0bUdsdy9CcmNJYkVmekxlMHFiUlFRcDVQSGtVN093Y0tMaitpQ214aUxk?=
 =?utf-8?B?V1ZVWitPL1FFM0VhNDhYazNBS3BVajVSenhhOGF2WHA4Z2YxTWVhSVdiazh0?=
 =?utf-8?B?NEFTWnBoU1lDL3lEak9IeGJqL3BCS0VCaTJCaG5KK2U2enR3OVRsRHhZMUV1?=
 =?utf-8?B?UlEzYWtGN2RaZTZmQWZjWGJOczJLS2hqeGFtUHh0cEpibEtxL0lFVWpPb2E0?=
 =?utf-8?B?WHVLT3I3Q2pGMG1odWJ5UU13NHdZYVNSWEFGbW9xd0U1bWpKSTY5dlFIRThw?=
 =?utf-8?B?QTVjbGJUVWYrczNVcEx6QzUyWFoxKzN0SXZid3ZuM1UxVUFWZTlwSGVkekV6?=
 =?utf-8?B?b0JhVkxKUmpvRUsvSHZWTGUxdFlCdDhDNHErM2czakRuZG05UFZyT2NZem14?=
 =?utf-8?B?Rzl4SmZ5OU5vUnpiakhGYjZhMWxtSXkrd3pTTHAwR25OMnNnUEFsRGdWVk1N?=
 =?utf-8?B?WTl3MlhSUHdzTjVzQXhoQktHVld0MzBvakhndzE4NVFUS2ZOSXNmZHhib050?=
 =?utf-8?B?RXBiTlpHL1dMOUNIQURNYjBscDJSK1Bab0ZoQ1AzNk4xdzFWVDJoM29rRDdx?=
 =?utf-8?B?cjZPZWg2d282bHEwVXA2aTlkRmlHV3NKVSt3OWdja3RrS29mRUwyeVhwS2lo?=
 =?utf-8?B?Rmk1dE13Z293SmpEMEtNQVlpQ3pJYkdQMUdyYUNCbkRoTjdhSUNDd1VWSTYx?=
 =?utf-8?B?Q3RkcytFV0YvVFdpcDhBQWptNVVoMElRbnY4cVo3a1BVS2Frb0VJZUFlZTk4?=
 =?utf-8?B?ZVcwT0hUbWxTSFl5VFBFSlhJNG9QdHZaR2src2xrRktPYjBpUVhJd0ppM0Rr?=
 =?utf-8?B?WmZnekM1eTRxaW4yUWNEUlNYWHM0dXJTUE5FL3VCRTNvZWlWa056K3NWTHF1?=
 =?utf-8?B?Mmc2bGRKcVQ5bmgwKzREblhFSDVMcklaQmYwLzZka01XUUZzYmptNkZSYUtJ?=
 =?utf-8?B?LzBuamMwUE51cWpxYmp1MW1XL244MjNEMExoZE81ZkNhWUdIL294eEpkeHIz?=
 =?utf-8?B?ZjJLS0NqdFgzaFNxZ1NLc1d0SlBBUWRUSlRnT3ZvWWpWbytPcm1nckY1SjZx?=
 =?utf-8?B?a01kVFVEKzhad0E2OWhiaHpXSjNTT3g1c2VpZDAvVnlzc0xZY0RJbXJ1R0ZR?=
 =?utf-8?B?b2NidWtlSW5xdGdKYWtXell6c0l1eTZrYkRlNGZ0c3RXTWh6OExZR2lEZEhO?=
 =?utf-8?B?YU9GQVlHZ3VBcDVKM1Y5TGVhZFV2TGR3RVBwaFFPTmg1eU5HZDNydkRTWWFS?=
 =?utf-8?B?S2RrRlVOdnhiODZIM29OTnFPa0ZDYmROQ21VNG9TY2V0QmZDKzlxUFJOdVVm?=
 =?utf-8?B?dHluUzNVZzBwMG5aR1FhelJ4TnNGOEo0V0kyK3VLLzZlSUl5a1RJNTErTjBJ?=
 =?utf-8?B?Q0xpYktGdklwOGNydEZIRFkxM3MxdG1NU1pwZGZRbWRIRnBEdU85cFBzZi9z?=
 =?utf-8?B?bmsxTUI3S0hOTW5JcW1IR2RsS2k2RDlqdi9EQStBeGsyaC8weERFdjNLc1JW?=
 =?utf-8?B?OXlhQ2hQaDcxdkZSbElPYjZ5SUpyWi9PdHRZMmk0OU50VWQ0dWx5QUIwRUVo?=
 =?utf-8?B?WndGRjFSZDh6dVQ2TVBSTjBvUGhvU1JJU0J6RFN6UUhqbHh5ZUdyN1FpbGsy?=
 =?utf-8?B?dHZEU1ZvVDFRMGQ1L1Rld1Q4aXVMYnlwWlpkVmgxK3hyNHpPdVl6L3ZoSG5u?=
 =?utf-8?B?ZnpTMVJzVlhldTBPOVE5U2pVNEEzTjRaTDVCajZrcTR1d3RaclYwSTFoSHBS?=
 =?utf-8?B?b0RaN2RIWEo0NFEwWC9GT2dUV1dZdGFZSldwTkhwd084TjN2ZmdsMGNYamJK?=
 =?utf-8?B?ZnVzc1RWMHcrNDJxVDZMU2I3eWNZemFmY3ZyQVJtM25yd3M3OGZvN0p4NDFD?=
 =?utf-8?B?ZmNFT0JvUkFEaDNRWnhHWmlrRXkwbEFaUFhlSFNWRExKSDNWRkp4bTR2TXN3?=
 =?utf-8?B?cU1BWTMrSW1UUk5nOUQwdVNhZmt3djYvWk9HUVlEbDZOeDlQR0FpNDJ3aUVy?=
 =?utf-8?B?ZVZ6ZnJVVy83cXFTdXlSU2l0Y2Q2MjBFR1JLeFhnK0d6V2ZIZ2dwLzlHMEt2?=
 =?utf-8?B?VkJVMERwZ3h5VEVFQ29VZVZNYVdPZ3dGb010bXU2UkIrdjUwNFBGWXMwK2lI?=
 =?utf-8?Q?FBqmSAvXK3PvZKeVV6B+L/oRDF0mo77px8uib?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0359469-0b9b-48e4-e58b-08df250bd235
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:14:41.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZcqEBZlOOI/tkCK1zTg1sbZ9N9EMxxO0QYD7uw/5x3fG8SAwL7wUazFPkrNAAMDbvhXUDUKN2aXVdAj8xqVctrhn0xDtJvDfH3F43/gFfXbV8rz/zww0b3Bh/jgps7e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10054

Add SIUL2 external interrupt support to the S32CC pinctrl driver so
that EIRQ-capable GPIO lines can be used as EIRQs.

The driver maps the SIUL2 EIRQ register window (DISR0/DIRER0/
IREER0/IFEER0), creates a linear IRQ domain over the GPIO line space,
and registers a chained handler on the parent GIC interrupt. An
irqchip implements mask/unmask (DIRER0), ack (write-1-to-clear DISR0)
and set_type (rising/falling/both via IREER0/IFEER0).

Because the EIRQ lines are not hard-wired to fixed pads, each line has
its own input multiplexer (IMCR). Routing is described by a per-SoC
pad-to-EIRQ table (gpio, eirq, imcr_pin, sss). The pad is routed into
the EIRQ input mux once at irq request time (and disconnected at
release); mask/unmask only toggle the line enable (DIRER0) and clear
pending status (DISR0). Routing the IMCR SSS field just once keeps the
edge-detector input stable across mask/unmask cycles; reconnecting it
on every unmask would re-drive a level transition into the detector and
latch a spurious extra event.

The S32G data adds the EIRQ0..EIRQ31 routing table, exposes the EIRQ
input-mux IMCR pins (pin IDs 910..941 / IMCR398..IMCR429) as a pin
range so SSS writes can be resolved, and wires up eirq_data.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32.h   |  32 +++
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 406 ++++++++++++++++++++++++++++
 drivers/pinctrl/nxp/pinctrl-s32g2.c |  72 +++++
 3 files changed, 510 insertions(+)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinctrl-s32.h
index 028578a090e4..2a1ef719c7da 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32.h
+++ b/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -61,6 +61,37 @@ struct s32_gpio_pad_map {
 	unsigned int pad;
 };
 
+/**
+ * struct s32_eirq_line - one pad-to-EIRQ routing option
+ * @gpio: GPIO line offset that can drive this EIRQ line
+ * @eirq: EIRQ hardware line index (bit position in the DISR0/DIRER0/
+ *        IREER0/IFEER0 registers)
+ * @imcr_pin: pinctrl pin id of the EIRQ IMCR that
+ *            routes the pad signal into the SIUL2 edge detector
+ * @sss: Source Signal Select value to program into @imcr_pin so that the
+ *       pad backing @gpio is connected to the EIRQ input
+ *
+ */
+struct s32_eirq_line {
+	unsigned int gpio;
+	unsigned int eirq;
+	unsigned int imcr_pin;
+	unsigned int sss;
+};
+
+/**
+ * struct s32_eirq_data - EIRQ capability description
+ * @num_eirqs: number of EIRQ hardware lines exposed by the SoC (the number
+ *             of usable bits in the DISR0/DIRER0/IREER0/IFEER0 registers)
+ * @num_lines: number of pad-to-EIRQ routing entries in @lines
+ * @lines: array describing every pad that can be routed to an EIRQ line
+ */
+struct s32_eirq_data {
+	unsigned int num_eirqs;
+	unsigned int num_lines;
+	const struct s32_eirq_line *lines;
+};
+
 struct s32_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
@@ -70,6 +101,7 @@ struct s32_pinctrl_soc_data {
 	unsigned int num_gpio_ranges;
 	const struct s32_gpio_pad_map *gpio_pad_maps;
 	unsigned int num_gpio_pad_maps;
+	const struct s32_eirq_data *eirq_data;
 };
 
 struct s32_pinctrl_soc_info {
diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 0025add68495..ecdc2a8e3fa6 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -8,11 +8,15 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/bsearch.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/regmap.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -40,6 +44,16 @@
 #define S32_MSCR_ODE		BIT(20)
 #define S32_MSCR_OBE		BIT(21)
 
+/*
+ * SIUL2 External Interrupt (EIRQ) register offsets, relative to the
+ * EIRQ memory region (DISR0). Only the DMA/Interrupt registers needed
+ * for managing GPIO interrupts are described here.
+ */
+#define S32_EIRQ_DISR0		0x00
+#define S32_EIRQ_DIRER0		0x08
+#define S32_EIRQ_IREER0		0x18
+#define S32_EIRQ_IFEER0		0x20
+
 #define S32_GPIO_OP_SHIFT	16
 #define S32_GPIO_OP_MASK	GENMASK(19, 16)
 
@@ -153,6 +167,14 @@ struct s32_pinctrl_context {
  * @gpio_names: GPIO line names array passed to gpio-regmap
  * @gpio_configs: saved configurations for GPIO pins
  * @gpio_configs_lock: lock for the `gpio_configs` list
+ * @eirq_map: regmap for the SIUL2 EIRQ register window
+ * @eirq_irq: parent (GIC) interrupt feeding all EIRQ lines
+ * @eirq_domain: IRQ domain exposed to GPIO consumers for EIRQ-capable pins
+ * @eirq_lock: protects RMW accesses to the shared EIRQ registers
+ * @eirq_owner: GPIO line currently routed to each EIRQ hardware line, or -1
+ *              when the line is free. Only one pad can drive a given EIRQ
+ *              line at a time because they share the same IMCR SSS field.
+ * @eirq_present: true once the EIRQ hardware has been probed successfully
  * @saved_context: configuration saved over system sleep
  */
 struct s32_pinctrl {
@@ -168,6 +190,12 @@ struct s32_pinctrl {
 	const char *const *gpio_names;
 	struct list_head gpio_configs;
 	spinlock_t gpio_configs_lock;
+	struct regmap *eirq_map;
+	int eirq_irq;
+	struct irq_domain *eirq_domain;
+	raw_spinlock_t eirq_lock;
+	int *eirq_owner;
+	bool eirq_present;
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context saved_context;
 #endif
@@ -1450,6 +1478,373 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 	return 0;
 }
 
+static int s32_eirq_line_cmp(const void *key, const void *elem)
+{
+	const struct s32_eirq_line *line = elem;
+	unsigned int gpio = *(const unsigned int *)key;
+
+	if (gpio < line->gpio)
+		return -1;
+	if (gpio > line->gpio)
+		return 1;
+	return 0;
+}
+
+/*
+ * Find the pad-to-EIRQ routing entry for a given GPIO line offset.
+ */
+static const struct s32_eirq_line *
+s32_eirq_find(struct s32_pinctrl *ipctl, irq_hw_number_t hwirq)
+{
+	const struct s32_eirq_data *data = ipctl->info->soc_data->eirq_data;
+	unsigned int gpio = hwirq;
+
+	if (!ipctl->eirq_present || !data)
+		return NULL;
+
+	return bsearch(&gpio, data->lines, data->num_lines,
+		       sizeof(*data->lines), s32_eirq_line_cmp);
+}
+
+/*
+ * Route or disconnect the pad backing an EIRQ line by
+ * programming the SSS field of the EIRQ IMCR.
+ * Writing the route value selects the pad as the EIRQ source; writing 0
+ * disconnects it. The IMCR lives in the normal MSCR/IMCR register space,
+ * so use the pinctrl regmap helper rather than the EIRQ window.
+ */
+static int s32_eirq_set_route(struct s32_pinctrl *ipctl,
+			      const struct s32_eirq_line *line, bool connect)
+{
+	int ret;
+
+	ret = s32_regmap_update(ipctl->pctl, line->imcr_pin, S32_MSCR_SSS_MASK,
+				connect ? line->sss : 0);
+	if (ret)
+		dev_err(ipctl->dev,
+			"Failed to %s EIRQ%u input mux (IMCR pin %u): %d\n",
+			connect ? "route" : "unroute", line->eirq,
+			line->imcr_pin, ret);
+
+	return ret;
+}
+
+/*
+ * Claim the shared EIRQ line for this GPIO and connect its pad to the edge
+ * detector. Called once from the IRQ core when the interrupt is requested
+ * (free_irq() runs the release counterpart), NOT on every mask/unmask.
+ *
+ * Routing must happen here rather than in unmask() because unmask() runs on
+ * every delivered edge (handle_edge_irq does mask -> ack -> handler ->
+ * unmask). Reconnecting the IMCR input while the pad is still asserted drives
+ * a fresh level transition into the edge detector, which latches a spurious
+ * second event in DISR0 and delivers a phantom interrupt. Programming the
+ * route just once keeps the input stable across mask/unmask cycles.
+ */
+static int s32_gpio_irq_request_resources(struct irq_data *d)
+{
+	struct s32_pinctrl *ipctl = irq_data_get_irq_chip_data(d);
+	const struct s32_eirq_line *line = s32_eirq_find(ipctl, irqd_to_hwirq(d));
+	int owner, ret;
+
+	if (!line)
+		return -EINVAL;
+
+	/*
+	 * Several pads can be muxed to the same EIRQ hardware line, but they
+	 * all share a single IMCR SSS field, so only one pad can drive a given
+	 * EIRQ line at a time. Routing a second pad would silently overwrite
+	 * the SSS of the first and drop its interrupts, so reject the request
+	 * when the line is already claimed by a different GPIO.
+	 */
+	scoped_guard(raw_spinlock_irqsave, &ipctl->eirq_lock) {
+		owner = ipctl->eirq_owner[line->eirq];
+		if (owner != -1 && owner != line->gpio) {
+			dev_err(ipctl->dev,
+				"EIRQ%u already used by GPIO %d, cannot enable GPIO %u\n",
+				line->eirq, owner, line->gpio);
+			return -EBUSY;
+		}
+		ipctl->eirq_owner[line->eirq] = line->gpio;
+	}
+
+	/* Route the pad into the EIRQ input mux once, up front. */
+	ret = s32_eirq_set_route(ipctl, line, true);
+	if (ret) {
+		scoped_guard(raw_spinlock_irqsave, &ipctl->eirq_lock)
+			if (ipctl->eirq_owner[line->eirq] == line->gpio)
+				ipctl->eirq_owner[line->eirq] = -1;
+	}
+
+	return ret;
+}
+
+/* Disconnect the pad and release the shared EIRQ line (free_irq path). */
+static void s32_gpio_irq_release_resources(struct irq_data *d)
+{
+	struct s32_pinctrl *ipctl = irq_data_get_irq_chip_data(d);
+	const struct s32_eirq_line *line = s32_eirq_find(ipctl, irqd_to_hwirq(d));
+
+	if (!line)
+		return;
+
+	/* Disable the line and disconnect the pad from the EIRQ input mux. */
+	scoped_guard(raw_spinlock_irqsave, &ipctl->eirq_lock)
+		regmap_update_bits(ipctl->eirq_map, S32_EIRQ_DIRER0,
+				   BIT(line->eirq), 0);
+
+	s32_eirq_set_route(ipctl, line, false);
+
+	scoped_guard(raw_spinlock_irqsave, &ipctl->eirq_lock)
+		if (ipctl->eirq_owner[line->eirq] == line->gpio)
+			ipctl->eirq_owner[line->eirq] = -1;
+}
+
+/*
+ * Enable or disable an EIRQ line through DIRER0. The IMCR route stays
+ * connected across mask/unmask (it is programmed once in
+ * request_resources) so that re-enabling the line does not fabricate a
+ * spurious edge. When unmasking, first discard any edge latched while the
+ * line was masked so a stale flag does not deliver an extra interrupt; the
+ * status flags are write-1-to-clear.
+ */
+static void s32_gpio_irq_set_mask(struct irq_data *d, bool mask)
+{
+	struct s32_pinctrl *ipctl = irq_data_get_irq_chip_data(d);
+	const struct s32_eirq_line *line = s32_eirq_find(ipctl, irqd_to_hwirq(d));
+
+	if (!line)
+		return;
+
+	scoped_guard(raw_spinlock_irqsave, &ipctl->eirq_lock) {
+		if (!mask)
+			regmap_write(ipctl->eirq_map, S32_EIRQ_DISR0,
+				     BIT(line->eirq));
+		regmap_update_bits(ipctl->eirq_map, S32_EIRQ_DIRER0,
+				   BIT(line->eirq), mask ? 0 : BIT(line->eirq));
+	}
+}
+
+static void s32_gpio_irq_mask(struct irq_data *d)
+{
+	s32_gpio_irq_set_mask(d, true);
+}
+
+static void s32_gpio_irq_unmask(struct irq_data *d)
+{
+	s32_gpio_irq_set_mask(d, false);
+}
+
+static void s32_gpio_irq_ack(struct irq_data *d)
+{
+	struct s32_pinctrl *ipctl = irq_data_get_irq_chip_data(d);
+	const struct s32_eirq_line *line = s32_eirq_find(ipctl, irqd_to_hwirq(d));
+
+	if (!line)
+		return;
+
+	/* The status flags are write-1-to-clear. */
+	regmap_write(ipctl->eirq_map, S32_EIRQ_DISR0, BIT(line->eirq));
+}
+
+static int s32_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct s32_pinctrl *ipctl = irq_data_get_irq_chip_data(d);
+	const struct s32_eirq_line *line;
+	u32 mask, ireer = 0, ifeer = 0;
+
+	line = s32_eirq_find(ipctl, irqd_to_hwirq(d));
+	if (!line)
+		return -EINVAL;
+
+	mask = BIT(line->eirq);
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		ireer = mask;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		ifeer = mask;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		ireer = mask;
+		ifeer = mask;
+		break;
+	default:
+		/* The EIRQ hardware only supports edge-triggered events. */
+		return -EINVAL;
+	}
+
+	scoped_guard(raw_spinlock_irqsave, &ipctl->eirq_lock) {
+		regmap_update_bits(ipctl->eirq_map, S32_EIRQ_IREER0, mask, ireer);
+		regmap_update_bits(ipctl->eirq_map, S32_EIRQ_IFEER0, mask, ifeer);
+	}
+
+	irq_set_handler_locked(d, handle_edge_irq);
+
+	return 0;
+}
+
+static const struct irq_chip s32_gpio_irq_chip = {
+	.name			= "s32-gpio-eirq",
+	.irq_ack		= s32_gpio_irq_ack,
+	.irq_mask		= s32_gpio_irq_mask,
+	.irq_unmask		= s32_gpio_irq_unmask,
+	.irq_set_type		= s32_gpio_irq_set_type,
+	.irq_request_resources	= s32_gpio_irq_request_resources,
+	.irq_release_resources	= s32_gpio_irq_release_resources,
+	.flags			= IRQCHIP_IMMUTABLE | IRQCHIP_SKIP_SET_WAKE,
+};
+
+
+static void s32_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct s32_pinctrl *ipctl = irq_desc_get_handler_data(desc);
+	const struct s32_eirq_data *data = ipctl->info->soc_data->eirq_data;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long pending;
+	u32 disr, direr;
+	int eirq;
+
+	chained_irq_enter(chip, desc);
+
+	regmap_read(ipctl->eirq_map, S32_EIRQ_DISR0, &disr);
+	regmap_read(ipctl->eirq_map, S32_EIRQ_DIRER0, &direr);
+	pending = disr & direr;
+
+	for_each_set_bit(eirq, &pending, data->num_eirqs) {
+		int gpio;
+
+		/*
+		 * Translate the EIRQ hardware line back to the GPIO line
+		 * offset that is currently routed to it. Several pads may
+		 * map to the same EIRQ line, but only one pad can be routed
+		 * to it at a time (they share a single IMCR SSS field), so
+		 * dispatch solely to the GPIO that currently owns the line.
+		 */
+		scoped_guard(raw_spinlock, &ipctl->eirq_lock)
+			gpio = ipctl->eirq_owner[eirq];
+
+		if (gpio != -1) {
+			generic_handle_domain_irq(ipctl->eirq_domain, gpio);
+		} else {
+			/*
+			 * A pending, enabled EIRQ line with no owner should
+			 * not happen. Clear it to avoid an interrupt storm and
+			 * flag the unexpected condition.
+			 */
+			regmap_write(ipctl->eirq_map, S32_EIRQ_DISR0, BIT(eirq));
+			dev_err_ratelimited(ipctl->dev,
+					    "Spurious EIRQ%d with no owner\n",
+					    eirq);
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int s32_eirq_domain_map(struct irq_domain *d, unsigned int virq,
+			       irq_hw_number_t hwirq)
+{
+	struct s32_pinctrl *ipctl = d->host_data;
+
+	/* Only GPIO lines wired to an EIRQ line can be used as interrupts. */
+	if (!s32_eirq_find(ipctl, hwirq))
+		return -EINVAL;
+
+	irq_set_chip_data(virq, ipctl);
+	irq_set_chip_and_handler(virq, &s32_gpio_irq_chip, handle_edge_irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops s32_eirq_domain_ops = {
+	.map = s32_eirq_domain_map,
+	.xlate = irq_domain_xlate_twocell,
+};
+
+static void s32_eirq_teardown(void *data)
+{
+	struct s32_pinctrl *ipctl = data;
+
+	irq_set_chained_handler_and_data(ipctl->eirq_irq, NULL, NULL);
+	irq_domain_remove(ipctl->eirq_domain);
+}
+
+static int s32_pinctrl_init_eirq(struct platform_device *pdev,
+				 struct s32_pinctrl *ipctl)
+{
+	const struct s32_pinctrl_soc_data *soc = ipctl->info->soc_data;
+	struct regmap_config cfg;
+	unsigned int eirq_idx;
+	void __iomem *base;
+	unsigned int i;
+
+	cfg = (struct regmap_config){
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.name = "eirq",
+		.max_register = S32_EIRQ_IFEER0,
+		.fast_io = true,
+	};
+
+	ipctl->eirq_present = false;
+
+	if (!soc->eirq_data)
+		return 0;
+
+	raw_spin_lock_init(&ipctl->eirq_lock);
+
+	/* Track which GPIO currently owns each EIRQ line (-1 == free). */
+	ipctl->eirq_owner = devm_kcalloc(&pdev->dev, soc->eirq_data->num_eirqs,
+					 sizeof(*ipctl->eirq_owner),
+					 GFP_KERNEL);
+	if (!ipctl->eirq_owner)
+		return -ENOMEM;
+
+	for (i = 0; i < soc->eirq_data->num_eirqs; i++)
+		ipctl->eirq_owner[i] = -1;
+
+	/*
+	 * EIRQ registers are placed after the pinctrl regions and the
+	 * per-range PGPDO/PGPDI GPIO regions.
+	 */
+	eirq_idx = soc->mem_regions + soc->num_gpio_ranges * 2;
+
+	base = devm_platform_ioremap_resource(pdev, eirq_idx);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ipctl->eirq_map = devm_regmap_init_mmio(&pdev->dev, base, &cfg);
+	if (IS_ERR(ipctl->eirq_map))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->eirq_map),
+				     "Failed to init EIRQ regmap\n");
+
+	ipctl->eirq_irq = platform_get_irq(pdev, 0);
+	if (ipctl->eirq_irq < 0)
+		return ipctl->eirq_irq;
+
+	/* Mask all EIRQ lines and clear any pending status before use. */
+	regmap_write(ipctl->eirq_map, S32_EIRQ_DIRER0, 0);
+	regmap_write(ipctl->eirq_map, S32_EIRQ_DISR0, GENMASK(31, 0));
+
+	ipctl->eirq_domain = irq_domain_create_linear(dev_fwnode(&pdev->dev),
+						      ipctl->ngpio,
+						      &s32_eirq_domain_ops,
+						      ipctl);
+	if (!ipctl->eirq_domain)
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "Failed to create EIRQ IRQ domain\n");
+
+	ipctl->eirq_present = true;
+
+	irq_set_chained_handler_and_data(ipctl->eirq_irq,
+					 s32_gpio_irq_handler, ipctl);
+
+	return devm_add_action_or_reset(&pdev->dev, s32_eirq_teardown, ipctl);
+}
+
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data)
 {
@@ -1553,6 +1948,15 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
+	/*
+	 * Set up EIRQ support before registering the GPIO chip so the EIRQ
+	 * IRQ domain can be handed over to gpio-regmap. The IRQ domain is
+	 * sized over the GPIO line space, so ngpio must already be known.
+	 */
+	ret = s32_pinctrl_init_eirq(pdev, ipctl);
+	if (ret)
+		return ret;
+
 	gpio_cfg.parent = &pdev->dev;
 	gpio_cfg.fwnode = dev_fwnode(&pdev->dev);
 	gpio_cfg.label = dev_name(&pdev->dev);
@@ -1565,6 +1969,8 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	gpio_cfg.reg_mask_xlate = s32_gpio_reg_mask_xlate;
 	gpio_cfg.init_valid_mask = s32_init_valid_mask;
 	gpio_cfg.drvdata = ipctl;
+	if (ipctl->eirq_present)
+		gpio_cfg.irq_domain = ipctl->eirq_domain;
 
 	ipctl->gpio_rgm = devm_gpio_regmap_register(&pdev->dev, &gpio_cfg);
 	if (IS_ERR(ipctl->gpio_rgm))
diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
index f9546c67a269..5d08a871220c 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
@@ -770,6 +770,15 @@ static const struct s32_pin_range s32_pin_ranges_siul2[] = {
 	/* IMCR pin ID ranges */
 	S32_PIN_RANGE(512, 595),
 	S32_PIN_RANGE(631, 909),
+	/*
+	 * IMCR398..IMCR429 (pin IDs 910..941) are the SIUL2 external
+	 * interrupt (EIRQ0..EIRQ31) input multiplexers. They sit in a gap
+	 * between the two SIUL2_1 IMCR windows above/below. Without this
+	 * range s32_get_region() cannot resolve the EIRQ IMCR pins, so
+	 * routing a pad to an EIRQ line (SSS write) silently fails and the
+	 * interrupt never fires.
+	 */
+	S32_PIN_RANGE(910, 941),
 	S32_PIN_RANGE(942, 1007),
 };
 
@@ -793,6 +802,68 @@ static const struct s32_gpio_pad_map s32g_gpio_pad_maps[] = {
 	{ 176, 190, 11 }, /* PL_00 .. PL_14 -> PGPD11 */
 };
 
+/*
+ * Pad to EIRQ routing table.
+ *
+ * On S32G2/S32G3 the SIUL2 external interrupt lines (EIRQ0..EIRQ31) are
+ * NOT hard-wired to fixed pads. Each EIRQ line has its own input
+ * multiplexer (an IMCR register, S32G_IMCR_SIUL_EIRQ<n>) whose Source
+ * Signal Select (SSS) field chooses which pad signal feeds the edge
+ * detector. The same EIRQ line can be sourced from more than one pad,
+ * so several entries may share an .eirq value.
+ */
+static const struct s32_eirq_line s32g_eirq_lines[] = {
+	{  19, 0,  S32G_IMCR_SIUL_EIRQ0,  0x2 }, /* PB_03 -> EIRQ0  */
+	{  20, 1,  S32G_IMCR_SIUL_EIRQ1,  0x2 }, /* PB_04 -> EIRQ1  */
+	{  21, 2,  S32G_IMCR_SIUL_EIRQ2,  0x2 }, /* PB_05 -> EIRQ2  */
+	{  22, 3,  S32G_IMCR_SIUL_EIRQ3,  0x2 }, /* PB_06 -> EIRQ3  */
+	{  23, 4,  S32G_IMCR_SIUL_EIRQ4,  0x2 }, /* PB_07 -> EIRQ4  */
+	{  24, 5,  S32G_IMCR_SIUL_EIRQ5,  0x2 }, /* PB_08 -> EIRQ5  */
+	{  25, 6,  S32G_IMCR_SIUL_EIRQ6,  0x2 }, /* PB_09 -> EIRQ6  */
+	{  26, 7,  S32G_IMCR_SIUL_EIRQ7,  0x2 }, /* PB_10 -> EIRQ7  */
+	{  27, 8,  S32G_IMCR_SIUL_EIRQ8,  0x2 }, /* PB_11 -> EIRQ8  */
+	{  28, 9,  S32G_IMCR_SIUL_EIRQ9,  0x2 }, /* PB_12 -> EIRQ9  */
+	{  29, 10, S32G_IMCR_SIUL_EIRQ10, 0x2 }, /* PB_13 -> EIRQ10 */
+	{  31, 12, S32G_IMCR_SIUL_EIRQ12, 0x2 }, /* PB_15 -> EIRQ12 */
+	{  33, 13, S32G_IMCR_SIUL_EIRQ13, 0x2 }, /* PC_01 -> EIRQ13 */
+	{  34, 14, S32G_IMCR_SIUL_EIRQ14, 0x2 }, /* PC_02 -> EIRQ14 */
+	{  35, 15, S32G_IMCR_SIUL_EIRQ15, 0x2 }, /* PC_03 -> EIRQ15 */
+	{  36, 27, S32G_IMCR_SIUL_EIRQ27, 0x2 }, /* PC_04 -> EIRQ27 */
+	{  37, 28, S32G_IMCR_SIUL_EIRQ28, 0x2 }, /* PC_05 -> EIRQ28 */
+	{  38, 29, S32G_IMCR_SIUL_EIRQ29, 0x2 }, /* PC_06 -> EIRQ29 */
+	{  39, 30, S32G_IMCR_SIUL_EIRQ30, 0x2 }, /* PC_07 -> EIRQ30 */
+	{  40, 31, S32G_IMCR_SIUL_EIRQ31, 0x2 }, /* PC_08 -> EIRQ31 */
+	{ 113, 23, S32G_IMCR_SIUL_EIRQ23, 0x2 }, /* PH_01 -> EIRQ23 */
+	{ 114, 24, S32G_IMCR_SIUL_EIRQ24, 0x2 }, /* PH_02 -> EIRQ24 */
+	{ 115, 25, S32G_IMCR_SIUL_EIRQ25, 0x2 }, /* PH_03 -> EIRQ25 */
+	{ 117, 26, S32G_IMCR_SIUL_EIRQ26, 0x2 }, /* PH_05 -> EIRQ26 */
+	{ 151, 0,  S32G_IMCR_SIUL_EIRQ0,  0x3 }, /* PJ_07 -> EIRQ0  */
+	{ 152, 1,  S32G_IMCR_SIUL_EIRQ1,  0x3 }, /* PJ_08 -> EIRQ1  */
+	{ 154, 8,  S32G_IMCR_SIUL_EIRQ8,  0x3 }, /* PJ_10 -> EIRQ8  */
+	{ 160, 9,  S32G_IMCR_SIUL_EIRQ9,  0x3 }, /* PK_00 -> EIRQ9  */
+	{ 165, 10, S32G_IMCR_SIUL_EIRQ10, 0x3 }, /* PK_05 -> EIRQ10 */
+	{ 168, 11, S32G_IMCR_SIUL_EIRQ11, 0x2 }, /* PK_08 -> EIRQ11 */
+	{ 177, 2,  S32G_IMCR_SIUL_EIRQ2,  0x3 }, /* PL_01 -> EIRQ2  */
+	{ 178, 3,  S32G_IMCR_SIUL_EIRQ3,  0x3 }, /* PL_02 -> EIRQ3  */
+	{ 179, 4,  S32G_IMCR_SIUL_EIRQ4,  0x3 }, /* PL_03 -> EIRQ4  */
+	{ 180, 5,  S32G_IMCR_SIUL_EIRQ5,  0x3 }, /* PL_04 -> EIRQ5  */
+	{ 181, 6,  S32G_IMCR_SIUL_EIRQ6,  0x3 }, /* PL_05 -> EIRQ6  */
+	{ 182, 7,  S32G_IMCR_SIUL_EIRQ7,  0x3 }, /* PL_06 -> EIRQ7  */
+	{ 184, 16, S32G_IMCR_SIUL_EIRQ16, 0x2 }, /* PL_08 -> EIRQ16 */
+	{ 185, 17, S32G_IMCR_SIUL_EIRQ17, 0x2 }, /* PL_09 -> EIRQ17 */
+	{ 186, 18, S32G_IMCR_SIUL_EIRQ18, 0x2 }, /* PL_10 -> EIRQ18 */
+	{ 187, 19, S32G_IMCR_SIUL_EIRQ19, 0x2 }, /* PL_11 -> EIRQ19 */
+	{ 188, 20, S32G_IMCR_SIUL_EIRQ20, 0x2 }, /* PL_12 -> EIRQ20 */
+	{ 189, 21, S32G_IMCR_SIUL_EIRQ21, 0x2 }, /* PL_13 -> EIRQ21 */
+	{ 190, 22, S32G_IMCR_SIUL_EIRQ22, 0x2 }, /* PL_14 -> EIRQ22 */
+};
+
+static const struct s32_eirq_data s32g_eirq_data = {
+	.num_eirqs = 32,
+	.num_lines = ARRAY_SIZE(s32g_eirq_lines),
+	.lines = s32g_eirq_lines,
+};
+
 /* Legacy data for old DT bindings without GPIO support */
 static const struct s32_pinctrl_soc_data legacy_s32g_pinctrl_data = {
 	.pins = s32_pinctrl_pads_siul2,
@@ -810,6 +881,7 @@ static const struct s32_pinctrl_soc_data s32g_pinctrl_data = {
 	.num_gpio_ranges = ARRAY_SIZE(s32_gpio_ranges_siul2),
 	.gpio_pad_maps = s32g_gpio_pad_maps,
 	.num_gpio_pad_maps = ARRAY_SIZE(s32g_gpio_pad_maps),
+	.eirq_data = &s32g_eirq_data,
 };
 
 static const struct of_device_id s32_pinctrl_of_match[] = {
-- 
2.34.1

