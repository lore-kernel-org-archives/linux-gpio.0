Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794942643;
	b=Y/Hs1Uty7TNFSJUYnr3iM6XZKRQFDp2z/4V2Ihx0nR69F+L9RVz/wHUTw7fx5SzWXrW7
	 oErpowtDaHzykpIPEVJGvCQANOnpbyFsInEYvriiiY9fcdeDAZXnXiMQiDOEEfbhbRJp3
	 UGKQLtM2iGqb0lXdIcyqVDWwy1agbZCqQil2kRJQnxYsVPQcmEOV5uLN0V5ArCXBQCpa6
	 zYQ7fG6xt2Zqgfmfx4iZaSDJ5pyUxbwzHNJU2cddRshG6SbKxV9AtNJE5ktyhyM4TCwQv
	 RroBPzY+10qNbOXR9Vrs6Y+3b4DIwp0Y4bpWDwc7nECPTAfXk0d8OpaPrXX4Y3o3OYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942643;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=EHVd5UrHjl2IgLOJFZjiPRJXW4hMjp2ffrPAnmqHhOM=;
	b=H00LZCal48amap+npMFpDjo8gspmRzWUdYbdh2MYzqS0pzqwUsX/HEfcZjAPzbtt6MZn
	 5lQ3Z5K9RUfp813TI37sc1ms3YWaJATZULrvcu1Kd3hWmPIrlVKIQecgDdUbPbo8EnEj6
	 TaIxlg45nn9aCpjR0raWZxk94veoeLAsNwBzWIkWkFvFIJ3jQfIfhf3yXdsbmH563fTcS
	 uEfyxPNkvR7BjLYAbeoXa9fh5QVBJm5rFX3ztoucutREdH9arAwUxHktE8L1zgotTm9Ww
	 nkrpX2QNfx5PO55thhOcoxI+pNxvQBn9vYYfg1QY2OAoGvo0R03QeKhRfnwYuGJwJjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CpawlFgA;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="XGSZxM/U";
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639B6606A336;
	Tue, 17 Nov 2026 19:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 639B6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CpawlFgA;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=XGSZxM/U
ARC-Seal: i=1; a=rsa-sha256; t=1794942629; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HHA4yXaNh9zJAh6K/BtGZ1sJPolIBk8O99o7Bsuehway19CAVMdlBrlcJUm2vNc5Xn
    Rdvm4tRgkQgigWKFepxviO6RHEWytZlL+E2ShA/C47zmaN0/EvsTq8u9si7RzWG+Nmre
    8FtEVcdPQ55nXMW8BEu+sPMJdLyk5EA0tOEipVz3fA2C3r0lZFeTpOZOEblPPYhvFvaM
    63gT0h/i0vl4d0vqGtYf63QjuIhHeM239Axz+qNDS3/HeEyy2m8p4+yUnTCJFDc8TFlc
    yEr3aSblHkN79+nAspqh4zwGBEdlxpT7k1mZWN4+TsFICRfR4eXGUKtA9tpW0+Vz9rmH
    Josw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794942629;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=EHVd5UrHjl2IgLOJFZjiPRJXW4hMjp2ffrPAnmqHhOM=;
    b=YT5MQiDWd+DI5BSBrFpV/V+6JMY8+LBJFQ97yKKy2UKeAvD0/SKOB4iCgM8dTg6kUB
    KUp2e48Ni3zog5zdthwcirQLqBpUTjmRMyqY9KtcyfSfAYdx8mVjQxjPPlHecJuWUSzN
    97eI49oJb1p67rkibrUWO3c5LHpg08cHWpdOmkWdkB157Z/W6Ux07fnWbLvKNDqXixJ3
    b58kqJ7dkxy90otGVFIvrOwC0yQD98XeGHJw/2DR8+uiFmHHeuY1ORqdAuOucx6z1Cne
    1N2Q9vK3InTCJEBqwnkl/ULcFCXjfrxw9qVZdE69xzUxW/fangaLnjcLxOy7mTItA2FX
    gDEg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794942629;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=EHVd5UrHjl2IgLOJFZjiPRJXW4hMjp2ffrPAnmqHhOM=;
    b=CpawlFgAkegLPW09Ttyz2i5jcoD6WQvsGb1BEKqnCNbk6Z1N99/YOWWgyODAljlr2M
    qU3CmrN/9UXjkvCxJQkisPLnTmikONgbymRSlj5lmNXn7dAy22UaiRRs+8MWmYNAwNje
    ntRRkZQHMUAcZjIaoau8jRn8JESE5aMFNt+T9YU+Rizj3ml70tVXuRm7NqsYbyFsJnBG
    xuSSeZip+NZVAnppdEaSLsp+wQ3dC/m8HsRG8s4qYXXuq9a4rAmbU7KFoGw152wDZDeE
    bL5zvZ+aNS2xq19OVl18bTIrw5qQrqsBJey+QvuWrE7wtRnEoWLgV1126mlKfoiZB9/e
    UAaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794942629;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=EHVd5UrHjl2IgLOJFZjiPRJXW4hMjp2ffrPAnmqHhOM=;
    b=XGSZxM/U/OSKBRigDREPvOaSeHJe2tfzZ0MeMeBqHXWlUnmAMZoTMowwheJI8biWG2
    1TH1ODauL9VUp9SSJuDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ppelMiNKoEY92nD9kO01+3QZuyyF4VcrvHZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AHJASYjA
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 17 Nov 2026 20:10:28 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH v2 2/7] pinctrl: ingenic: Fix hardware dual-edge
 interrupts on X1600
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <sashiko-outbox-219369@kernel.org>
Date: Tue, 17 Nov 2026 20:09:58 +0100
Cc: linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 robh@kernel.org,
 conor+dt@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <24975DE6-A803-46E2-A975-1CA3CE935077@goldelico.com>
