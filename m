From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: rcar: Prevent module clock disable when wake-up
 is enabled
Date: Thu, 26 Mar 2015 10:26:00 +0100
Message-ID: <CACRpkdYLXyA3Bfn+iLmR6w0cTmvs=i=sW4rTrzTz_zZiiCHmEA@mail.gmail.com>
References: <1426704069-26389-1-git-send-email-geert+renesas@glider.be>
	<1426704069-26389-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:36757 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751624AbbCZJ0A (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2015 05:26:00 -0400
Received: by obdfc2 with SMTP id fc2so40710724obd.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2015 02:26:00 -0700 (PDT)
In-Reply-To: <1426704069-26389-4-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Wed, Mar 18, 2015 at 7:41 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> When the GPIO module is needed for wake-up, it's module clock must not
> be disabled. Hence implement irq_chip.irq_set_wake(), which
> increments/decrements the clock's enable_count when needed, and forwards
> the wake-up state to the upstream interrupt controller.
>
> This fixes wake-up from s2ram using gpio-keys when using a PM Domain to
> manage the module clock.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
