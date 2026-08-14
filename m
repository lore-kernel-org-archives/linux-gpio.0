Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C820D4E9;
	Fri, 14 Aug 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690051; cv=none; b=LvBjHv9nrYR6jXe7cCYnn1PuFyz+QZc089gq85BVvSW/jf2upX7/6aDGFVc5GO8IzjVIeVVb4jWZGcmnQcIN69QAG6yPGwbwJ9vMKghzgAatjXk+SVvR7UUWiEXGWVJpUK3z0MYZsmbG4QjaA1QuU6znmt0ZBCJjqrZOEGsPPn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690051; c=relaxed/simple;
	bh=6kZp8TnIZyNENX0HqrTJRtmoZ59RD1MltvlATYkGsJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Njnzy7v40ZWOWMU8bORHZnipGYiDaixMwjivL1Pju6iv9suwZV7mYYC5r9PO6wAPdWaGm3MQhrSS8B2JMbNuWspeEQ+8c75enyOHiYO2FDgSX1CHG4khabp3o087UhN1ImOg/MGFT1cf+xo7/l6sw6oWPtUUcoEDSm6gJMXhIUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhuKPC1w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhuKPC1w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AC01F000E9;
	Fri, 14 Aug 2026 06:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786690050;
	bh=e660rBWN+6D6cgSDGlpQuKSob4piABKKiJyOTAYdW0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhuKPC1whUbjpagYtEIuWb9fTvl5K8C+u9aJZP0TrxAIlgaEkL6rFec5/KvDbBzPR
	 VpuwRetC92VUNQ8PfAFClQntRxO5hFstzeKUNKJoArEkj2Q7m4/13PU/qBn+ENc6pb
	 wBT8uIf8oagIJOIJzbFtYZO1atBEvjQuqqh5jaySwJKmIszpqWcNZOePcfzvi/BCDU
	 CsNVdFWDMcaclUFcmS/PUUL4o7Ns4IoUEGlNskvcltGaeca+t9sC8R7OKApmbPh1L7
	 YvaDu1Dsw75lRMgN0oz7wiHfza1/A7oSbUlteGwyflX3Ap3OvNy5Hu06VVh+H+sxzX
	 UYjgOWb9T5arg==
Date: Fri, 14 Aug 2026 08:47:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Alexandre Ghiti <alex@ghiti.fr>, Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260814-shapeless-onyx-pronghorn-d423a9@quoll>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org>
 <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>

