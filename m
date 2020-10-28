Return-Path: <SRS0=Je6w=EE=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F23C388F7
	for <linux-gpio@archiver.kernel.org>; Thu, 29 Oct 2020 02:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18B4020738
	for <linux-gpio@archiver.kernel.org>; Thu, 29 Oct 2020 02:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnSAZvX2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgJ2COV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:14:21 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:38530 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbgJ1Vfu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:35:50 -0400
Received: by mail-ej1-f65.google.com with SMTP id za3so987525ejb.5
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EsEUWfEw0rdUjuGyy64d98Cv0PkfNVWtn5SQvgmieGM=;
        b=fnSAZvX2aXo5cp2qFBj5UaxxB1xqDpeoMeHz+OUjt84KZaMl30fKZwYO7+4MYDEsIP
         m55WP82ufZV/L9iJ4bnbchKRLmrzI3cZvo/rwO4Xg3aiX+lWccIKo2cNY+MAhJda+3DH
         SjUfP7qM5W3CW0yVqQY/yHUu21xPsZP6ciMaqqvN5aqbC5VV9oueiCilfHmAKAx9Gydd
         YE5WOIwtiotRhB6lHWRyX2yoVrxrI9CGg7obNuhqzJfUQwF8xzcymrobnXET50cO59T+
         stwJx3UNjvmMdVBifuZUIBB9T5LJw/tgAd2xI7c/WpI+0Kgb2w2Pyw6tWEkdtM///UZO
         VEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EsEUWfEw0rdUjuGyy64d98Cv0PkfNVWtn5SQvgmieGM=;
        b=jOoaWppxjO3XjbJDT+DlgWkbBiiRq509l0AApZqyxqNMKhD3Ooj1t8cedQL6yeaWoA
         IwgZ4LyeXq07lrd1bzmanDZDghzoq3yOjfCpnCFRgcj0/B73STjyFUlWvN3n+dbaB62b
         HR9zLjZoGRoe1KxoLAGjenOi0YWNvXn7UfonBOHyrKluaXQBht1tvnQ2RvhM3RAtJRFQ
         BuL1MiAhzQo/9Re7HGcle+s1UQsXmQOQ4prExa6nonYf/yuG7DJTjPleR0DLSVpq2YHG
         rX0+NIVE/bkBp8aUc7IqNJjnXuuBK3s8Iot9qAH/cay5fU5AuOLLhi9Q4fX2mFt937NW
         F+nQ==
X-Gm-Message-State: AOAM530GQKlc3UJQnxIloUdzvRtwjye1R0pJ4YTCJbHMXv6PWTK7GQbO
        ClQR5Z8ypZLzCU+AvMO+3HkEfSO9SYoh6YgJJicdwRISfb1JEA==
X-Google-Smtp-Source: ABdhPJxHSkKBd8XvtNmfAzUxxA82g8YI959ywSo7yHJjReDr6TWK3d2FEkCLLUVEFW/HDtzNYId805Sb+bZzITmiXbU=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr2869840lfm.333.1603901746305;
 Wed, 28 Oct 2020 09:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
In-Reply-To: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 17:15:35 +0100
Message-ID: <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Alexandre Courbot <gnurou@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 22, 2020 at 6:26 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> It _seems_ between
>   79a9becda894 ("gpiolib: export descriptor-based GPIO interface")
> and
>   14e85c0e69d5 ("gpio: remove gpio_descs global array")
> the "Interacting With the Legacy GPIO Subsystem" of GPIO consumer
> interface is correct.
>
> But is it the case afterwards?
>
> Details of the question are here [1].
>
> [1]: https://stackoverflow.com/q/64455505/2511795

I don't know if I even understand the question right, but gpio_to_desc()
can be called at any time as long as there is a struct gpio_chip with
the global GPIO number assigned to it. It will just index into the
array of descriptors stored inside the chip and return a pointer.
The allocation of the memory lives with the struct gpio_chip.

If for example that chip is on USB and you unplug that USB
cable, naturally referencing the descriptor after that point
will cause disasters.

The gpio_request()/free() doesn't really allocate or free
any memory at all. This is why we call gpio_to_desc() first
thing in the legacy functions.

Yours,
Linus Walleij
