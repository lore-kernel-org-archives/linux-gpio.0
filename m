Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989661;
	b=WreYZIYwUcyUAeo+VyK7HLuwz2uY0ZjKP/3TeG8hwl73lCjf/gLIwCqXXw1um0YoOsfa
	 OZzIZpGchdKOyx2CUs/FY3a2q02TeLghHbPjuum7LGxz6N1XzWiznGmPb1YI5YOqFR9jW
	 m0LhYwfoEyVbLJhot8GjamBAO99cDA4F2SlT9nyJ6+RiJPrBTSuG6N0JAvYP/IksqdVu0
	 DYjkRdKT7ux/8r8jCoV3lfNzGV4QQnQXfyQcnT79d+YHPx5kzl+DRs2gVVwdJ46C4F7Bf
	 fSUXe/rczz/eX++/7ab/w/O+fBLIiyKGo95SYcemFW8oq1SWEvzBKTsyAhrZPZE1O5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989661;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WlCEZESfOmb1UfVHdqxtpBorzwyZKIs/pd0KVUd31AM=;
	b=xIOFkIWsl+1TIX8RJ8zIW7AfyyPrxJlpG/+7wptHSUm/1wRp6S2Ylz8x84NzdD9bOiyU
	 ZBy/mKyaJ7pK40zWnfW7z9SLSD92hq8QeP1M3KNLWEn+tc2sw10V5jxYHsd7JtWGtgSvh
	 HEvcCqQB39+tCF7eFPJMy3dHHSLlNHeYy4CqN0sjglNLQAokw+SZ1msE5NSLzx29EV6EC
	 6NHUTMOqBr8gAWVx+4qh/mit95GGIsj0NXNNtOkqcJMsus0nBXHvLiyMnt9d6QpchbQ2Q
	 AjZBPZ6VIGq1QiNPoq7RuuaK69iXKflpNz9vANGC2aC4irViEoDfXp74CrGgpayilEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=E9qNzqww;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DC2606A326;
	Fri,  6 Nov 2026 18:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DC2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=E9qNzqww
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793989657; x=1794248857;
	bh=WlCEZESfOmb1UfVHdqxtpBorzwyZKIs/pd0KVUd31AM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E9qNzqwwcOgulpKnm8UeZTapr25+17D4M0OrhVFDD9j3tHAReSmVCqXse2fl+FYRZ
	 J/cFTZ5BYxkZ5bFAWhlLzWzoM3QDuIG6ChC45tsSbYgngi0EzV46icCs1zCzLOnsOX
	 sfnBhu4xEROtX7Kd4SMG/LuHhsi4TFZ7hchLQTdWK7LJ3c7tjoeWBadGVvyfglSvUA
	 AexL7vsYkFkAQHFHNS4hnwqXm2pylPMdhbAxA3tp6CHRKLDMWi4fCjuaRDwVrV4WEA
	 HO4xk2I6aU4Y0UacfLTrlm122o87rAmLlViiiAv/SEdKSquC0QVMlQsnP/3DPifauq
	 LzHaaP9kBEnYg==
Date: Fri, 06 Nov 2026 18:27:32 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,tlmm-common: Add wakeup-enable
Message-ID: <0orir54c0rbF6-ZvpZq9hVVwLOMN02Et6AtRxRh3DU_DbJ_dwkDo3PFVFftKlaDI2IGdFsZdH-olYFZHn_5AA4U03M0-uV_e5UUtnXQIHg4=@pm.me>
In-Reply-To: <20261020-delicate-serval-of-fruition-fe0cb8@quoll>
References: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com> <20261015-tlmm_wakeup_gpio_support-v1-1-c6d6f37a7e51@oss.qualcomm.com> <20261020-delicate-serval-of-fruition-fe0cb8@quoll>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: a845e39c3a4ac81e44bf1ebf3626e10ae16b1ca9
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 20th, 2026 at 2:19 AM, Krzysztof Kozlowski <krzk@kernel=
.org> wrote:

> On Thu, Oct 15, 2026 at 07:52:59PM +0530, Mohammad Rafi Shaik wrote:
> > The TLMM can gate whether a toggle of a pad is transferred to the wake =
up
> > controller (PDC/MPM) while the system is in a low power mode. The pinct=
rl
> > driver arms this for pins it requests as GPIO interrupts, but that path
> > takes over the pin mux, so it cannot be used for a pin that has to stay
> > muxed to a peripheral function.
> >
> > Such a pin exists on boards with a SoundWire codec: while the bus is cl=
ock
> > stopped the codec requests a wake up by toggling the SoundWire data lin=
e,
> > which is muxed to the SoundWire function and not to GPIO. Unless the pa=
d is
> > armed, the toggle never reaches the wake up controller, the controller =
is
> > never resumed and the event - a headset insertion, for instance - is lo=
st
> > until something else happens to wake the bus.
> >
> > Add a pin configuration property so such a pin can be armed from its ow=
n
> > pin configuration, without being turned into a GPIO.
> >
> > Assisted-by: Claude Opus 5
> > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.co=
m>
> > ---
> >  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml        | 12 ++++=
++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common=
.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> > index aec72e8c0..95f539611 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> > @@ -87,6 +87,18 @@ $defs:
> >        output-high: true
> >        output-low: true
> >
> > +      wakeup-enable:
>=20
> As Sashiko points, there is no such generic property.
>=20
> Anyway, the wekeup is per device rather. Arming a pin would be different
> sleep function, no?

Heads up this also appears to be needed outside of sleep, was looking at NF=
C
enablement on the Nothing Phone (3a) and left out clock from DT since MGPI
is meant to handle CLK_REQ and enable relevant clock, but MGPI does not
work unless the wakeup_enable bit is set on the pin.

>=20
> Best regards,
> Krzysztof
>=20
>=20
> 
