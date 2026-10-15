Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47CC52123E
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069080; cv=none; b=ZI5utPDaV+2bgGmKM8sjShxCTVYQa3YTDkLlLYxnpzGeMHhwgHusVn4QeYLk0mt8xFwh8XImaTDyBDDl//XYriBnxCiezZB/tGQ3Rz1Vw8LWWUAbOxk+urabEOMSI8k1FA8LhwjKWZAsOAbU8afhNvXmsRnVr+H676Q5Stmu4Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069080; c=relaxed/simple;
	bh=cpwpaAtgJNNX755/5sKkt/6ut+Sre7NFK/Xy+Xee+SQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljtt74eZ4B5auF/Y0QGL0SkDyq8jmmqjO5njB7iOKLVOrDG7Z2l1Bje//0tYFYMkTc996XcJUGpw51QLA9nQ4/9cdMUE5I/UA7+13IaMbmqIeLndmOkbi4BmcNR67SkGtvW/aiIfV1vJ6TApevdLs/pu95IQRM7gPKiwd4/n2uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsPppeLQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsPppeLQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2211F000C8
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069078;
	bh=/uhLjwmFFuEE/yy/7F8o/1RaUUqimr9FVC9uiewfGaI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BsPppeLQXc6z4p1Ox6beZTdwT6Uh+zd9GukYnI04GH6f/g4LIsXhV1CRoDQHa6SJi
	 37NA0MiKWav17zH+s2V56L/ZV3tngs5aFCZTzJSd0xKpK+FN6oTk2jchUyhd4r4gVB
	 Dgo1R7WZI/sglw+f2qA00Z+wj6HevZdSD5Df0lbMvjRq4wQVdCFb30uDGcCU5qGCF/
	 r7OI4VN51Lb06VIE6l9PqEHjmFBRLzyn/v2aOcj2nW65tPG8UShYjchEzBV5Pn2TEa
	 JvqLU2tD0lGTnmOl3G5zfsITprFShlGEmUnqQ4xF67huyhlj59DttWxXS3o/VCSA8i
	 uN9sNW7wr5lqw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso2354705e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 05:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxFwr9e6aS4FqVW3+Y2lzI8nrxSchmDyKwqrnxEDnu79OV3HIxiHmULk7utmWVvRxtxPqu5VhxQMav+@vger.kernel.org
X-Gm-Message-State: AFq9FYKw2h3K/QicZtnSzm7HkowsxP+hULvuvXloB80fprErK1aaCsaD
	zrc9tkwKHlZrUPwv1jrf/JJ4dTqlmnEWqPD7vPnM+Sl5WCy2tojgJEvejcHyiAuLQHMjQBC23mn
	GplscRB8ii2B3u1PLJJk09ma9iiBEaazgsWqXmM8CvA==
X-Received: by 2002:a05:6512:3f08:b0:5bc:cbe1:571d with SMTP id
 2adb3069b0e04-5bcdd559e1emr6179708e87.44.1792069077145; Thu, 15 Oct 2026
 05:57:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 12:57:54 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 12:57:54 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261012-gpiolib-chip-removal-v1-0-aambrozewicz@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-gpiolib-chip-removal-v1-0-aambrozewicz@nvidia.com>
