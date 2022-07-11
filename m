Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781F9CCA47B
	for <linux-gpio@archiver.kernel.org>; Mon, 11 Jul 2022 08:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiGKImx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbiGKIme (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 04:42:34 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072C021835
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:42:19 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-31d85f82f0bso5816977b3.7
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BbEeMhaMhMOIFE7vJDdeDc8ULQN4ZptBVrKw7X+VxQs=;
        b=ObFrz41RIzdXr5qaNWjyskEd6dnfwk81/aVaeIgneQ6+j1lxaCxsXaPxDZ1Y8pyeeI
         1dCH3tqKuqRAMzKr+HkTWWk4qLZ6/u+XfjaZrWvcRuMiOXGWBiBwjpXWBYYJcu1pCt/b
         5HYoYKInUcmpxUzwhQW3+tJrdVZzYox1JchV7Nz820Ve0vsgtabIFxfKIysBu9mo2b2s
         yGVAxhQlK+l44yEZENaSvle4e6JkQRjqqamD5RjANh+/3lhw0i+VhTufxOViRW0ScrrS
         LE94O+xTjaz09s4qCkz4f/g4hlWP8q28NVvZ0bsbvD2EJGIemUgNbfkzXFyuGlz/no+M
         WEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BbEeMhaMhMOIFE7vJDdeDc8ULQN4ZptBVrKw7X+VxQs=;
        b=UBHBrL2KtYat+Ityl5PIom3V1tqNIwyCRop43iHkB/lH7POVoX2SpDSHbcG35O9P28
         pEYFa/7FilxIkTIMPHFLJlcEOGOOv4T9hG+uanPd9dulClkEYCGptGwGMO4HH8Y5J+sO
         zySl3bmHY32ZLCZ4R4keBQSvwtTgOyH+PxE5tD7tKCgD2tf2vRIv8kGk+qbN72Iba3JU
         0u8uSNC+t/+uCqsr9gTYJXvEeynNIsFEerxbR+4ZjfRV3hbrHMufZtfxq25b0XkniZZN
         YeZJgGf9+yL6R8xrJv0rYuc5mwtfJNF8/UfnVuiudUeWr4Mq7RdmqTS1Rlw172twMyMx
         zZgA==
X-Gm-Message-State: AJIora/ZFzCaWKqHZouwIaTjtumDnOS+DxhXBnjJm6q1AN+qMS/Wo0AE
        DCq/7rs1PwQSRj9/5ggCqb+PzL7aSGFdhH9903czzQ==
X-Google-Smtp-Source: AGRyM1tu+11jEpO9I0Zp/q1P64jol0ViZ8rD11nXo7P0I6A8tRWYlerraqnGejlpiHTPIxLEgh9vgYaErsEarPH8PiA=
X-Received: by 2002:a81:a8d:0:b0:31c:cb2f:c805 with SMTP id
 135-20020a810a8d000000b0031ccb2fc805mr19345536ywk.118.1657528938287; Mon, 11
 Jul 2022 01:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220704130602.12307-1-henning.schild@siemens.com> <20220704130602.12307-2-henning.schild@siemens.com>
In-Reply-To: <20220704130602.12307-2-henning.schild@siemens.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 10:42:07 +0200
Message-ID: <CACRpkdaZK+0r5VfyAzp-4wYkdANQ68pMnwZAobusnkZS1qaN8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: nct6116d: add new driver for several Nuvoton
 super io chips
To:     Henning Schild <henning.schild@siemens.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Kuan-Wei Ho <cwho@nuvoton.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 4, 2022 at 3:06 PM Henning Schild
<henning.schild@siemens.com> wrote:

> This patch adds gpio support for several Nuvoton NCTXXX chips. These
> Super-I/O chips offer multiple functions of which several already have
> drivers in the kernel, i.e. hwmon and watchdog.
>
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

(...)
>  drivers/gpio/Kconfig         |   9 +
(...)
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -457,6 +457,15 @@ config GPIO_MXS
>         select GPIO_GENERIC
>         select GENERIC_IRQ_CHIP
>
> +config GPIO_NCT6116D
> +       tristate "Nuvoton Super-I/O GPIO support"
> +       help
> +         This option enables support for GPIOs found on Nuvoton Super-I/O
> +         chips NCT5104D, NCT6106D, NCT6116D, NCT6122D.
> +
> +         To compile this driver as a module, choose M here: the module will
> +         be called gpio-nct6116d.
> +
>  config GPIO_OCTEON

This driver is put among the memory-mapped GPIO drivers
in Kconfig despite it is using port-mapped IO.

Move it to the right section with the other port-mapped IO
GPIO drivers that begins like this:

menu "Port-mapped I/O GPIO drivers"
        depends on X86 # Unconditional I/O space access


Yours,
Linus Walleij
