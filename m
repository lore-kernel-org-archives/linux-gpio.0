Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB2511883
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419072; cv=none; b=CrQRU58/XfSU8WRMOj4OMbvUqUD5pf3C69QG95Oq1W2QrbIrfn2iHH5t/rV3NseOG7dKqBK0jgnRH2fUtUUZcX0UF2dc3oNH42okYZUa88QTPn9J+D0F8QzUoxzwY+j1/oGs850gm9k72UJRSsKtel3TIdoYYbYIlwjMPU+fhos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419072; c=relaxed/simple;
	bh=+ENVG7C/tGrHrCzJWa0HrsbALRBbxlBI00ndbk817xM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQMHsQfXfZ0M+DmbAJw6h5V/g92311Lyg+Eq3L3R9Zpw4nZNX58vQYz0GNANSISLZ/IU0RjRhl3GPTYIUa/VOJBgu3KRSXRkge2IVThDKKreENSkn2gx0dpsqhnVpIcvbczh7H3CLpQLp3aNm/uS0dxaynu/zFnjh9/M5z3zPWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LU7gV8ZA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LU7gV8ZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DB71F000C4
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 14:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419071;
	bh=WpV8jxC0tYjZlSY9ad4KVetpMBPVub8C0mZlkJ5aYfI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LU7gV8ZABwCilUXrwmGIK4E6vkCcBAxYvhBrlAmkQH81Xi1+GV2CSUkJ4N1XayAik
	 EeK23vSkP13YXrlDk3Hb87cXMSIBSq3g0Xq0jk7QqulB3miidHigP7BspNu6UxfVB2
	 NEgaP9sjsd2M9vaumuteFN7buMqZ1dCbffCugT3VetIPWNIaQPQ0D7OFpPx6t1A8zd
	 YjHoVPou41uBmp6WERxnkXt6eqUdapDd00OlFVwI/3pv56WbdsSZlOK/u+ba8R+Uxf
	 fsfufO3GTS4FuFbPTWfyYSYqwmcNY9zl5iJD1zJ/sjURFlQXt1vmcm/4Id8AoL3lfK
	 +rxwFRyvENAIw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so28384931fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:11:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMNvpgDOlQcQEwaqQrh5FVT+rWXdwAIkTO716uYrVBNe4GhervknsNK2pc+GOfcf8/FPTvScY7bAGV@vger.kernel.org
X-Gm-Message-State: AFq9FYJQC9juSYWyD2Kgm/X38f8axxTfBTCLfKRKWiTl+HABqmRM0GUN
	5icbuVx5jCw0WohNUjstOkNqsBUrPwdd+H4kQptbw2eIR2hCYlfzFUhaj2TMqtlE2Pd7Z4QmgiY
	KC03B515remU5ANc3r5JQ0GpH6/V8anb4fAga1SO+tA==
X-Received: by 2002:a2e:be12:0:b0:3ab:13e6:c351 with SMTP id
 38308e7fff4ca-3ab28f46b3bmr15652331fa.2.1792419068733; Mon, 19 Oct 2026
 07:11:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 10:11:06 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 10:11:06 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261018042546.GA48005@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org> <20261014043645.GA13991@rigel>
 <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
 <20261015153714.GA105746@rigel> <CAMRc=McOWzuqr9qcrbaL4U2_Y==-XfWYo44XVgTkB20JW_5EFw@mail.gmail.com>
 <20261016091420.GA63617@rigel> <20261018042546.GA48005@rigel>
