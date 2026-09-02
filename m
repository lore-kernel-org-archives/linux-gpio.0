Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A215F39FCAE;
	Wed,  2 Sep 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337398; cv=fail; b=BNguuMzO3ICxXlyWrPANgKzcwzJllWWwF/dwGi+riwz5P1+TJwTqu8xUVqfdD5AZPHYv3aanv/Ns9atyePQRYjdQC2gQf9ORYErKs2f5Sr6zhbAWaY2Dm8O59OPh4xDqaUgMijG5Q7xOyRANom99scD54SlKJOs8aWxDf6G5JGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337398; c=relaxed/simple;
	bh=e2g0mD844N0n5+kU5CJmi4K+YFUB1xW+6wFbHF75IB4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VYuH6SzzNdhSJLwn7+083Q7HQUZLJ35A2gPdys+VchXXxQy4iY77f2pF1uCyHu41xpe8cODg/rnLE4a9qGcDV25mLvV5BhJEZ4YGtlKJYvCCs5PceVQXPtQccfLSaYUi6J1u7Zi5W+WwvkqFfUwbrGGFInWqeUeV0hL0NwS7RT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LSvobscP; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LSvobscP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctF2f9F/Mnva0fJo96TQLNYiD8K6zxLiBRHZXsMDSYLL3MJpL3q5Qp+SOLOHPX0tlPHXGT07i0t2jheTn/M0Naw6VIvz9Ry99Piux5OnpMJ/AlVeIvJhkqVoiBePT0YLerXPiTBH/UAJWIIJBuH9/PUMeZXXwQo1jAAXz66uQyQsFG/CwN+AhG4X7hdhwIEyBtbQ+VYAlmBbxmciszZfZYiMP59EpLDMyOq37uSrlqLDi/5e8HjLoIN8Z/dN6ChsAcDNjBOP2DXWX3j/y78R93MCmvtPfkKFn1ddXOwo6c8FyCq9Gz3fOb3V7+a8AcAh3G8fWKLqhRrF9R+U0EJywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgIJ6sAfvKl6AYUuVAL3cI2aM34dZmUHw+BzQvTENQo=;
 b=QKks314pbL36PX3Me61jtB8TURO8JD3W4+sDI5dmSShBZa1ciLWaJOVnhJ1uW56pq47YPOmTkaidAovxKUIuuQQzYlzYWFvZAdnTf/wY5y/Lg6dXNxj+mfz5feUzCFfGbJY0VN8xKEm69RbiNAtmIWYD6UKfZAegV9zNTmdB+DQ5iEcygQt2oK6UisyX38YFFfDx0NAWWCL3bxFYwcne0i+KoTDDperp6pnogWOL0zmVQrhYvXU3HrXCKzJxyg0UJ8mnDi/rGPNiYlBZAWSE5dqOf7JzdOUhSq9uPD5vVAPLeZX1U0ns2UGZrZGNaRP0X7xF7ioMOQt3U0UC6q6o0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgIJ6sAfvKl6AYUuVAL3cI2aM34dZmUHw+BzQvTENQo=;
 b=LSvobscP3pBZrpSRauBB/clL3ICf7WPhraoCRwGJoT2jAu6sDnsWi+qO7hlOMlcc9UIIA6wjwa51XJULUSCHkt1FgeY9z8LnbvwP0HbbRJvHgTvPjs5hjpGrEwDZQmPkvawSejo29IJr1+WxTWjSlsYg4QmXGOazfEJVZMFU9YI3xs9FgmKFitZLeBDpqb+1cK7iz8sY3d02a7jeGiGfAx15+N+/ri40lMsMps8s81Z6R76yrHnxjtUoNvXX0dSDbtip/jzja+n7OS9Mb6SCCzY0UBy6WbYiilJaJV7Ez21gjj+Gip9o4zriTtHoBG0oOOP6kmAV2XkMiXX3TVdzsQ==
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 (2603:10a6:910:dc::10) by PAXPR04MB8333.eurprd04.prod.outlook.com
 (2603:10a6:102:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:23:12 +0000
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de]) by ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:23:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Aisheng Dong
	<aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<frank.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, dl-S32 <S32@nxp.com>, Linus Walleij
	<linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Giulio Benetti
	<giulio.benetti@benettiengineering.com>, Jesse Taube
	<Mr.Bossman075@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] dt-bindings: pinctrl: fsl: Replace tabs with spaces
