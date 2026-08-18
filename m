Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA73A1DB
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 05:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787030253; cv=none; b=LdV/2tiXFk5dD9P9m1anihNKkpBtYuhOGSmuN51E3nC8YNdN+PsxJ5mni9KgVt45Z7lcq2+cBjOkMYyYMwYwdV/G/FixmtfK/KUgLjPl8QcMY8tvgipb5k2EpTfiI6CkYPYhDzTnDLgQr6A9/nsGmgVclmCoeDN2nH2yC0GZuQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787030253; c=relaxed/simple;
	bh=CnA5diFpP2sbUMafPtFQF29GaYmhYPGTZIsaxV2y+h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBq0xkqQuYNsFzBTZDDuvxnzec+jzI/XFFx4yWvhO2wDoOhzwLXk1HMsYR+2BSek39e5IXrxsLCOaQaBxGrTpq9iky9rfZu0sDVvvyYOPBP5fSlto3yxs4pqru2/Twl//jtwYzE+ZBCjsfl3TEK1TofRfGB+gJ2c0T6pDKlL4bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jB1UCdDl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jB1UCdDl"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caed617615so55798265ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 22:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787030251; x=1787635051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0YhvxrTBybFCJOyKw4CeuxSV0om/PxfxriRtGrnZuA=;
        b=jB1UCdDlt79HzCXi7GMO0kDK4sekj7l1C5sV5Go8wRgO254xqlWWDXvi2EJhjyCuYn
         +Pqk7Y3eebqQaEyC5Qwed911wbUt4ht9erMtgtWjshS8O8Uwj/rMIZsFSBUDpc3yCOmX
         kw/Dx25ixsHk6RB5Ry4P2ThJF2o47xjz4ZaHKtc6xrFuuv38cjavnI6U0IKxnzYvkoZ0
         A73O3kCii/W8TSZ756znV8GrewRKCSrvIbiULTEV/LcdWFqsVJiRpeQz6BVeC5z6XZep
         EH1xsqE7hhcIuZa+Ho1H7qzbeqfYiuPvfwSfNhL1kT9jCp4onsw64BAAiQHcbA8X83/L
         OAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787030251; x=1787635051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0YhvxrTBybFCJOyKw4CeuxSV0om/PxfxriRtGrnZuA=;
        b=X8ZNKwPivGRYDsR/qZubNMxthfzQC76Ykf4L1FcdQ+N/0rm2jmTwteYkvhwUFf5M9N
         SFNoCTQazcYaIlxb5lw40p2FuFx17zc//mJ2SAokp8BpWwVMfCH+wHStdWKRXNKB2ekJ
         omn+mFLtFm3uZBEwpUvXbJ+4LD1Rm6sxWFX9p+3XsBLqCzlmVfWqnFmFC5F3SE514u+Z
         IalIaPSBX4xIli1BQg9SswXsGIaRU9bDTmvh96gIm0vnLNCVIwp4utybfO9+TSDAHl1V
         zGnH6HF3taC6OO3Q9mEEE4GD/O/ni8OX9WiStlFfpmCahtO4CE2lO6y+Pfb4v1b87qPd
         ka0w==
X-Forwarded-Encrypted: i=1; AHgh+RrhHLFhU7EM+31IRy7Uf1M6bWctAztV918gN6BFMGzShA77QDlTUjvvlS7YCE35vT3uPd5ffC9r+ZDC@vger.kernel.org
X-Gm-Message-State: AOJu0YwxFVU3rumlJbG8+lQTZ530gSCmomgKidB1tZrLuImA2wQ7S3j3
	NbrxvfP2VU/GmKQufvLQPBTog7i+p6m5ulo2e/sEVU2f+uu6eQpcIRqh
X-Gm-Gg: AR+sD13jQtcZgX5qULXxrMa85P9ieeZg8CS21W0rnH8j7J20r9vit7fPVqHisp2ATuw
	NGZlCBnNj7wqtgoCc97oht1j7OiEruRNRPhXZB+K2fINfacGG+Vry0kun8yc/HSFJ16VqQwVsaf
	rgz5tw/bp0PVR5jKLem2mMubY9hIUVzYw6ZJQQxLxdpsg0EPe5cRpwApFTj5u0gC8c/L7ZTpMl+
	jOMf677ZY1MjHGx33S+tRnCjd/ixDF0f4SWvQFxGQLsoTSqvVwa79VJjR7VvJ0O76yRd9Mb1HGy
	FBQoIGGmVMC9DfsiCfcEYSPXt35V9Vz/tgRtDH11CnESjtzSBMLK6w797YtAIcgdl1IJyDm08gF
	ThHvgBT0oYedL4+HOjD5iHXTIb90J9j/fYHAFZ75KDwDOOH8ascka5DAadrKeHrK8fo6LVupMRi
	p7H0IcecFrWL3yOvD+4Bn+qbRi01X3+xfQUCVAvEaw5MOB8BHlNWa0PwrZuP0zYZJjrgH9nPnlx
	kLx1A==
