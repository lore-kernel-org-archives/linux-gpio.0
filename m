Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792753272;
	b=zZ+HQDPXIIrx7YtNRuOeWIXebGdW7rocplQbVnqHjIdeEZar5axfdgMduv59eL1J+Ggs
	 HlfiKq/9VFDSTE7i8GU4y3Vh0Vybs6vbWeXaWn8XCfIhNHqru/v9XlmGdWWeOrU+zijEy
	 AdDbbp3W0P7t+5dRjBu2Xlf5oArjGEjZ+c89CgkNhZobSZ16RmoIx8zgITD4fxHUNQPR2
	 5phbSGAXxqGQ6QRUUwqUwONGckB7TB0bvg2YknyXNt5ZHPo1C1TBi0jA34qRT9zi+y4Zc
	 SBlI4lj4+TBBNLKG9DB475QkpLAffLCvas0WyGs8Pr2xQkc/TulCeRFB8ln/UenLctg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753272;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JpoYMt4SZrCuFsuBj8R4hqcuiyly6R8t9J/O/XFpEUw=;
	b=3eOoKycFhObKGHGPz4sRr0acIT5LEUZlg55EHX87/4g6BtVhX4bLObDTnMCDSOre5Je2
	 BpSY2F7SWSo8X9kIcfeiMj1xXF/lNtbfZBOqt9Nc28EVGia8DEqYTSxx9mxNMv05MjwVb
	 9yoV60YBe7ypyduZEgZXK6QXIlNvhRk8IaSOmwOvhaYSxfPVGGy4EHDDCKx+3oYTTXgT+
	 MGcGktOXKxlG4P1LhQh3kcmzTgjQFX4GV+UfmqWxR3HYvMEEoWUEAfxrOKmZCsfVO0eXw
	 tWP/UndH/51s+FSI/ZiiOx2VXZceRrbaOIZln7rbDSCd9mQFIv1w0FCIK+Aqyl+sPPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=wt8lXNhi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.70
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393EE606A31A;
	Fri, 23 Oct 2026 11:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=wt8lXNhi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTJ+J8YNnG+tjFqqWaQrjHe+gwNDGYcz7EQgGowhBgYv25QqUVQl8IeMVm4CQ0rSD18tOUFdshf/c9lP23VIwYDNreiaTG7W3qX4OODRUB0LyAINNFY7wD0UNp0Ygk/KkDW4Nr7yGF6/HBx5Ktzp/XOvUd27DnxHNNaaddVwamlGBDbdsls1BhqhuAusfLkYt5gKdMwheY06I1SqJQGQdc0MZPPSddxgwDj2Uh9Ipfz8dFz6bvSWSPqbfhDBTCYrR3fBIqlAEFcUEGSTnXIcY1RWtDnERRneyN/CnT+dXMptCbramt7N5UBrWs4iOtK9yPEeXA9ZUDUh9XxTsxCmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpoYMt4SZrCuFsuBj8R4hqcuiyly6R8t9J/O/XFpEUw=;
 b=LNSEf7F8SMHMQKPXclCTR534Vz6RnKYZYv/oX+eclxSGXuafCkK8AODiHhC3r5WwMCmhtJIRm1tWNg77TXRGGnA9cbLRz549lfnAwmP6NIx/QwOBHQ++bAfRQhlMgar+yLI5Z19HLKYkHEEIExTIBhyN4Hl+NlrzgUBoPGeU2Jfotq/fybv/rf9bxGNa5TeR6udGqvT36J4w/j2vlJKdgdXBq1OO1cg4m4L1hlYZX+z++pwydfhcfttImRDdQtSJZv3spCT8cfAEteQqKb3nSR4IzMhg6FLlCAXYcUOiBWcIluVK+TAisSIUQeZLNfLMC++L5uQZfnSYqEYfv9B3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpoYMt4SZrCuFsuBj8R4hqcuiyly6R8t9J/O/XFpEUw=;
 b=wt8lXNhiTZRv4k0VLotogkbvTzqXS8i6KbQY0pNGncRQ1QWBCdGisUTCOTCEALLSfB9fu0HXTIeDzGH0q9yTOheIjU/zJQYbgcoJ9eMw5dsR1Do0UG4aAxMj/d7ezu/47uIiOcy/R5Z5lSwB6iehIdmHJJYnkA+U7VEinl7w1FM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15725.jpnprd01.prod.outlook.com (2603:1096:405:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 11:01:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 11:01:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Diogo Ivo <diogo.ivo.sx@renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
Thread-Topic: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
Thread-Index: AQHdYshzb4PwsU6o70iLmg1Iun2rircK8bIAgAADmJA=
Date: Fri, 23 Oct 2026 11:01:07 +0000
Message-ID:
 <TY3PR01MB1134645CCEF0656592B93690586642@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
 <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>
 <ats6zi2lZW09Bs2e@shikoro>
In-Reply-To: <ats6zi2lZW09Bs2e@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15725:EE_
x-ms-office365-filtering-correlation-id: 4433353c-6afc-4eab-55a7-08df30f4f048
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|10067099003|38070700021|56012099006|11063799006|4143699003|261022105027099003|261021121427099003|261009223027099003|261009221227099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 mqmFDP3+O5AsTMIIE6MLXyFAgd6X8+W/AwYXbnZ2enfDS8P2XzI8N8MQchof1ocsjUNTDkfqSGy71FDBqAbuWc+VEdmtTDenTgdCuDoijaPq/oZhlk2H8cVv3c6gtUH9Xv8rNz3yIUBpxbJYBBUUuPnFno5Ur5yZI+HKRRyn/SBDJ8AynIBcxBs+ehEZgaFUX/g8GTeTkSrus/ipO39Y6+h8Q4OWAXWgBDV0MeuEtiHTv69AS2CG3vwz1oS0kl4gp2ljVt/Flq55iMqIA1GrhnK243kJdPTJBK4vPlPujI8rWDD4dSCRh6I8qWeKjj+nYAB+znmAEC5eaWMQnqk5OpdSuQrVSNhqhoTXcp9TEtlHnK++Ej260jxSS/MuVvBhk6n2ywnY+3OvgC9zaIxvi+qoEJJZ2zgmVNULIEoKh5gFiJxl53jLRSnSRjblL4r7l5XKfF10VZ1g16EpAf/qGnIqN9U9W06inNHRQJKTIxuIcPhBBu7KbupiU83cyM0//YpxoudD13KSF8idhd7L5S51/RKe+MyOPYdmWP7gkBAOmQww2IxZdbBKdIvDHbGFYWq7FSy+c1tI+i4dQgtuKZBT9Sf9y83l/ZD2AgoMjxvRlAuGCj5R3e6yzeMr0FHR5mo3JBfVFlSb3HMruxPH/J3f59nPrBJwGt8Y6VA5ujMW+54P5ynQ01AuVl0TmiaO2vH1xnKcCd9/sWXvPIwlP/jAgKPBOAppNqueFsSa2k4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(10067099003)(38070700021)(56012099006)(11063799006)(4143699003)(261022105027099003)(261021121427099003)(261009223027099003)(261009221227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Q2YsW+buyyGkGViZYwjo0xXFVKu4Kk8FTmCWiBaOPL9nUujUA2PXwWR7Hly8?=
 =?us-ascii?Q?yIdXIYvX5x7WdxXoWjqVL4HivySvx/Sp2UAUKM1OIrnsAVIZFYpXOeKtPgsM?=
 =?us-ascii?Q?zhduoqzpjPxk8h8HWQxx4R4g57S9VnMhIiDWlaG2cCjBR100jmyrAeoR9PCB?=
 =?us-ascii?Q?/O14lrHjlAddsB891zFrJeZM6T4IoD4L3Fy1EIJgO6PPdB5sr1PqLOe4ugoU?=
 =?us-ascii?Q?1ueX2kAGMr/sONTgo8Z0UvorwEmu1e51cLWv8ig7DV/p6P9eHNp3BTDIY3C/?=
 =?us-ascii?Q?RGN+XNwVVncc4XrtBqTbejXwmliACB2Hzb1QdzIjFlaDQ7gu5gdkz+MYtY5A?=
 =?us-ascii?Q?pK5g8Bcsfjv1tYptYcq57HWKBobgEwaouNHsC8G/iZ77eNpMheUt6da4uUzZ?=
 =?us-ascii?Q?m9pW/nMeAGYXA11zbGuPZTVp8Ibt0k/qVwDr6/c06JtYS+aiY/m+KRIcgMSC?=
 =?us-ascii?Q?XC5rbLEKHFdso1jBMpGCGs2VYPffAlFiDS7JcMJifTBOfiWAt4hDF6DIkKbO?=
 =?us-ascii?Q?5CvQVn3EPoF0lw+ywJ5vqW+7EQ+pu6n751NbtSpUHs6h9uy2WRqYRbq5rpfF?=
 =?us-ascii?Q?RUAuwyk536eqiZ3J40dwCnu0/7htybygk/UqSKWKp6j0Tz88q/+XnlOEdY0L?=
 =?us-ascii?Q?p61U6L/c4N2mmv03bNb5O7CYXNh15bviIEJjO3hveb0sndcmO/QNnQ7ByCeW?=
 =?us-ascii?Q?FpBSRhKSbqB+6+gsEw6q/9q3qwdnuWdhl8Nn90gXuDrQMF+VYLPwv0KywRy8?=
 =?us-ascii?Q?aiQiPcVNlVmzRfCKFRBbJe9gBmzHbE7qxNa4/RWyxhtPt5ILmSvotqCLtmmN?=
 =?us-ascii?Q?PbG09qhp58M4wsMbpiOwgOMWCNMKOEQSToAHt8MbdmCq9iWrNy98xWHVEmo6?=
 =?us-ascii?Q?DzlRp9SHkYzGZnW5w4t4+F3q+YhnWgSLb/d7H8KaGYVPbql0vNYSrCzqJRby?=
 =?us-ascii?Q?F2WiaXh/Nsvvcey2/blSh1v6QPtIj8fFl6uMQqhfZ9hkDdNR94/RXucn03NI?=
 =?us-ascii?Q?RAJd5c9lcqX0DVhLp2Thjxmjp4MepcCAZL+tBXAlCHHrO1wOyQeMIak8VuWX?=
 =?us-ascii?Q?Zbabcd7AyLhmUHpIMKVbl/YTjr9K7VDAXaCNLkI3D3reC2EutjDq6GflNS4W?=
 =?us-ascii?Q?1PWGbkVOrNV1iuG8xC/+C6AZ0vd1amHoaptx/Y3iwORUMgBhqsNGPdwT5eSL?=
 =?us-ascii?Q?fhHUMnL6izkyZqJ9wuACi4BnSD/W+It4VARPMKO8BbEY4uusq8u+jgwVbGrT?=
 =?us-ascii?Q?5JSYEbXWG7pRiO9mQRB8jsJYeC8SZw5W048wZrFFIf9T5bapnIy7YpDGiSUf?=
 =?us-ascii?Q?lcamfdswown3OWjXh4VDciY7ovkK6ycZXK2Ph0/TyDAUDaOlfUFv1S3/AiKg?=
 =?us-ascii?Q?NrOik1NG3GtZNm+Wv6Tx7hnLP4CPqVBfYcSNqO9wSm1ydIqlMc/1wTwnVTgn?=
 =?us-ascii?Q?fvM7LtFR+D/Snfg/d2pm/ZewTyP6n+N253gOeSjqyMEkH1IUKGxgr9dxPTEU?=
 =?us-ascii?Q?8QYy37zpjG/aYnLDeRrndBjGUrb/7FXxWiYUXN7erukaxmiZOKn49y1axzAb?=
 =?us-ascii?Q?Y1lr7ha4l1yX4JDEXZIqYQdRMDhYyITyjbuCik92m7qCn9XCY+wq/YQGNcIx?=
 =?us-ascii?Q?CsGh3Ye98uiQzkYfNL7wFaRLZbah89iMwtVoQY/Rvzgz26nMwks86x61Uk8v?=
 =?us-ascii?Q?xLv+eeH2n6R47nEB4rFIZUc6yg79Bn84jq6WgVQ4ueoVQ5/Bc9bIFn9RpIUE?=
 =?us-ascii?Q?37TZQoXF2Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4433353c-6afc-4eab-55a7-08df30f4f048
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 11:01:07.0936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DyjcWxnesfEPv3XMzTkwtZAmSVEEeRMddpFM2mnAJPXCpOsTvzVdqUqqTpAp2X4sKJyJ0XeJDo5Jg20Gcc4UvciElG8mHjmbqbX8XbzDF/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15725

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 23 October 2026 11:46
> Subject: Re: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
>=20
> On Fri, Oct 23, 2026 at 10:28:16AM +0200, Krzysztof Kozlowski wrote:
> > On Tue, Oct 20, 2026 at 10:14:58AM +0100, Diogo Ivo wrote:
> > > Add support for the I3C Bus Interface on the Renesas RZ/G3L
> > > (R9A08G046) SoC by adding the renesas,r9a08g046-i3c compatible to
> > > the OF match table.
> > >
> > > The controller is very similar to the IP on the RZ/G3S. However, for
> > > instance the RZ/G3L variant has no HDR Exit Pattern detection interru=
pt:
> > > RZ/G3S exposes 17 interrupts, while RZ/G3L exposes 16. A RZ/G3L node
> > > therefore cannot be described with the RZ/G3S compatible, as its
> > > bindings require at least 17 interrupts. The same point applies to
> > > RZ/G3E, that requires 3 clocks while the RZ/G3L requires 2.
> > >
> > > From the driver point of view there is no difference between the two
> > > SoCs: the driver only consumes the tclk clock, the presetn and
> > > tresetn resets and seven named interrupts (resp, rx, tx, st, sp,
> > > tend, nack), all of which are among the 16 shared ones. No driver
> > > changes are needed besides the new compatible.
> > >
> > > Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> > > ---
> > >  drivers/i3c/master/renesas-i3c.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/i3c/master/renesas-i3c.c
> > > b/drivers/i3c/master/renesas-i3c.c
> > > index 4fddc1b4fdbb..80a6df1151bf 100644
> > > --- a/drivers/i3c/master/renesas-i3c.c
> > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > @@ -1625,6 +1625,7 @@ static const struct dev_pm_ops
> > > renesas_i3c_pm_ops =3D {
> > >
> > >  static const struct of_device_id renesas_i3c_of_ids[] =3D {
> > >  	{ .compatible =3D "renesas,r9a08g045-i3c" },
> > > +	{ .compatible =3D "renesas,r9a08g046-i3c" },
> >
> > So fully compatible? If so, drop this and express compatibility in the
> > bindings.
>=20
> Well, this SoC has 16 irqs / 2 clocks. The other variants have 16 / 3 and=
 17 / 2. So, to which one should
> it be compatible? I'd think 17 / 2 is the easier one.
>=20
> Or should we even refactor r9a08g047-i3c to be compatible with r9a08g045-=
i3c ? We currently don't use the
> third clock as well. That would mean deprecation of the old plain 'r9a08g=
047-i3c' binding, of course.
>=20
> Opinions?

RZ/G3E I3C does not have analog filter compared to RZ/G3L and RZ/G3S
Moreover, it supports - High-speed mode (Hs-mode): 0 to 3.4 Mbps.

Cheers,
Biju=20

