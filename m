From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: xilinx: Do not use gpiochip_get_data() in xgpio_save_regs()
Date: Thu, 7 Jan 2016 10:07:51 +0100
Message-ID: <CACRpkdYG77Q30J4hodKEqR2Cth==XfyqU5wi5gk3wz+YS6qJ8g@mail.gmail.com>
References: <1452126010-1111-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33099 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752722AbcAGJHw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 04:07:52 -0500
Received: by mail-ob0-f178.google.com with SMTP id bx1so294600186obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2016 01:07:52 -0800 (PST)
In-Reply-To: <1452126010-1111-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 7, 2016 at 1:20 AM, Guenter Roeck <linux@roeck-us.net> wrote:

> Commit 097d88e94c44 ("gpio: xilinx: use gpiochip data pointer") replaces
> the use of container_of() with gpiochip_get_data(). Unfortunately, the
> data pointer is not yet set by the time xgpio_save_regs() is called,
> causing a system hang.
>
> Fixes: 097d88e94c44 ("gpio: xilinx: use gpiochip data pointer")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> It might make sense to merge this patch with the patch introducing the problem.

Patch applied, thanks for finding and fixing this so quick!

(I hope I haven't created too many of these regressions...)

Yours,
Linus Walleij
