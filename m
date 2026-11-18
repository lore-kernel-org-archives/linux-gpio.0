Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.164
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794993542;
	b=hsil2xgrKgHOS7rXzLv8GDEXe0uK0W4rrfHolqMAsLxxCKKFU8vP+XsvJU+Rv6l0fZT1
	 HZ080Ta11MEV8b7TDaVbpmoGXG6vLSwTLific1pOftNbW1S5QYkkQu8otp0ZzeHjTYN7P
	 g6pLSdz2Mxj9njTmWFixapn61kp45r92ZYKBPPIym4afkb08EDRhaVVlEWpbvcGIcaS4f
	 YeCdebAR2OTh8otSnZKUmO87wa/498lz0CCRQvNMY+zsTuhYEa0hPKr9aHlRXk/UqAWrH
	 QVh3WWvibZ+/O9ov6/4d11AMnuwzPLGE5IxW40D2jH1uzC5iOp1rVQCja2f+RR8jzEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993542;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=8+C6tOb/Dl8Of9BB5bsesi1tsKmLxRThu6jLT9pRQjk=;
	b=M87unNwuUdRnAAPhe+Zn00tGSShxsIvRIuyWO7FKUfR/42TvYr0GupB2Et2JNQLgvotj
	 eOVhl+r/4BXGeLTY6FUIZrkvLJau2pXM29genmBU/1sKGfhYPZJD9bd0boA6I418WySte
	 ymfEmstW8NOQReonZ/bf+aM7N7zeqiVxOFi9M/ChJC8HC4C1jTswb/2fOQFIVOuVdL/As
	 4AjyIWdHheniS5HrPzBjHbMZHKnxR50H6F+7olnnkNLhmejtG9Oern2+8cm9MPggg7tQo
	 gv0jkqvNxIov+gQuu3Ffk6f4EfPxj0sqC2Ie+/jkQSD2iumHQuW+1Rq8KNmyDceoBTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Gg6TFruz;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=kJNpSSek;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.164
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02059606A31C;
	Wed, 18 Nov 2026 09:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02059606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Gg6TFruz;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=kJNpSSek
ARC-Seal: i=1; a=rsa-sha256; t=1794993519; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eUeC2nB+lKu4UVceZOn61y/vWpu7wKl3bIM+uTbLXjj/A1B6gZ6pRFyDUh2doQq5DH
    AK/lHQDAbHHA5FBCsJY9OG3P1lXezXe/OME7Rmri9yVlvHpG1JFrwnavwsxSmqOrZlsQ
    7xwxJ/5oAfvFTXa9tkRUk65DKUGxpgCiwlMwmYrLTjJUuhVcs5JF/pDFnUk1BEEIcUJq
    UR0q9s4JJwOyrsz1N0H4ekWYw+wM88mNQxHz1dCdPeuHuqHQ4Ql0eodW6pRAIAa+Q5Nq
    bp0zES4oXr3MddykFXIpaBK7JhhpScfXlodS49O+/aSyzWbqUCJPfoZxIAuaU25+HqSB
    vDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794993519;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=8+C6tOb/Dl8Of9BB5bsesi1tsKmLxRThu6jLT9pRQjk=;
    b=XfwUjsH8CtGuX5swhby6a3JnnXQqMSCW6LRQ1egbN6tAALqtNbSEZsbVZZrM7efOYR
    WS/7BuUWus13yQzv5mAon2uDsUVIstCgBeULIa9p15ee9+8YkdosSumkq6xdD4D4MvWS
    qGVn6uzeYLQo2uYM6aVVV22xQGSGQb/kBkeOGMQk0TBHJh6TffVz+TBgnpKnkoopiP5L
    sAZR9hx9mOEYzFAH0YWi8hndhZpSq0dV2d/nFdZ9TWqnaZbAh7sj2c1VTmHBOppQrdAz
    AtSk0vuSKxhalOcbrICj21pdd2oPZtELsFfx7XdEgZFXlGdZBFSt/Iznyrv8hq2n3Ffg
    JxJg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794993519;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=8+C6tOb/Dl8Of9BB5bsesi1tsKmLxRThu6jLT9pRQjk=;
    b=Gg6TFruzNOqkeBtOQCU9uM0WpvOUARxaYWgALh93PJvcdp/WMxyNHutvRcNbAx9tK9
    rffha8P3Yoz84vJJg05wZ+Yd9EFEoY3d0CsGr0zr+Q5v0nGokTiD30oP+kYgo36OT7X3
    D+YtOAxTIZa5kb3QlszpmSrTnoqFMN7QFtLa6Z580NQlc0fal8Mi3lFTEoXCRIgnD+uJ
    h5lh8n3MaJxp7LZhfHCawc5oDm24vcDegKdmzguS66OJqgttPhPZyhRcGWob1CzDtcVd
    ZsB9nzActZhiLbRMyukrD4zcHEZbRfHq4yQP+m5ExEXZDk6rFy+YPx57BjmwdJmZngxk
    zRCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794993519;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=8+C6tOb/Dl8Of9BB5bsesi1tsKmLxRThu6jLT9pRQjk=;
    b=kJNpSSek6yTm835+rSSCZoIExdwo0gElNum6mzYT/yeyQHqRQ5bG3dYPgwKdsvWR0R
    AvZqC0Iy/KNKN689g+BQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AI9Icb4j
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 10:18:38 +0100 (CET)
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
Subject: Re: [PATCH v3 2/7] pinctrl: ingenic: Fix hardware dual-edge
 interrupts on X1600
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <eb60698d243da29c61b3ffded6acca90dfcb3475.camel@crapouillou.net>
Date: Wed, 18 Nov 2026 10:18:07 +0100
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
Message-Id: <0D0B1E2A-B5A8-49C4-ADBC-947C057F5C5A@goldelico.com>
References: <cover.1794987700.git.hns@goldelico.com>
 <29961993f8fdc1db97854f940ecf3883c2d32cf6.1794987700.git.hns@goldelico.com>
 <eb60698d243da29c61b3ffded6acca90dfcb3475.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Paul,

