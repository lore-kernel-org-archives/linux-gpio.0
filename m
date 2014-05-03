From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] use BIT() macro instead manually shifting bits
Date: Sat, 3 May 2014 12:15:10 -0700
Message-ID: <CACRpkdYdE3YfVguC+GV6JaTSNd9mnik7D4N+TspDGsD5XpZOMA@mail.gmail.com>
References: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:60597 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216AbaECTPL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 3 May 2014 15:15:11 -0400
Received: by mail-oa0-f45.google.com with SMTP id eb12so6762377oac.18
        for <linux-gpio@vger.kernel.org>; Sat, 03 May 2014 12:15:10 -0700 (PDT)
In-Reply-To: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, inux-omap@vger.kernel.org

On Sat, Apr 26, 2014 at 5:00 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:

> Hello Linus and Alexandre,
>
> While learning coccinelle towards doing the big gpio_chip/gpio_chip_ops
> split refactoring I wrote this trivial semantic patch that replaces a
> manual bit shift by using the BIT macro from <linux/bitops.h>

Nice semantic patch!

And all patches applied with Alex's ACK.

However I will edit the commit messages to remove the word
"manual". This just breaks my heart everytime I see that word
used in code, manual means a person is typing the keys or something
I bet it's still a computer doing the heavy lifting here.

Yours,
Linus Walleij
