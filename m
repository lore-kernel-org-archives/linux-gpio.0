Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254BD1B4F0A
	for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 04:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297561; cv=none; b=gPmC0S2ddgsUdG/9xIM7bcMMBVx3HijrL3wvUYy4gBwlHXPZJj3xiSWIPSf6wjgItzqRAhhtNRVCRc1/ZYbjbfNXm34vyjhUe5f4ZVpAFzl4wEiFbOW0DIwNv3EPg9PYZYHkPoJJdg+nKNy33350Q6mcdoIgpjrzMJ1hoXkodDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297561; c=relaxed/simple;
	bh=sBN8gYMkWre7fx8eZUu+83/T3hVvDt2VarqsCwbr7nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlC8zDf9i1/F8nG9G13gBgvV3fb52J0eZg4UpMmTP96RZ8B7axhvzZTsAFrhBzMfZzNf09vADvfmpZt/Gu/l/sYYjIDpgFSUypOosx/ZLdPPXjdU34OlaZcfGwyTMEsi82EuKSHx9kRNoqEE9ogRM0dZof35X5uysXSXoUDXFLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4lod5Fi; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4lod5Fi"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so600928a91.0
        for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 21:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297559; x=1792902359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ImiinU5FpLUxjOjpfSahyWrQ1MDJ5jJnNsuCe2IFujo=;
        b=k4lod5Firq2B1V72uQNHCzPFdwYc37TMz9uQ8M382FGP9Z0YKvwnTYuzR+MdRb+hTz
         azgrkpnmuP53/JBIpar8yEcUGN2pqVm0BaPnsSIPekZ4ZsU8iEUOrYm5ynREJFrP7LjD
         N80sbQaLIk2jn4ZqVgKJT0gqDY2VqUqOrtQxvnZdT/yofDpLcZfyhAsfsTPUKkY0lwXQ
         JUVCX/Oy0LjXFtzKZSNFppeHp0l1QOM+QFc7PaIgB6aPA2q/FhgC/UL38SP7SbnNVzYt
         LXhsrcg6veIx/HKNoOeTcUKdhba3W2lJThy2O02swar6nu2gLdvQ4d8FU/I68YIcS+eL
         HZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297559; x=1792902359;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImiinU5FpLUxjOjpfSahyWrQ1MDJ5jJnNsuCe2IFujo=;
        b=T9Kj7B3J4dUKRoA3Ezt3GhIW0XODMBO++5I0wzy9WPBdkz/3lT+UbQcbivrKh8ITv1
         w4lilwAeJ5+/N2I2Gn9WMpkhjBD1WFHI39ajRIzjNWIQApH2yYXKIUR+QgGazN0sMpnp
         Vn6DxlP+NJk7JfCe+nJVTa3bUgjymPyaj5iduqvbhM6ff7dNIorwm52QO3VgNcxWrSms
         qqiM7Fq3ruRi3RuOTmtCX3b5rI3msw71sRkaEsOPtaNfrd9sfHcf1gVRxkKcbGhV91lA
         UyUG3tBwyPMsIG17VBmPSUKKm89oDa2Wi8LcNREHm3BGz1yz1Cvc7sZv4VAvgzCmYG21
         QnLw==
X-Forwarded-Encrypted: i=1; AKwUvBzVaJ7fHQ+kWLBtOsn24QrsA6/vxCT42vC6vohcXLo9IUlX8O+m9NAiBfNYSJjLJrc7ibrZPdTV0IT0@vger.kernel.org
X-Gm-Message-State: AFq9FYJBdeb9kyePadjifLys9kcwM80sdfhmdBqZeCsbdlOxNSp//iSW
	6qTdiZ6zIYNMj+Fn0Ao+BDDA73uwryyaqUavpmTeid23iBeZXJPw7lKvfyDHfg==
X-Gm-Gg: AYBFou3xDMdDcD5sjaci/b3P3pAV/Y5OVNeOXzxOcb+JRXR+ayL9X8QHqDCa5+th8az
	J6IibhJ2HTNO81ygJhX8hUcgR6yd9AusGdEbHhlAJ6jPnrDlZ6VGjBOySzRLMQlREdMt0spTyGb
	GwFZRRREsGBu4Ep64MA9Cm4Tjv4mz3MRuvTbDeiV/vQ/XZEJw4f6zaCaiLc1YJSw9Rz7r+NbDgT
	D9CK1j3FaUms+yIjchLVZ2S00d3ey+QKougQq8bs/2E2R3UswD5rEAKtrSd4+WjMvwuSSOoktUv
	M8zyvJ6v8yvvnAEGkMKrvFmrBTRRamIuiOuSTxlg/SboJtwtoVZ4yp74ED+bsWN109wL0QYnEhK
	5+EzOHj3peN+1SQu9J8971TQ8+j5gas6GEFjGLGVlQ3PsD1qfyZI+9AtyFCc0p/KhdDtBd2Kn8o
	KQP4F6QQDsDMxAlXDMYALImFTEhDm4dqMyQdiCH2q6FC/ezrRn+BQqn46GpFk2L+h3aezap/ETQ
	TSHSz92OPL+R67AW5g=
X-Received: by 2002:a17:90b:4ac4:b0:3aa:f2c4:12df with SMTP id 98e67ed59e1d1-3acee9783c0mr3818224a91.9.1792297559437;
        Sat, 17 Oct 2026 21:25:59 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497ef50sm2517959a12.10.2026.10.17.21.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:25:56 -0700 (PDT)
