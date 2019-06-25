Return-Path: <SRS0=lsbl=UY=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0669DC48BD4
	for <linux-gpio@archiver.kernel.org>; Tue, 25 Jun 2019 09:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0F4B205F4
	for <linux-gpio@archiver.kernel.org>; Tue, 25 Jun 2019 09:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VTIPyKy9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbfFYJCt (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 25 Jun 2019 05:02:49 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46046 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfFYJCt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:02:49 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so12023831lfm.12
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yAnfyWnFOYDee8zMa6y9jztBJ/ZakyyrgxyUeS9SKPk=;
        b=VTIPyKy9yeL1CLurpOjrYVamSrhieiLVJEoow8oWGeRsHZSAljgcaUepPQvvF42YxR
         cbI2kdi4FJJUj7FyIn+HA1YYf5SZO61xrLCJZ8SwIT/vlwHYFYlr1DKt3KPvDb0GO98U
         djpU0kfQWMO9Cx7CpcJdL9JOSGErQOgK4QUnvbh8keFAaJRnte7AEUxaIe6tz3dnvXV4
         xSA0se92p3tU8G1CCHc8OgNZw96IWnwE/l444vW5CYf9zyCzDolRreHp6bERM7hhYbdL
         9jNBbwIvdyItWNl+ja3o9dz+gogP2mLvF0Xc9oPD3VVynNRnJGRQb12Cm5s7BSBT1K7u
         XOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yAnfyWnFOYDee8zMa6y9jztBJ/ZakyyrgxyUeS9SKPk=;
        b=p8oeL4xD7bAT7zID9pc+aP/DS1fK1WA3cVyJLJnLs4awR5fpGUewrGcJvMKsR59by+
         WhVGS2l7dZBdim4zDnGKgY59CmcLcyIM/BPKCBYTpbhppob5ntveaMAz+Wj9vK6AeMX4
         l5p+PoRLp8EgGeTB9pfTi6yDazrxG49y8H9nHrdyp2iugD+pn7VoHvV6rU/bZYNeUdNg
         qiSoDkZh9u8/sJ4EG5TZwIHfBUAZMZ9L3sda6YeRwUrliGWiGcPJ/e4zE/bqbZ0+lXKo
         p8Y07m7mHCAQrH50UUeIvJ6UUo0ut4G/JxbCcpOlRHCEMPgfDGI37aKy/vXzffkWesb/
         x6kg==
X-Gm-Message-State: APjAAAX7liEbspk02v2IpCb1Uqc5VfIvO1cyxKyu3fEV7Uz9QfN2stsc
        hQXPrUsBktbeAGLzGUj3L/3snQZAj7SNwkDUDuh3GQ==
X-Google-Smtp-Source: APXvYqxUkwWXQfh5c8kcNKArsxvvB13HsHjkS45z9Ap8MZ0Ufk4J/xaEtDpod0hKb+77Crajqpbnow9w4KZxFqEBBhI=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr76015987lfn.165.1561453367171;
 Tue, 25 Jun 2019 02:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <1560789905-32307-1-git-send-email-info@metux.net>
In-Reply-To: <1560789905-32307-1-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:02:35 +0200
Message-ID: <CACRpkdaavrDWNJnbRk4+m_GQnCKbCe_qYtOHQd2VvD_OrPbeSA@mail.gmail.com>
Subject: Re: [PATCH] include: linux: gpio: add comments on #if/#else/#endif
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 6:45 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> From: Enrico Weigelt <info@metux.net>
>
> Improve readability a bit by commenting #if/#else/#endif statements
> with the checked preprocessor symbols.
>
> Signed-off-by: Enrico Weigelt <info@metux.net>

OK then that looks better.

Patch applied!

Yours,
Linus Walleij
