Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083132;
	b=jWkkYU8vdh+wgVtSTB7edoAQ7oKp1Cq7bRmPUt/Cql5QL8YCTC5eRu1xLAxTPStmIblf
	 zVKQkMNV3vzLA9jIrDZK8nO4ItwPPb2YeDtEG06F53U4lQ93JbhBDWU/wO5iEcNrQWitK
	 PyohpDYBidnCvBKaGRAgwN2ArQNTk6leIwFiSl18MVq+IDl9uxYhHM4BXm9uRxX0G12lq
	 OLaEpQHlip2RAh3PSZDV6K9eceHLtT6uPQhnAgMM7c8WqhE500OJ06PclmPGNI5PqdJ+I
	 /E93Z6QEm5Y/XgCZ6dvhqMdpVRz4hmjsny2WbuFXg6IPEjVvmm91+6TCZMzXLr6GOxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083132;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=QAZK0eTfXOUwC0t31aKU7yQH9i2StJLCrltg0Ftvua8=;
	b=uUt6zskiG/0s5WruyssdEfsz4ZOfPXt7fYc/7k3zlr/ITNpT/ZW2MWrlUlTdyMCrnYku
	 s6sIPsHl4E4TkVq7IgRvo5sMzavjTZD4E88C7m7Qu/RRvuNPS5+m9XPe4mD4OsT8mBWXA
	 X4rjkDCWXDAztZ3lgUhRLEqjoaHOGCcclZfCn4J0ItfHAv9SDfCkTg6jIzYvwyezE7iwT
	 ZnzlR+6vWpse0bkfX64nZbcHLcNx9Jd05AHz6OYm360Bx1BL4gYmOSyzfnW8rEh/vfMF5
	 SNUnzYhLBBividQHAdA2eFOfuKfAUHPXYUCpuRWTd+FTHkVFEl4EGu8pZQpJZQ3fHCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IKpycJpJ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="jASbZAC/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33EB606A324;
	Thu, 19 Nov 2026 10:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D33EB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IKpycJpJ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=jASbZAC/
ARC-Seal: i=1; a=rsa-sha256; t=1795083115; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=k4LMnF/Pi2O5f+xIrtGBfZElYD8BgAd9E0cpenkvBOAz4HLXjfdd1kFACLtfGNkjeF
    K/8g/WXr1lUivR91JHG9MEyrltmLAYzzs/Fd8Rh3b1+1VTRgdDgBf0ptrqsLg3tb8R2M
    Xwcta5AjhXnLFOSn9FsHRlH6m9bB2VsxQS9BiQAnlNFcJ2v+xfWrPLl8z9J4XcfSNWP+
    omso8CDmy38apETZf/fafjV4jFCkPInBFQ52K1XmFWzvmo2p3dRY7dAWqF+CXYNLi0Zm
    OTAapnFBZSMmyK9B5IAg/ZxruOSTWuxqBQMS4PsQr5zBOS/dEY16jU7Ivq3WYIdxOvTK
    /8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795083115;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=QAZK0eTfXOUwC0t31aKU7yQH9i2StJLCrltg0Ftvua8=;
    b=p2Zajq0vYFkPuWuqTFEbRGgDxH1qakyeEaAPPUVrIcJdYFVfddB6JH/GNvGdRJX18t
    qM8iPXcibq0wYiLFmrMxlNrCUVumPZ1o9UdvY/vE3bUzWUOwM58FcNHTLh4cE5XlIf3g
    CNf4z4fZiy8YP0tgOlyR3hL59cKG5MT7AJp8bog+2DKrV0s1k8zGXFKMfjgXhMHa2i2k
    efQBgDMb36nOdZeZ6qk5TtOID/JT7+8tkHN0vvwlQPN9dimKTouE8twmMiUNj0BuxmN5
    82ega0DPOpaFZ1t6qTS5DzS+GGFIXUQcCRhEyTE1/dIHNHwOVG54fYLs+mDkem4kXp/q
    7lGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795083115;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=QAZK0eTfXOUwC0t31aKU7yQH9i2StJLCrltg0Ftvua8=;
    b=IKpycJpJQISdnWpQd1L5ev3KBLur3/OYQS7sFY0E13z52kZL9s32+MKmstJuJYrBqw
    ZqJptZlyT2Z1Fsl3B5i/WMLUnTB6NeaK7JiHDj6WxCZVW6uRG/IBx0ImRWaNY+kmdfM7
    If0Mz9fWjnXMr8ioFIYjcCJyYlzhohk3p9PVHY46PL0zUFcePf/ZXyz7SPsiP6rFE+kL
    vIW54GJCTLlyniHaWcp5QV7cUHJbmN3LpQwuoKAyrVjFkmlrkJwGyjukJXLxVgXKcstO
    O0omEpn3IV3OMFP9LsueIlyoyZoOn9VG4SQMu18PFv8z6zF+OjSUC9VdRPjh92bGzd0G
    6asQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795083115;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=QAZK0eTfXOUwC0t31aKU7yQH9i2StJLCrltg0Ftvua8=;
    b=jASbZAC/twLCEq8OEZqDe+tKd3TdRfRvqXQq1fPqXc6e1SlkUmjPo0a/Ih+rfBUvWz
    0n1NHIpkHJRHV2M9EQCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrVippbzMiNg6IYaWB/kgKnPFT4xvEDRUsTkpe3"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AJABtgZh
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 19 Nov 2026 11:11:55 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH v4 6/7] pinctrl: ingenic: Handle X2600 Port E Schmitt
 trigger
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <39af3ec5a953dcc1cbada1c53881f8361f63e80e.camel@crapouillou.net>
Date: Thu, 19 Nov 2026 11:11:24 +0100
Cc: Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1906569E-E748-498E-A8AD-479B5D4564A3@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
 <1932f6b68d67badeddcd1d1ec213d2918d877d71.1795022736.git.hns@goldelico.com>
 <39af3ec5a953dcc1cbada1c53881f8361f63e80e.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Paul,

