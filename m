Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97770528427
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688717; cv=pass; b=RV04Cp6l5NkHALbF6URsK+5Iru/c+BxHOgVeouYfDFdHOBlosM4qA1zSXedJTp9XAreThtnUd80S84E7vcvwQm/hr6tZuinGl6BSpS+qFvvc5TorwM+HgtAK5CRjQHfOF6NeB0K6d/xUxMGBfPfy0d+oLuiKk/hg8bbujD0fOCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688717; c=relaxed/simple;
	bh=D7kmmG1GuO/EhWy2JaVucoGOlHpDmY1uBa+Wvm1wk+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrMVQyuy9oHK09gpaEKg2qUDjZwfDcgLrulo8tukzfdDN18Dksd1dCDEISfH7GReWL3Hmr4wrVWeI4anzlNTpVdaKcoboy/KclVGDgKw+1etc/8rtumHFQ9r31H6mMT0/OCkfxKraCYsrhsAQvtasFWfXHRcHa5e7vmvJSxspjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7SRBFAs; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7SRBFAs"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e01f5c0aeso33712266b.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688714; cv=none;
        d=google.com; s=arc-20260327;
        b=WcHkAQQkeG2EZfyuJAdnITbjJkrGBtAzwRhK2w+SlwCEreGlhi45GAftzD7hf/464w
         CQr6xg3BWtfqLlFvh3M0/6b0YmZFHL/n8/RSTx/jPYybCG2s5oGl/kbyGWR+6xrWzp4O
         nJxV5XH0Ao4awHOP0VzL/3hrM2x3Xxk0fqe+oL8pGblD8TyJLLvQPrgydB+aJ+Hl/Ixi
         ZjwYz3hzrM/dYuURcoI6+eO68EsCNxchRmP67YCNswh1haqnTtpzfxuKpI/OoPcGhPhL
         LrvBDr1s75N+3nPwu0fxnpyqHG4FggNYTSv++o7MIpLk477OxmAgnk6FcdmaTCoLCOO5
         BeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WbkScVBZE8CCnigxn/KSUYXgCxDjqVU+r7tVnxGgsoU=;
        fh=l0w+qU8som5pVNWwbfL4EGEn1Vu1e2t1iAAI4ybIloI=;
        b=b9jlnGaxExIZLyL7Ynuh2XQurvq+Xa1pfvZ2JfxEYXE3JCgbXHPuqIG8P8QY8fkl85
         Ep/h2dc0b1DD/MAyvTGX+9tIQrMx8R7TAzv+vSfdTRT7w23mJGb4yd8iOKmFR/CRjaXx
         1INhJPAnOHO6K42GP9+T8D0X6QN2P+AvSfZ/Hs4Lzn098jNVVHsLXUvyN7zmPou/+B+N
         VL8iOaczTZsc6Ulx1+ZBrL585vlRX2lumyi6GqnOgFSv3E+qZVF3TBIXiaqsJlJ79TGY
         TAG46fOsq80CiP7h57a8Oxva0gYj5jj+OHMWTQY6YR1drW9cyKZDtC/ylpTrgG7E4mBw
         jafQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790688714; x=1791293514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WbkScVBZE8CCnigxn/KSUYXgCxDjqVU+r7tVnxGgsoU=;
        b=V7SRBFAsaFxF/bR8AQCChI7QDr+gdHtPCW46ieDSLtl1J74RVKh1nCru4tmUxa9pzs
         DJyd2RzpdXCwihB+MdHYouTMz/mrdnPelARnf6G7rcSuWWCa+KPBzi+H9VL3f6uKiTTN
         E6F6S9Y2XEj6mhXQPNSOArnDr+jC6UqZ2b3euo4Z1gCWMVeVtUHm0ZmP6R6NP71gOd94
         PXETtMkoFrPiwkimK0LckENGT7QiT+2l0CaSK/uORYzbm197AcvneSNXYscwzehsSkT4
         hJkECoblzvXakrtqHityJ63xVaW3D8rjIpX3kO+kEsIiEbuEoCjABD61iKxvB5mQhxW1
         eISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688714; x=1791293514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbkScVBZE8CCnigxn/KSUYXgCxDjqVU+r7tVnxGgsoU=;
        b=h4+joIXpvwTK/rRPjnlaKBhnYUDo28wRVIREmaP9sqJ8SzX6YlTGwrdsO50XRZDN0N
         UzFtSbw3h9C+E3xPlbRhXiaondCpkxlPay0+nz49DYqu7Zmd/hyuORkKbfEyMlPt/cOv
         kElUvsdCXwqElSvN1Tc2dHdfQSp7Loimk1lHO8Yh826etjUF7CBxvsEJ7jXoegtG4txS
         fw8solfeaLOCeqU5VAdBKZfBE1fpDfX2OPot5AjL10SmFl2wHQ69Gja6VPDX1OFOwFX/
         ZPsb241tAT8pDUsMUIpr64sfLK67fOfmsNson+3x7WTRquU/vHKsd6EtVdLsVsLD8boj
         R17Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHEeLDGnweSkGoKCfW4Ikeyl1myaj+bPhHUViTBnzHXYfM/sX2nA/FHfOI81EcKwzV0NeVof2RIADV@vger.kernel.org