Date: Thu, 15 Oct 2026 12:57:54 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfVU-+r_1s6Lezv4s-vRa6cBLmdVsLt__TJVL=zZW4M4A@mail.gmail.com>
X-Gm-Features: AclHuK-PcN9rmFcA0XeisZpVH33AeF5V_pKt5VVHm8XfStzKgUdsVeYecTCr6x0
Message-ID: <CAMRc=MfVU-+r_1s6Lezv4s-vRa6cBLmdVsLt__TJVL=zZW4M4A@mail.gmail.com>
Subject: Re: [PATCH 0/6] gpiolib: fix chip removal with lines still requested
 from user space
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Kent Gibson <warthog618@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Jia Jia <physicalmtea@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 15:49:54 +0200, Adrian Ambrozewicz
<aambrozewicz@nvidia.com> said:
> Removing a GPIO chip while user space keeps a line request open, which
> is what happens when a USB or otherwise hot-pluggable GPIO controller
> goes away, leaves a few things behind on current kernels:
>
>  - the consumer label of each such line leaks (patch 2), and freeing it
>    just before the GPIO device is released needs gpiodev_release() to
>    wait for pending label frees (patch 1, which can also be hit on its
>    own with line hogs);
>  - the character device frees the line's IRQ a second time on close,
>    after gpiochip_remove() already did, which warns when the IRQ number
>    was reused and was reported as a use-after-free with virtio-gpio
>    (patch 3), and its IRQs are freed in an order that still lets a
>    reused IRQ number or a concurrent close() get in the way (patch 6);
>  - a process blocked in read() on the request keeps gpiochip_remove()
>    waiting in synchronize_srcu() until it is signalled, and with it
>    device_shutdown() on power-off (patch 4);
>  - the IRQ name the character device allocated leaks (patch 5).
>
> All five were reproduced with gpio-sim on v7.3-rc5 under QEMU (x86_64,
> 4 vCPUs) and are still present in gpio/for-next. The loop: create a
> gpio-sim chip, request a line through the character device and hold
> it, set "live" to 0 while it is held, then optionally set the chip up
> again and request the same line, and close the first request.
>
>                       v7.3-rc5 (30 cycles)        with the series (100)
>  v2 edges, reuse      30 WARN, 17-30 labels       0 WARN, 0 leaks
>  v2 edges             0 WARN, 19-29 labels        0
>  v2 sw debounce       30 WARN, 13-30 labels       0
>  v1 line event        30 WARN, 14-29 labels       0
>  v2 no edges          15-30 labels                0
>  v2 edges, consumer   30 WARN, 15-30 labels,      0
>                       17-24 IRQ names
>  blocked read()       removal waits for the       removal completes,
>  (v2, v1, info watch) reader to be killed         read() gets -ENODEV
>
> The counts above are from both a KASAN and a non-KASAN build; KASAN did
> not report anything in these runs, the slab use-after-free from the
> report needs the descriptor free to race with the close. kmemleak does
> not see every leaked object, hence the ranges. The desc_srcu warning
> fixed by patch 1 takes srcutree.convert_to_big=1 to show up within a
> few dozen cycles of a hogged line (cycle 57 here); with the series,
> 1000 cycles pass. That warning was also seen on real hardware, on arm64
> KCSAN kernels with v7.3-rc5 unbinding a USB GPIO expander whose driver
> is not yet upstream, built both as an out-of-tree module and into the
> kernel.
>
> Patch 3 on its own leaves two windows, which gpio-sim does not hit: if
> the chip disposes of its IRQ mappings in gpiochip_irqchip_remove() and
> another device gets one of the numbers before the character device's
> notifier runs, the notifier's free_irq() warns; and a close() racing
> with gpiochip_remove() is not serialized against gpiod_free_irqs().
> Patch 6 calls the notifier right after the chip pointer is cleared and
> before gpiod_free_irqs(), and makes the release paths free their IRQs
> before unregistering from it. With a test-only chip on the gpiolib
> hierarchical irqchip that hands an IRQ number out again during the
> removal, or sleeps in irq_bus_lock() to widen the race, 30 out of 30
> cycles warn in each case with patches 1-5 and none with patch 6.
>
> Patch 6 is kept apart from patch 3 because it changes the order of
> gpiochip_remove() for in-kernel users too: interrupts they leave
> requested are now freed after the chip pointer is cleared rather than
> before, so the irqchip callbacks that free_irq() calls into run with
> the gpiod_*() consumer calls on that chip already failing; the driver
> data is still set at that point. Patch 3 is enough for the reported
> use-after-free and is the smaller backport. Herve's series [1] moved the
> character device's cleanup earlier in gpiochip_remove() in 2024 and was
> set aside for a fix covering in-kernel users as well, which became
> gpiochip_free_remaining_irqs(); patch 6 keeps that and only lets the
> character device go first.
>
> The revocable conversion posted for gpiolib [3] keeps all of these as
> they are; patches 2, 4 and 6 would need rebasing over it, patch 6
> because its notifier call goes right after the revocable_revoke() that
> the conversion puts in gpiochip_remove().
>
> On arm64 (QEMU virt, 4 vCPUs, KASAN), 5 cycles per case, the removal
> loop gives the same picture: on v7.3-rc5 the v2 edge, debounce, v1 and
> consumer cases warn in every cycle, all cases but the blocked readers
> leak labels, and the blocked readers hold up the removal; with the
> series none of that happens. With the test chip, the close race warns
> in 10 out of 10 cycles on v7.3-rc5 for v2 and v1 alike, and in one v2
> cycle KASAN reports the use-after-free of [2], free_irq() from
> edge_detector_stop() on a freed irq_desc; with the series there is
> neither. (The reused IRQ number only leads to a warning once patch 3
> frees IRQs from the notifier, so not on v7.3-rc5.) An x86_64 KCSAN
> build, default KCSAN options, shows the same warnings and stalls on
> v7.3-rc5 and none with the series; KCSAN itself reported no data race
> in gpiolib, also with kcsan.skip_watch=100 for the test chip and the
> edge, consumer and blocked-reader cases (one report in 32 boots, in
> osq_unlock() while a disk was probed during boot). The test kernels
> with patch 6 also had the direction fix mentioned below applied, which
> touches none of these paths.
>
> User-visible change: with patch 4, a read() that is blocked on a line
> request, on a v1 line event or on a chip file with watched lines when
> the chip is removed returns the events still queued, if any, and then
> fails with -ENODEV. On v7.3-rc5 it stays blocked until it is signalled
> or an event arrives, holding up the removal. A read() started after the
> removal already failed with -ENODEV, and poll() already reported
> EPOLLHUP | EPOLLERR; neither changes.
>
> For stable: patches 3, 5 and 6 fix commit ec8b6f55b981, which is in
> 6.12 and later. Patch 4 applies to 6.12.y as is; the SRCU read section
> it changes replaced the gdev->sem rwsem in 6.9, and 5.15.y, 6.1.y and
> 6.6.y have that rwsem from the commit it fixes and need a different
> change. There the read handlers hold gdev->sem for reading across the
> whole read through call_read_locked(), wait included, and
> gpiochip_remove() takes it for writing, so the backport has to drop the
> rwsem around wait_event_interruptible_locked(), retake it and check
> gdev->chip again, with !gdev->chip added to the wait condition. On
> 6.6.y the device notifier, called with the rwsem held for writing, then
> wakes the reader, which gets -ENODEV once the removal drops the rwsem.
> 5.15.y and 6.1.y have no device notifier: the removal no longer waits,
> but a blocked reader is only woken by an event or a signal, as before.
>
> Two fixes found along the way have nothing to do with chip removal and
> are sent on their own: one for the line info keeping a direction that
> the driver refused (gpiolib-cdev), one for the event clock flags of a
> released line (gpiolib). This series does not depend on them, nor they
> on it; all three apply to v7.3-rc5, gpio/for-next and gpio/for-current
> in any order.
>
> Direction fix: https://lore.kernel.org/r/20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com
> Event clock fix: https://lore.kernel.org/r/20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com
>
> Cc'd beyond the GPIO maintainers and list: Paul for the SRCU side,
> since patch 1 replaces synchronize_srcu() with srcu_barrier() before
> cleanup_srcu_struct(), patch 4 moves sleeping waits out of the
> gdev->srcu read section, and patch 6 relies on synchronize_srcu() on
> gdev->srcu to rule out new IRQ requests through the character device;
> Herve for [1], which patch 6 revisits; Jia Jia for the virtio-gpio
> use-after-free report [2] that patch 3 addresses; Kent as the author of
> the v2 character device; Andy, who acked the commit that patch 2 fixes.
>
> [1] https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@bootlin.com/
> [2] https://lore.kernel.org/all/20260817070429.157993-1-physicalmtea@gmail.com/
> [3] https://lore.kernel.org/all/20261011121246.162759-1-tzungbi@kernel.org/
>
> Adrian Ambrozewicz (6):
>   gpiolib: wait for pending label frees before cleaning up desc_srcu
>   gpiolib: free the label of lines released after their chip was removed
>   gpiolib: cdev: do not free line IRQs again after the chip is removed
>   gpiolib: cdev: don't sleep in the SRCU read section in read()
>   gpiolib: cdev: don't leak the IRQ name when the chip is removed
>   gpiolib: let the character device free its IRQs first on chip removal
>
>  drivers/gpio/gpiolib-cdev.c | 136 +++++++++++++++++++++++++++---------
>  drivers/gpio/gpiolib.c      |  34 +++++++--
>  2 files changed, 130 insertions(+), 40 deletions(-)
>
>
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> --
> 2.43.0
>
>

Thanks for doing it. Other than a few nits, it looks good and it's also quite
impressive it didn't trigger a single sashiko issue!

It also breaks neither kunit nor libgpiod tests.

I'm a bit hesitant to queue it immediately before v7.3 so I'll let you address
Andy's reviews in a v2 and pick it up during the merge window.

Bartosz
