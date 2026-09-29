Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDEE41A92C
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686001; cv=pass; b=bubSG9GZZBQdwBZxFVESD3rTteYQ8IX7RzhN/3wxR4DGE22j4auGMB+jlKBqeCCzWmyutYw+LpLlMGLUg1UvB0tUEskJ5cDAXltgOBfSaLi2WwkLel4tf1dZ7hAWAQFWdqvJKnAf0z4o3q/5daXk6mhtzmP2/1DxtneNLqoU61M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686001; c=relaxed/simple;
	bh=epuukrWfLwY64O+T6DJ6mUEc5U2I1eEXmIgEk9P4IJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O182bPa9jnyqoE2CWISHVi8nY1NmbMvwT7aFSDZrqpKZion2WGkiEVJYPk7pWBJHu1WHEYYt+MGFCJV+mohC7XYZxw4HyceD250K1TgtWq57gOAETYO8L0hTd2HWL1YGvCe06QhVfB83eyp54+whrTa3Z5jcm7D60xtSTP8LoM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLuQ8Gfg; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLuQ8Gfg"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbbf409b8so409200566b.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 05:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790685998; cv=none;
        d=google.com; s=arc-20260327;
        b=DKEn5cO40iqAcgvBcq/n5JPZ10y9+qe3EKJTBjOOosb5KNpvbNuA0vxqkpoAEkK0GF
         zQpTPkRLsw/tbdOU/lPNpRePZ+IUwEywMVsouktgN5AHBq/xCQRtw5FmRrSxmMz5DT26
         W8MTyRc89vRxeEqWNEU7BI0F3d/tPrdeN1lxSY2Ae3pT/DbdLz2b+kjf9KfqEHtZ2HPo
         esQQ6oUhU/A9+pcycqdhRARpgCB1QxV7ReiRROUkFfi2fRyjiGkcyComUy/XLAz28BC7
         YHdiS9++10C9AijP6AmlsKnp35wHvD1Qcqw6v0/bu6MpDJz5m2LMabG9FlRazPWMO8U8
         //xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YwGp6LLrC6+cNnTMLzub9cppjx2HiEgd8s5IY+o7TjE=;
        fh=ANDgoQaB0l19irM8h0Vr7dHIhEFyjTNoMJ5/sUK+6X0=;
        b=l2aFc4aSSgr8HZw5e7CI1aeN66bSiH/6gOXrLWBRgSxko3z0CI4PHr/qzZxBDH3M+s
         ImiL/6HxLwKIX1MjAksTD+6Tq3BgUOwjYfra7lNxMMNbZM6VKsQKJVrolB8B+uuvcJCo
         pkqmG18/mXz6jc5Mp5dn4II9w/lGt5dJ16TCQAGmU9R4LBMu4XteAOaYbBXvywzJ4Hla
         259DBl0qNJiV81Hy1cDJGmFHVoKU0jMTn398cdPTbclDwMNkdmaKlrkvt1IeG8vzGJGq
         l6NwfeddrXPkPtaOHNyIsCR3IePes08NnPoeAbz9mMJol4C0tpvpoFLUMCNJxP7+mdXb
         rK9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685998; x=1791290798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwGp6LLrC6+cNnTMLzub9cppjx2HiEgd8s5IY+o7TjE=;
        b=oLuQ8Gfgzg7xyNmfGMunZZOG5CIwh/g7grvyAl0Tzjqoo/T5v+J1IGlRMOqY3tNK1Y
         uP/8Zdy69EPjKkhET1rpM7gsdknfmg+8QQnbkIw1djV4CQm1t2biskGMN5ZVuvIfr4FH
         4ZIWWXVe8f6GvpIkYPKW/Bjqu2CNLT12rjbTJreQgqd/D1K4me0nWrJVB8/RoreDU24z
         LUp0XT5hz5rEqkCkdJ54Ef32N69l4oAKe5p8vc1Ate/ZWkZzk9dBHuoOllzLmLsQAx7Q
         xWUqHtieADtgPBqGca6YV1wiowq/fJuYNUdWxQTUSYyK/eB0DdlXGqhh3de/rgn1W3eg
         xQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685998; x=1791290798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwGp6LLrC6+cNnTMLzub9cppjx2HiEgd8s5IY+o7TjE=;
        b=Ncpdl2FcfpejUhmqFXgKFUy0Y1KlKlpyZnMPIU+8UmQrP8xx2JjIZxql5YnVAQr+4B
         dnxr6yvsh3OA+7t/nVVIRohqwHoWesMWbyby4LkvKALa0O5yNTuBJriH1C0CktCcuKOf
         63JSdjidEiRG4WfJEKP62Cc/U32ulfloJdQ/GDwly0NOeutCwCrKqOzDco8jraDeeQ34
         PS5P3GdWuJCPEeVZl8Ik+ghAe5BIBQZhauTwM0QSv5ePzohe1U7/PNQIHMVyxq5tN3HO
         Bz7az9UuHNd4ezC3DQ9ct8emWfOLRczTmvA3v79lywFoVN8W69O3x2oFpPbX3RFf4VHe
         QlYg==
