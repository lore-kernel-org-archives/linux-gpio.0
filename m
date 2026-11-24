Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515528;
	b=2y2kKHUtbMhd82V2dK1OfLwkB7SKfgXQX2iFkUAHJnoq2FsJZXqX1ygUVVmXwjh8j8yZ
	 +ZFWIaMAtkP2NoAdPMjMAX8DJO6v5XNA/YsI9duv4NbJQBS29J5OVy9ZwXrkCJiJb+xCl
	 xnJH+3X2eYAyoIhDKHJeyTiu1jfKqsD8YUFi0SSztMISiCz/ZCSRE4/+572B0Uo2Q0oYA
	 Xj8L0f4UBiOEu4k2a9XwKSPzfXgN0Oz3krqsxF2HhTemj4FGQKyLYzPFfQP1dxZcMC9LW
	 pq+Ql5XEJdSxwO2KDTTtQorIkpLZ9rPzER13O8MSumMcXDKo7XBNu6OAeOvB4pCj+cQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CUO4ExU02cQGrmPrcJ49fSWnHPQqWJxdiEswQmxThgM=;
	b=lwq2eyl1KxEBYyLcNiCCqQv/dc30XvdBqzQr4m5uZwdWiTpfiij2hHoyCJOEz4+TU6d0
	 YeedpQwIQj5Nh11oJPUr9FIMmYmqgEuiT0jxKaN3tJ5nVIe6xwh9cc+/izwd6//PFPSPB
	 SjaK07BXgSlCk9paG8xJZrngOlnZTHcHa5/X2ZQYEqDkvkzDX+oAhrs3fKSIwLF+AtqNV
	 Ax112FzJHFSlP3OSZrHGLpltnT2QEvCW/JCUSwtNZ8smxJD5iIRM53XAQ6sryepkvYvqI
	 IM2aOF+CCwjFy1bi7xjRzd7baTtZ65uT2Kbi1TdvNAXqpWU9vDh4xoidrVADyoUDUDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7Bw9TsG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C6C606A33E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 10:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C6C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7Bw9TsG
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a42b34e930so3776713f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 02:18:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515526; cv=none;
        d=google.com; s=arc-20260327;
        b=g0DRmUkzSxxYttewho/LskFxlf3+WwGNRGhG3Qz9fGnCR5McoEIiHyZOQuxvN7Mq7O
         SE/LOcxqtlkY7UUfYEJB74+9rWjkIc8x1zgpd7x2JQEawbdRaGsVK8Ny49++53KeLOB0
         t71Pd6+mtAXkRse0SYFlxe2vNm6caJlSKcwJmgoUoC93RwANwwD/SZOnN1fcfRJDh/E4
         6bvxAgvU1yq2/V/ns4FWwTbVfQ0cz7w1UuRAuseVDceW+YhZlpvoWmLG1AqsNBTStP+E
         7qYEIfYou/nHu2LXGLr+USxLcXlVHfbd0bLmeVh6KXmA0i5BO94IMb76IP6oxKY4uAz7
         cMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUO4ExU02cQGrmPrcJ49fSWnHPQqWJxdiEswQmxThgM=;
        fh=JM0zb9UKFhwjeElqrZaASEanUjl0wgSwWGTPbnxFaw8=;
        b=TjG39I9sJgFpshcQyPlFtyG1jklINd1Y7xvcryQdS05IXNt4X/GOk2yFPaUrn/PT3y
         tqSIpeQGx6Ssd08SGsd3r/Te7SXgjrRzh+h2LPPbNbrLt/zqtewclpKjO/8DTXygxnRy
         vOPUNqD9+lo0WufQ2iFMmbbp8K4DuZlBbryCfdKU1IgE51Xxojz/Y5iTVtf7XfPJJhGf
         pfI/uan6aUUDBSofJl4TvMOCCNM1SYj1nOt1gzXptWjWmrTm8lVa9LW/lWs5Y+NwXr8R
         V1Dqb9aQujxrKGOrzgzkQ5dpRstMchZzsP1Mok1s/3fadQgnW5MNgeZRDpKeMb4u2oMN
         4U9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795515526; x=1796120326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUO4ExU02cQGrmPrcJ49fSWnHPQqWJxdiEswQmxThgM=;
        b=z7Bw9TsG4OANK41aSJfx8Lx42vGTu6EfpD/A4/S+62rlzAAld2aM9T2rndBLbwNGfi
         VUHNrmDzd3bP4sGgqonXQ459tcvQCh/Ig5ieK4Xc5H+doyalKkY1OqGh5SoD/k1TXgEa
         PGd/f4alC4T31elB5DPYDkglEDecs8ZXeQS/9LQN1VAm/35Ji2ROfikeupQ7VnUCkwaV
         M31aWODSRCgaLXE0pwQc62QMIIn6BYiG0u2S1WBnxaCg71d8Ennal7FnMmGQChvVhZKN
         +/Xn/f+DeOr1Trd+RdoPoPfaa6xRLxMo4hJSxblVSb2EP2zuffaJmnU+UOlj676YIYV9
         h4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515526; x=1796120326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUO4ExU02cQGrmPrcJ49fSWnHPQqWJxdiEswQmxThgM=;
        b=Jxzbd23xVXlhN2bvf12y2jgp5e++9a1oJuZY1KjbXscD7rhutlEN3REQyyR7141CVM
         9kpKscXeLuuROVO8CZlr5i0InMgu3tAD41nuJX5ESU4UH73BjxJmus7C9vBnfXKrGkh9
         XBZ+isaD3zwgT3PQArgLLFXqA12/1Fo7aG6br0SSRvC3fdtoCx0/fBI/Jn6TmBL1cBf4
         OOInSBb03p/R+n5taEQxw56HaQIeS1n1P2OcAH/eTANnk1wSX7tggC3yoQnuZG1MYsJk
         cZIaw0RPptNsSU/966+Jw/9sejLStr90MP8rOJTM6E0vuFTA4taLDPGOQ/7L/kzCQ4VI
         4xtw==
