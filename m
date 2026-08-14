Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8DF361DAE;
	Fri, 14 Aug 2026 01:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786671979; cv=fail; b=t1zdcisXFHDz7KNizEdbolEsqWYIG5ZrrIxr8/Bm8Hz0lsCCKiswNY2zGdyWkGSg81Tvvhc8uqc21TNMDvoFZV7Uji1Ncvs3Y6s9Mbykl8VE3ZiEV4eyg3rjwfrIfCM+2CnivvS2aRq6mwkeyd4QzaCZj7E7z6jZpdRzKrfO+Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786671979; c=relaxed/simple;
	bh=NQVwoQy2YJx6bIx7tRcF5fN6Xo7MD2YB2qFWmyuBDSI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sgZsiBNXvx+35pNUByzCdvDU9mSHjeChPrwPALp8Onjp2J9b4L3C1bLhh9V7roducMzcir8+aAr0dz8F9uXx1MDeU+Y+fVhZpbuXtDypQ+7054dz+4il52UR09LsBnJbg9nMdHNa/iz/uaI4bw0524MceAGifcsoK8hhSBaK/uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYhxGm6h+4NR4+FhOcLeBKR5SrdYXWFrSOUOae953h19J68ObKjcEIiiwOgKvIvG84PfDqbLtUWQtkjh58voJ0I/5nFpjfHDxc2ohsPbg5z0p8WnSZWK9YOPlhJF+3tbUvVrncvIst0BvaDcDFUfGFmBmZM+2CU5bCbHNMrEbI+TymTBzmKb5WUca7EeQ/+kVjRnjJJmuLOlqhzScdo+ZkDv+g3hvujras9XXsBUJZjjkcnaz2cQXDK7mAAfe7kLtq5kOYuJ2U5svPRfQjdRijaHnY2Xb1a0vc6QwbW60Gj8ExlID42BX6vlDMVlWnxa2kIGRdTvAyBIMT7O+D1cEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiIeXVw9KifjB9BeN0YvcuUW0q+9Sj4a8iz0/eva5HU=;
 b=fjMZFFJHXTtNXBHbWHYJPYXKU2NYuR4SVMRAs1aa+v6za5ZLqTRImY+U6vIdlgfsO0q3UcxDK3I/at8upWn11/yU3LJThvS7GlmhSKMT4STOebPOgC7rQVwzkNDEKdWN0AYPQIVgXBK7RaNbmS2rPOYT6bAikFJ2qD6Y8NDHtunrKo29AgavbpyEZ5+zmOiDJxA6/94tIzaQRo+1pjrR14k2/qgX9X6Ugmst75Z2RIw9t1WXj3O16Dh8ZsNcdqjnG/+uxYeos+iKxF4FtM7gpc2bXNNyqLfkr9QeisZNVlVnw7Nj1Z+eYmdBN9w5LY9VNs6jNbZmG6NxgQxRFw3Rgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1313.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 01:46:03 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 14 Aug 2026 01:46:03 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Emil
 Renner Berthing <kernel@esmil.dk>, Alexandre Ghiti <alex@ghiti.fr>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHdKJKmmncLFStLcUOAd2EEccdBl7aW8JiAgAAZydCAAFDGAIAA0XrAgASfjJA=
Date: Fri, 14 Aug 2026 01:46:03 +0000
Message-ID:
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org>
 <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To:
 <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1313:EE_
