From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: Use kzalloc() to allocate struct gpio_device
 to fix crash
Date: Thu, 18 Feb 2016 20:47:42 +0100
Message-ID: <CACRpkdYdzM_Anfa4UBafC5ASAiBc4BPr_PYc+QMV7-cM9L5zLA@mail.gmail.com>
References: <1455618171-11719-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34901 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946442AbcBRTrm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Feb 2016 14:47:42 -0500
Received: by mail-ob0-f179.google.com with SMTP id xk3so84982021obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Feb 2016 11:47:42 -0800 (PST)
In-Reply-To: <1455618171-11719-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Feb 16, 2016 at 11:22 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> gpiochip_add_data() allocates the struct gpio_device using kmalloc(),
> which doesn't zero the returned memory.
>
> Hence when calling dev_set_name(), it may try to free a bogus old name,
> causing a crash:

Ooops got two patches to this independently and applied the other one,
I tagged your name onto the Reported-by now. Thanks!

Yours,
Linus Walleij
