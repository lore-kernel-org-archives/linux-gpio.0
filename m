From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: bcm281xx: Fix return value of bcm_kona_gpio_get()
Date: Mon, 18 Nov 2013 10:55:09 +0100
Message-ID: <CACRpkdaY0pJiy29BeXK3rdEesopLPF6P3MpdKAXybEpWF6=Ewg@mail.gmail.com>
References: <1383941945-27569-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:42496 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418Ab3KRJzK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 04:55:10 -0500
Received: by mail-oa0-f52.google.com with SMTP id h16so862319oag.11
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 01:55:09 -0800 (PST)
In-Reply-To: <1383941945-27569-1-git-send-email-markus.mayer@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>

On Fri, Nov 8, 2013 at 9:19 PM, Markus Mayer <markus.mayer@linaro.org> wrote:

> We need to return the corresponding bit for a particular GPIO. This bit
> contains shift not mask.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> Reviewed-by: Matt Porter <matt.porter@linaro.org>

OK...

>         /* return the specified bit status */
> -       return !!(val & bit);
> +       return (val >> bit) & 1;

What about doing it like this instead:

return !!(val & BIT(bit));

?

Yours,
Linus Walleij
