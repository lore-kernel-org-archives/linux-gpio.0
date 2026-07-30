Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6666C3B42F4
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785444261; cv=pass; b=H/8Ac1kPGxm0KOsnFz0DPcn+JlBohMcqo+Ob8+K4SOYCjus6b4Hosco0THVdQ1/CfAQ6QTWvUuNUVY6gMzhg5Hx/JnJ2XPhNW9RnhzDYF25+bcqLhBNfTseXAc7BG+dS7VIy9XO1L3EtynkQXWZ/aIYQfgOYqM+n3reqnMApiJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785444261; c=relaxed/simple;
	bh=CRRKCyVkjDyX0VA5gae6GARzK1YsWbFeI1wJXV90wLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOais7KSlCbDiedgMvpkY+TAFN56E8i1RipoiTIrUiUNNY8t5gsR3tfFLGthKTeRzH4yOiTd+9y+Xsf52SNugbrG9N3qUZryVK1nRTyQ0NGRu1S4Rx9t9IYksYqy6JS3VGgM/GR8NvTRKBh86bh1oSCHyCSjbSfBuFAQBUXUIN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRCoewNw; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRCoewNw"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so467009a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 13:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785444256; cv=none;
        d=google.com; s=arc-20260327;
        b=ODfm26O5wLx9ZtYu00GbzotfaUh23UCBrPz4Yu6sYx/dWys6PDTtClyQalNE/4m/Vs
         IcB1uMNaYnJFfM29L2+wtsgZ5J4MEHqS/vPlBX/3P/LqFkMI2BP9uglwTwowZipZS8SU
         7RjhdFynDg/gzZL2IgK+hqKa249kpK5tCVKZF+nrrDlHIHULJ8ZuePyYzA+L37ngwHuJ
         fVP82sZcdf5PYL0h8A7y37ynI3Gdgeh8PEPU0iBLjZPbVaGwLtsb9cgUTiD2oM/RfrjY
         03AsFlZ+FoMSOrRMrm3NdUwRo6LdvcC+UCL0GITYGWT09G7qy4RKXDOeyRaqvqHB31IF
         hpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7krrGD9WM3wP2p7EjFIybZWxvqaAPH6bQoTBvIKjdQk=;
        fh=8PjjcbqQ76nQVO+t8rx6hOBc4dLudqVdFyLfd819UJE=;
        b=eJBFxgVh2mPxc7PHVqdIpEIbPPR1PPa4LU9E3AHGNKC3mOXOYOqJhXJngsQKmkYA8N
         qWjLyr/Uhcaw4BH7j256gedNtOydpExt6GTSIjwnWZ+jLg6OswKSYCIb+lT7v7bUkwke
         oJFw38q3LuuolZNZ0R3ntpk8d9RF6qeH26Z/Xao+t4dfCBTVxIO3XU6yrTjIP46Zz+DE
         4b/+Eg8Gm+w0OnchmL7Ck8N+KmjxJtT/uvHIBfkk0lorRp4B44m/uw23jGMnDQA7k4ja
         U/8HFwM/RaSyBx2hdIZGoiulzARrRgHR8YgE4PMfeIpsQSiOcGDuHgLwGUckwNCClU9r
         pQaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785444256; x=1786049056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7krrGD9WM3wP2p7EjFIybZWxvqaAPH6bQoTBvIKjdQk=;
        b=qRCoewNwzQ7JjDaibn3LyfEX89fIqzxP0+Mp+nizzSM1Tyi+N0Db2u6qUla+4pLaje
         HwfuNM/wcNclrmKboJf3t9dlMwKYxjkwJChlS5evfZXPz9RXxELEjPBjHRM60BM5KnIf
         ZDGHdhMmRW/RPLaRKZiybFxfEOueU+lhNL0zGvlKz9+wqQRJv6/OHLTvkbTXh5JET1Tc
         bhXm9bOjCXzoexcsfm0rNg0xmeVY6k9dqCgL7Dppm6I3sZt9FjOFheBSZ7pfHTZwr7Ku
         FL2ypL5EGy9mBSbZWfb9WzGNPyHN/NW+Bd9wEIEM+b7z7adQkXFvletUpXDtfvBR2lF6
         UHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785444256; x=1786049056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7krrGD9WM3wP2p7EjFIybZWxvqaAPH6bQoTBvIKjdQk=;
        b=JGAM3lQne5dO4MmDyZSM/LSCfUPuP/lq83Y79SAIDZ1vlw7lVO6NKyHk/XSSJOnnni
         NIdIabLYgdrE3LICiXp/Hj7kKeephrTbqD/xvUbAj2l48bNIkWOTYtTzhs9WFTcRedso
         ykEpwmXVVoUeK833NPzOsp0jayzgGWUNvwbWLA61aTpcDDfeyah4wgVULq3/b49WnSqx
         eNkflnanB10ergkrusnUIL3HQPzJCERQ7hWEap3UTRur1wKdE5Z9zm7va/M6lptTTY3o
         q3ZnPOck0q1+ZfpwPgODn5A9eHUYRWVCrTxUszNOcWkU+KikfEFZYYfKxNo+x6veq51m
         gdtA==
