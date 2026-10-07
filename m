Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE973AD50B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352738; cv=pass; b=r48WCUerrkTqV1xrvwonnGh1wuxiXhtdSpewUE+UlRj30ohmYKK4x1QTysAbgX8yqtsthLSlw2tLMeFF+m56HLI1oAD05yIZcjF6PZrY3++j4H61y0jopmCTXIEtvT6Y0VB0OceRRMo7FZBtU8nBLSWLSRjPGx/JIwbSsnPY/Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352738; c=relaxed/simple;
	bh=egWNEyrcah0jamvRkd2t3iPlF/zp1CsncVLF5ZQhZ7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjRK79Fhqv7WcLvVLY33MFreI1JZZZCCca2znrrLfllLx3FH74Sme8upT9wY20OSYarw09LxvxQ+P+4GHvKVosd/Gi5W0MaqxE4X7s2lHFrGLiYL3xMzMwqVUQWvdQVH5zADONWMFacP6L+n0bZad6HO8pRg8JyL4jOhCu+fArU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niY9qG1p; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niY9qG1p"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e4a341d177so21063625ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 22:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791352736; cv=none;
        d=google.com; s=arc-20260327;
        b=Q9CZ9ER7r5CExARG6XSnWxyU8ZHhkbrLSnBjw0eSiGcj9NGF/EHUzeEekByeJEfIHz
         GN/Tl0mwaNOqgOTQV+bQshKTIQi5vQ58VvXFh+kiOpiPRTD4pBCj8fwZAEFKWgy3+5ht
         wwTmQWqVJ/TQULPgbU9M0kOfpsJfljANLZarDNhVvh2E3U3/Nx+3b+n772jGpq73ibPR
         Z7GR51/Ytcqibkgh0A/HMZ0qM44ry1e7FNK3xJpBn3skzik54DCNIDweE6pxQsEWWArj
         GDYq7jUkOHovUyEFwvY0/lIEZ8Ve1Xw+WXOCVT3ZNM/UJcO3nnUi+BJFMK2Ygn4BmfHz
         kHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        fh=v1mCTOanqUOqsfR7psVVoaMF3J72wyILv74kqYIITGA=;
        b=ICFe1RLPJ7ORT4cmthLH51OYtlqARots6WVr76EIcK1G6uUT7huaHvOiRW9ZbWKKz4
         dQl67kcYX5VsA2N7FCw7ZASCG1weVSH4MtClS9z3x8cB/FyFd8xtVzZqoM5L+hU6+XIZ
         aBc77alqcxSCAkZJ6Bh1ZzLlUR/DCZMfXSSGTIEbrEiX2hLcwGbBtYarpuhiIC3ckOWL
         YTUB0JqAFCG90L0qKZP3vg5Jf/0c8CBldn7At2ExWSC4xBSadLTyR2E3Fu60P8l87mxl
         2xZlOxlC7bP7psQzCHKuI2MnqArsJIx3Qm2bAfd+t3iM6p6ogDdPKJJD4OJIpN8+ytTQ
         gLjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352736; x=1791957536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        b=niY9qG1p64ghyWuaPLnACfNJft/Ut11dV/yx3JRfF9lgH7Hfvwp0iClP/vh4Fcq6GK
         PnG+bqnwfd995Oj9pnohjEIV9t5//HDnI2//PUwKaUilrfqfkifCJ3LH63Q6jUnOSUtE
         1/WbYHVoZLgVsaJ9vZy1KO0RN2MnagVeiK0fnMb4pC/2WqcrrzgU0Hc/BFdMPKX0pGSr
         TeOoKSElrUDQDwVN3Hol5e6CHtmpzCqSFv/U1eZQwRp9jceITF5ISozaTpR/d83fsqkK
         6rTyVFn0ycdGA64xRX2OYGOjYGxE1S1hAImFVC5Yj4hyFpGuOYz7aQmOz6eUTLFlzw2R
         Npig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352736; x=1791957536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        b=08Ev2gV2bl1GzaqfJj3qKyO0MIHszzulNFMd120YK7HKlj+kxO9cpYapjS+5uDTlSr
         wgAl9EpbjZf/UW/r05knwUc3Rhj1W/qKL0OEXxGSTrXsQYPatTXpDbbB1JGVeFA32WSz
         glXUeuJzbP8NQOnfOQYQxChRe7znt7hYkuXEcm5iaFOpq/EgEa9PC7ueIRMQWyuhgSLn
         Kuiot4tNGs79bRWjnERb/RiNB4MyJKTLF+PnxDTlaRD/4NXZSTo+Jh08x87Aw9ItIhX6
         1GZcnXebe/GJ0X3VP3KxSAPnhrX/NY95NKqxrSoMGAdnpSkQIpL+8pCrBWmrFkuWOgOi
         jiwA==
