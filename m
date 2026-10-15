Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74917B50A
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071390; cv=none; b=JSAG08MRBPAC4JYMgC9uFcZKTcsjDjrTWYC+TGo6Yoe2UpH4s2uPAgkJ8iYrwHKor8bHGm2ug8uG+T265mTcf8WRkEbv3rGne3HJf7wJCiRx3n/P94LWF7n/xzK40X3+i/av/NshDAnGsCxYEmPjtuZr0x8QjD7G1b4qGzn1Tic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071390; c=relaxed/simple;
	bh=U6/twj5q4ydP9GmPqYU2M3GVNAl28ewlrxc0ZIwxqTI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbhIgz7hZQp9grrq5yTF7YRpz7XhszD+ioe6BHAhx6+PE78g/iVpBj1mRoN7KTfEsZgdc68V+MR7qHVAwIpdGOgazgUiCRFE+Fa+Agkk7wfiHGB/8VpfTb1Sr+WKQ9zxzuGAiV8wuB0op3gkNSje7YrqHZ186ZXfcqSPtKfSi9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2CQUoC/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2CQUoC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819441F000C4
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071388;
	bh=HeDuRskIVKJ5UBtwTUOw8UY2+6EaUz3xCekMHwswIdk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=c2CQUoC/XKnYgF+ySrFuAyO7FzkMKLGYpWbdYOnJKlJ0IW64pg08TbpX5L6JHjh9V
	 SUazjLl5TfwOFah1D6uhQ65rCbz0giKL9pn6xjpD+HbC83q35TZhp0ixjkje4E+EIg
	 Sasf3JPi5J+xWE3Ql0qGtm03MnhpxdNmA0B6m+sEaV+T7B5wowt5ejEFr6pALieHTu
	 kgl8hoojAe8ca9bHWbcFfM7YzzUbMC5thBvVlhuIet+Ehawvr/jOJ/PQvgjptYCwV+
	 yrknNHVxuDgCZ4Kp3OeqD6rst/eNeDz6O0/uJ4ZlA82NvYqujmNQjhEnp9dHZpzdMN
	 qkgUUhOr2Xymg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3aafa3e23e8so3501801fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 06:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDxKx27Eqokr2IBMkO6YI14hKVf3j9evEQjHHXoyOVPSuseokJ7g5bGUmFAiW9ptEPMLkxw3qafjTC@vger.kernel.org
X-Gm-Message-State: AFq9FYJsdqzRwF9EeYeVK7dKLIrjbyPeD3YUpKf2JXGbX+6KPqCk8wqe
	/kRfcU898g5h6HqeLpcykti92LGiZXg4xTUep+VGJHWaq8rAEOMaO7tfyac7g9f/7hBinxyZrER
	eVQu9l18Q5sDrnSnFfulFoYNwi2qgQfyA0E7XSXg/kA==
X-Received: by 2002:a05:651c:a201:10b0:3ab:119a:81c5 with SMTP id
 38308e7fff4ca-3ab119a82e8mr1980041fa.23.1792071387190; Thu, 15 Oct 2026
 06:36:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 06:36:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 06:36:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261014043645.GA13991@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org> <20261014043645.GA13991@rigel>
Date: Thu, 15 Oct 2026 06:36:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
X-Gm-Features: AclHuK_wiXVJCm-9qKwf9OJbt2u6tO5jfbqyRr0EywLbkiVkGRq49MEhzXGZ8CA
Message-ID: <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver refused
To: Kent Gibson <warthog618@gmail.com>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Oct 2026 06:36:45 +0200, Kent Gibson <warthog618@gmail.com> said=
:
> On Mon, Oct 12, 2026 at 02:04:58PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] gpio: memory leak in gpiod_set_array_value_complex() on error p=
aths
>> - [High] gpio: non-atomic desc->flags update clobbers concurrent IRQ fla=
gs
>> --
>>
>> commit 910242af9150f094f4676cb26fb8b58cc8edfa96
>> Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
>>
>
> Hi Bart,
>
> following this up with you directly since Sashiko doesn't currently let
> original authors or maintainers know about problems it discovers in exist=
ing
> code, just the patch author and the list.
>
>> gpiolib: cdev: don't record a line direction the driver refused
>>
>> The commit modifies gpio_v2_line_config_flags_to_desc_flags() to avoid s=
etting
>> the GPIOD_FLAG_IS_OUT flag before the hardware direction is confirmed by=
 the
>> driver. This fixes an issue where refused configurations would leave the=
 line
