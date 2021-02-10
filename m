Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F34C433E6
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Feb 2021 13:51:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 188D064DE0
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Feb 2021 13:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhBJNvY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 Feb 2021 08:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhBJNvA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 08:51:00 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA01DC061786
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 05:50:19 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id f14so4303863ejc.8
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 05:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TTNJEfoQUaDnKZJmRpNWMQ9bWqNkHovtgW4jAdcH7YU=;
        b=Dlz7MKU/9UeXQKBzTFiSk719BaoT1HYGidmcF6MAEEDd9enG8a3UcEQ7clv++YknVd
         LZ3yUZNHrgCDUARz/tWhiIfs0Gvt4eTl+1Y8mF3Cle0a3hQiG0XBkC44dFLIjtZG7yRs
         pYt5fMdv4UPd8GujBGOQCd/Z1N4H0dJJLtLHEpPDc0y8ESV7CjMY53WoGJSVwtONeHAk
         8Elj1AidnO70XGmtuj+I5r+m6KB+Pm756uQ8o2xKYKzSwC0aLn8B2gxxWigsDlzDLMz0
         fpv/HelKiQTe08dYWfAI3xom+B0jTAxzOs1MHIw5jRi570NuTVHhv7XyTE2OE0aqQxWC
         BdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TTNJEfoQUaDnKZJmRpNWMQ9bWqNkHovtgW4jAdcH7YU=;
        b=c4euwnb0qML4ZxJ+zT1+42nYkSu5ehhOw1PDl/w/2XssvNxNfrGrszSTgXM0XXhUst
         zFgYGpUGJJML5kmS4CgPbn2FdekkvJMKBW2QNtDt/SZStLP0H/hQQkbFf6dZTfV2i5kX
         gAlcqDvByuv2x5qk4OmmUAoXW8/FkMBz1eQddICMTu9oY4HoirmXC3JqFgJeBbGdUgIn
         kynyU+j1DxHtvxQ6rGD2U0Vv58XMHBBQ07DJ9RzGcEBe0o3N8oFtNS7xfFu6r8QfUl1E
         vY/Whqeqtjo45USkFBuebeIoE6QqPecAXlHXwIiNts0EOZWUySVjuW5hJ3ZSxwLDKLMK
         4QqA==
X-Gm-Message-State: AOAM531t3HKa/j5vTWaGT1CFowyC0H5HZFyZCYoEIXeJ10DvEco6AGYh
        eiHSfUdW37v6d96j+AC38At+oncADwc1ZdUAbtwUrQ==
X-Google-Smtp-Source: ABdhPJwRaTDjhBuZQGy2fNZbRshWThFtyxyfeLUOVTfCnfenIP1OwfkLDCKxNSDplkwzPsnz7QCMYvtDO5tQRPO1u4Y=
X-Received: by 2002:a17:907:2d09:: with SMTP id gs9mr2883611ejc.363.1612965018296;
 Wed, 10 Feb 2021 05:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20210209133110.7383-1-nikita.shubin@maquefel.me>
In-Reply-To: <20210209133110.7383-1-nikita.shubin@maquefel.me>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 10 Feb 2021 14:50:07 +0100
Message-ID: <CAMpxmJUKkhhJOMf0WUintH=xPXO7+qLz-R2AyK5wygECzip3Nw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: ep93xx: fixes series patch
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 9, 2021 at 2:31 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> v2:
> https://lore.kernel.org/linux-gpio/20210127104617.1173-1-nikita.shubin@maquefel.me/
>
> v3:
> https://lore.kernel.org/linux-gpio/20210128122123.25341-1-nikita.shubin@maquefel.me/
>
> v4:
> https://lore.kernel.org/linux-gpio/20210205080507.16007-1-nikita.shubin@maquefel.me/
>
> v5:
> https://lore.kernel.org/linux-gpio/20210208085954.30050-1-nikita.shubin@maquefel.me/
>
> v5->v6 changes
>
> [PATCH v6 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
> Andy Shevchenko:
> - add devm_kasprintf() return value check and move it out from
>   ep93xx_init_irq_chip()
> - removed ep93xx_gpio_irq_chip
> - pass girq->chip instead of removed ep93xx_gpio_irq_chip to
>   irq_set_chip_and_handler for port F
>
> Tested all patches on ts7250 board.

Series applied, thanks everyone for reviews and testing!

Bartosz
