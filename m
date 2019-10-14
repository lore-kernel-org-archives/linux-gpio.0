Return-Path: <SRS0=RHvV=YH=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA53ECE587
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Oct 2019 12:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81646217D9
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Oct 2019 12:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="wEXZLcTK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730799AbfJNMiu (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Oct 2019 08:38:50 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37009 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730797AbfJNMiu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 08:38:50 -0400
Received: by mail-io1-f68.google.com with SMTP id b19so37590759iob.4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 05:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VWzUTtlohwAl+KkmvTitcj0vcJK9FlfXBgqcHILIsXs=;
        b=wEXZLcTK5JfovmD+m4qb/4Lqbi3F4o452Lb+/5ibt5gceWsQUXVx0G3CR0D8Es9AZs
         t2/iTHqFrXllnYqKwTKtvGpnT+xUWfI4qc6yEjVCCiDBe+ASqGVYf+QSgmPAW0KftmZG
         wMYjjCtu2itEzp+IJhuOrZRNRoEJsHAocezPdkiV7fJ1IefCAkPBhFh92mK+KJTyE9cb
         v8PLPLLF+vYvBkMiMM+dJpeaLRmomNFoBz4zkgxsK1az2elLW40lpNO4HxzCoCKcXmdi
         AAav/2vCAzW2eqDowxt7Aef5PIKION8ZnT08HovZ8OxPulLE+lRhjXNfdUwo+pkrzR0r
         L+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VWzUTtlohwAl+KkmvTitcj0vcJK9FlfXBgqcHILIsXs=;
        b=nnuUXt7shozl6o5Hkh7UuGFdRAn6GIzEoPA5+rzVTqwAl06QDVfEVx09YkvIayudQP
         yBkSetlGnujzEjH9E74oM73tTIa+9hTLbt0rtX/7B/v20ClLuhk7fkaSty5NHELxJDVa
         4j4MyiwXTWbVy9r/S7pbWmNKxtpQsHDT+LsZ8zhAr/YX5Dhs+FoqOEdJSsNBflGzjSAK
         c6vNBGUajYh3aDslUrjKILDWgUIvdxgF4BRDywV14K5xeDgBO9mwYFDGL92EdRBL6ZtE
         gAWDc8fES41w99i9OaCQPppucWMtA+I7hTBO+r7IRsKPZKES7yjdcvKeQfhOkdjQhL9o
         P5zA==
X-Gm-Message-State: APjAAAV31HVGsS2Z0DcN4MMe24/st87SsRdkLB9iUY++nNfa0Pp+Kcsi
        AnIHW8KdhFOn2ioktH+PR60OY8HgZfquHnqAqEG3zA==
X-Google-Smtp-Source: APXvYqwYgLzwKJ5rQvcaH49EebB9iUTFV6G7CaU/mHYsagtdMJItY3PbYaeT/P/JSi3PLsnxeNmpfqAJifcSgziZUwI=
X-Received: by 2002:a92:c80b:: with SMTP id v11mr227833iln.6.1571056729188;
 Mon, 14 Oct 2019 05:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-5-warthog618@gmail.com>
In-Reply-To: <20191012015628.9604-5-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Oct 2019 14:38:38 +0200
Message-ID: <CAMRc=Me+u2brQVo2HwLS+gSDSZWXvsjT59qP75aKRi3PHqMbvg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] gpiolib: pull requires explicit input mode
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> This patch prevents pull up/down flags being applied to as-is line
> requests, which should be left as-is, and for output mode for which
> setting pulls is not currently supported.
>

This again looks like it should be done right in patch 1/6 instead of
being fixed later in the same series. Or is there some reason to do it
this way I'm not seeing?

Bart

> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 053847b6187f..647334f53622 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -559,6 +559,12 @@ static int linehandle_create(struct gpio_device *gde=
v, void __user *ip)
>              (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
>                 return -EINVAL;
>
> +       /* PULL_UP and PULL_DOWN flags only make sense for input mode. */
> +       if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
> +           ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
> +            (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> +               return -EINVAL;
> +
>         lh =3D kzalloc(sizeof(*lh), GFP_KERNEL);
>         if (!lh)
>                 return -ENOMEM;
> --
> 2.23.0
>
