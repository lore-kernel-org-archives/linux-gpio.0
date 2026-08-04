Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2713E36167B;
	Tue,  4 Aug 2026 01:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785806884; cv=fail; b=SDES0WAP0N5bSkq6zHUYAe3UJnNOqHntn2g4IcqPTSukXJWhGrPAIejk8a/6dOzEMDR3ReEzEh6hWhSAgzkJOUnmqZ9q5lAU3bHMtoNg6O/+gqF4pnTArmhzgeb33P3uji+5N5DlYoffywybSUq0nohEy6ejWvrVfB02+cdmtNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785806884; c=relaxed/simple;
	bh=dCn9cmByvU2SHi1lJRyrEeRz3l5batjfTu3rnPDx2QM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Omo4Oo+/RKNUTxR8FKC6PsqhV1EuRIhx4JBOwR8GoWcPEfuldI4BEt0AbHQ0m2yLThlxguFFIVymLmSWGMu4KqkLwwLbBzsUXw0shdnA3iEOKdxB0ZXQD3bsa9LcCznMcj3zmHe+bCQT3/p84MDmUEew+GYsVo4Tw8EV15wxqbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a//Dvs2lJ/VHUg5soz6ZShS4RCyWUbZNyVgA/4Ao33g1DvJWbr3g84W9Cl5p3R/IDrDw7D3eeQeEokcXPcS1b7St0FO6D8srsuhIO6MYr9+wfgUVQvKS9StDNlEKJMhK94jzbAA1ycrxdf/v7ivJWNcnFVj+I6s2zl9FN/35Os7JCTmXSoVM+gHw+7eoi4faquPmaoJ30MLqEFZp/EPtSCUpIxlHFAjhvwCZZks4e6IVoVgUoBbu44l5gZ1PrQ6Gxu0qEgPFEt5pOq/FPDjP9COF+KTDrBXoh2DEdJbP/O5EcH8vCtlrb911dOQ1wIs4yK2ZY9H3NsEgNXHUB0AfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCn9cmByvU2SHi1lJRyrEeRz3l5batjfTu3rnPDx2QM=;
 b=JVa45hG/mlpwCgijqUnceb8DwZRs1q5hEOfmNkH8T89uGkzqbf1q3KcOxYnOb/0EzA/P5ue5iM686CnOvL1lZxzFStHpQ5AdTklIUhjjdFVuvFL30U8I3boC90sRngZKAnuCj8Zn746BbJh0lAV1pSUL1PP6A4YIedIdUEJw5nbl7gmyRYmJv2rzsRX11o8zdzOzuHp1oOLOlX9kjBkBk17l66pBuIX+YD1t70nvyIWBJQJNRdnc9txIFUCk3By4EXKQb4xbq8F1YAIZ7PFD8p7VQqFNs/OM+nYMNqgj6ulCFk/cHabGb4nmVj7yQkxeGDdXDiUPrIDmvALLbQTQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1298.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 01:12:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.017; Tue, 4 Aug 2026 01:12:25 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou
	<aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski
	<brgl@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 01/21] dt-bindings: pincfg-node: Add property
 'input-debounce-ns'
Thread-Topic: [PATCH v4 01/21] dt-bindings: pincfg-node: Add property
 'input-debounce-ns'
Thread-Index: AQHdIYcwUjDfWRkUJU6+JOjz2MMFNLaMYVuAgAC4NGA=
Date: Tue, 4 Aug 2026 01:12:25 +0000
Message-ID:
 <ZQ4PR01MB1202AA6D5D6414E1EDC15157F2D42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-2-changhuang.liang@starfivetech.com>
 <20260803141307.GA3243695-robh@kernel.org>