Thread-Topic: [PATCH v2] dt-bindings: pinctrl: fsl: Replace tabs with spaces
Thread-Index: AQHdOFtSVjjrtP01E0+Q4iRKC8m0lra697Vw
Date: Wed, 2 Sep 2026 08:23:11 +0000
Message-ID:
 <ZR6PR04MB375776506544910DCDF977F72D88B72@ZR6PR04MB375776.eurprd04.prod.outlook.com>
References: <20260830084104.14968-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260830084104.14968-2-krzysztof.kozlowski@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-09-02T08:23:05.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR6PR04MB375776:EE_|PAXPR04MB8333:EE_
x-ms-office365-filtering-correlation-id: 1d3753b5-06ab-4d65-3a72-08df08cb6d88
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|19092799006|376014|22082099003|18002099003|56012099006|38070700021|11063799006|10067099003|921020;
x-microsoft-antispam-message-info:
 WBzTnrlgWhpOiXVTWgZjnsXl32l7i7D+952m7b0S7cl1YIZPPEMol3+kuoCCeC5VrPDI+OtLy770D8oP226PGbrW1lviQixATILnHKuJQA4WvjxOhYpX2wUQI6oCawitfDpUIerwOQ9BC9OOYxpwIprlwkqcTaf8lvmFGEfCIn4qqg0ZOugGBV45Pbh8bUE/nZGGvsq6NUIrUDzQbE2ykibmKoTCbpRau7mD7ifiOkXMlOKSBKm0G2BV7vuADfC8RJhdgusG86JwwjDgjcNwhu7ApK1LoB/5n7DYBWkuQBaFmSG10Hi8PMqniNyeEvocpwvvlOC6uPc1ZIwHTCveY193eArqEwknyDCnzvURf4gD4EEBf0oF1rYZa4efuAalFMmbqQRB71BI/wjLO12k9y9roWCwhsssPWcld7acnfhUJExz3qD8SVI0RyfM1T8WPXidkShxexwI/aJYaAXBjKJb7tEyEpnNVz2Jr2ir8pa+H0/pDJUYbMg/QUAgITdUXRuXr5HBNgI+0/ovjFLEDS0qBujiW37EsxlN73cePSekp2eXzTRq6Rk8rldqsJZMJ0qcd/V/MilkDaHKePdlPoKOXkSVu4E0k9Gd9F6t5ioaWzFnWEmoFlFl3zF4unBfAsu4JLoJ6CxoIuTF+3lIvnyey89suLl86TMibN/PBbBUDLi4uBhT0/Gng6/QBxUV0Mm8BLF9Th/y3TD0OhNcsf60e5AhDaiWq5UjX55af7k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR04MB375776.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?G/tsRJYUyKBV4/scGiczqivYYeRiKwEjPMuupDZE9U9Yf45JnQAb2DNlMLui?=
 =?us-ascii?Q?XjXRdhAQiP2ZEsxFzQdJUfJECOws/PQcToFsQrWuXwtOMdChWt8Vz0RrjB1y?=
 =?us-ascii?Q?zp0CXBs6t03XPEhqo18TaFxEEp+Z36MTfvhgNtY4XFlpUKlb4jowH8yVehrO?=
 =?us-ascii?Q?c67bHT535Nw24Jogmp6XqbsZtJRJ+sXQVGfgP7w/AKwA6DTOPBLfxGzlRVWo?=
 =?us-ascii?Q?zqAkoWq3SfwPszrI+IrYnwnw8r7emiolWNl7iVaXIjk5eS+aaazgVD2hkoap?=
 =?us-ascii?Q?t1zGlHAjARltvc+4FLNfj8dCSzlUjMD3SZNzQIGRY2errujnbo06AIsAFu4N?=
 =?us-ascii?Q?ZYqA5x3Ds8jYdIzWG+qPBT/TdVrQXPQ6IcDRdZTeJ3/c6dIxDjqrYwoyw38+?=
 =?us-ascii?Q?aHFTcctz1s0uQEG71orZtKD0zyLPwStUa1pOnoHrWdHtuqOFW3LwgkJ7zpKE?=
 =?us-ascii?Q?GDIOYmq9OBc9k2Mx87W0Y3d52o5h/llKW+7b1Ga2MkL59d7wtGQXN7ezQXJl?=
 =?us-ascii?Q?dWtSQLuJ3iObOp/AWq+fr46ThzUvHsEE23ulOUNzdwIUPykwYLvnIgGQx9jS?=
 =?us-ascii?Q?nIuXd8C4VgI770adDGO3rO/ZAhcJL4C8+1g/v6kTPwZybJIXjr2JuU7wgloZ?=
 =?us-ascii?Q?b5RVzHNIxLwvzhC2uqsLlvDsOn4iZ5JptjzjfmraZQx/oey5paUIkhmwcfyT?=
 =?us-ascii?Q?BPZKwFxH4ajsuGiUFjWLZVc3Xloebi02sbxFtERn8/xsuARQVesIWY2EPHq9?=
 =?us-ascii?Q?RbbT4dRwsh3NhEc3iSDYqN5EZMfz7Em1LNennO+s57Pw8u4m2ukYGquxkN8S?=
 =?us-ascii?Q?djahcrMqMv7s2peSwKSZBoNnARg0AYEV3lvgyrTWa+rOiyzMNGTTd+B+gyHX?=
 =?us-ascii?Q?sKMr1ICtX0gTi1e6FiSe6H6ozZGnlqjyrMkS7Io6IcPJNjw/PtfVOrg5vlvW?=
 =?us-ascii?Q?OCusdbL1IIvUOVFLUfr0UGSUqvZ2r9XmSAfsy0UOVAvy/B9GiT3DUW5ltsJs?=
 =?us-ascii?Q?ihuqmfiAbY0ywwUQCd2VeT9IFc+Erwz54WhJ0sObEuezBH1/Rs5bdvZWHL4B?=
 =?us-ascii?Q?q4zsOpLuzE7uBJIZoWhDwCgTrtlAU4A4jvrhg040sfgKiJtYc+LvLMjrPlrJ?=
 =?us-ascii?Q?wcdm2nX6bjpJX6bYlNV0DmFvfEX5csxzuryZvX/J3kwWSW9EkGJoq/kyhpZz?=
 =?us-ascii?Q?bfSedEN6qFQwE+npyNUldCM4MJkxJpOIdFFt0141i8oUVVGn9mUkNanZkTxB?=
 =?us-ascii?Q?JinTixZc5CN74JOWar69t447khewRVhzjZUIkow/A4q2S5SzEzuFVKYgIRZO?=
 =?us-ascii?Q?JBhQH1AhCaeMd/dgTuF8SO5rhCvp9XauOV+Z+mof/glX3BjOfqq0HHiZKIj8?=
 =?us-ascii?Q?Jixc4sYJQKfwxvyrCd/1oVkz7NDXZKi7PgZLWrlcyTzKK9CnlJASSGxx/4Q1?=
 =?us-ascii?Q?94ytqCFEyawybf2KrroLnAja6dwRCWAUFzHHsQ/ygQRB6zRkYf/NcOr9Pnk0?=
 =?us-ascii?Q?Xo7p5hBzu8HEwYbrfZAZZHnRyfDmOPQm0tTh3qKrmsn6JyD02FQCn7T03anj?=
 =?us-ascii?Q?CsBGc2aUkGiFKOBrDk/shIR3yIzgI20IoSfbOUjqLRDo9rhnS+MXyQ3JnUbI?=
 =?us-ascii?Q?R+LTIZR+QSX4ddYba9paEKmx9ZHOQs0aqYu59rzvDD/dUmJUenQ4xWCIecEM?=
 =?us-ascii?Q?lCw+uyicqhikovx3Qg3v/GdIaP2BnOxlhk4hR9h7I5zsgHdO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR04MB375776.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3753b5-06ab-4d65-3a72-08df08cb6d88
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 08:23:11.8575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gGVQsgwBGgb9yoIr4J02rsV4X3ZxFXWj0rrq0p2CBS21ErZaSnc+gyrQ55DfP/jwwXa3MA2K1CQaWxpcxs/oUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8333

> Subject: [PATCH v2] dt-bindings: pinctrl: fsl: Replace tabs with spaces
>
> YAML files do not use tabs, even within the values in DTS.  No
> functional change, although dt-style-check will warn about it ("[tab-in-
> yaml] tab character not allowed in DTS example").
>
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
>

Acked-by: Peng Fan <peng.fan@nxp.com>

NXP Public
