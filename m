Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795082404;
	b=myTxJIG7xH6gV/FdTIvVkTTOWWWdIgw4aZCg0PjiPAEVFVzpGyKlSjdtt7R4clNZLuFj
	 NTKb+qCRqW4S5HnLXR9BypxxWJZNkGAOEapXzKb5g1tolvTVoaHMidq7+GDFjV+pAaSLs
	 gyEBjYddyY7tXQIqvIIPGf7mOCdGpV3elyUXF/h5QvR+PtmrwkmEfbjekFgyPn8ubs+ze
	 jc2W0E1x+uZrgJtm/ZZ1QcuFnx3kizEtLL3yE/7j0tejSCr8lu4Dt0qEXQnlzfWxmbfh4
	 OKYU2PnkP2nOmW0lR8cqIS/bQ+tjy1TK5Q0bfcSMHljRigQsWxOnHjRuhHKB/oL8xkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082404;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=G1ZnVuiB+3B9VlRb31yTEJVTL/MFeZ64BiLcT5FTGlg=;
	b=S7t3OUtLxsKe4xs03XvGItrjgK1V7XGFDPrd/WhEqfag1YcFkEGA+vtUbiPj+sVwrLyY
	 +6Q5M47MpyzFQoMX1H/YLRTkwsVGGzin/G/ldRODQlcJQJBuoe7qFUZ0bJqJepV1EeISW
	 a9fv1ljKsixSt8wO0CBWFqYA2tQ/3KWGWH3rbLPKhkYF3Q/05Fzv4L6b/7b2V/vGk9drW
	 5aTfRxJ4VLKKJsDu3sI/KSF5b5eiMWRMlyC3F1j5yXaZ6j0JrXRFKEspyhA3KjqTsfmP/
	 tVFOwoCcf6+mEj3N9+DAtY5iT97Ryb0h4TjOPZsJG3LKuutdluVA4CJMvEF2YYd3JKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sj9QQgyW;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=3rehU7q9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.54
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C1E606A320;
	Thu, 19 Nov 2026 10:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C1E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sj9QQgyW;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=3rehU7q9
ARC-Seal: i=1; a=rsa-sha256; t=1795082381; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=er2161mt68UQpPagezmqtS/0MbuZF9NRAqGlWASSQBG56cX9BDlV3ccNXL28YeSnV0
    7qPyC0qoiLa/ibBlgOtLSq5CcK+QcA8cN647+YiNpDUbCLzytgXDUsYZ17sWuI0my969
    bqR8o9oRitxgcN2GYUP8rViD0lVeU4w8t034JxzUMaUyCPjzPTUNKFUqW6r7ybRCDlgv
    xxGQeP3+FTnB+AQZS9sUtdcI9yLdR7jd8AJBEW5gzkGiEUtnxY7cR6NAEtRd2gYFAyqm
    zN4Z/lQVQMc7/LduCiEr34epzcK4i+9nrStHKgY3pT8VsN/oQwrCBHjtOfeVtjMqhBS2
    F7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795082381;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=G1ZnVuiB+3B9VlRb31yTEJVTL/MFeZ64BiLcT5FTGlg=;
    b=AyFcwMA72E6bX1TvQgMm/TszsSAtN6ULe+TBWF+odE1jrM4X8nQimiL/Zt3zbeCWI+
    5OTY7AvxPu/hiapLdX3lI8YXgOGY0DOMsOc0sAKXpnoSILq2GanQOZBGHrTygNhtKXzZ
    Ca7cEHt4i0QCY8YGHNgc4pu/ZfRcstplXYl1mJrn6c6gc9rD8e9AgVwnomq0nLsPwL2P
    Pw1QkSNz+41TQemNJVyk0KO52lGnPdm6rFHK9HdMKmCHjgUPso0y7/k2yUlwlaqq8Lwj
    a2uxNcq1hmFF6uAthT/6uF+Zo7yCjlT/FgvO79yNNptsAApN9tsv5YAf0nPKE4TJOn5D
    ypBQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795082381;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=G1ZnVuiB+3B9VlRb31yTEJVTL/MFeZ64BiLcT5FTGlg=;
    b=sj9QQgyWleSDeVApi78N/YBBcmA5UIX6oXXG9M5txaQYqJR+tLKmT4lFbK4kS+5W0q
    An8YpzPbN5KdfvFmw+ey9cXXosUlYAoTgAloQ0TrEFJd36h9VnAjUhimhnWgoBVs3cQ+
    +CVgOA2bsledP4QuCQqBId+S8KsHcEeb76QY4rIi1a9XuRc5PaqoqivLAkM2rAzc6Wq1
    iBGmgBHPmGR4z23c27ybVWnaOdxl8pZfnyOUfBJqN5EmuZwnTT8o9/afDaDOptxIhlW8
    CjVzycuYZrItf5NndDR7JWLFxev1ZaMnymJnR0rxc9x3A+jjPrLmL3GWn1hxa3hnEPml
    mVzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795082381;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=G1ZnVuiB+3B9VlRb31yTEJVTL/MFeZ64BiLcT5FTGlg=;
    b=3rehU7q9x3s0HQfE3HnJIFexLN6onjAX65hcpGd+uTN1L7qGDFlNb2leRtHYDuraX1
    CpKd6aFMf5LQPfnX33DA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrVippbzMiNg6IYaWB/kgKnPFT4xvEDRUsTkpe3"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AJ9xfgUJ
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 19 Nov 2026 10:59:41 +0100 (CET)
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
Subject: Re: [PATCH v4 4/7] pinctrl: ingenic: Add X2600 register and GPIO IRQ
 support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <d24f63f3baf1488269b092af6147717510372e61.camel@crapouillou.net>
