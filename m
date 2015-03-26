From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: rcar: Use local variable gpio_chip in gpio_rcar_probe()
Date: Thu, 26 Mar 2015 10:18:17 +0100
Message-ID: <CACRpkda7PtB+Sripq8BDQy9rOqa-fomzt=rfKFxCS2nB4d=ENA@mail.gmail.com>
References: <1426704069-26389-1-git-send-email-geert+renesas@glider.be>
	<1426704069-26389-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36607 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751312AbbCZJSS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2015 05:18:18 -0400
Received: by obdfc2 with SMTP id fc2so40588547obd.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2015 02:18:17 -0700 (PDT)
In-Reply-To: <1426704069-26389-2-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Wed, Mar 18, 2015 at 7:41 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The existing variable gpio_chip already points to the gpiochip instance,
> hence use it everywhere.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