x-ms-office365-filtering-correlation-id: 7f06680b-0c77-4e03-1fe8-08def9a5ccb2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|7416014|13003099007|38070700021|4143699003|6133799003|56012099006|10067099003|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info:
 8X7/4zMSSmlmd7KMqqnHCA2F6UwbGwDJXgmK0+/RfNAaqW2BK1h1tAPfGfDnhGofJloU/GTHn/OhVblL75QZK8Oqrbx1j6gE/iOtP5MkztO9jz9FGSMrH4PCTuI/LLvt1YGwWAicHt9t1D3Lmc4fpFObl9h4rlBywggYdjOhl33TLB++GTCWrwoaqTTIh5dGCVrcffZzvJFX4u0Fmxfk6KI7LQrcplGxYcTkxhkEBMpdVayx7lY1ZUh8vyEXe1Ksq4wlsXezZlIrCwrGBBaCMMZOQ/RanoktsqQyJw/6VpR2sB2LQb4Xtq9Lp5PwuDUvm4Zaepvnmxm8KfWFCM4ujvWtEbAwH/0J53JuSOgBZWUHIVquuYLWx9gIiOQT+LTu+fLdwiyg9AblMPUUPIYb4kipWuWG8ukOiGFpOK11whKDVFA/qb039RVC/Iy6oo9zpiHiJLMkJ1kxX3pa88kzE4MVpU4PO7zTzExDtly8tnNqO4vTiC5A0NwOOzv3GCZPLhrnL+fnOyg0WVEb//yiwrJmP9thD0ogeatcqAt10znMmO3Hw/TgWq7kuGg63ld1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(7416014)(13003099007)(38070700021)(4143699003)(6133799003)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c2R1zI60lUxAqwsbV7gzO2tcgporaDpfW1zyzYeqXVqZymA22F5jtxHr8m?=
 =?iso-8859-1?Q?rZplOXdnvDAxR3tIP519bAyio3UGJkG7lTxlmRphfidvvG74/itxgUZNay?=
 =?iso-8859-1?Q?NdmsdVFK78OGuKA/TOoKeLI40LgrLATb7tKmhs56UFwUaArSnhU+8QADDk?=
 =?iso-8859-1?Q?cR4R+jSBuMvPlnjgrBKoe/hyz72+Aih6IPfCo/sIrA0/e40gxI+bEX6Y3o?=
 =?iso-8859-1?Q?3AZiz7lbyJGhZePZgEOOd2xo4HX/4TAKbBxT0duFjp61ZfFUIKqZGfcjQo?=
 =?iso-8859-1?Q?u5ErOON/ibc0h697RtxGYOEqPhCbfCgLeVIU/ciL1JjVDpjk3OtKqHUhlp?=
 =?iso-8859-1?Q?MZl9iwC2CdV24lJ6SQq9C20DJTm3dK0WT9++FWsYE+oHCVC69humtDLQck?=
 =?iso-8859-1?Q?4zGhNGz+mAp9wsyeFvriuyYeBBV9LFEHLxVstX8qTmoBOB+WaUfYPbOqVj?=
 =?iso-8859-1?Q?ClvsMM0yyipyAbrSmUZZTLX6FPLjWYaV0wcYbU1pIsrUtbFged1rFp/TGr?=
 =?iso-8859-1?Q?dmjj1f0KfpPJNwPmrBwLGHtyFDJgyTgu1RVA/GPUaU3dhCGq5DOjP4KkJy?=
 =?iso-8859-1?Q?IEaMzXH5rI886yypZQkOrV2hKiMRLbnERXalB+X8m1odtidHBMLWnm0twq?=
 =?iso-8859-1?Q?GRoKCxem16iEr7aWIcaN7rbOUta3decN1bOtmV49nuexHbViVSeHnivSHx?=
 =?iso-8859-1?Q?uhYWLvcfCKVHE2FZn07sSi+n/Dg9nZycjRtUy/6fFEQlgqgefiWRQ1hZkK?=
 =?iso-8859-1?Q?NB5CaiTk+eA8SC6BLOo8Cs/eAwAMhvicSeY58NvWAlBeZPq9JlrT6ZqY7u?=
 =?iso-8859-1?Q?0M+TkOdVIoAgvvpc478fvZOGR3rcclljrJwreDeFuKxVo0VTORk1zs9ZYo?=
 =?iso-8859-1?Q?D44yA9iHMtxrF6yAPVj3djmL942adkFyPiqJ7snzcTWL36SgkY/c5E53KG?=
 =?iso-8859-1?Q?jxetqCKkpMRTDwateTPg/jdLWO1fs1P2TTLSZoV5fOQVQ068u+Ft06T0X0?=
 =?iso-8859-1?Q?EZHhoEv4lj/CveWfZhWNaES+ooLECrASw6drnSHpB8DBQwb0JU0w/kEQ+K?=
 =?iso-8859-1?Q?oiQamPn/xlSL+L5S+c+NzAS6sK4bcqGAF1keQNdMWz36PeJHkMvSVS1Wum?=
 =?iso-8859-1?Q?aN9C2SKp1bPxFDxtc9N5tRD293kAgGe2JPQ9OlZ3Qx3TBIQUk4/7UPDxVb?=
 =?iso-8859-1?Q?6blE+z9v9Ly5CYY75lhU2gQn/8vYamrRZ/J5aK8eClfI00BkEvs8gilN+N?=
 =?iso-8859-1?Q?dxy5hMhME9yeSspkTZ6kUkIWhMGEK0U3dx2wmt/luNDiUhHJNXrmuM9a0Q?=
 =?iso-8859-1?Q?Eou3DChqZyzVVF1c7C1YMHrZ8hBzGD5PHZLVu6TeK+hPT1uz0/R++LzIDD?=
 =?iso-8859-1?Q?y85pjX8CU4FM4OKSZumGtl2S/7sdJsQKnGZ6gV1nXmdHo/heUbjvIbuW05?=
 =?iso-8859-1?Q?QiGMHtRmI0Iwu7OmeICz9YWBY/5GSCpp+uThelh3as43ZhxdiHPFe50POi?=
 =?iso-8859-1?Q?wtkdp5EwEyXCFMKjiqDHt2X8djXAanv+uGxob+/r8jTwhQGhIqPIaZMW3D?=
 =?iso-8859-1?Q?2RdTq33L7z1+YTURiyWFZLoLLFBJfTqfCIB5DPbfhaC9PTVaNdniUt5WQv?=
 =?iso-8859-1?Q?pkg8L04choWmiPKPo/kakF+QBPKH0cq2Y8l1hS+oRG7KYg5FeNdAPMLO+X?=
 =?iso-8859-1?Q?b/E5+QL2C3jX8KplN/tZsmKrglpSHMzW1RECFotYHWYvVXXN7gmdHsY7B8?=
 =?iso-8859-1?Q?0akyWDmz5ubEP6JR/BO9JskI6SG17wc5ORUedOgRWChadaCGKwxMcqCIOY?=
 =?iso-8859-1?Q?p2pD6k5/TJ2baa7t+5Lmxybso2OuT/M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f06680b-0c77-4e03-1fe8-08def9a5ccb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 01:46:03.2196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVI7ExrQQHX0muC2OxDULDBt+Wblmjythx1695I5LzjXtGd2f9b87bxjKhbsSQFZmT34y8JVziwIzlDa9WYNpvnO8uTGAxUDtE8MQn1c/Ia10qchCgTs8RpLUaoMOZNU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1313