> Am 18.11.2026 um 10:13 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mercredi 18 novembre 2026 =C3=A0 08:41 +0100, H. Nikolaus Schaller =
a =C3=A9crit :
>> Use the hardware dual-edge detector on X1600 and X2000.
>>=20
>> Set PAT1 when configuring both edges and program EDG on X1600.
>> Keep software edge switching for older SoCs without EDG.
>>=20
>> Tested on X1600 and X2000 using GPIO buttons and register readback.
>>=20
>> Fixes: 943e0da15370 ("pinctrl: Ingenic: Add pinctrl driver for =
X2000.")
>> Fixes: 4da56f9c6f14 ("pinctrl: ingenic: add x1600 support")
>=20
> You'll have to decide, I don't think you can have two Fixes: lines.

Ah, sorry. I thought I had it removed... I think we should fix only =
4da56f9c6f14

>=20
> You also need to add:
> Cc: stable@vger.kernel.org

Agreed.

>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  drivers/pinctrl/pinctrl-ingenic.c | 19 +++++++++++--------
>>  1 file changed, 11 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-
>> ingenic.c
>> index 88c5edeaaddcc..dc5d38c16e18d 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -3622,6 +3622,10 @@ static void irq_set_type(struct =
ingenic_gpio_chip
>> *jzgc,
>>   break;
>>   }
>> =20
>> + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
>> +     is_soc_or_above(jzgc->jzpc, ID_X1600))
>=20
> That actually fits in one line of 80 chars.
>=20
> But you can do even better and move that to the switch above, and =
replace the
> val1 =3D val2 =3D false;
>=20
> with:
> val1 =3D false;
> val2 =3D is_soc_or_above(jzgc->jzpc, ID_X1600);

Looks good.

>=20
>> + val2 =3D true;
>> +
>>   if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
>>   reg1 =3D JZ4770_GPIO_PAT1;
>>   reg2 =3D JZ4770_GPIO_PAT0;
>> @@ -3635,15 +3639,13 @@ static void irq_set_type(struct =
ingenic_gpio_chip
>> *jzgc,
>>   return;
>>   }
>> =20
>> - if (is_soc_or_above(jzgc->jzpc, ID_X2000)) {
>> - ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
>> - ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
>> - ingenic_gpio_shadow_set_bit_load(jzgc);
>> - ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
>> - } else if (is_soc_or_above(jzgc->jzpc, ID_X1000)) {
>> + if (is_soc_or_above(jzgc->jzpc, ID_X1000)) {
>>   ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
>>   ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
>>   ingenic_gpio_shadow_set_bit_load(jzgc);
>> +
>> + if (is_soc_or_above(jzgc->jzpc, ID_X1600))
>> + ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset,
>> val3);
>=20
> The minimal diff would have been to change the check for ID_X2000 to =
ID_X1600
> above. But the code does look better this way so I take it.
>=20
>>   } else {
>>   ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
>>   ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
>> @@ -3718,7 +3720,7 @@ static void ingenic_gpio_irq_ack(struct =
irq_data *irqd)
>>   bool high;
>> =20
>>   if ((irqd_get_trigger_type(irqd) =3D=3D IRQ_TYPE_EDGE_BOTH) &&
>> -     !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
>> +     !is_soc_or_above(jzgc->jzpc, ID_X1600)) {
>>   /*
>>    * Switch to an interrupt for the opposite edge to the one
>> that
>>    * triggered the interrupt being ACKed.
>> @@ -3758,7 +3760,8 @@ static int ingenic_gpio_irq_set_type(struct =
irq_data
>> *irqd, unsigned int type)
>>   irq_set_handler_locked(irqd, handle_bad_irq);
>>   }
>> =20
>> - if ((type =3D=3D IRQ_TYPE_EDGE_BOTH) && =
!is_soc_or_above(jzgc->jzpc,
>> ID_X2000)) {
>> + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
>> +     !is_soc_or_above(jzgc->jzpc, ID_X1600)) {
>=20
> Keep it on line line.

Ok.

V4 will come asap...
>=20
> Cheers,
> -Paul

BR and thanks,
Nikolaus=
