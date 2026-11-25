Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618605;
	b=vuTgdCWrIwMKhlbfXIAwPgGnIOanmD9nDOVg8tlEwPWRzdmw2fq5zaXTsCi6POgyZrFr
	 QMRwAEF8YhSyT7TbdFSsjufS/WiZhXCUVVbWHpIgpkjOaAGCRNzx30EbNujfLFRAH0RhA
	 jEuDf+/zLXpeURDned67BQlfOIo2MTi7/FAuFYV0GFcBIywePyoVxTdYOrklOkNBOGy1f
	 hLubCZqJycXWN8b3ylABYJ/j0A4P9EP576xAi2uUybqIz3Jr0b1El+BZpn1URQ5EzeSox
	 W2YnHlKRIt21g7sQdOV+iMX0I/1+Lph7c1WaZ4gPTbK4ymCKe/t1SNSUZZT1EcYArOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618605;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=MI4OKQismbXKL6uyZV+4cscz1JHjyMMOGYJJlaT3/4A=;
	b=wilxs+/vAcUb7FpW27g/aHTKFpWQgwwapbez3i8wSE0ZFoEKj8JkfrVyCVyd52hOl1Xt
	 o/+clBokwBjiQ/cyIoCQMHVu6+/q0LQdtdbZKBRmaakQ47lb+GI2BptDxryfmGFJ57VmS
	 o515CXeOMC0Y9uIXdVDfFf0dJnDl3EsdUwe1JAVROixIGGGz87YY5nif8SkCnyppTUkML
	 2ag4b2UoIw+ao5ZFnCw6aLV+qoWmsKp1K8VvO1aXXLj8BuubcS+fl69wFfg2ejJ3Jvpe1
	 Ous5KGDaTJRPHOjqfJcprLgQH79XjlS0RlK5mTsabUARN206kI/WfNpeYPqx/hX9DyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1658606A31E;
	Wed, 25 Nov 2026 14:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1658606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <1a6496e133cdc2477931cbc2f95f3c647093b040.camel@crapouillou.net>
Subject: Re: [PATCH v5 6/7] pinctrl: ingenic: Handle X2600 Port E Schmitt
 trigger
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski	 <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Wed, 25 Nov 2026 15:56:39 +0100
In-Reply-To: <D50BEB61-6E7B-40A8-BF1C-E69F7A49E644@goldelico.com>
References: <cover.1795589383.git.hns@goldelico.com>
	 <ec49e1a7da313c8dfe012c17a04d03dc4167ee2a.1795589383.git.hns@goldelico.com>
	 <a61b9a24e0eaf8240933ad2433e6f1c00855b683.camel@crapouillou.net>
	 <D50BEB61-6E7B-40A8-BF1C-E69F7A49E644@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
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

Le mercredi 25 novembre 2026 =C3=A0 15:51 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
> Hi Paul,
>=20
> > Am 25.11.2026 um 15:34 schrieb Paul Cercueil <paul@crapouillou.net>:
> >=20
> > Le mercredi 25 novembre 2026 =C3=A0 07:49 +0100, H. Nikolaus Schaller a=
 =C3=A9crit :
> > > Port E has two Schmitt trigger configuration bits per pin.
> > > Select the lower-hysteresis mode when enabling and read both bits
> > > to report firmware-initialized settings.
> > >=20
> > > Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >=20
> > Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> >=20
> > With one question below.
> >=20
> > > ---
> > >=20
> > > Notes:
> > > =C2=A0=C2=A0=C2=A0 Changes V5:
> > > =C2=A0=C2=A0=C2=A0 - Keep the ingenic_get_pin_config() call and the P=
ort E
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 condition on single lines, as suggeste=
d by Paul Cercueil.
> > >=20
> > > =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 7 +++++++
> > > =C2=A01 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinc=
trl-
> > > ingenic.c
> > > index 88531d472cd2e..d253674accacd 100644
> > > --- a/drivers/pinctrl/pinctrl-ingenic.c
> > > +++ b/drivers/pinctrl/pinctrl-ingenic.c
> > > @@ -69,6 +69,7 @@
> > > =C2=A0#define X2000_GPIO_PEPD 0x90
> > > =C2=A0#define X2000_GPIO_SR 0xd0
> > > =C2=A0#define X2000_GPIO_SMT 0xe0
> > > +#define X2600_GPIO_SMT1 0x100
> > > =C2=A0
> > > =C2=A0#define X2600_GPIO_SHADOW_OFFSET 0x800
> > > =C2=A0#define X2600_GPIO_PAGLD (X2600_GPIO_SHADOW_OFFSET +
> > > 0xf0)
> > > @@ -4693,6 +4694,8 @@ static int ingenic_pinconf_get(struct pinctrl_d=
ev
> > > *pctldev,
> > > =C2=A0 return -EINVAL;
> > > =C2=A0
> > > =C2=A0 arg =3D !!ingenic_get_pin_config(jzpc, pin, reg);
> > > + if (is_soc(jzpc, ID_X2600) && offt =3D=3D 4)
> > > + arg |=3D !!ingenic_get_pin_config(jzpc, pin,
> > > X2600_GPIO_SMT1);
> > > =C2=A0 break;
> > > =C2=A0
> > > =C2=A0 case PIN_CONFIG_SLEW_RATE:
> > > @@ -4767,6 +4770,10 @@ static void ingenic_set_bias(struct ingenic_pi=
nctrl
> > > *jzpc,
> > > =C2=A0static void ingenic_set_schmitt_trigger(struct ingenic_pinctrl =
*jzpc,
> > > =C2=A0 unsigned int pin, bool enable)
> > > =C2=A0{
> > > + /* Port E uses two bits; select the lower-hysteresis Schmitt mode. =
*/
> > > + if (is_soc(jzpc, ID_X2600) && pin / PINS_PER_GPIO_CHIP =3D=3D 4)
> > > + ingenic_config_pin(jzpc, pin, X2600_GPIO_SMT1, false);
> >=20
> > So on port E it will configure both X2600_GPIO_SMT1 and X2000_GPIO_SMT?
>=20
> Yes because the X2600 just adds one additional register SMT1 and I think
> it is not necessary to introduce a separate name and code for X2600_GPIO_=
SMT.
> And naming it X2000_GPIO_SMT1 would be wrong. So it is a compromise.

The register name is fine. I just wanted to make sure that it was correct t=
hat
ingenic_config_pin() is called twice.

-Paul
