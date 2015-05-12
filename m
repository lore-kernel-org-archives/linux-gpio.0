From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/27] gpio: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue, 12 May 2015 12:20:15 +0200
Message-ID: <CACRpkdZQq8oOUSPVefAv8a-uvsJkXRW4XeF6VkgCAAZFzYh9yQ@mail.gmail.com>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33372 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752987AbbELKUP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 06:20:15 -0400
Received: by obblk2 with SMTP id lk2so1768721obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 03:20:15 -0700 (PDT)
In-Reply-To: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 5, 2015 at 4:33 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

>         Hi all,
>
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.
>
> This patch series relaxes the dependencies on GPIOLIB if COMPILE_TEST is
> enabled, where appropriate:
>   - Patches 1-2 add missing dependencies on GPIOLIB || COMPILE_TEST,
>   - Patches 3-27 relax existing dependencies on GPIOLIB.
> In some cases (patches 1,2, and 4), this required adding a missing
> include (<linux/gpio/consumer.h>), as this may not be included if
> asm-generic/gpio.h is not used.
>
> There are a few more drivers that depend on GPIOLIB and that may be
> eligible for COMPILE_TEST. These I didn't handle yet, as I couldn't
> enable them with m68k/all{mod,yes}config due to other dependencies.
>
> This series is against v4.1-rc2 and next-20150505 with the exception of
> patch 21, which has an additional dependency (mentioned in the patch
> itself, incl. resolution instructions if the dependency isn't
> satisified).

FWIW: the series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
