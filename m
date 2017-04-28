From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND][PATCH V2 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
Date: Fri, 28 Apr 2017 09:49:37 +0200
Message-ID: <CACRpkdbpQ=Q6zt8uzfDCvOUU40S5aEvbvNd4OP4uVwBzQJhzQQ@mail.gmail.com>
References: <20170425183210.30594-1-marek.vasut+renesas@gmail.com> <20170425183210.30594-3-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:35063 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932516AbdD1Htj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 03:49:39 -0400
Received: by mail-io0-f180.google.com with SMTP id r16so53360615ioi.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Apr 2017 00:49:38 -0700 (PDT)
In-Reply-To: <20170425183210.30594-3-marek.vasut+renesas@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

On Tue, Apr 25, 2017 at 8:32 PM, Marek Vasut <marek.vasut@gmail.com> wrote:

> Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
> This block is pretty trivial and supports setting GPIO direction
> as Input/Output and in case of Output, supports setting value.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> V2: Use linux/gpio/driver.h instead of linux/gpio.h

I applied this for v4.12 to bring down the number of deps in
v4.13. The guarding symbol makes it not compile until the MFD
patch is there, the MFD_BD9571MWV is unlikely to change,
and Marek will certainly go through with the driver submission.

Yours,
Linus Walleij