On Fri, Aug 14, 2026 at 01:46:03AM +0000, Changhuang Liang wrote:
> Hi, Rob, Conor, Linus
>=20
> > HI, Rob
> >=20
> > Thanks for the review.
> >=20
> > > On Mon, Aug 10, 2026 at 09:51:07AM +0000, Changhuang Liang wrote:
> > > > Hi, Rob
> > > >
> > > > > On Sun, 09 Aug 2026 23:36:32 -0700, Changhuang Liang wrote:
> > > > > > Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0)
> > > > > > pinctrl controller.
> > > > > >
> > > > > > Signed-off-by: Changhuang Liang
> > > > > > <changhuang.liang@starfivetech.com>
> > > > > > ---
> > > > > >  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164
> > > ++++++++++++++++++
> > > > > >  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
> > > > > >  2 files changed, 181 insertions(+)  create mode 100644
> > > > > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-p
> > > > > > in
> > > > > > ctrl
> > > > > > .yaml  create mode 100644
> > > > > > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > > > >
> > > > >
> > > > > My bot found errors running 'make dt_binding_check' on your patch:
> > > > >
> > > > > yamllint warnings/errors:
> > > > >
> > > > > dtschema/dtc warnings/errors:
> > > > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pin
> > > > > ct
> > > > > rl.exa
> > > > > mple.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl):
> > > > > gpio-ranges:1: [4] is too short
> > > > > 	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
> > > > >
> > > > > doc reference errors (make refcheckdocs):
> > > > >
> > > > > See
> > > > > https://patchwork.kernel.org/project/devicetree/patch/202608100636
> > > > > 50
> > > > > .23 9303-4-changhuang.liang@starfivetech.com
> > > > >
> > > > > The base for the series is generally the latest rc1. A different
> > > > > dependency should be noted in *this* patch.
> > > > >
> > > > > If you already ran 'make dt_binding_check' and didn't see the
> > > > > above error(s), then make sure 'yamllint' is installed and
> > > > > dt-schema is up to
> > > > > date:
> > > > >
> > > > > pip3 install dtschema --upgrade
> > > > >
> > > > > Please check and re-submit after running the above command yourse=
lf.
> > > > > Note that DT_SCHEMA_FILES can be set to your schema file to speed
> > > > > up checking your schema. However, it must be unset to test all
> > > > > examples with your schema.
> > > >
> > > > Hi Rob,
> > > >
> > > > Regarding this link:
> > > >
> > >
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schema
> > > s
> > > > /gpio/gpio.yaml#L71
> > > >
> > > > It seems that the configuration to support #gpio-cells =3D <3>; has
> > > > not been
> > > added here yet, is that correct?
> > >
> > > Shrug. Based on the description, gpio-ranges doesn't depend the # of =
cells.
> > >
> > > Why do you need 3 cells? You haven't described the cell content.
> >=20
> > For the pinctrl of JHB100, every 32 GPIOs correspond to one register, s=
o it uses
> > 3-cell #gpio-cells and 4-cell gpio-ranges, which helps simplify the dri=
ver code.
> >=20
> > I referred to this generic implementation:
> > https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/gpio/gpiolib-o=
f.c#L93
> > 6
> >=20
> > So the content of gpio cells and gpio-ranges is as follows:
> > gpios =3D <&gpio [instance] offset flags>; gpio-ranges =3D <&pinctrl [g=
pio_instance]
> > gpio_offset pin_offset count>;
> >=20
> > I'm not sure whether this error is caused by a mismatch with the defini=
tion in
> > schemas/gpio/gpio.yaml:
> >=20
> > gpio-ranges:
> >   $ref: /schemas/types.yaml#/definitions/phandle-array
> >   items:
> >     items:
> >       - description: pin controller phandle
> >       - description: GPIO controller offset
> >       - description: pin controller offset
> >       - description: number of pins
> >=20
> > Do you have any suggestions for fixing this? Thank you very much.
> >=20
> > Best Regards,
> > Changhuang
>=20
> For these configurations:
> gpios =3D <&gpio [instance] offset flags>;=20
> gpio-ranges =3D <&pinctrl [gpio_instance] gpio_offset pin_offset count>;
>=20
> I tried using spacemit,k1-gpio for comparison. Currently, the gpio-ranges=
 configuration under K1 is as follows, and it does not report any errors:
>=20
> gpio: gpio@d4019000 {
>     compatible =3D "spacemit,k1-gpio";
>     gpio-ranges =3D <&pinctrl 0 0 0 32>,
>                   <&pinctrl 1 0 32 32>,
>                   <&pinctrl 2 0 64 32>,
>                   <&pinctrl 3 0 96 32>;
> };
>=20
> Then I reduced it by removing one set of entries, changing it to:
>=20
> gpio: gpio@d4019000 {
>     compatible =3D "spacemit,k1-gpio";
>     gpio-ranges =3D <&pinctrl 0 0 0 32>,
>                   <&pinctrl 1 0 32 32>,
>                   <&pinctrl 2 0 64 32>;
> };
>=20
> At this point, I see a similar error:
>=20
> /linux/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: gpio@d4019000 (sp=
acemit,k1-gpio): gpio-ranges:3: [0, 64, 32] is too short
>         from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
>   DTC [C] arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb
>=20
> My understanding is that the first configuration has 5=C3=974 elements, b=
ut the dt-schema seems to treat it as 4=C3=975 elements.=20
> In that case, it still aligns with 4 elements per group, so no error is r=
eported. However, when I changed it to 5=C3=973 elements,=20
> it no longer aligns with 4 elements per group, which is why the error app=
ears.
>=20
> I'm not sure if my understanding is correct. Does anyone have any good su=
ggestions=20
> on how to fix this error? I'm currently unsure about what the next steps =
should be."

You still did not explain the cells - neither in reply nor in commit -
thus start with that. Why do you need it? Multiple controllers have
groupped pins or GPIOs in registers, so explanation "every 32 GPIOs
correspond to one register" tells me nothing. Why would that matter how
many GPIOs is in one register?

Best regards,
Krzysztof

