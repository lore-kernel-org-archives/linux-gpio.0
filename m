Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957ED376A05
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841199; cv=none; b=Q2chBWor3+M1oqr23RN1kBMKM2fGV+oM1YKDZYdqaLHNiqCf0QWzqRD6BZmFl1YT9lwzVFdkoPWleIa7dicZkcGmVmzT8JYF2ioYup3y5vHB0xI0kLK34XSphc8jtke/4tkJ7UcaXU87CELS0xgyFZJBetraJ0hM+A4sXu+gPVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841199; c=relaxed/simple;
	bh=BnyoYXlx48o6LiKRnqfSaEEHyc90mBDXq3VnD8GdE04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKui0tR1tAEuixTUVWlmnp7Owe1hMrb2lpnvwlXJeYUDeL/eHl/HHFRwm5Rmj7VNeO14Z38EMX/1bBxO6KsKtT5H5CzT1Zfj/4x+UuGDMxTdQqo/QbYA+aI1hDbM2aqo80glcx2Bkm2hdQUGOytpRjP22laK7klTyly6HlLiIig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sg2vrAZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sg2vrAZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4931F0089D
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790841198;
	bh=BnyoYXlx48o6LiKRnqfSaEEHyc90mBDXq3VnD8GdE04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Sg2vrAZRhe/78hv0dYmb8hkAH8i9ibDdhHfcXEyQMYIVYscVxwFzhHgQ+CGKd6tMc
	 ssqugj+waRHcJmf42M55QGVldecfKWWRn87c07aLfIlLQeKgor0EHznDZol5QTEQx6
	 RuJT0ltdjjD6jzHnoafcdFXvfL2x2I9yIfPrfRCxvnLTWZhCZwM+pZ9rvkw1KnrWqR
	 vmH8CnbA2wwgObo/GTeBoUwJGJ6t//7K0fW6AhoTlAzrJoP5+Ss+4qtwQi9hY6Kyvy
	 nejgOlpTQ7HLmhreZ/mN/3Gg0476G4VM6Dlzc81bay/EkDdtzDble4pOPuxXGLjDrr
	 fA6gY0H7hjO9A==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a77141826cso16043191fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 00:53:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFVwzhVhy8gycipjMCh5uaHzNDArB0bDXDbCiENW6XwqteQxoX4rvrxODbaWaPjV7ECpzp6Dq6GmV9@vger.kernel.org
X-Gm-Message-State: AFq9FYILbqN0Ci+Jb1IsEeI2JDOPVHgIY/YhyYEZWhZq6yjnT4h16bz4
	htHogvy5UstFY+BGQUe6qKEcoIKBnXzA/dQ8N75X7R+N14I9T4YouFnlz8torK9vmceHDdQkv+W
	vtUDg/OTf8Ng/1OB5nwxucUM+/A2z6h4=
X-Received: by 2002:a05:651c:418d:b0:3a7:6d4a:1c9f with SMTP id
 38308e7fff4ca-3a779208624mr10185991fa.15.1790841197261; Thu, 01 Oct 2026
 00:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922103051.5257-1-farbere@amazon.com> <20260923182243.41060-1-farbere@amazon.com>
 <20260923182243.41060-5-farbere@amazon.com>
In-Reply-To: <20260923182243.41060-5-farbere@amazon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:53:05 +0200
X-Gmail-Original-Message-ID: <CAD++jL=cPZ1vEDgXodbmHAGd2jr+X8DdaH7yxbfN7OJMBojSpA@mail.gmail.com>
X-Gm-Features: AclHuK96XSBtmlDHjUjVB2CCIFY5lwq0-m1jdyvq1z87aPg8ZZ_e7N-RjYFed7c
Message-ID: <CAD++jL=cPZ1vEDgXodbmHAGd2jr+X8DdaH7yxbfN7OJMBojSpA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
To: Eliav Farber <farbere@amazon.com>
Cc: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 8:23=E2=80=AFPM Eliav Farber <farbere@amazon.com> w=
rote:

> Some boards route the PPS input GPIO through a pin controller and need to
> mux it to another function when pps-gpio is not driving PPS. The driver
> core applies the "default" pinctrl state before probe, so the pins are
> muxed for GPIO/PPS use while the driver is bound. Nothing, however, hands
> the pins back when the driver is unbound or the system is shut down, so
> they stay stuck in the GPIO function for whatever runs next, kexec
> included.
>
> Look up an optional "inactive" pinctrl state in probe via
> devm_pinctrl_get() and pinctrl_lookup_state(), and select it with
> pinctrl_select_state() in remove() and shutdown(). The state is looked up
> and selected by the driver itself rather than reusing the runtime-PM
> "idle"/"sleep" states, so its meaning is unambiguous and it does not
> depend on CONFIG_PM. Boards that do not describe an "inactive" state are
> unaffected.
>
> Since "inactive" is only meaningful as the mux to restore after the
> core-applied "default" state, reject an "inactive" state that is not
> paired with a "default" one rather than releasing pins that were never
> put into a defined PPS state.
>
> Look up the pinctrl states first in probe(), before pps_gpio_setup(), and
> route every subsequent failure through a common err_release_pins label.
> The driver core applies the "default" mux before probe(), so a probe that
> fails after this point would otherwise leave the pins stuck in "default";
> releasing them to "inactive" on the error path is the symmetrical
> counterpart to what the core did on the driver's behalf. A failure in
> pps_gpio_get_pins() itself returns directly, as no state was taken yet;
> pps_gpio_release_pins() is a no-op when no "inactive" state was found.
>
> Convert the pps_register_source() failure path to dev_err_probe() too,
> so all three probe error paths that share err_release_pins log the same
> way. This path already returned PTR_ERR(data->pps), so this is a logging
> change, not a fix.
>
> The mux must not change while something can still drive the pins. On
> shutdown() the requested IRQ and the echo timer would otherwise outlive
> the mux change -- device_shutdown() is not the end of the road, the
> kernel keeps running to load and start the kexec image -- so a timer
> callback or the PPS handler could poke a line that by then belongs to
> another function. Tear down in the same order as remove(): free_irq()
> first, then the echo timer (only when the board has an echo GPIO, as in
> remove()), and the mux change last. shutdown() does not unregister the
> PPS source, which is a remove-time concern.
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>

v6 looks reasonable to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