X-Gm-Message-State: AFq9FYJFA12yKUkC9mM2Dtw3O8Hk3U1L7TJVy9gDGDDwaYR7eRMEW4p5
	WUFWsu63Mv8JmZLfSMK5kdAcfpdK7mWfbkH9yURH9no7GqBgcNh+nqmjCaz4Hr/t4oM2AIe1QjO
	bgv/VjeF4ZzQJFiTWFudHmQyGqbBNbMM=
X-Gm-Gg: AYBFou2hD/DyAn0dYf9Bvxoz8DmvsU6JmKkaAOVug5T7K3g5EOOLrDqnWYA+q48zqWR
	ZZh+gBZgl/S0pE06NpJdPqJVtlq6bZDoms9QYgrd75qzrvWMy48RmOerpIIWWY2D9idAGtnsL+r
	yoQSzhSGpz3iT7OLhq/nWKlaMRl0OTziQLJ0qzH9hRw26uRy34h6/pt0xqbRjpeF5EYavGqBxCC
	copkCmqCwymq3l6oWJ8ROrz6HcUVqgK+kcaNiQOGlUeIuacv8aSU12iAqSHLvic0qGYDJQ17oTC
	3d4/qMRxPZ32ZhN96cNYvKrgYtdNgpJSEpvhUMIXC7083AKOU3kkS5PobntlhsceglfXZ2bIpv0
	kkDWT6bgKDx372XJKVZyJCcpi4f1A7wSN4lZO1H3art3OWJb4ktZkM8AkQ9MGIM0d0IQIPqDGl8
	IbXSYZvI3NsnsiJ8cq+Q6Kb7dlHTOR9W77+CKRNWFd
X-Received: by 2002:a17:907:c819:b0:c29:d77b:66a0 with SMTP id
 a640c23a62f3a-c2ac525f320mr1303304066b.10.1790688713752; Tue, 29 Sep 2026
 06:31:53 -0700 (PDT)
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
 <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com> <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com>
