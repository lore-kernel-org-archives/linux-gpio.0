From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH] gpio: omap: Fix interrupt names
Date: Tue, 23 Sep 2014 17:47:13 +0200
Message-ID: <CACRpkdYh-AWN6y_cfn6sg9j-hYYkLYbf-3Vcnsv+u5WOO9hxLQ@mail.gmail.com>
References: <1409946775-24076-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:64488 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756132AbaIWPrO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Sep 2014 11:47:14 -0400
Received: by mail-ig0-f175.google.com with SMTP id h18so4833905igc.14
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2014 08:47:13 -0700 (PDT)
In-Reply-To: <1409946775-24076-1-git-send-email-nm@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Kevin Hilman <khilman@deeprootsystems.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>

On Fri, Sep 5, 2014 at 9:52 PM, Nishanth Menon <nm@ti.com> wrote:

> When viewing the /proc/interrupts, there is no information about which
> GPIO bank a specific gpio interrupt is hooked on to. This is more than a
> bit irritating as such information can esily be provided back to the
> user and at times, can be crucial for debug.
>
> So, instead of displaying something like:
> 31:     0       0  GPIO   0  palmas
> 32:     0       0  GPIO  27  mmc0
>
> Display the following with appropriate device name:
> 31:     0       0  4ae10000.gpio   0  palmas
> 32:     0       0  4805d000.gpio  27  mmc0
>
> This requires that we create irq_chip instance specific for each GPIO
> bank which is trivial to achieve.
>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Acked-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Acked-by: Kevin Hilman <khilman@linaro.org>
> ---
> Requested to be resend by Javier with linux-gpio maintainers in CC.
>
> Original V1 of the patch: https://patchwork.kernel.org/patch/4757891/
>
> Probably belongs to 3.18 kernel series at this point in time.
>
> Changes since v1: just picked up Acks.

Patch applied.

Yours,
Linus Walleij
