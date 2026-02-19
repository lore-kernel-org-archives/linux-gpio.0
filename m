Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6603D2F5487
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771519201; cv=none; b=vBHkBJ7aTp4ULJklufAdPeob89cH3I5KKnM0abmjde8Sc6yI/JGzuh7knKjQPxsWzcv7B/UewjQRrRKiTCVui6ixv0Ay1ux0M3D0AfSFdbfDT44/1z7lPTCWS3o1fUTUxyLne30LFeotPw7LPUdnnc/ygbbHhCL9Pc54pEx4j0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771519201; c=relaxed/simple;
	bh=wQ+0DM9KjFKzFPbbxFnSyLUwjzbFJw+Vn38qyJDyfE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lT05JsbzXhlcem/BChBiiQY2F2Gx3TZgHQMu5nb6N7G2YZUvel9a6c4205Jqgo4m72FRGprx/kIyrSmBMFUPSCmTZFJJQYZIW/CQ332fdYXJ35IOQVp/D4U5f/VJHy+dwnPd0mtN34jCtTQ9w17p6ECwC+e1SlPiMvrz2L9hrLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MREM3Nkm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MREM3Nkm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAA7C2BC86
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771519201;
	bh=wQ+0DM9KjFKzFPbbxFnSyLUwjzbFJw+Vn38qyJDyfE4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MREM3NkmuAKznmnxz6mewESVYvX3ACw/VmJZPZBplgWdZGZ/5M3QnTgGAahJOWtgZ
	 r6CUAo1Be0lJwpJjHgSIfRHM/Tw4eHY1Qn4zUj3UQ2DulsxcxADR+p5roXE+ZEYrtv
	 KONjQIfvoUfWp1HAEcm8h2D+5rmyiUWZtxNEH0i2AsBwB2DC2xn0MfNexWBt2vco9P
	 1y7RKF8jCKHNiKCZZg1AgSH17S7zJnZXvAqRvIabI6GzrYkBUNRUeLA148WNJExi41
	 BehS4N0GhHA5RZQhuy0pe/PYA1/YldvHN98yh1HNH9eAlfMF3oFtD1LcN/JAHzbVWg
	 1Alr9v9JGa06A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3870cbd6c40so10693081fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:40:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJNJFuhQ7bz+211mBimTVSw7qRDvJQOZ94Dav7H9sfgfPx78mxLMBX818IldPOe45a/f0A5pJyGX5r@vger.kernel.org
X-Gm-Message-State: AOJu0YyHchjCjvywmi2lu9KZTUISpa+yTPha1wVHiTiCDa1M25y4xeo6
	/qrukIqUlyIrxNrHXCJveKJwuGLI60S8v8slvEu+frJFda8vUTZmFtk88fGY3FsGUZvq8/oDDzS
	yp1K8sJcwv8CJp7sTv5g6Kgvz1MrLthoJVU8Dw7qrkw==
X-Received: by 2002:a05:651c:1583:b0:385:fbff:ab39 with SMTP id
 38308e7fff4ca-3881b93d9ffmr53837661fa.21.1771519199186; Thu, 19 Feb 2026
 08:39:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com> <2026021900-trekker-twenty-9daa@gregkh>
In-Reply-To: <2026021900-trekker-twenty-9daa@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 19 Feb 2026 17:39:47 +0100
X-Gmail-Original-Message-ID: <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
X-Gm-Features: AaiRm52BiF3fVbMF5u7zY0-MvTafgVKZLlDKD7r0jmuH29tKUA6o67_9pPe7Ocs
Message-ID: <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 5:36=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> > Provide an extended variant of device_match_fwnode() that also tries to
> > match the device's secondary fwnode.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/base/core.c        | 14 ++++++++++++++
> >  include/linux/device/bus.h |  1 +
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bda=
85e0bb7f6879879c0 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, cons=
t void *fwnode)
> >  }
> >  EXPORT_SYMBOL_GPL(device_match_fwnode);
> >
> > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
>
> No kernel doc to explain what this function does?
>
> :(
>

It's not like any of the other variants from this file were documented
but ok, I can add it in v2. Still, I'd like to hear if this even makes
sense.

Bart