X-Forwarded-Encrypted: i=1; AL+hErHQajTglNq7yfL5M9tLSD8zbkX8PaVvrPUpxkiWkuv4IgareUVhuI5wi8SKNy/wsJ/LV4/W1PehlhST@vger.kernel.org
X-Gm-Message-State: APuU4Z9EM79wUaXPLGl88OwElrv2inOQ/bXerA987D1YUlGdaldw0jqx
	POOeR1CVnyJyLI4J1eLXr6271PnbXpApUaOpNbBZ88lBvLGDscBM5buA86NNXZqPohWeCoqR7Rx
	L6AbWUO4GXli6WQOjksPbtjRlkyQh5Sg=
X-Gm-Gg: AZFdTZfLqSnpoIa6QV8BqjwTsRjB2+HLKe6z85o/WfQTD+HEKplhnuDe1zQY2WW+zwL
	oE80WlIopjOz0W+5uA54449dbK9e6BRuTp0XbfIW0tGwmXrza0fnVjPO+zcl4PEO06hQM0p2Wes
	1Jt/Oq+MDysb9hMpzwqHlk0i0MowwFWBX38qUNvh05ojEcCPCOBBLqxvlNuGDRU5aSz6QKKTrcr
	KTI3S8KKK8MZI/VEAO3mo0iito7up+k8UKHliMYFfDdHT+riIFo7HiCTkdzbk8CbTwPePtQ+LGY
	za+2O3v6dW/8rT+nh0yl4bsAeSm257L8ELVyOA20IDkEO1odSyi8k34IjMeCDP6A7rdvC+9a/54
	i7lrUdzH7YA/rqttixKJ1HcoOb5Q/TakV4fD6tuPS