References: <cover.1794940166.git.hns@goldelico.com>
 <b87494f8bd72efe7d4c8b8c7c6a5f37686861aff.1794940167.git.hns@goldelico.com>
 <sashiko-outbox-219369@kernel.org>
To: sashiko-reviews@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)



> Am 17.11.2026 um 19:38 schrieb sashiko-bot@kernel.org:
>=20
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] pinctrl: ingenic: redundant checks and duplicated branch in
>  irq_set_type()
> - [Low] pinctrl: ingenic: missing Fixes: trailers for X2000 and X1600
>  dual-edge IRQ
> --
>=20
> commit 478cc52f71c553d81f6fc71fbe29cdc01e47f147
> Author: H. Nikolaus Schaller <hns@goldelico.com>
>=20
>> pinctrl: ingenic: Fix hardware dual-edge interrupts on X1600
>>=20
>> Use the hardware dual-edge detector on X1600 and X2000.
>>=20
>> Set PAT1 when configuring both edges and program EDG on X1600.
>> Keep software edge switching for older SoCs without EDG.
>>=20
>> Tested on X1600 and X2000 using GPIO buttons and register readback.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> [Severity: Low]
> Should this bug fix include Fixes: tags for the commits that =
introduced X2000
> and X1600 GPIO support?
>=20
>  Fixes: 943e0da15370 ("pinctrl: Ingenic: Add pinctrl driver for =
X2000.")
>  Fixes: 4da56f9c6f14 ("pinctrl: ingenic: add x1600 support")
>=20
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-ingenic.c
>> index 7d3f34c4fb589..f718725d84d4a 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -3622,6 +3622,10 @@ static void irq_set_type(struct =
ingenic_gpio_chip *jzgc,
>> break;
>> }
>>=20
>> + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
>> +    is_soc_or_above(jzgc->jzpc, ID_X1600))
>> + val2 =3D true;
>> +
>> if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
>> reg1 =3D JZ4770_GPIO_PAT1;
>> reg2 =3D JZ4770_GPIO_PAT0;
>> @@ -3644,6 +3648,9 @@ static void irq_set_type(struct =
ingenic_gpio_chip *jzgc,
>> ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
>> ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
>> ingenic_gpio_shadow_set_bit_load(jzgc);
>> +
>> + if (is_soc_or_above(jzgc->jzpc, ID_X1600))
>> + ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
>> } else {
>> ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
>> ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
>=20
> [Severity: Low]
> This isn't a bug, but both callers of irq_set_type()
> (ingenic_gpio_irq_set_type() and ingenic_gpio_irq_ack()) already =
convert
> IRQ_TYPE_EDGE_BOTH to level triggers when !is_soc_or_above(jzgc->jzpc,
> ID_X1600).  Can case IRQ_TYPE_EDGE_BOTH set val2 =3D true directly =
instead of
> setting val2 =3D false and overriding it here?
>=20
> Also, with the ID_X1600 check added to the ID_X1000 branch, the =
preceding
> is_soc_or_above(jzgc->jzpc, ID_X2000) branch in irq_set_type() is now
> identical and can be dropped:
>=20
> drivers/pinctrl/pinctrl-ingenic.c:irq_set_type() {
>    ...
> if (is_soc_or_above(jzgc->jzpc, ID_X2000)) {
> ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
> ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
> ingenic_gpio_shadow_set_bit_load(jzgc);
> ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
> } else if (is_soc_or_above(jzgc->jzpc, ID_X1000)) {
>    ...
> }
>=20

Thanks for the review. Both suggestions make sense.
I'll simplify the shared shadow-register path, remove the
redundant X2000 branch, and add the two Fixes trailers in
the next revision.

Nikolaus=
