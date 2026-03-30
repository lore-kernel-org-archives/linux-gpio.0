Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56F3AE709
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861024; cv=none; b=rp7bBzKqFQqCX4wZhJ/mrSHyqVWGvXOQn0fw2TaCyDjWoUPH/hn0sHMQSlpfjaEiePK1bLfSLnxklNKIHehDPQ1DtJV5V9uCY2YlixseNrPHKhBsYZPhcqOHigG3ULep5I4Lh8xgp8o7V7NXbhh9f5ALK7SJ0EQA4dBLXiYZiG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861024; c=relaxed/simple;
	bh=Oq7xqs5iQpf1/waQR0+XBp4js0LWeuqoKcGkBt4bbW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnnHkUy+QrJJfMZoCgjnVTdUxHIm8oExBGgcHJUXDZRYobjRGSz50sa4EI+MMa2p2eEAOecZgAfy3ZoNhE1d/t/C/k1fGH0NdhHPcGb2oRiqKDCEieobnnj5M3iZG/NWKm7VrvCTgKMOdUQ6GmAzGViHph/9fXjyjhU5qY7/OGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYRZ/6XB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYRZ/6XB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B96C4CEF7
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774861024;
	bh=Oq7xqs5iQpf1/waQR0+XBp4js0LWeuqoKcGkBt4bbW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gYRZ/6XBGDe+PxzV0bJczsO89h8QRJdaKjq+Dig7wOJREum6XLzxuUq+B6T2rwr7Z
	 Cxwf3iZsi10/kDKQJ1ZtVVwam4VJ7NrYGvC6el/idnbOTysiMklaS09hlK3DhfkXkR
	 OybeGL93ZTHOJaA1LMHMjQqUIxGJLsiCMveHjfojU8F2Ae+ZH/xuqaRtMQUuFkpWYF
	 EZPTaGkfWWzNtekar3eI44Y007f2Qkk7d7EU6Anbts8TDdCaPVttKBu8qjUAsU0bo+
	 blga/EwlIZwVyBanhw0seYDqK9QxUXhubdyrF6kZmLDdSrPdTZSssIaxOPyDhgGy85
	 Odf4wbqt42Frw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64edf260b49so8232308d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:57:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUAFPys/e891FroTtUg7WpjY+v8DEMI1yowhv7h8M8aWkP+fTA2gDT3WW13fprEh1Er4fPYVGszdTb@vger.kernel.org
X-Gm-Message-State: AOJu0YyORuc1NZPoqzBuNZjb+gMr2LbBmY30oMWYIZG5MMdH1rjhq+VY
	qJemCNTnj06HnwU6Adzx5Qlldrt3203iQjGYmEZ4AqV8Zm4VLWyc5L9qf1Hjf83kAHVUkNPRjDN
	Bf22rjYIrQY/Y6s84mQVPPsCWZFiWOSY=
X-Received: by 2002:a05:690c:4886:b0:798:711f:a0df with SMTP id
 00721157ae682-79bde385480mr94809217b3.13.1774861023812; Mon, 30 Mar 2026
 01:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-asoc-uda1380-v1-1-f6f91be9b7f8@kernel.org> <CAMRc=MeJ4eVx9HEWP6_4Yd-a=jb4SOyoWW=KgY_=od=ft1=7eA@mail.gmail.com>
In-Reply-To: <CAMRc=MeJ4eVx9HEWP6_4Yd-a=jb4SOyoWW=KgY_=od=ft1=7eA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 30 Mar 2026 10:56:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLniBA_9NzG3BwNpTpT8fC3QRF0yiM_=Wq4u409_fqWVcQ@mail.gmail.com>
X-Gm-Features: AQROBzAaL_fFRxPLcJxgJ6GGzRfnFrqKNsLOYRWFlSD3YVfYEji7A2ItDOmKdww
Message-ID: <CAD++jLniBA_9NzG3BwNpTpT8fC3QRF0yiM_=Wq4u409_fqWVcQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: uda1380: Modernize the driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 10:45=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Fri, 27 Mar 2026 09:05:47 +0100, Linus Walleij <linusw@kernel.org> sai=
d:
> > This codec driver depended on the legacy GPIO API, and nothing
> > in the kernel is defining the platform data.
> >
> > Since there may be out of tree users, migrate to GPIO descriptors,
>
> I don't think out-of-tree users are a valid argument to keep anything in
> mainline, so if nobody defines platform data in tree then it should be dr=
opped.
> On the other hand...
>
> > drop the platform data that is unused, and assign the dac_clk the
> > value that was used in all platforms found in a historical dig.
> >
> > Add some menuconfig so the codec can be selected and tested.
> >
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > ---
> > Maybe this driver should rather be deleted if there are no
> > real users left, but that can be done after this patch if
> > so desired. This makes the driver usable on contemporary Linux.
>
> ... I'm seeing this:
>
> $ git grep nxp,uda1380
> arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts:           compatible =3D
> "nxp,uda1380";
> arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts:          compatible =3D
> "nxp,uda1380";
>
> I think these count as in-tree users of the driver, right? The compatible=
 is
> not described in bindings but I think this still looks as ABI.

Oh I didn't see *those*!

Well we could just delete the platform data handling instead but fixing
this properly is probably more fun and helpful.

Yours,
Linus Walleij