X-Forwarded-Encrypted: i=1; AHgh+RohfyfVO9mDjgamhQ3mfNUSK/F9MsyM0XD+k/rw1/dblGvu485WrSUyxA7BQcdpl+JijPELHDGpZWvw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyel9KfUeW96HCdU5lG/1dlV1KINotk8G7m27IR6Hnc/JZnrzC
	kxl7bcXdo0rnQ0zSa5oprb99g//DWs044NJRcqOgCJ4Y0fsAMOKP2blP8tOGsDaZLUxDYALOutb
	MhtTO68vJGLmvrIsBixy/PrnoskqQUJ8=
X-Gm-Gg: AR+sD13GxPehNGd5UvOOoGk4oxGK84CAS8y2IRr6FL97N+YXZLfPKXgEYb87lAvMdqO
	upnC0S38xp+57jCKBz4ai8X6o12gy7sXwqzsMOl8C0gOuqn4A4w45Ll0it9rUh+/46ikppP/w2U
	J9IX75G6xE4jkGeq07D/+HA8YSaGzH6jwbMXEFC4qpzWSw0ZP5j6CuwC4/5I2N91qpy/xTrYuXZ
	ECabEM+yYbRhKKzUl/n5zVH68uv2aKCCVaQoKZzroFIx2oZSBjrO7YlhJpgpJW/ojUh3CUwddpQ
	bd2XPlvLyXN3hJZAuD5MfeDROstjHdgz1LqjFiDXyjvLvmkkkNBD0jk8B3XXbKinYcXmOry9vX8
	FRVUhy59avEM/o2iu8dQeB1Ug7QFXhoRP80QXVEiR9PWItRtrmH/i7Uf0NzcR9JL1aWjI/iPGHs
	dCoTzqKKUR47WfU7CaZpywRua8Yw7s+kirva2c4mbshkj/Nm9j5YF8iQ1z
X-Received: by 2002:a05:6402:5288:b0:69f:e196:1213 with SMTP id
 4fb4d7f45d1cf-6a090da1ef8mr1003480a12.28.1785444255884; Thu, 30 Jul 2026
 13:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602050131.856789-1-rosenp@gmail.com> <20260602050131.856789-6-rosenp@gmail.com>
 <CAMRc=Me0rqs8nxrp95X-2Bjw059ahRxwKrg-NtmEt025w2m9bw@mail.gmail.com>
 <DIYGFNLIFBW7.21W9J6SUGYF72@gmail.com> <7ee42722-f7f9-40cc-a576-5f85e3955537@linux.ibm.com>
 <CAKxU2N8n4iHrr-+NxL6D9WZ4EgH_XVJ7yfPa4P6ZyFNJTir60w@mail.gmail.com> <880aae3c-a552-4d3f-8ed1-e3dc3911ee1a@kernel.org>
