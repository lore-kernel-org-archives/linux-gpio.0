Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D325572E9D
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418300; cv=none; b=PeYtpOqbYAUUX7z7J/dFrvMtqjLV+ZcVpLaW+cxz6bXB4nVGxay3O/1nqc4SGyz/nNguymepbPf2EGRNuuHhKhKjdVS9QSnyXLhP4YkBTMaG01pxshQQTYpVTPXAqNhDk/Px9qlyULfyr7nXpO+a6wdhSeZbSAZftInP+H099OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418300; c=relaxed/simple;
	bh=2OdcfPo0f7CvRCyc0g8bK1HIDhgLVKEqSKZ8utx+/DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNCiSm4JuQ8wfhzpckj7Gy9M72WJjkO0QQy4eS66QFX2R1vTvV3jmwONE6CxXcfvpT9Tq/8wTZ42XWux5NWmo5PNH3W2LYoYMruSTP3ppVOV+4Gz0OT+LNm0FDOetuyhYb6bj1O96X0P8GSucuIf92x/INyWUn7UOwbF7RoY4Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLGq1ed0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLGq1ed0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060291F000CE
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792418298;
	bh=tUBdSvbFcZn61woC/8r2e8q9PPFcbN0sxv6OLZLx7aI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cLGq1ed07E8BI5S8I/05mlwT/bn4mCRjekab/VLmDgskxjQgUG9g3TtSO3r4uj28X
	 Pn3jxJfujuxhrsaHbquy0XYVSRmwH/Gw8uW5odmTMKB+y42nO93cXs7hQmXjpzCKaN
	 Ck1myLBRwKlgl/fD6hnMLaeEIC/VtQUhg6wOYkagbF1OyATCtW8vvjgr0pivyqgq6s
	 8HPqEZTaD7Oq0gGrYeo4LU6BsQajjkDAUrybAseLqqql24XC2+EutCuOE9KAUwRI6P
	 smjLAg/nN3lL8jb6WR1T6ncQCs5L/QM5oZLmlIMdG8bO75FsvLMb9R/FpHjJXzixnM
	 zx0DkIiCyVqPA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso1613521e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 06:58:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw77FgE/qnk4RZYvRbxPV8NsDIYMUGyMKVU0RKQo00AaIErpI5SwilrhvQAGSvlD9MQ1fpOPymWssg1@vger.kernel.org
X-Gm-Message-State: AFq9FYJnLoymkKExaUJ4KNLPSm6b3uQpHotVI78pQY0KxL50rrl7tlWZ
	vdOPoXjJKZGIJ6c1DM3Zxja5Q24ppG8ljo2Xhh+5zy1TPyDiA338+zM+S2EECwYIFcmEjn0XXEB
	kvpfDkL8eAYavRCG8AN2R6XJ0tJ9e9ykPXal4D65idg==
X-Received: by 2002:a05:6512:3090:b0:5bc:ed73:f68f with SMTP id
 2adb3069b0e04-5be50a69debmr2539230e87.16.1792418296576; Mon, 19 Oct 2026
 06:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
 <20261016-gpioctl-v1-3-8770622679b8@oss.qualcomm.com> <PH1P110MB1603341FEE65946773070BE79F98A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603341FEE65946773070BE79F98A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 19 Oct 2026 15:58:04 +0200
X-Gmail-Original-Message-ID: <CAMRc=McQ9yQc2dauys5LMEHbbBER5zPURKmkPgVZ1fUcfh_gSg@mail.gmail.com>
X-Gm-Features: AclHuK-ViuhyBRR63EKPjp-o72OL-h45FECY-Mt0lNypNwwdzrFKSu_sMaF1tgs
Message-ID: <CAMRc=McQ9yQc2dauys5LMEHbbBER5zPURKmkPgVZ1fUcfh_gSg@mail.gmail.com>
Subject: Re: [PATCH RFC libgpiod 3/3] tools: implement gpioctl
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 3:37=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
>
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Sent: Friday, October 16, 2026 9:18 AM
> > To: Linus Walleij <linus.walleij@linaro.org>; Kent Gibson
> > <warthog618@gmail.com>; Vincent Fazio <vfazio@xes-inc.com>; Andy
> > Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: linux-gpio@vger.kernel.org; brgl@kernel.org; Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com>
> > Subject: [External] - [PATCH RFC libgpiod 3/3] tools: implement gpioctl
> >
> > Provide gpioctl, a new command-line tool for persistent GPIO line contr=
ol.
> > Unlike gpioget and gpioset which release lines on exit, gpioctl holds
> > requested lines in a background daemon so their state survives across
> > multiple client invocations.
> >
>
> This would be very useful for us since we have scenarios where we're back=
grounding gpioset to sticky the state and then using pgrep to find and kill=
 them.
>

I'm glad to hear that. Testing the functionality of this is very helpful to=
o!

> > +
> > +Persistent GPIO control tool
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +``gpioctl`` provides GPIO control with **persistence**: a per-user bac=
kground
> > +daemon holds requested lines even after the client process exits, unli=
ke
> > +``gpioget`` or ``gpioset`` which release their lines on exit.
> > +
> > +The client auto-spawns the daemon on first use and communicates with i=
t
> > over
> > +a per-user abstract Unix-domain socket. The daemon exits automatically=
 after
> > +60 seconds of inactivity.
> > +
>
> C is not really my forte unfortunately, so RTFC won't help, but is there =
any mechanism to either raise the default or extend this timeout or "sticky=
 until stopped"?
>
> Our use case would be: we need to set a pin and do some long operation li=
ke program a SPI flash where 60 seconds won't be enough.
>

Oh, maybe the docs aren't very clear. If you request a pin, the daemon
stays alive indefinitely. It will only exit if there are no active
requests and no new connections within those 60 seconds.

So:

    gpioctl request --output foo=3Dactive

spawns the daemon and until you do

    gpioctl release <request ID>

or

    gpioctl stop

It will stay alive.

Let me know if this is what you need or if you actually need to make
the idle timer configurable for some reason.

Bart

> I suppose callers could simply request the pin state via `get` but someth=
ing like `ping` would work if it reset the inactivity counter which it look=
s like it might.
>
> Since it's "hidden", I suppose `ping` is unstable and shouldn't be counte=
d on for scripting?
>
> I won't be useful in reviewing the actual code but from a "would this uti=
lity be useful?", two thumbs up.
>
> Acked-by: Vincent Fazio <vfazio@xes-inc.com>