Date: Thu, 19 Nov 2026 10:59:10 +0100
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
Message-Id: <CC314F81-FBFE-4137-B332-99DB7E52109E@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
 <57c9892c8e1c34308c18ef07bc007dc9506d6e04.1795022736.git.hns@goldelico.com>
 <d24f63f3baf1488269b092af6147717510372e61.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Paul,

> Am 19.11.2026 um 10:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mercredi 18 novembre 2026 =C3=A0 18:25 +0100, H. Nikolaus Schaller =
a =C3=A9crit :
>> Support the X2600 GPIO register layout with a 0x1000 bank stride,
>> per-port shadow registers and load registers. The GPIO interrupt
>> acknowledgement uses the existing JZ4770 flag-clear register path.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> I'm close to ACK this but I think the patchset overall needs a v5 (for =
a few
> things I see in the following patches) so I added one small nit below.
>=20
> I only reviewed the first half of the v3 yesterday, and didn't get to =
review the
> second half that you already had sent the v4 :)

Ok, I am also happy to have a little more time for the v5. It was =
basically because Sashiko-bot
did respond within minutes...

>=20
>> ---
>>=20
>> Notes:
>>     Changes V4:
>>     - Simplify the GPIO port index used for the legacy global =
shadow-load
>> register.
>>       (suggested by Paul Cercueil)
>>=20
>>  drivers/pinctrl/pinctrl-ingenic.c | 49 =
++++++++++++++++++++++++-------
>>  1 file changed, 39 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-
>> ingenic.c
>> index 7f65f3abf05f5..981789e468ac5 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -70,6 +70,9 @@
>>  #define X2000_GPIO_SR 0xd0
>>  #define X2000_GPIO_SMT 0xe0
>> =20
>> +#define X2600_GPIO_SHADOW_OFFSET 0x800
>> +#define X2600_GPIO_PAGLD (X2600_GPIO_SHADOW_OFFSET +
>> 0xf0)
>> +
>>  #define REG_SET(x) ((x) + 0x4)
>>  #define REG_CLEAR(x) ((x) + 0x8)
>> =20
>> @@ -114,6 +117,7 @@ enum jz_version {
>>   ID_X1600,
>>   ID_X2000,
>>   ID_X2100,
>> + ID_X2600,
>>  };
>> =20
>>  struct ingenic_chip_info {
>> @@ -164,7 +168,8 @@ static const unsigned long enabled_socs =3D
>>   IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
>>   IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
>>   IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
>> - IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
>> + IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100 |
>> + IS_ENABLED(CONFIG_MACH_X2600) << ID_X2600;
>> =20
>>  static bool
>>  is_soc(const struct ingenic_pinctrl *jzpc, enum jz_version version)
>> @@ -3549,15 +3554,21 @@ static void =
ingenic_gpio_shadow_set_bit(struct
>> ingenic_gpio_chip *jzgc,
>>   else
>>   reg =3D REG_CLEAR(reg);
>> =20
>> - regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
>> - jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>> X2600_GPIO_SHADOW_OFFSET + reg,
>> +      BIT(offset));
>> + else
>> + regmap_write(jzgc->jzpc->map, REG_PZ_BASE(jzgc->jzpc->info-
>>> reg_offset) + reg,
>> +      BIT(offset));
>>  }
>> =20
>>  static void ingenic_gpio_shadow_set_bit_load(struct =
ingenic_gpio_chip *jzgc)
>>  {
>> - regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(
>> - jzgc->jzpc->info->reg_offset),
>> - jzgc->gc.base / PINS_PER_GPIO_CHIP);
>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>> X2600_GPIO_PAGLD, 1);
>> + else
>> + regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(jzgc->jzpc->info-
>>> reg_offset),
>> +      jzgc->gc.base / PINS_PER_GPIO_CHIP);
>>  }
>> =20
>>  static void jz4730_gpio_set_bits(struct ingenic_gpio_chip *jzgc,
>> @@ -3852,16 +3863,34 @@ static inline void =
ingenic_shadow_config_pin(struct
>> ingenic_pinctrl *jzpc,
>>   unsigned int pin, u8 reg, bool set)
>>  {
>>   unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
>> + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
>> +
>> + if (set)
>> + reg =3D REG_SET(reg);
>> + else
>> + reg =3D REG_CLEAR(reg);
>> =20
>> - regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
>> - (set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
>> + if (is_soc_or_above(jzpc, ID_X2600)) {
>> + u32 target_reg =3D (offt * jzpc->info->reg_offset) +
>> X2600_GPIO_SHADOW_OFFSET + reg;
>> +
>> + regmap_write(jzpc->map, target_reg, BIT(idx));
>> + } else {
>> + regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
>> reg, BIT(idx));
>=20
> I'd write
>=20
> if (is_soc_or_above(jzpc, ID_X2600))
>    reg_base =3D (offt * jzpc->info->reg_offset) + =
X2600_GPIO_SHADOW_OFFSET;
> else
>    reg_base =3D REG_PZ_BASE(jzpc->info->reg_offset);
>=20
> reg =3D set ? REG_SET(reg) : REG_CLEAR(reg);
>=20
> regmap_write(jzpc->map, reg_base + reg, BIT(idx));

Yes, this looks much better to read and understand and separates base =
address
calculation from setting the bit.

>=20
> Cheers,
> -Paul

BR and thanks,
Nikolaus


>=20
>> + }
>>  }
>> =20
>>  static inline void ingenic_shadow_config_pin_load(struct =
ingenic_pinctrl
>> *jzpc,
>>   unsigned int pin)
>>  {
>> - regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset),
>> - pin / PINS_PER_GPIO_CHIP);
>> + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
>> +
>> + if (is_soc_or_above(jzpc, ID_X2600)) {
>> + u32 target_load_reg =3D (offt * jzpc->info->reg_offset) +
>> X2600_GPIO_PAGLD;
>> +
>> + regmap_write(jzpc->map, target_load_reg, 1);
>> + } else {
>> + regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info-
>>> reg_offset), offt);
>> + }
>>  }
>> =20
>>  static inline void jz4730_config_pin_function(struct ingenic_pinctrl =
*jzpc,
> _______________________________________________
> https://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel


