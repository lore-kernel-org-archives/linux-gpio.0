Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795618334;
	b=lEldDsPrlbe1kDE7JetKftJiIiRX37hxU8d/AgCISXVMwsmlSo5cg/sdExok5cb/mwwK
	 dNkuS+Q3CjJWQSk/NhIaDSlin1kFFH8sITYvltoxkWf+vSMD5pRW2fn4JcqaPzrtosJjB
	 v6agEv9FIpexGQtcNOcwXctDUb102oRRC2shXrfVfvyCg5gfDUMwr2Ocv3P7Nuj3DP7p9
	 QaRZ2RSN8ne5jHFVYgzJO67E+2Bq7oueHxVMJpurB09sk/Ir/t43a7fb/Hp2iutUpsv+U
	 3ix/5ddRA1Xde3l9WkFTfp3m9YjijIjZJ0lOxjis3qhsOTTk9a8zSoEu1OdGd/y2yGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618334;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=zr0M3uU5NRhzf91qOL1hNvZmgH3NG0m3k3/M7IPG5p8=;
	b=lEbH1lwd13WJQUeAutyaD5uVTxVPnO/mBbWHyqfuZNMD2JLqA+gkQDHX+X7xxHwpm7Zq
	 8vye09GzaCOJocvA9kTqe2qBMmwzoctNCUEHp2qshhrmv6P9LNeaquzFvmdikaR/YcxcF
	 mjy4DBqpj2IfTmHnu/wUczC1qEnpn3vgNUdcYJ+WT0yq4b3q8mMl7Uc1Ys2YX4tJ2rnPK
	 abpkLT4o16T3ahUzVcytzx8WyUlcRstjoj1RuFWWh74Qrl5j7R5GvHtSc+h3uxCILXqwI
	 hZj1SWV3QtlqjoLa+4/J9omOA52Dq6XRn9HKiuG3ocblxm0ZSVsWXoLZJJ5i1bFZgKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SivUKT6F;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=O5rE26o5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.50
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1490B606A31E;
	Wed, 25 Nov 2026 14:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1490B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SivUKT6F;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=O5rE26o5
ARC-Seal: i=1; a=rsa-sha256; t=1795618313; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XBXTQOYD74D+6qv65WkcZqtzLoRsPgBwAk3TxexhKb8XrS1372Ul4wcAQYkq4OChfI
    7H+D8A4Rm0APLVmdEv0FwE6RGqoXU9U6Sw2iLx9qIYMKlbmX7tEFf0PwM//ESGpD2dLS
    dAAjuKEEg6QZuFokWwrlcl9HTOQDGvnqk1qTZJ79VXxGH3Ba5R8Xjyf8d25aTtNAMXGF
    i+664AvamMIOLjPJV4M5p+G41RwcUYkOv2o92FiBEjm2toep73xP1wtLw6+zsg6DZgWE
    hRv58u40sToVLY5PD3NtkZNXhtWIfzL4eHs20Vyi+teh5c9mFU367fPVeQiXZ98xPVQR
    IHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795618313;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=zr0M3uU5NRhzf91qOL1hNvZmgH3NG0m3k3/M7IPG5p8=;
    b=tHciZu74TQYhjWp527L0bFVHIMssPhcGloXMsAXRzntOqPUbfd4kTQ9w+auoLKOcL7
    1fgdER46C42VRugYevzlTexLj7eSZJgYsKy/cB8YrD2aIgBKigLy8iE7+RQ5/p2+1LM2
    kpBETmQ34gGjGlwJlpv41RsEZ34uZCwIcYeJAAlLB76br2+/Uw5ToAxGRt0fkwrC8KBk
    sh+d+ztr2RmNSYI2M4Cz7GRBdYA9jVos5z5GuSbeeq5CAQB4O49M5ZKcQ5Q0NKWCaUYo
    l1DEAt8ttuRvWXjqsJkHZ03wicg6kF61nBYsItrW0MxGRS861fSQbOvRUIxskZazJjVf
    sj9A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795618313;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=zr0M3uU5NRhzf91qOL1hNvZmgH3NG0m3k3/M7IPG5p8=;
    b=SivUKT6FEf1V6L53128tm1q6G9h9SA0xHSxLTn42BmrkGxZE8D+aEoEfQ2z5VqNzbO
    xQiLNlcrl1TpjQf3AKiwVQ/vGYpRkmZe1gmh7YKwTz9V2vdufd1oC/l13wyX4Mvn4PXl
    UeHCAtV2G7700quuPvZBOnuafBcjBsIfomVTiwN4VDbokSXpjU+UPTUorplvVZMPnklH
    w/9jITO9ww+mO5Z2+8mdQ/nRlTNihkH2glFyolHtqkykkfNH8gXixHACB4M1O/89XYWN
    VVWgGuBdHMtsqhwj+FiwlJ8+TT3uvzWUUG9qh3efBnQdVp4ipIgVFDX4EPvI3I1PIAEC
    ST2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795618313;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=zr0M3uU5NRhzf91qOL1hNvZmgH3NG0m3k3/M7IPG5p8=;
    b=O5rE26o5JSh/GYdRO/L/WIk5e8QfgRM0+MTLaRFRD9K/2teUnFqAEP1v3naTh4BwR3
    13R+V/6zqjdQ4pOCsvAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS25oMlMiNMn5e/Npe6SVDIvzG+5uG4p/zkDZq"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22APEpq9RX
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 25 Nov 2026 15:51:52 +0100 (CET)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.11\))
Subject: Re: [PATCH v5 6/7] pinctrl: ingenic: Handle X2600 Port E Schmitt
 trigger
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <a61b9a24e0eaf8240933ad2433e6f1c00855b683.camel@crapouillou.net>
Date: Wed, 25 Nov 2026 15:51:21 +0100
Cc: Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D50BEB61-6E7B-40A8-BF1C-E69F7A49E644@goldelico.com>
References: <cover.1795589383.git.hns@goldelico.com>
 <ec49e1a7da313c8dfe012c17a04d03dc4167ee2a.1795589383.git.hns@goldelico.com>
 <a61b9a24e0eaf8240933ad2433e6f1c00855b683.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.11)