X-Received: by 2002:a5d:5846:0:b0:4b5:fdc3:33ca with SMTP id
 ffacd0b85a97d-4b5fdc33455mr5655709f8f.32.1795515526164; Tue, 24 Nov 2026
 02:18:46 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
 <179551183567.11700.4795900066384429160.b4-review@b4>
In-Reply-To: <179551183567.11700.4795900066384429160.b4-review@b4>
From: GaryWang <is0124@gmail.com>
Date: Tue, 24 Nov 2026 18:18:34 +0800
X-Gm-Features: Aa3M54p4pYVawcdbet-1QzcXbMDc3P95wSAEB4W3N0rsbxri08OxfQ1k5YM--u0
Message-ID: <CANYHO6pWocCPaO=_6Feh9nAY4EpQOtznviwks7N5VOp9cAKszA@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO
 OUT not function mode
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, BillyChou <BillyChou@aaeon.com.tw>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 5:17=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> > The CPLD I2C pin mode setting following uart & spi used modes array
> > on device AANT0F04.
> >
> > CC: stable@vger.kernel.org
> > Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP b=
oards")
>
> Please explain the real issue you met and how you fixed it.
Ok.
>
> >
> > diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctr=
l-upboard.c
> > index b9af6dd93c34..66c1c3e3bfe0 100644
> > --- a/drivers/pinctrl/pinctrl-upboard.c
> > +++ b/drivers/pinctrl/pinctrl-upboard.c
> > @@ -225,11 +225,21 @@ static const unsigned int upboard_up_i2c0_pins[] =
=3D {
> >       UPBOARD_UP_BIT_TO_PIN(I2C0_SDA),
> >  };
> >
> > +static const enum upboard_pin_mode upboard_up_i2c0_modes[] =3D {
> > +     UPBOARD_PIN_MODE_FUNCTION,
> > +     UPBOARD_PIN_MODE_FUNCTION,
> > +};
> > +
>
> Add a static_assert.
>
> >  static const unsigned int upboard_up_i2c1_pins[] =3D {
> >       UPBOARD_UP_BIT_TO_PIN(I2C1_SCL),
> >       UPBOARD_UP_BIT_TO_PIN(I2C1_SDA),
> >  };
> >
> > +static const enum upboard_pin_mode upboard_up_i2c1_modes[] =3D {
> > +     UPBOARD_PIN_MODE_FUNCTION,
> > +     UPBOARD_PIN_MODE_FUNCTION,
> > +};
> > +
>
> Ditto.
>
> >  static const unsigned int upboard_up_spi2_pins[] =3D {
> >       UPBOARD_UP_BIT_TO_PIN(SPI_MOSI),
> >       UPBOARD_UP_BIT_TO_PIN(SPI_MISO),
> > @@ -289,8 +299,8 @@ static const unsigned int upboard_up_adc0_pins[] =
=3D {
> >
> >  static const struct upboard_pingroup upboard_up_pin_groups[] =3D {
> >       UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_=
uart1_modes[0]),
> > -     UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MO=
DE_GPIO_OUT),
> > -     UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MO=
DE_GPIO_OUT),
> > +     UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, &upboard_up_i2=
c0_modes[0]),
> > +     UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, &upboard_up_i2=
c1_modes[0]),
>
> I personnally prefer the actual implementation because it saves some line=
s.
>
> But if you really want to use modes array even if the mode is the same fo=
r all
> pins of the group, you should convert all groups to modes array, drop dea=
d code
> and explain the benefits.
The benefits just have flexibility in the future. if 2 pins mode is
not the same.
AI code review is not the whole accurate, The current code hasn't NULL
pointer modes array in UP2.
However the UPBOARD_PIN_MODE_FUNCTION starts from 0, if there is a pin
that has set UPBOARD_PIN_MODE_FUNCTION then it will get NULL pointer
modes.
So the good fix I'll set UPBOARD_PIN_MODE_FUNCTION as 1 then we can set I2C
to UPBOARD_PIN_MODE_FUNCTION as you wish.



>
> --
> Best Regards,
> Thomas Richard
>