X-Forwarded-Encrypted: i=1; AKwUvBym5gk6tw7s9hoJ9JwwplVEA3iGpMhI9eHrDJ77g4cIEvj/o7KFGThSYw5mOg4yzkB3kwWjAmpX0ZI8@vger.kernel.org
X-Gm-Message-State: AFq9FYKojf63rBtao/BZaO4ZD93VmSjPHhSe+aYYoG4quSdW5nq/5Im0
	ecGMOH35XJBYbSyxpi9J0VzPhEc5UJ1g14gsCa1Im33righUcI4jg0l7YhbZA2TagVbQGqTKrgj
	lPBpthbCJEB9mwiClkgWPsz7Qc12s/vw=
X-Gm-Gg: AYBFou0d/wylm1kpp0Q8iirIU396RMhjvVTt0VkR0bwOiV2rxkOAiilXyUFEB55z/YD
	B6/lzVMYUov1ym1mxhmmY29eKcH1mmzO9UNNMBWeCtLxU+72IpXnkcw4dv9gE5CAdFI5aEmUIi5
	iW9WfYpKUSLecnsCm6uSinxQV15jUosbCpkMAlUXpYIkvfleR6Itzd4NV1d7ycHLyMPU9GdLEzG
	ulSa9N2GHJr6sV8fCdl6GxkSilYUMCzPGbOtGl2X3aT309nP59IV/ukb40naWzjBhqTUMZQTuRs
	v5/UXCpZUlQZqxzHnLGt5luuTy5T1j8rfcoB3G9QemHivs+vHXK4dHfJlWEnz+LMzEYHAOY=
X-Received: by 2002:a17:903:2c0f:b0:2e1:2ce5:677a with SMTP id
 d9443c01a7336-2e6003b5d0emr12356995ad.16.1791352736407; Tue, 06 Oct 2026
 22:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006210313.43163-1-pmazzini@gmail.com> <20261007012337.6765eae7@ryzen.lan>
In-Reply-To: <20261007012337.6765eae7@ryzen.lan>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 7 Oct 2026 06:58:40 +0100
X-Gm-Features: AclHuK9so5s6SVHKBrMxWd9wydw_PDXudCltTNho_5K9L0MuDF1LhfNqIbWLxW0
Message-ID: <CAAxh=jvd=dR4anQ9P=f=NtUePTfXY0SSR6PXxc8VvDcjP+ni2g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, that's simpler, thanks. Will do that in v2.

On Wed, Oct 7, 2026 at 12:23=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue,  6 Oct 2026 22:03:13 +0100
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> Hi Pablo,
>
> > init_pins_table() adds to npins in the driver's static descriptor, so
> > after a probe deferral the count doubles and the next probe fails with
> > "pin 0 already registered". Count into a local instead.
>
> Can't we just initialise desc->npins to 0, at the beginning of
> init_pins_table? I think Sashiko suggested that even...
>
> Cheers,
> Andre
>
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl=
/sunxi/pinctrl-sunxi-dt.c
> > index 50a16f3bd131..1c1888394cf1 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> > @@ -75,7 +75,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
> >                                             struct sunxi_pinctrl_desc *=
desc)
> >  {
> >       struct sunxi_desc_pin *pins, *cur_pin;
> > -     int name_size =3D 0;
> > +     int name_size =3D 0, npins =3D 0;
> >       int port_base =3D desc->pin_base / PINS_PER_BANK;
> >       char *pin_names, *cur_name;
> >       int i, j;
> > @@ -85,7 +85,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
> >        * Also work out how much memory we need to store all the pin nam=
es.
> >        */
> >       for (i =3D 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
> > -             desc->npins +=3D pins_per_bank[i];
> > +             npins +=3D pins_per_bank[i];
> >               if (pins_per_bank[i] < 10) {
> >                       /* 4 bytes for "PXy\0" */
> >                       name_size +=3D pins_per_bank[i] * 4;
> > @@ -98,12 +98,14 @@ static struct sunxi_desc_pin *init_pins_table(struc=
t device *dev,
> >               }
> >       }
> >
> > -     if (desc->npins =3D=3D 0) {
> > +     if (npins =3D=3D 0) {
> >               dev_err(dev, "no ports defined\n");
> >               return ERR_PTR(-EINVAL);
> >       }
> >
> > -     pins =3D devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL=
);
> > +     desc->npins =3D npins;
> > +
> > +     pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> >       if (!pins)
> >               return ERR_PTR(-ENOMEM);
> >
>