X-Forwarded-Encrypted: i=1; AKwUvBwixspVh29oemaotytKF8MlGamVBgdDfm+D69BLAaHH4sFITyW7AgyXw5IugB1BYNR0mLMNQgZELknW@vger.kernel.org
X-Gm-Message-State: AFq9FYJjUJgg4gPahvQLfXqK00xmVHMckW4KyUtCNnokvDNpLrA3AywY
	rPc93HBT8w8dph4tZDB18Phf1GbgIEMk4itSG+jivgUImvWqcvFa4gcbFX5BBxu17qqUMy7idId
	cVA48JgBoYPW6KM9GQEL/dQZZgDX/sFg=
X-Gm-Gg: AYBFou00ZzyIAvca1HA7w6rBBATb7YsgTOVXFVFJBg4JamCSntcx+pxDzKHKHG3kdZe
	3PNcaZCCI8F8bh+2IEz5BXEJwjp8SauAtAXp7MhtZbzUVQWXU0RGz2BZZdZW7AiSvK/S+7pb3Hd
	bPDkKQtzxLi5E67K2Ey3YtuzGvUnJeINodZm3q6Oax0hJiRqbNqrGWTpDKSDG8J8s/pBZtIeHof
	dk4dE3zaXL63o1EYP9B+6GyB08m13f+X5DQNIr+b8m+Hu0xu6QTL4rqGbr4t7s4yX9+pB993Xte
	dakM+/XmcO1QmRtYaASueu3yGd4rkD129jH6BuZbelUs5v2rBfi7D0ePnM7X7IYHu50DC7eteQI
	bw5oHmrb0yTBh0FiXOv87VcJU345ltMaoYuMXM+L9v+MU/fUOwAaA6krOUotTDtQivciV7k29uz
	6RhVeOd9l1QITsXdczVL6V63PMXPjtGG+WqUXTL3+Zs3C64+mA53I=
X-Received: by 2002:a17:907:9811:b0:c2a:46a2:5b57 with SMTP id
 a640c23a62f3a-c2ac2375464mr1261369166b.10.1790685997699; Tue, 29 Sep 2026
 05:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <20260928123446.GH106095@black.igk.intel.com> <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
 <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
In-Reply-To: <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 15:45:59 +0300
X-Gm-Features: AclHuK9eM-z23tmTxWp3mB574OeAxAx9uEP4yofS4FOytnllOZRupTj8wqenUOo
Message-ID: <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:15=E2=80=AFPM Alan Borzeszkowski
<alan.borzeszkowski@linux.intel.com> wrote:
> On Mon, 2026-09-28 at 16:13 +0300, Andy Shevchenko wrote:
> > On Mon, Sep 28, 2026 at 3:34=E2=80=AFPM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Mon, Sep 28, 2026 at 02:34:44PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski
> > > > <brgl@kernel.org> wrote:
> > > > > On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> > > > > <mika.westerberg@linux.intel.com> said:
> > > > > > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko
> > > > > > wrote:
> > > > > > > On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg
> > > > > > > wrote:
> > > > > > > > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko
> > > > > > > > wrote:
> > > > > > > > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz
> > > > > > > > > Golaszewski wrote:

...

> > > > > > > > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> > > > > > > > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> > > > > > > > >
> > > > > > > > > These are interesting drivers, not sure where to put
> > > > > > > > > them
> > > > > > > >
> > > > > > > > IMHO they should be there too. We are maintaining them
> > > > > > > > both.
> > > > > > >
> > > > > > > Do you send PRs to Bart or you just rely on him to take the
> > > > > > > patches?
> > > > > >
> > > > > > I don't expect these two drives to get too much attention,
> > > > > > and they could
> > > > > > be contained nicely inside intel folder and that would help
> > > > > > Bart to
> > > > > > identify that these are Intel drivers. So your bandwidth
> > > > > > would not suffer
> > > > > > even if these two are added there. Your call.
> > > > >
> > > > > I'd like to avoid a situation where we have Andy's Intel
> > > > > drivers under
> > > > > drivers/gpio/intel/ and other Intel drivers under
> > > > > drivers/gpio/. I'd prefer
> > > > > to move all of intel GPIO drivers into drivers/gpio/intel/ and
> > > > > have Andy
> > > > > gather changes to them if he agrees.
> > > >
> > > > Okay, we have two parts missing:
> > > > - Nova Lake driver (I would need Alan or Mika to step in as at
> > > > least a
> > > > designated reviewer for that)
> > >
> > > I suggest Alan to be the reviewer if that's okay for him :)
> >
> > If he agrees, he can provide a patch on top of my series to move Nova
> > Lake and add himself to the MAINTAINERS at the same time.
>
> I agree to be the reviewer. I have the patch ready, I can send once
> your series is applied.

Just send it now, in any case my series is blocked as I have not seen
a consensus on what to do. Or do we? Bart, Sakari?

--=20
With Best Regards,
Andy Shevchenko