Date: Mon, 19 Oct 2026 10:11:06 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc41umcA5ujMD_YOZUZpfJEvtuE4eBwX0g9nPOAJd7GmA@mail.gmail.com>
X-Gm-Features: AclHuK9znvs0HlvQK_Kl-exKEPdnZxRcrREQM7dDVZM1zjZLuM9bcvyqpYjRd70
Message-ID: <CAMRc=Mc41umcA5ujMD_YOZUZpfJEvtuE4eBwX0g9nPOAJd7GmA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver refused
To: Kent Gibson <warthog618@gmail.com>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 06:25:46 +0200, Kent Gibson <warthog618@gmail.com> said:
> On Fri, Oct 16, 2026 at 05:14:20PM +0800, Kent Gibson wrote:
>> On Fri, Oct 16, 2026 at 03:23:24AM -0500, Bartosz Golaszewski wrote:
>> > On Thu, 15 Oct 2026 17:37:14 +0200, Kent Gibson <warthog618@gmail.com> said:
>> > >
>> > >> We can't protect the flags with mutex or spinlock due to the multitude of
>> > >> issues that forced us to use SRCU. We could maybe consider atomic_t for the
>> > >> flags field and that would allow us to use various atomic ops and possibly it
>> > >> would be enough to cover all the read-modify-write cases we have. I need to
>> > >> think about it and will also ask the clanker for help.
>> > >>
>> > >
>> > > I was thinking along the lines of reverting to atomic bitops directly
>> > > on the flags, e.g. reverting b7adfb6076ff, without changing the
>> > > underlying type to atomic_t.
>> > > Given that most of the time we are operating on individual flags.
>> > >
>> >
>> > That's still two threads fighting over the flags effectively, right? Ideally
>> > we should modify the entire set of flags at once. If that proves to be
>> > impossible, going back to atomic bitops is probably the next best thing.
>> >
>>
>> Yeah, that change wouldn't resolve that conflict - it is just about
>> deciding which framework you plan to use for the flags.
>> The IRQ flag problem, and any other flag contention lurking, needs to be
>> addressed separately either way.
>>
>> > > With atomic_t you could also use xchg variants for bulk ops?
>> > >
>> >
>> > I'm not following, could you rephrase or give an example?
>> >
>>
>> I mean atomic_xchg(), atomic_cmpxchg() etc.
>> I thought atomic_t was intended for counters, not bitmaps of flags, and
>> I don't have any example, but I expect the code to be pretty hideous -
>> You would need to READ_ONCE(), check the flags are in a suitable state,
>> update them, then atomic_try_cmpxchg() with your updated value.
>> Rinse and repeat if the try_cmpxchg fails.
>>
>
> Here is an example of an MT-safe gpiochip_lock_as_irq() and
> gpiochip_unlock_as_irq() that demonstrate what I had in mind:
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 0586fc1f9564..9446cfad17d3 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4223,6 +4223,7 @@ EXPORT_SYMBOL_GPL(gpiod_to_irq);
>  int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
>  {
>         struct gpio_desc *desc;
> +       unsigned long flags, new_flags;
>
>         desc = gpiochip_get_desc(gc, offset);
>         if (IS_ERR(desc))
> @@ -4242,17 +4243,25 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
>                 }
>         }
>
> -       /* To be valid for IRQ the line needs to be input or open drain */
> -       if (test_bit(GPIOD_FLAG_IS_OUT, &desc->flags) &&
> -           !test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags)) {
> -               gpiochip_err(gc,
> -                            "%s: tried to flag a GPIO set as output for IRQ\n",
> -                            __func__);
> -               return -EIO;
> -       }
> +       do {
> +               flags = READ_ONCE(desc->flags);
> +               /* no WARN_ON here as this is resolving a known potential race */
> +               if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags))
> +                       return -EIO;  /* not sure about that error code */
> +
> +               /* To be valid for IRQ the line needs to be input or open drain */
> +               if (test_bit(GPIOD_FLAG_IS_OUT, &flags) &&
> +                   !test_bit(GPIOD_FLAG_OPEN_DRAIN, &flags)) {
> +                       gpiochip_err(gc,
> +                                    "%s: tried to flag a GPIO set as output for IRQ\n",
> +                                    __func__);
> +                       return -EIO;
> +               }
>
> -       set_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
> -       set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
> +               new_flags = flags;
> +               __set_bit(GPIOD_FLAG_USED_AS_IRQ, &new_flags);
> +               __set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &new_flags);
> +       } while (!atomic_long_try_cmpxchg((atomic_long_t *)&desc->flags, &flags, new_flags));
>
>         return 0;
>  }
> @@ -4274,8 +4283,12 @@ void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset)
>         if (IS_ERR(desc))
>                 return;
>
> -       clear_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
> +       /* here you should hold the lock if you are unlocking, so if not WARN_ON and bail */
> +       if (WARN_ON(!test_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags)))
> +                       return;
> +       /* USED_AS_IRQ effectively protects IRQ_IS_ENABLED and so must be cleared last */
>         clear_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
> +       clear_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
>
> The xchg approach is used where you need to test multiple flags simultaneously,
> as per gpiochip_lock_as_irq(), and possibly also where you want to set a bunch
> at once - e.g. gpiod_free_commit().
> But you can still use atomic bitops for individual flag cases, as per
> gpiochip_unlock_as_irq(), though you need to be mindful of ordering -
> particularly when releasing flags that act as locks, such as
> GPIOD_FLAG_USED_AS_IRQ and GPIOD_FLAG_REQUESTED.
>
> These cases are simple as they are only modifying flags.  It becomes
> more complex where you also have to apply config to the driver and rollback
> the flags if that fails, such as in gpiod_direction_XXX.
>
> Not sure how kosher this is from a kernel perspective, but that is what I was
> thinking.
>

There are some instances of casting an int to atomic_t but given the "aligned"
attribute in its type definition, I'm not sure if this is fine either. There
are roughly 100 places where desc->flags is dereferenced under drivers/gpio/.
All of them would require inspection and rework.

I need to get that clanker to look into it.

Bart
