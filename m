From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/23] gpio: sysfs: fix memory leaks and device hotplug
Date: Wed, 29 Apr 2015 23:44:18 +0200
Message-ID: <CACRpkdahTSVKC5KVLWEv4JQWV8Buys2bjV7pvg-d82Vd9eHdyA@mail.gmail.com>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
	<1429630951-27082-2-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34684 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750940AbbD2VoT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2015 17:44:19 -0400
Received: by oiko83 with SMTP id o83so33315205oik.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2015 14:44:18 -0700 (PDT)
In-Reply-To: <1429630951-27082-2-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>

On Tue, Apr 21, 2015 at 5:42 PM, Johan Hovold <johan@kernel.org> wrote:

> Unregister GPIOs requested through sysfs at chip remove to avoid leaking
> the associated memory and sysfs entries.
>
> The stale sysfs entries prevented the gpio numbers from being exported
> when the gpio range was later reused (e.g. at device reconnect).
>
> This also fixes the related module-reference leak.
>
> Note that kernfs makes sure that any on-going sysfs operations finish
> before the class devices are unregistered and that further accesses
> fail.
>
> The chip exported flag is used to prevent gpiod exports during removal.
> This also makes it harder to trigger, but does not fix, the related race
> between gpiochip_remove and export_store, which is really a race with
> gpiod_request that needs to be addressed separately.
>
> Also note that this would prevent the crashes (e.g. NULL-dereferences)
> at reconnect that affects pre-3.18 kernels, as well as use-after-free on
> operations on open attribute files on pre-3.14 kernels (prior to
> kernfs).
>
> Fixes: d8f388d8dc8d ("gpio: sysfs interface")
> Cc: stable <stable@vger.kernel.org>     # v2.6.27: 01cca93a9491
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied for fixes.

I worry a bit about what userspaces do out there, but they
cannot reasonably have behaviours tied to in-flight removal
of GPIO chips, that would be bizarre.

Yours,
Linus Walleij
