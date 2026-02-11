Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E635028E
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806311; cv=none; b=f5+/qFK9ViJWUo6+sfA6uRIeyZYAWzSw2Fefeach46WiSExA0U8zegCFSw2XSVJkYZ7EdC62IrwCk59DR+cxCttoaxOOdOERx2GXgwjNqybByKhthFSqAE7agUPDrvPIASJyqq9gj8wY6AftOMsfS7QNAmnsLljsXsCEfj2dZHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806311; c=relaxed/simple;
	bh=g4c/+hg4xfQ1QyXw/0chMr+4FZyH+lKINM8dtae1Pgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1ZfRuIwMclmOY+i5/sXS3Z9aIIDb1v2OfD07n5U/ATT+aOlSG/g681e03pfaTTqyJ2z51gf8DR6Z+aeOM1q74Raz3gglrL6WNpsdcOWFMcKt7/g1z2wPORn7dgmVHoYMhMm5Qj2yR8Ad+5JNP4RPaGjuHafW6EpeNsQ0IukRQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz5fP4KJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz5fP4KJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07AFC19424
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770806311;
	bh=g4c/+hg4xfQ1QyXw/0chMr+4FZyH+lKINM8dtae1Pgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nz5fP4KJWkSnfHKLAICOcJGEkth7XyvpQUpMQU9JmEROmJOy87h8ZZ/M0vcU/9j+h
	 RTGFB0qdEwLBHBrbol+joMUSU5vYVr7WBq0XujTqmPXMEmujpUJO0KoRUOfqVeFylA
	 5Onia7LjbvkVmmwKNFI9oX9L2r3LkoKt7mw6yO/mNvZ1QKtSl9LoSjQy7UAQZsARtN
	 8QvwFYhHhb8xhtVVZi55hMOJY7FB8SgNN87+n1duNp6vbijMHEGGeB9IEftL68WfE2
	 ByipEpYByC7ABGiHYMS+ZqjWwEQUdKvIYDqorwZv13dqO/rWA3iR5Dvvqr/0VtGD0l
	 +hSvGd/BxE5+A==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-385cfc572f1so16532631fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 02:38:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDjXDboB+cqnV24pOLpTDKqLbYMSAxbxWZzMcyQ4bczcruVc5K4QkxqMsvVxFcIpGVhQM25e0/r0ea@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47n9lcCb7A3KoIyeQgpGsRar23mosReP593dWHa8YapbMcxXM
	eZdTeWXPq6WRWsBfZXeYIQCEJft08UOnlTdU3zfBA33ZWOfCx4vU8JEvNtQCeW570Mfguih7oSk
	QelXBQImOSYNmkOP1CCCeEGPCjIBW4smKiEGH5qel9A==
X-Received: by 2002:ac2:51c3:0:b0:59e:71f:cc1c with SMTP id
 2adb3069b0e04-59e45043866mr4818761e87.1.1770806309629; Wed, 11 Feb 2026
 02:38:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com> <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
 <CAMuHMdWS-ZaL1nLS=C=hjBVJeVtgNYX-XgWf-8Oy4cGt6OMGDg@mail.gmail.com>
In-Reply-To: <CAMuHMdWS-ZaL1nLS=C=hjBVJeVtgNYX-XgWf-8Oy4cGt6OMGDg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Feb 2026 11:38:17 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdRn=791YHaGZ7s+rwftJ84PYRivOO8gPPbCMNF6MUH3w@mail.gmail.com>
X-Gm-Features: AZwV_QgOPgzWmQKucamzjl1eNrb3mJ8VNnRF-yVHm3Vge-JPF_DwZLNVc38hba4
Message-ID: <CAMRc=MdRn=791YHaGZ7s+rwftJ84PYRivOO8gPPbCMNF6MUH3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT compatible
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 10:50=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> > >
> > >  static const struct of_device_id gpio_aggregator_dt_ids[] =3D {
> > > +       {
> > > +               .compatible =3D "gpio-aggregator",
> > > +       },
> > >         {
> > >                 .compatible =3D "gpio-delay",
> > >                 .data =3D (void *)FWD_FEATURE_DELAY,
> > > --
> > > 2.43.0
> > >
> >
> > Regardless of the DT bindings - this change is perfectly fine. We do
> > that for other "virtual" devices like gpio-sim, gpio-virtuser, etc. I
> > would just ask you to document it under
> > Documentation/admin-guide/gpio/gpio-aggregator.rst.
>
> This is not a pure virtual device, but for use with actual hardware.
>
> Nacked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Well, it is a virtual device in that there's no actual "aggregator"
device on the board. It virtually aggregates GPIOs into a separate
chip for user's convenience. While there's no such device as a
gpio-aggregator - and so we must not put it into bindings nor into
mainline devicetree sources - having a compatible matching in the
driver is perfectly fine IMO. Just like gpio-sim.

Bartosz