> Am 19.11.2026 um 11:00 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mercredi 18 novembre 2026 =C3=A0 18:25 +0100, H. Nikolaus Schaller =
a =C3=A9crit :
>> Port E has two Schmitt trigger configuration bits per pin.
>> Select the lower-hysteresis mode when enabling and read both bits
>> to report firmware-initialized settings.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  drivers/pinctrl/pinctrl-ingenic.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>=20
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-
>> ingenic.c
>> index 02ebfecf9563a..876e8e9e00c45 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -69,6 +69,7 @@
>>  #define X2000_GPIO_PEPD 0x90
>>  #define X2000_GPIO_SR 0xd0
>>  #define X2000_GPIO_SMT 0xe0
>> +#define X2600_GPIO_SMT1 0x100
>> =20
>>  #define X2600_GPIO_SHADOW_OFFSET 0x800
>>  #define X2600_GPIO_PAGLD (X2600_GPIO_SHADOW_OFFSET +
>> 0xf0)
>> @@ -4697,6 +4698,9 @@ static int ingenic_pinconf_get(struct =
pinctrl_dev
>> *pctldev,
>>   return -EINVAL;
>> =20
>>   arg =3D !!ingenic_get_pin_config(jzpc, pin, reg);
>> + if (is_soc(jzpc, ID_X2600) && offt =3D=3D 4)
>> + arg |=3D !!ingenic_get_pin_config(jzpc, pin,
>> + X2600_GPIO_SMT1);
>=20
> You mis-align it here, then fix it in patch [7/7] in a somewhat =
unrelated patch.

Sometimes my tools have this as an unexpected side-effect. Sorry for not =
recognizing it before.

BR and thanks,
Nikolaus

>=20
> Honestly, you can keep it on one line - the hard limit is 100 chars =
per line
> now, and splitting here does not make the code more readable, on the =
contrary.
>=20
>>   break;
>> =20
>>   case PIN_CONFIG_SLEW_RATE:
>> @@ -4771,6 +4775,11 @@ static void ingenic_set_bias(struct =
ingenic_pinctrl
>> *jzpc,
>>  static void ingenic_set_schmitt_trigger(struct ingenic_pinctrl =
*jzpc,
>>   unsigned int pin, bool enable)
>>  {
>> + /* Port E uses two bits; select the lower-hysteresis Schmitt mode. =
*/
>> + if (is_soc(jzpc, ID_X2600) &&
>> +     pin / PINS_PER_GPIO_CHIP =3D=3D 4)
>=20
> Same here, no need to split.
>=20
> Cheers,
> -Paul
>=20
>> + ingenic_config_pin(jzpc, pin, X2600_GPIO_SMT1, false);
>> +
>>   if (is_soc_or_above(jzpc, ID_X2000))
>>   ingenic_config_pin(jzpc, pin, X2000_GPIO_SMT, enable);
>>   else
> _______________________________________________
> https://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel


