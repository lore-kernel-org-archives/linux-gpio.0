Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56781450904
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 21:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772226759; cv=none; b=DrsDWlvuDOGLPSk8nUtFVRDMfhRIeYRxOqfDLrFl6ksKvocpt37p2NzGKi0YEu6aeZFxmvsa87YQYRtxYxeaJytdDp2nazUZmSL+tvz12IA7jq5hK72WTPo6QdzwduvHtxAP8JT7Gmu9Lxfz47HImnkppAZPBty9nWWFHFbaoEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772226759; c=relaxed/simple;
	bh=Ro1aTplCojG8fqIPGIhsXf9dy53mhFoKdUqMQv1Uxzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGuUMzjAqDkzOY4zwHTzMl+gu1w2wva2AT+mSBVMmbSK2KqGxHZD9xSLLkrAoT3SpavlA/hb3WdZvtR9lDU8UODdOZjrg7KlxVGVFjfWwilp/j0+Z1SCtCrq97I5MlH7mYYqttD60imt9m5kPRSBnJMKE9ZnX/5/LHQS3Fpxr0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbY8/eDZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbY8/eDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158E4C19421
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 21:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772226759;
	bh=Ro1aTplCojG8fqIPGIhsXf9dy53mhFoKdUqMQv1Uxzo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YbY8/eDZf9JbFAz6gOiL9ndc0Ud3Xb8rIsQrgdqRMwu6ZRABf6rKRbKO6rM8Zn0C7
	 vzjszJOdNo/nqUFobp/qMlMDUOhUkjbMIY/lUVf6pkEZqry0RWsk0r97BYMANY7Ahy
	 2Ju/bMaVy2nvjtnari5WG9Hln0j1/m4i5M4c2ryuarljnhBNOXZtrEZDUqjzOHtdif
	 VXfYwMHdRl2Rlm2hqZujDRRMy8eLZEFM3m4rGiPXzb9/dDMKslSfcbEeIBDnJ9VDdp
	 JlY8FNBHXmYwSnNNXTwlD/rQa3PxQzW55jxQsVvMYzaFikU7L6g9Ap8BFnTSQfm1Cw
	 54sVIweQMZImw==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so2363058d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 13:12:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1pXgpi8zCtBzjVjJqTd1K9vk84n9bGjFeZo2SdH/ObY1oLAUyPpdRvxqt0Od0EWf6V6ZeXg1dSxaY@vger.kernel.org
X-Gm-Message-State: AOJu0YysJmpnjffibotCh1zk7vYSJg9rO7Uhemv2CRCDuNsKFdr004s2
	HHiaJMNepXWby3p8TFTOFuRDXPIE6Y6GRuM307bnl255UKpciYw9/27TO11XRfwM4xzaHXXqemB
	kM+rcX/lAnNaN/4IHPhGWHSHWhfR/tWo=
X-Received: by 2002:a53:b785:0:b0:63f:9fcb:2050 with SMTP id
 956f58d0204a3-64cc228b093mr2716426d50.50.1772226758425; Fri, 27 Feb 2026
 13:12:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224202846.2437400-1-ethantidmore06@gmail.com>
 <CAD++jLkYaEHEy=P68MRLEFsoxDFh5yxna7Eby8KeDzm8F7Zm3Q@mail.gmail.com> <DGQ1PH7L50P5.1S6WZBTYH2SNR@gmail.com>
In-Reply-To: <DGQ1PH7L50P5.1S6WZBTYH2SNR@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 22:12:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLkHKBM7b5masVSmCfcdwXoxrS+fqySCp2xo7cu5aY0APg@mail.gmail.com>
X-Gm-Features: AaiRm51V0jWArEnQVj7tpCffdFcit2-HPM_rjRKl7zVCjeq72fF7fU1RXYcgp7c
Message-ID: <CAD++jLkHKBM7b5masVSmCfcdwXoxrS+fqySCp2xo7cu5aY0APg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-pic32: Fix resource leaks
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: joshua.henderson@microchip.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 10:01=E2=80=AFPM Ethan Tidmore <ethantidmore06@gmai=
l.com> wrote:
> On Thu Feb 26, 2026 at 4:37 PM CST, Linus Walleij wrote:
>
> > Can't you just use devm_clk_get_enabled() and let devres do this?
>
> I thought about that but wasn't sure because I saw:
>
>         ret =3D gpiochip_add_data(&bank->gpio_chip, bank);
>
> Later in the function and knew that you're not really suppose to mix
> manual resource allocation and devres.

And there is a bunch of other devm_* stuff before it so it's
confusing isn't it? A mix however you put it.

In this case that is just because the gpiochip_add_data() happens
last in probe().

If you study the driver you see it does not have a .remove() function
and you can bet your life no-one is manually testing to remove it,
so all the devm_* stuff is just there for exititing a failed or deferred
probe.

When the probe reaches gpiochip_add_data() that is the last
thing that can fail, and if it fails there are just all the other
resources that need to be free:ed.

I'm all for changing that to devm_gpiochip_add_data()
for completion but semanically it  won't matter unless someone
goes in and unbinds the driver in sysfs.

So use devm_clk_get_enabled() and optionally convert
to devm_gpiochip_add_data() as well.

Yours,
Linus Walleij