Hi, Rob, Conor, Linus

> HI, Rob
>=20
> Thanks for the review.
>=20
> > On Mon, Aug 10, 2026 at 09:51:07AM +0000, Changhuang Liang wrote:
> > > Hi, Rob
> > >
> > > > On Sun, 09 Aug 2026 23:36:32 -0700, Changhuang Liang wrote:
> > > > > Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0)
> > > > > pinctrl controller.
> > > > >
> > > > > Signed-off-by: Changhuang Liang
> > > > > <changhuang.liang@starfivetech.com>
> > > > > ---
> > > > >  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164
> > ++++++++++++++++++
> > > > >  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
> > > > >  2 files changed, 181 insertions(+)  create mode 100644
> > > > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-p
> > > > > in
> > > > > ctrl
> > > > > .yaml  create mode 100644
> > > > > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > > >
> > > >
> > > > My bot found errors running 'make dt_binding_check' on your patch:
> > > >
> > > > yamllint warnings/errors:
> > > >
> > > > dtschema/dtc warnings/errors:
> > > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pin
> > > > ct
> > > > rl.exa
> > > > mple.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl):
> > > > gpio-ranges:1: [4] is too short
> > > > 	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
> > > >
> > > > doc reference errors (make refcheckdocs):
> > > >
> > > > See
> > > > https://patchwork.kernel.org/project/devicetree/patch/202608100636
> > > > 50
> > > > .23 9303-4-changhuang.liang@starfivetech.com
> > > >
> > > > The base for the series is generally the latest rc1. A different
> > > > dependency should be noted in *this* patch.
> > > >
> > > > If you already ran 'make dt_binding_check' and didn't see the
> > > > above error(s), then make sure 'yamllint' is installed and
> > > > dt-schema is up to
> > > > date:
> > > >
> > > > pip3 install dtschema --upgrade
> > > >
> > > > Please check and re-submit after running the above command yourself=
.
> > > > Note that DT_SCHEMA_FILES can be set to your schema file to speed
> > > > up checking your schema. However, it must be unset to test all
> > > > examples with your schema.
> > >
> > > Hi Rob,
> > >
> > > Regarding this link:
> > >
> >
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schema
> > s
> > > /gpio/gpio.yaml#L71
> > >
> > > It seems that the configuration to support #gpio-cells =3D <3>; has
> > > not been
> > added here yet, is that correct?
> >
> > Shrug. Based on the description, gpio-ranges doesn't depend the # of ce=
lls.
> >
> > Why do you need 3 cells? You haven't described the cell content.
>=20
> For the pinctrl of JHB100, every 32 GPIOs correspond to one register, so =
it uses
> 3-cell #gpio-cells and 4-cell gpio-ranges, which helps simplify the drive=
r code.
>=20
> I referred to this generic implementation:
> https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/gpio/gpiolib-of.=
c#L93
> 6
>=20
> So the content of gpio cells and gpio-ranges is as follows:
> gpios =3D <&gpio [instance] offset flags>; gpio-ranges =3D <&pinctrl [gpi=
o_instance]
> gpio_offset pin_offset count>;
>=20
> I'm not sure whether this error is caused by a mismatch with the definiti=
on in
> schemas/gpio/gpio.yaml:
>=20
> gpio-ranges:
>   $ref: /schemas/types.yaml#/definitions/phandle-array
>   items:
>     items:
>       - description: pin controller phandle
>       - description: GPIO controller offset
>       - description: pin controller offset
>       - description: number of pins
>=20
> Do you have any suggestions for fixing this? Thank you very much.
>=20
> Best Regards,
> Changhuang

