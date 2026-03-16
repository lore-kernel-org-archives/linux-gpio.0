Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC82384244
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652134; cv=none; b=YnsLzF5joudaf8Df5H4LbILJn5MS2eDj4kh5uqdb8I1amX7CdhypajjoMyma6kNKp39nAtC+PmeI9x5hoYtXZOIvj5+li+ABb6tLXY6/V2ma9+ArsBHXR0i41Vasr+JJPlXcTsUolKwrzpq9LJfQhXjTuAp4vr1UnVgDnx2O+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652134; c=relaxed/simple;
	bh=IHP2z/7YeWXK6Tx4xtubEup0KBNca0fnUaaTxKTXo0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgKelS49NJZv3QYzh1csj6dDogSuJblRQos9Zjogtn1OI5E3ytUuThuDLmENO81aa3V19oSZLnM3fWik6t+57yYiSC2fQoP/WbA8RlFjZdU0Ll59lm7en2okFu3kcqbyQpvKjryeYqXo7/Lbj0RN0KuMjt+Nz+WK1MJ7HUf25iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cfd1p+je; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cfd1p+je"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF188C2BCB2
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652133;
	bh=IHP2z/7YeWXK6Tx4xtubEup0KBNca0fnUaaTxKTXo0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cfd1p+jed+2I/+2rf19TdHKMBG9ibfRW/HVz7if3RgCQ2iNPhdaNOoT+I75rCqZQH
	 AVaUTQSd31nvk37LrOLbBXgA5vNPDyDMwvwjdaqxcRp1NGmDpvIHaiAOVzJB1YgxlP
	 Lfz3fmmzsfU83Gr42fXaDXbDnsO0wQXUmZpJuc7x+haIvz06VIrzbcWo89sHUfK2s/
	 aTlUiplClTZhbyXL0sChAnoQ0tO5nzSpcYgr9jsPmaBGv/Qfx7qLuNXMRahLWCqLWf
	 e1gjniiKFm4b+kHj/kJK2iTW0amUuhEVND1nH5A+b+baD/JUF93pZTimp9QfS6zxwf
	 ojRbZEiflMygg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64cb577e79cso4614542d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:08:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8TP3OO6/FeEl4lVyNZErgWSjNZja1aisgFGqPTUNKYftDyBIVhcnah+DhInZ4Wf3jIGktiqUFs5xY@vger.kernel.org
X-Gm-Message-State: AOJu0YwfnJK0KO7oDYkWjuEoxGfme2tKsO7J0Ki3nsYrYA3rh4opoO8u
	brFJDZNHkPWBkODribYYBXWiFpYVffLPMWA6LM3dyBPH6kDig7hdV34jwLbght03fRhbjZc1q+w
	zjswFiKfleXwCBeTkmUzrBLm55Y0uE/0=
X-Received: by 2002:a05:690c:7344:b0:798:4f55:2c59 with SMTP id
 00721157ae682-79a1c188c09mr124992917b3.39.1773652133121; Mon, 16 Mar 2026
 02:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me> <20260315014205.471d6834@ryzen.lan>
In-Reply-To: <20260315014205.471d6834@ryzen.lan>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:08:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLmO-wpxYZJw2PCoqD73Kom2s1_5GT7CXQGMi+ED6sh-1A@mail.gmail.com>
X-Gm-Features: AaiRm53q4gewf2JyuIj82fugjLAoB6_CrhPdB9DI4ls4pXU8cNr5OY8BWc8rHig
Message-ID: <CAD++jLmO-wpxYZJw2PCoqD73Kom2s1_5GT7CXQGMi+ED6sh-1A@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 1:44=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
> On Sat, 14 Mar 2026 13:14:25 +0800
> Icenowy Zheng <uwu@icenowy.me> wrote:

> > Ah, is this a userspace API break?
>
> Was that ever a guaranteed user space API? Or just something
> that everyone relied on because it was always the same (until it
> wasn't)? Similar to /dev/mmcblk0 being the SD card?

As Torvalds has pointed out, if it has users (that complain) it's an ABI.

However if a tree falls in the forest and no-one is there to hear it
fall, it is a philosophical question whether it makes a sound or not.
https://en.wikipedia.org/wiki/If_a_tree_falls_in_a_forest_and_no_one_is_aro=
und_to_hear_it,_does_it_make_a_sound%3F

The ABI has been broken since the first introduction of dynamic
GPIO devices, because anything specifying -1 as base will
get some random semi-predictable global GPIO numbers.

> And ignoring the ill-fated old-style sysfs interface for now, how does
> this work with libgpiod? Would it still use the absolute pin numbers?

No.

There is also a new sysfs that enables you to export chip-local
lines, and this is what you get with CONFIG_GPIO_SYSFS.
The old ABI is available behind CONFIG_GPIO_SYSFS_LEGACY
and if the users don't enable this, then they don't have a
problem with this patch.

> I mean looking at that warning about the forced GPIO numbering we
> get, using base =3D -1 seems to be the recommended way?

It is.

Unless there are users that love the old ABI (for Sunxi, I *doubt it*)
I think the patch should be applied.

Yours,
Linus Walleij