In-Reply-To: <880aae3c-a552-4d3f-8ed1-e3dc3911ee1a@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Jul 2026 13:44:04 -0700
X-Gm-Features: AUfX_my7A6QKyTc9STOnZDQVN1ZhP0FUsC3gLrEqPLkUxNe872gyKrAyfUMD0RU
Message-ID: <CAKxU2N-h2amT8KMZ-Vm+jvVekbP+w-n3=tenkEOtmuQNaBWQcw@mail.gmail.com>
Subject: Re: [PATCH 5/7] gpio: ppc44x: Convert GPIO to generic MMIO
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 10:49=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 29/07/2026 =C3=A0 20:32, Rosen Penev a =C3=A9crit :
> > On Wed, Jul 29, 2026 at 3:55=E2=80=AFAM Madhavan Srinivasan <maddy@linu=
x.ibm.com> wrote:
> >>
> >>
> >> On 6/2/26 2:56 PM, Rosen Penev wrote:
> >>> On Tue Jun 2, 2026 at 12:51 AM PDT, Bartosz Golaszewski wrote:
> >>>> On Tue, 2 Jun 2026 07:01:29 +0200, Rosen Penev <rosenp@gmail.com> sa=
id:
> >>>>> Use gpio_generic_chip_init() to set up the PPC44x GPIO chip
> >>>>> instead of open-coding the basic get, set, locking and state handli=
ng.
> >>>>>
> >>>>> Keep the PPC44x-specific direction callbacks because they still nee=
d to
> >>>>> program ODR and the OSR/TSR registers around the generic data and
> >>>>> direction registers.
> >>>>>
> >>>>> Assisted-by: Codex:GPT-5.5
> >>>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>>>> ---
> >>>> ...
> >>>>
> >>>>> @@ -124,10 +102,11 @@ static int
> >>>>>    ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> >>>>>    {
> >>>>>      struct ppc4xx_gpio_chip *chip =3D gpiochip_get_data(gc);
> >>>>> +   struct gpio_generic_chip *gen_gc =3D &chip->chip;
> >>>>>      struct ppc4xx_gpio __iomem *regs =3D chip->regs;
> >>>>>      unsigned long flags;
> >>>>>
> >>>>> -   spin_lock_irqsave(&chip->lock, flags);
> >>>>> +   gpio_generic_chip_lock_irqsave(gen_gc, flags);
> >>>> If you're already doing it, can you use lock guards too?
> >>> Sure. btw, I avoided placing
> >>
> >> Do you have plan to address this comment in v2
> > Yeah I have it fixed locally.
>
> You should probably put patch
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20260517063754.21=
819-1-rosenp@gmail.com/
> as first patch in this series in order to enable applying the fix to
> 6.18 without applying the entire series and to avoid any future conflict.
Not sure what you mean by this.

I assume the simplest way to proceed is to wait for that patch to be
merged first and then proceed with this patch series.
>
> Christophe
>
>
> >
> > I'm not sure if this has to do through the PPC or GPIO tree.
> >>
> >> Maddy
> >>>
> >>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ore.kernel.org%2Fall%2F20260517063754.21819-1-rosenp%40gmail.com%2F&data=3D=
05%7C02%7Cchristophe.leroy%40csgroup.eu%7C2ac0ec525c7045cd969508deed9fc7e0%=
7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639209467691381845%7CUnknown%7=
CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIk=
FOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DiqGebSy%2BbKMBFZz%2FZwZ=
9N2Jf8v63FkGPNhrdUf864fE%3D&reserved=3D0
> >>>
> >>> in the beginning of the series. My thinking is that's for older kerne=
ls.
> >>> I believe either the generic API or devm_gpiochip_add_data fixes this=
.
> >>>> Bart
> >>>
>