Date: Sun, 18 Oct 2026 12:25:46 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver
 refused
Message-ID: <20261018042546.GA48005@rigel>
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org>
 <20261014043645.GA13991@rigel>
 <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
 <20261015153714.GA105746@rigel>
 <CAMRc=McOWzuqr9qcrbaL4U2_Y==-XfWYo44XVgTkB20JW_5EFw@mail.gmail.com>
 <20261016091420.GA63617@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016091420.GA63617@rigel>

On Fri, Oct 16, 2026 at 05:14:20PM +0800, Kent Gibson wrote:
> On Fri, Oct 16, 2026 at 03:23:24AM -0500, Bartosz Golaszewski wrote:
> > On Thu, 15 Oct 2026 17:37:14 +0200, Kent Gibson <warthog618@gmail.com> said:
> > >
> > >> We can't protect the flags with mutex or spinlock due to the multitude of
> > >> issues that forced us to use SRCU. We could maybe consider atomic_t for the
> > >> flags field and that would allow us to use various atomic ops and possibly it
> > >> would be enough to cover all the read-modify-write cases we have. I need to
> > >> think about it and will also ask the clanker for help.
> > >>
> > >
> > > I was thinking along the lines of reverting to atomic bitops directly
> > > on the flags, e.g. reverting b7adfb6076ff, without changing the
> > > underlying type to atomic_t.
> > > Given that most of the time we are operating on individual flags.
> > >
> > 
> > That's still two threads fighting over the flags effectively, right? Ideally
> > we should modify the entire set of flags at once. If that proves to be
> > impossible, going back to atomic bitops is probably the next best thing.
> > 
> 
> Yeah, that change wouldn't resolve that conflict - it is just about
> deciding which framework you plan to use for the flags.
> The IRQ flag problem, and any other flag contention lurking, needs to be
> addressed separately either way.
> 
> > > With atomic_t you could also use xchg variants for bulk ops?
> > >
> > 
> > I'm not following, could you rephrase or give an example?
> > 
> 
> I mean atomic_xchg(), atomic_cmpxchg() etc.
> I thought atomic_t was intended for counters, not bitmaps of flags, and
> I don't have any example, but I expect the code to be pretty hideous - 
> You would need to READ_ONCE(), check the flags are in a suitable state,
> update them, then atomic_try_cmpxchg() with your updated value.
> Rinse and repeat if the try_cmpxchg fails.
> 

Here is an example of an MT-safe gpiochip_lock_as_irq() and
gpiochip_unlock_as_irq() that demonstrate what I had in mind:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0586fc1f9564..9446cfad17d3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4223,6 +4223,7 @@ EXPORT_SYMBOL_GPL(gpiod_to_irq);
 int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
 {
        struct gpio_desc *desc;
+       unsigned long flags, new_flags;
 
        desc = gpiochip_get_desc(gc, offset);
        if (IS_ERR(desc))
@@ -4242,17 +4243,25 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
                }
        }
 
-       /* To be valid for IRQ the line needs to be input or open drain */
-       if (test_bit(GPIOD_FLAG_IS_OUT, &desc->flags) &&
-           !test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags)) {
-               gpiochip_err(gc,
-                            "%s: tried to flag a GPIO set as output for IRQ\n",
-                            __func__);
-               return -EIO;
-       }
+       do {
+               flags = READ_ONCE(desc->flags);
+               /* no WARN_ON here as this is resolving a known potential race */
+               if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags))
+                       return -EIO;  /* not sure about that error code */
+
+               /* To be valid for IRQ the line needs to be input or open drain */
+               if (test_bit(GPIOD_FLAG_IS_OUT, &flags) &&
+                   !test_bit(GPIOD_FLAG_OPEN_DRAIN, &flags)) {
+                       gpiochip_err(gc,
+                                    "%s: tried to flag a GPIO set as output for IRQ\n",
+                                    __func__);
+                       return -EIO;
+               }
 
-       set_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
-       set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
+               new_flags = flags;
+               __set_bit(GPIOD_FLAG_USED_AS_IRQ, &new_flags);
+               __set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &new_flags);
+       } while (!atomic_long_try_cmpxchg((atomic_long_t *)&desc->flags, &flags, new_flags));
 
        return 0;
 }
@@ -4274,8 +4283,12 @@ void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset)
        if (IS_ERR(desc))
                return;
 
-       clear_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
+       /* here you should hold the lock if you are unlocking, so if not WARN_ON and bail */
+       if (WARN_ON(!test_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags)))
+                       return;
+       /* USED_AS_IRQ effectively protects IRQ_IS_ENABLED and so must be cleared last */
        clear_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
+       clear_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
 
The xchg approach is used where you need to test multiple flags simultaneously,
as per gpiochip_lock_as_irq(), and possibly also where you want to set a bunch
at once - e.g. gpiod_free_commit().
But you can still use atomic bitops for individual flag cases, as per
gpiochip_unlock_as_irq(), though you need to be mindful of ordering -
particularly when releasing flags that act as locks, such as
GPIOD_FLAG_USED_AS_IRQ and GPIOD_FLAG_REQUESTED.

These cases are simple as they are only modifying flags.  It becomes
more complex where you also have to apply config to the driver and rollback
the flags if that fails, such as in gpiod_direction_XXX.

Not sure how kosher this is from a kernel perspective, but that is what I was
thinking.

Cheers,
Kent.