For these configurations:
gpios =3D <&gpio [instance] offset flags>;=20
gpio-ranges =3D <&pinctrl [gpio_instance] gpio_offset pin_offset count>;

I tried using spacemit,k1-gpio for comparison. Currently, the gpio-ranges c=
onfiguration under K1 is as follows, and it does not report any errors:

gpio: gpio@d4019000 {
    compatible =3D "spacemit,k1-gpio";
    gpio-ranges =3D <&pinctrl 0 0 0 32>,
                  <&pinctrl 1 0 32 32>,
                  <&pinctrl 2 0 64 32>,
                  <&pinctrl 3 0 96 32>;
};

Then I reduced it by removing one set of entries, changing it to:

gpio: gpio@d4019000 {
    compatible =3D "spacemit,k1-gpio";
    gpio-ranges =3D <&pinctrl 0 0 0 32>,
                  <&pinctrl 1 0 32 32>,
                  <&pinctrl 2 0 64 32>;
};

At this point, I see a similar error:

/linux/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: gpio@d4019000 (spac=
emit,k1-gpio): gpio-ranges:3: [0, 64, 32] is too short
        from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
  DTC [C] arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb

My understanding is that the first configuration has 5=D74 elements, but th=
e dt-schema seems to treat it as 4=D75 elements.=20
In that case, it still aligns with 4 elements per group, so no error is rep=
orted. However, when I changed it to 5=D73 elements,=20
it no longer aligns with 4 elements per group, which is why the error appea=
rs.

I'm not sure if my understanding is correct. Does anyone have any good sugg=
estions=20
on how to fix this error? I'm currently unsure about what the next steps sh=
ould be."

Best Regards,
Changhuang