In-Reply-To: <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 16:31:15 +0300
X-Gm-Features: AclHuK-nByvvmE6DU6ioowzhzoPOAiWSsnUxikS8NS0SivmigV2HdHCkEyV3rmU
Message-ID: <CAHp75VejKaoUvCYnOErrk8AYy1dLDA-u8jZghZqi5rX6hSQY7A@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:51=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Tue, 29 Sep 2026 14:45:59 +0200, Andy Shevchenko
> <andy.shevchenko@gmail.com> said:
> > On Tue, Sep 29, 2026 at 3:15=E2=80=AFPM Alan Borzeszkowski
> > <alan.borzeszkowski@linux.intel.com> wrote:
> >> On Mon, 2026-09-28 at 16:13 +0300, Andy Shevchenko wrote:
> >> > On Mon, Sep 28, 2026 at 3:34=E2=80=AFPM Mika Westerberg
> >> > <mika.westerberg@linux.intel.com> wrote:
> >> > > On Mon, Sep 28, 2026 at 02:34:44PM +0300, Andy Shevchenko wrote:
> >> > > > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski
> >> > > > <brgl@kernel.org> wrote:
> >> > > > > On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> >> > > > > <mika.westerberg@linux.intel.com> said:
> >> > > > > > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko
> >> > > > > > wrote:
> >> > > > > > > On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg
> >> > > > > > > wrote:
> >> > > > > > > > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenk=
o
> >> > > > > > > > wrote:
> >> > > > > > > > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz
> >> > > > > > > > > Golaszewski wrote:

...

> >> > > > > > > > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |=
  0
> >> > > > > > > > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |=
  0
> >> > > > > > > > >
> >> > > > > > > > > These are interesting drivers, not sure where to put
> >> > > > > > > > > them
> >> > > > > > > >
> >> > > > > > > > IMHO they should be there too. We are maintaining them
> >> > > > > > > > both.
> >> > > > > > >
> >> > > > > > > Do you send PRs to Bart or you just rely on him to take th=
e
> >> > > > > > > patches?
> >> > > > > >
> >> > > > > > I don't expect these two drives to get too much attention,
> >> > > > > > and they could
> >> > > > > > be contained nicely inside intel folder and that would help
> >> > > > > > Bart to
> >> > > > > > identify that these are Intel drivers. So your bandwidth
> >> > > > > > would not suffer
> >> > > > > > even if these two are added there. Your call.
> >> > > > >
> >> > > > > I'd like to avoid a situation where we have Andy's Intel
> >> > > > > drivers under
> >> > > > > drivers/gpio/intel/ and other Intel drivers under
> >> > > > > drivers/gpio/. I'd prefer
> >> > > > > to move all of intel GPIO drivers into drivers/gpio/intel/ and
> >> > > > > have Andy
> >> > > > > gather changes to them if he agrees.
> >> > > >
> >> > > > Okay, we have two parts missing:
> >> > > > - Nova Lake driver (I would need Alan or Mika to step in as at
> >> > > > least a
> >> > > > designated reviewer for that)
> >> > >
> >> > > I suggest Alan to be the reviewer if that's okay for him :)
> >> >
> >> > If he agrees, he can provide a patch on top of my series to move Nov=
a
> >> > Lake and add himself to the MAINTAINERS at the same time.
> >>
> >> I agree to be the reviewer. I have the patch ready, I can send once
> >> your series is applied.
> >
> > Just send it now, in any case my series is blocked as I have not seen
> > a consensus on what to do. Or do we? Bart, Sakari?
> >
>
> If I didn't make myself clear: I would love it if there was a single sour=
ce
> of intel GPIO pull-requests (most likely Andy) for *all* intel GPIO drive=
rs
> even if they have additional reviewers. I'd also love for them to live in
> a single subdirectory at drivers/gpio/intel/. Otherwise, it's still chaos=
 like
> right now, just worse.
>
> This is in line with pinctrl vendor directories. I also don't see a reaso=
n for
> moving Kconfig options into their own vendor submenus if we keep the top-=
level
> entries sorted by driver type.

So, as of now it doesn't seem like an agreement among all parties. My
opinion is that it's good to have PMIC be separated from the other
code, although I don't know if the camera PMIC GPIO driver that is
used with IPUx is good to go under the intel/pmic subfolder. I also
believe that camera related drivers are the best to be handled by the
media tree (as it's done, exempli gratia, for int3472).

At the end of the day you will have a single PR from me, but it won't
include camera stuff unless Sakari agrees to send a PR to me (which I
think won't be the case).

--=20
With Best Regards,
Andy Shevchenko