X-Received: by 2002:a17:903:3885:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d3b0d78794mr319291935ad.5.1787030250915;
        Mon, 17 Aug 2026 22:17:30 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([59.93.231.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528e5sm9880995ad.50.2026.08.17.22.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:17:30 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:17:24 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Linus Walleij <linusw@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] pinctrl: airoha: limit GPIO interrupts to
 interrupt-capable pins
Message-ID: <aoPq5F8dVl/FQ6Yp@DESKTOP-TIT0J8O.localdomain>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <5a7f97adbca73f2bd01393ce0ca840c2a6f43f76.1786262697.git.naseefkm@gmail.com>
 <1cd344b3-22a3-43d2-83b6-2eb01b3245d3@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1cd344b3-22a3-43d2-83b6-2eb01b3245d3@genexis.eu>

> > +{
> > +	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
> > +	unsigned int num_irq_pins = pinctrl->num_irq_pins;
> > +
> > +	if (num_irq_pins < ngpios)
> > +		bitmap_clear(valid_mask, num_irq_pins, ngpios - num_irq_pins);
> > +}
> 
> I'm not sure if there is something that gives a sane error log if this
> trigger. Maybe make it explicit?
> 
> Either way:
> Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>

Nothing logs the limit itself, the -ENXIO only surfaces at the consumer.

However Most of the  gpio_irq_chip::init_valid_mask implementations in the
tree log nothing at all. Only pinctrl-baytrail does, and not for the valid
range.

Happy to make it explicit if you prefer, at probe:

        if (pinctrl->num_irq_pins < AIROHA_NUM_PINS)
                dev_dbg(dev, "GPIO%u and above cannot be used as interrupts\n",
                        pinctrl->num_irq_pins);

Thanks for the review!

Linus, since  the merge window is open. Is this still worth taking for v7.3, or
would you rather it soaked in for v7.4? 2/3 has no DT ack yet either.

Ahmed
> 
> > +
> >   static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
> >   					struct platform_device *pdev)
> >   {
> > @@ -362,6 +383,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
> >   	girq->default_type = IRQ_TYPE_NONE;
> >   	girq->handler = handle_bad_irq;
> > +	girq->init_valid_mask = airoha_gpio_init_valid_mask;
> >   	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
> >   	irq = platform_get_irq(pdev, 0);
> > @@ -848,6 +870,7 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
> >   	pinctrl->grps = data->grps;
> >   	pinctrl->funcs = data->funcs;
> >   	pinctrl->confs_info = data->confs_info;
> > +	pinctrl->num_irq_pins = data->num_irq_pins;
> >   	err = pinctrl_enable(pinctrl->ctrl);
> >   	if (err)
> > diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/airoha/pinctrl-an7563.c
> > index 40cbbe90cc46..f011c6c9ccce 100644
> > --- a/drivers/pinctrl/airoha/pinctrl-an7563.c
> > +++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
> > @@ -1069,6 +1069,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> >   	.num_grps = ARRAY_SIZE(pinctrl_groups),
> >   	.funcs = pinctrl_funcs,
> >   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> > +	.num_irq_pins = AIROHA_NUM_PINS,
> >   	.confs_info = {
> >   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
> >   			.confs = pinctrl_pullup_conf,
> > diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
> > index 2fcf88106e11..bfb777594811 100644
> > --- a/drivers/pinctrl/airoha/pinctrl-an7581.c
> > +++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
> > @@ -1441,6 +1441,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> >   	.num_grps = ARRAY_SIZE(pinctrl_groups),
> >   	.funcs = pinctrl_funcs,
> >   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> > +	.num_irq_pins = AIROHA_NUM_PINS,
> >   	.confs_info = {
> >   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
> >   			.confs = pinctrl_pullup_conf,
> > diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
> > index 2c3a75c35915..1cd0f442ddc1 100644
> > --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> > +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
> > @@ -1471,6 +1471,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> >   	.num_grps = ARRAY_SIZE(pinctrl_groups),
> >   	.funcs = pinctrl_funcs,
> >   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> > +	.num_irq_pins = AIROHA_NUM_PINS,
> >   	.confs_info = {
> >   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
> >   			.confs = pinctrl_pullup_conf,
> > diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
> > index 5aa39bacf460..b0c5e60f0aeb 100644
> > --- a/drivers/pinctrl/airoha/pinctrl-en7523.c
> > +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
> > @@ -1113,6 +1113,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> >   	.num_grps = ARRAY_SIZE(pinctrl_groups),
> >   	.funcs = pinctrl_funcs,
> >   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> > +	.num_irq_pins = AIROHA_NUM_PINS,
> >   	.confs_info = {
> >   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
> >   			.confs = pinctrl_pullup_conf,