>> erroneously reported as an output or input.
>>
>> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
>> > index 5d53bfcdf7268..9bbee3a1f9c9c 100644
>> > --- a/drivers/gpio/gpiolib-cdev.c
>> > +++ b/drivers/gpio/gpiolib-cdev.c
>> > @@ -1226,14 +1226,13 @@ static void gpio_v2_line_config_flags_to_desc_=
flags(u64 lflags,
>> >  {
>> >  	unsigned long flags =3D READ_ONCE(*flagsp);
>>
>> [Severity: High]
>> Does this non-atomic read-modify-write clobber concurrent atomic updates=
 to
>> desc->flags made by the IRQ subsystem?
>>
>> If a driver or IRQ domain calls gpiochip_lock_as_irq() or
>> gpiochip_enable_irq() concurrently, they atomically update bits like
>> GPIOD_FLAG_USED_AS_IRQ:
>>
>> 	set_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
>> 	set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
>>
>> Because the IRQ subsystem does not check GPIOD_FLAG_REQUESTED before usi=
ng
>> the line and does not share locks with the cdev ioctl, these atomic upda=
tes
>> can happen between this READ_ONCE() and the subsequent
>> WRITE_ONCE(*flagsp, flags) at the end of this function.
>>
>> Wouldn't the atomic updates be silently overwritten when this function w=
rites
>> back the stale flags value?
>>
>> Losing these flags disables the safety check in
>> gpiod_direction_output_nonotify(), which could allow user-space to force=
 an
>> active interrupt line into output mode.
>>
>
> This isn't a scenario that I'd considered - I was probably assuming
> GPIOD_FLAG_REQUESTED being set would provide protection by making the
> line unavailable.
>
> How would you like to handle this?
>

Sign... By adding it to the heap of GPIO issues found by sashiko. :(

We can't protect the flags with mutex or spinlock due to the multitude of
issues that forced us to use SRCU. We could maybe consider atomic_t for the
flags field and that would allow us to use various atomic ops and possibly =
it
would be enough to cover all the read-modify-write cases we have. I need to
think about it and will also ask the clanker for help.

>> >
>> > +	/*
>> > +	 * GPIOD_FLAG_IS_OUT is left to gpiod_direction_input/output(), whic=
h
>> > +	 * only update it once the chip has accepted the direction.
>> > +	 */
>> >  	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
>> >  		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
>> >
>> > -	if (lflags & GPIO_V2_LINE_FLAG_OUTPUT)
>> > -		set_bit(GPIOD_FLAG_IS_OUT, &flags);
>> > -	else if (lflags & GPIO_V2_LINE_FLAG_INPUT)
>> > -		clear_bit(GPIOD_FLAG_IS_OUT, &flags);
>> > -
>>
>> [Severity: High]
>> By leaving GPIOD_FLAG_IS_OUT unset when a driver refuses the output dire=
ction,
>> does this create a memory leak in gpiod_set_array_value_complex() when
>> user-space subsequently calls GPIO_V2_LINE_SET_VALUES_IOCTL?
>>
>> Looking at gpiod_set_array_value_complex() in drivers/gpio/gpiolib.c, ma=
sk
>> and bits can be dynamically allocated with bitmap_alloc() for large GPIO
>> chips:
>>
>> 			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
>> 				return -EPERM;
>>
>> If a descriptor is not configured as an output, the function immediately
>> returns -EPERM.
>>
>> Doesn't this bypass the bitmap_free() calls at the end of the function a=
nd
>> leak mask and bits?
>>
>> The same direct return leak appears to occur if the driver's set_multipl=
e
>> callback fails:
>>
>> 		if (count !=3D 0) {
>> 			ret =3D gpiochip_set_multiple(guard.gc, mask, bits);
>> 			if (ret)
>> 				return ret;
>>
>
> This also looks like a valid concern in existing code.  Unlikely, but val=
id.
>
> It is also not something we can readily test.
> Would you be open to extending gpio-sim so we can simulate constrained dr=
ivers
> to better test alternate paths in gpiolib and cdev?
> e.g. input only, output only, not supporting bias, supporting open drain,=
 open
> source, debounce, ...?
> I haven't put any thought into what that might look like on the
> userspace side, much less done any actual work on it, - just wondering if=
 you
> had or would at least be ok with it.
>

Definitely! I don't see why I would ever be against extending the test
coverage. :)

Thanks,
Bartosz

> Cheers,
> Kent.
>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-gpiolib=
-cdev-direction-v1-1-aambrozewicz@nvidia.com?part=3D1
>
