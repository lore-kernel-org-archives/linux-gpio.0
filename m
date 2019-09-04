Return-Path: <SRS0=izCi=W7=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3405FC3A5A7
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Sep 2019 14:54:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0815B2168B
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Sep 2019 14:54:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vG9icw4d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730505AbfIDOyT (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 4 Sep 2019 10:54:19 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37766 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729993AbfIDOyT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 10:54:19 -0400
Received: by mail-ot1-f68.google.com with SMTP id 97so18041991otr.4
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2019 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5zV9A0Ata4tMQdZh+AwuadaWR8ym+Y4RneU8wNATTrs=;
        b=vG9icw4d+VqW3bcV6WLKRyJzz73yDvPpmA0p3yHTNkY1seMK7ZEZfcAt4LEYJgjydI
         7C4X54TqP/xiyu3XzzP4Aiz8xxj9L7xBBiJJkSsKoKwNj1maGo19o9102Wd+bSg+yEe9
         6DFQV8Jnkm0ueFeM3n916QBWkzGjjWZszvbGa6Al0sYhamaXVHVKlg8q+0I8hC6PfsQk
         Ie4ZxL6hWu2UDdDCvSxp5jnsgtbdNEJArch8ZrzwvBme61nZ83dUYvT6mOoFSHh4U2gm
         cfA0ocV0MX6sL+nIBNX0LEKm3/SdCiXZ/xo7Pr7dJ/his6DHpraccwckUrf3EjXn9PTA
         T3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5zV9A0Ata4tMQdZh+AwuadaWR8ym+Y4RneU8wNATTrs=;
        b=sJ2TA6JxxmVBKmA2KjlfJl1EYJdFhz7cos792tdexA9Brke3YT/NM0JpnOiTJgkNMl
         LCHW1QoeMaGpoVVsuAWokPivmgU6v540xKw8JfzY6p/LVBLyh+lekxfiZDdfHz21rEqL
         uYN7tNG7nRmQPairi4UcMuoqAC4G9DpjkaFNY4VecGeCMXmLXGzohosb63dSoUlnjF90
         lz9NdwHz5aBJtF8LB+UHkxiCwZZnqxgJeYTMfkWPcJJkfHfKzKQOaVuI9ykpKzYA3QHL
         hupgcRa573wtOHk6DHTxOPH5fPQKqTUXkckMkeVP0nRjdnLyT7oshU/B0MGeh96cM9rr
         p3vg==
X-Gm-Message-State: APjAAAV7k5u1j4OoDHeoT72576p8w4h1Ylq8gMTq8crg+r/HejHXwrrq
        FwYZN82BErayfZsOlhW1x+AQMouAQfpTkhzZJDCgHg==
X-Google-Smtp-Source: APXvYqwUSf12y7wuehDTFY7naXt93ZG8G6JhQJzrNpZN+yIOuQ7ul/zuM3uCOukHIlaERnjQBfM9OqRdGrnmgvFa7UM=
X-Received: by 2002:a9d:62c3:: with SMTP id z3mr3082007otk.194.1567608858331;
 Wed, 04 Sep 2019 07:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190904141834.195294-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904141834.195294-1-weiyongjun1@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Sep 2019 16:54:07 +0200
Message-ID: <CAMpxmJWJr0uBCs_oGX+h1uFmQ2f7Axo1iqtD6rzwgT-bbZdD6g@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: add missing single_release()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 4 wrz 2019 o 16:00 Wei Yongjun <weiyongjun1@huawei.com> napisa=C5=
=82(a):
>
> When using single_open() for opening, single_release() should be
> used instead of seq_release(), otherwise there is a memory leak.
>
> Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpio-mockup.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index f1a9c0544e3f..213aedc97dc2 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -309,6 +309,7 @@ static const struct file_operations gpio_mockup_debug=
fs_ops =3D {
>         .read =3D gpio_mockup_debugfs_read,
>         .write =3D gpio_mockup_debugfs_write,
>         .llseek =3D no_llseek,
> +       .release =3D single_release,
>  };
>
>  static void gpio_mockup_debugfs_setup(struct device *dev,
>
>
>

Good catch!

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus: can you pick it up for your last pull-requests with fixes for v5.3?

Bart