In-Reply-To: <20260803141307.GA3243695-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1298:EE_
x-ms-office365-filtering-correlation-id: 40da28b5-97e8-4643-b77d-08def1c5722a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|38070700021|10067099003|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 p/FRTHJaEVBzH3GcSEp4U3nalMa4fjQql6hnCE2bhlGJVgxAeNBeBwu7g7iqNowz4DeUEvtdVJeBDH14c13Zmj0ZArinXLYmndyrFECaV1gnsFE0G4xDvQOsE7uv3k+5o4dJ8APaWfaisK1nI92MRm13OmmXq8KcpdIyzBTbBlzmzKfpRAjRJizgrlHIWBfRy1/CMgSkdQAQ3S/EoWv8/E500gSGuRwkxl1OKrKsOPahRKuU5/KR5POvmX8zHaohdhXVsfztkhF0nYeuiU8Yf3tlMLXIoLzCqr6Ee5RjIJ/z16FlxEvizciZTkrnmnl6UtbMxB3Yk5cKXvMFmqnShwnSWswMMTGgZEwr890MXY8I9I/SJ6yI5dNvd0MhDPIqYAHF5sZ4kAWZ0867wQtbiQmpJVthrADubwXFCpWwFWpFPYah4INEY9njqLsAZ60b0MAZFHAWm1zzvtgjB1j4wZTimopEBT14T7LquKJJszzaBpEcoDa/vH2y62i4bPy/JdnGgOdYG2YWUGt4SYg8fnEmMX9oQ35BnYoS3wUYzpV0SeiXstMV5OQU0Olp6pIw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w9JpW36rZ1tmAVEURkIbGHSkrg2I2Nu3HjuvQnwQ0rUP9t2Z00Vyi49wgIb2?=
 =?us-ascii?Q?xX2TPWTmOWMdmd7hci/btacKNM/U4NEy09j6WfEWKNUyPb+rnfiUN2jtZzGu?=
 =?us-ascii?Q?1211zHfJkzW5aRPa0kUIJRf9hBXNHfS8CwsAD8ohPKR3607EZydEYO2WRm+1?=
 =?us-ascii?Q?0WcVIwsuiml0uj/9e2Stf/ixcCDW42EkFZxU7Rh7aOfXPA5HofgEJHpoLqhP?=
 =?us-ascii?Q?nFF2ztZUWvDClKAoO1OQWYcv4Q79HIqNlqjv/ENqLLjc6qjeoC+ZMEJBiTcp?=
 =?us-ascii?Q?NKAkuKq+ZlRS3xqbLNi0nfRG8xaX6GQdeN3sCp3HwCls16lx9rWYP4dcA4mK?=
 =?us-ascii?Q?6DMZylH2/nP4Hs/u1e4sZgvBNRHhbB1aY+ZOLuPL4RUl9hX9Jt/T0pqkQkEr?=
 =?us-ascii?Q?cpsP8Qa9HX7gRA76ILvaZIpnR725yOUzd4OPywFG7k0t967sf3J0kn1JLP2z?=
 =?us-ascii?Q?Szz7C+05I/lY2Jav4grCZCZGDCyiTmRUvzvH6IkQjRSt8R9blMaJVjHGBdyt?=
 =?us-ascii?Q?QrDT0m0+EcDJg/GZ/JynEJ/4aCxE3b+5A/EqMvpLRWn+Ut8gx36dW7hWDkwT?=
 =?us-ascii?Q?nwGgYcP/lo8bQbwrtRazgWJlXw8v8KN8cWDo4OdIZaE+40N2FAHan3OXTwNM?=
 =?us-ascii?Q?Bjxj+wkAOrY45W2MTI+ixK4lQB5TSReudFApiY33lpfmREmD4fA2bv77rS4h?=
 =?us-ascii?Q?5uj2puQnuhd6Yq0XvbOW/eErJe7dibDtYyPv4PvssEmHN8iqMmhp/puvQuwX?=
 =?us-ascii?Q?6+vyerobt5vkjHBHfBYlTA6cmJQusDw37EqM9HzYHgY8pddLV60LbMlvRLRi?=
 =?us-ascii?Q?mFTfqe+uewRj/NU99mnaM/W3kCaPUfD23fUnVcJJAZyhJfHROc4127gvDmWp?=
 =?us-ascii?Q?+lWX8npAkSfjI+W/mJDhVDVQTZertKoSmDkfC4tsb8SSQyIZuHnsX7Zlnw07?=
 =?us-ascii?Q?74umlCE3P4UkK9msYY4ro8Y9AIJx6vjnu6mYlbPpQLS2ArjTb7+xCL8GDHmL?=
 =?us-ascii?Q?76IZtcfvGFG5beNxXQ37FEs7D1bsV9XgXjMRMgnt38s8fVkM6htZYUQB0Xey?=
 =?us-ascii?Q?Plw3LZse7tp3xwRSUOXegd65ihq44HZGHKMYjYo6UO2pLmLFO7UEtgXVnnBH?=
 =?us-ascii?Q?oC/N/CZ8Xl3ZvBCkkYDHzN6c9llIN9zCLHQl3dSP1lT01hdNvP9iTF+E4ynH?=
 =?us-ascii?Q?pSDnvIBalT0oVv8GOcifNvGYH62PwEMG0pjp41116oXkSZWQFCcrIyImTLY0?=
 =?us-ascii?Q?o8azsSqIlqA8+MQvQOQDibiJyKbUvkBILx7J/Ly1gh+KKi12J7dM+rSUhs//?=
 =?us-ascii?Q?VLD7ZuvYoNJ8d0nLX6p93ZUAhfsYI4/3k0qN4JsdQA6pBetyaJQlQcyLFPJC?=
 =?us-ascii?Q?QlRp+nVP5PRKZdUAVfr+jEf5xKaCPKsW3wM/kjvIqarQIjIfnrAa01MHLIei?=
 =?us-ascii?Q?Z/hxP3r2PXSCVbiN6hEqx7w6ukbov7XH1MUBl1/lSeKoH2x/3NZ33q1vGRqd?=
 =?us-ascii?Q?BSRUj4rpWH15DjKoruEtH6mEygUQwzt2A+ho5ujcavP+hbvROiR8s1t5eECD?=
 =?us-ascii?Q?oz6Hv+aC1fKlTzxaMXzD1zd3Q1tUdxWpRU/amYuaUxC+9vI/o5tD+JWqBMaK?=
 =?us-ascii?Q?OIn118jWMGvo5asbJMD5iv8WtSNt+zveYj2sdi2JWxpHpqzwrvuPkZceMWwB?=
 =?us-ascii?Q?z1+KRswtTRGQKyyfcJOKcqHMn1YoMx2pkVR8lPAV74XuHdcY6jyARIZtklbw?=
 =?us-ascii?Q?jCrZCo2Zftl4YBJo2OcVE57hpdYhsFE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 40da28b5-97e8-4643-b77d-08def1c5722a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 01:12:25.8962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZ58EKBiQyMjmZnE1gRXXaPdJEHZmk7tnzxOFNFyuD7ZPCoth3tGYMo0R8W2b0V5Ame4Dp8U6O/PmOuVoYrNpQOWPkLILgU5EnTT1v3bCfcWp8gCHXJVe1q2kkORO0Yw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1298

Hi, Rob

Thanks for the review.

> On Sat, Aug 01, 2026 at 12:26:51AM -0700, Changhuang Liang wrote:
> > Add the property 'input-debounce-ns' to specify debounce time in
> > nanoseconds as an alternative to the existing 'input-debounce' which
> > uses microseconds. Make the new property unavailable when the existing
> > property 'input-debounce' is selected to prevent conflicting definition=
s.
>=20
> Why do we need this? Why is usec resolution not good enough?
>=20
> That's what your commit msg should answer, not explain the diff which I c=
an
> read myself.

I will supplement this description in v5.

Best Regards,
Changhuang