Hi Paul,

> Am 25.11.2026 um 15:34 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Le mercredi 25 novembre 2026 =C3=A0 07:49 +0100, H. Nikolaus Schaller =
a =C3=A9crit :
>> Port E has two Schmitt trigger configuration bits per pin.
>> Select the lower-hysteresis mode when enabling and read both bits
>> to report firmware-initialized settings.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>=20
> With one question below.
>=20
>> ---
>>=20
>> Notes:
>>     Changes V5:
>>     - Keep the ingenic_get_pin_config() call and the Port E
>>       condition on single lines, as suggested by Paul Cercueil.
>>=20
>>  drivers/pinctrl/pinctrl-ingenic.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>=20
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-
>> ingenic.c
>> index 88531d472cd2e..d253674accacd 100644
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
>> @@ -4693,6 +4694,8 @@ static int ingenic_pinconf_get(struct =
pinctrl_dev
>> *pctldev,
>>   return -EINVAL;
>> =20
>>   arg =3D !!ingenic_get_pin_config(jzpc, pin, reg);
>> + if (is_soc(jzpc, ID_X2600) && offt =3D=3D 4)
>> + arg |=3D !!ingenic_get_pin_config(jzpc, pin,
>> X2600_GPIO_SMT1);
>>   break;
>> =20
>>   case PIN_CONFIG_SLEW_RATE:
>> @@ -4767,6 +4770,10 @@ static void ingenic_set_bias(struct =
ingenic_pinctrl
>> *jzpc,
>>  static void ingenic_set_schmitt_trigger(struct ingenic_pinctrl =
*jzpc,
>>   unsigned int pin, bool enable)
>>  {
>> + /* Port E uses two bits; select the lower-hysteresis Schmitt mode. =
*/
>> + if (is_soc(jzpc, ID_X2600) && pin / PINS_PER_GPIO_CHIP =3D=3D 4)
>> + ingenic_config_pin(jzpc, pin, X2600_GPIO_SMT1, false);
>=20
> So on port E it will configure both X2600_GPIO_SMT1 and =
X2000_GPIO_SMT?

Yes because the X2600 just adds one additional register SMT1 and I think
it is not necessary to introduce a separate name and code for =
X2600_GPIO_SMT.
And naming it X2000_GPIO_SMT1 would be wrong. So it is a compromise.

BR and thanks,
Nikolaus

