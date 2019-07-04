Return-Path: <SRS0=Yh4R=VB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80F8C0650E
	for <linux-gpio@archiver.kernel.org>; Thu,  4 Jul 2019 07:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B80A4218A3
	for <linux-gpio@archiver.kernel.org>; Thu,  4 Jul 2019 07:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwlfKmPN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfGDHfv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 4 Jul 2019 03:35:51 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38654 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfGDHfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:35:51 -0400
Received: by mail-lf1-f65.google.com with SMTP id b11so3553869lfa.5
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=skb5LCybXQHRXMU6OjavL+iyC8UWM2nZJNdVafsEZGU=;
        b=jwlfKmPNxGZs8zcqzYdTuBfm11HSTs3AsI4pNJzktt8Wg3rNfaiX+rsmXpciUtwThM
         xd0ueI8OEFz4kIP7ekpGmgjjL3n3ep2ogNHhV0sCP+Ch49N9YDDEJn2rt4BhrkWxmDqm
         lIJcUjZclWEeO+W/0kskufD0eJI7m/F8TM9yqcdvv4313TtC7qjNnLRDru9PuAEdcq5j
         tO+CFwTZYFvSjjMPazMFEYPRVp66yXzEGBJl/eTW1gg0TZ0+7lo1Km/yStwlkKRfybVc
         4C90gFITFC41aNvC4z79xiNRsXdLdKosCuvhApdQ9xw53la8RSMmRMOCh0mZPqqabdJP
         hJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=skb5LCybXQHRXMU6OjavL+iyC8UWM2nZJNdVafsEZGU=;
        b=j4iDNTwCoe5yAXNMKI/T70RcwZbksGB1UHOXzfxTzTfAf/hF4BaTXfKsRCx4qeMSMd
         +UP+3X/ppYqLAiYfW89FLw4TC8DIDBTcVtrdkXJCkC90rd0AHeZR3fTWasj606e0t7Re
         e0N2ADEJ5fs3Ky3sN+J/NZFQi1/GQB8JxVoBjpmuxEv+CJ7GQb3fradc5yJ14mhJePzV
         kZVPC3XArvxa2/MjJpGA9mvseGPHItZv5wVSi1mRkOrrnTehDCRTFOGPZp/UeUG7DL2+
         TgKe5FlLuiCy4jy6R12DI0xvEgRU33BAGxQNIHt6xAbWC6fgQKLrnI0EquV+tWH/aaix
         kUUg==
X-Gm-Message-State: APjAAAUFuCwuLGuknIuDPfoVybTQfzI68nGE0dBzAvPzpkkD71K5hbaW
        69PYmo4MtpnMf1ota+X4TtxNkCOcoOeLBQs9UgOOuw==
X-Google-Smtp-Source: APXvYqyTvlqNDXXYJs40fHcHZAjgIK2KrVDPoFah8oL/0tZ8wYIjKqWgE36q48owGJY6iDSW03MKSlFppsyr9QEnM3Y=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr5288996lfu.141.1562225749043;
 Thu, 04 Jul 2019 00:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190701142738.25219-1-geert+renesas@glider.be>
In-Reply-To: <20190701142738.25219-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:35:37 +0200
Message-ID: <CACRpkdbq9ruVK+Yo73x3rM_396nGSV3q99=iJWqdtbX2xAFnQw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix references to gpiod_[gs]et_*value_cansleep() variants
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 1, 2019 at 4:27 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Commit 372e722ea4dd4ca1 ("gpiolib: use descriptors internally") renamed
> the functions to use a "gpiod" prefix, and commit 79a9becda8940deb
> ("gpiolib: export descriptor-based GPIO interface") introduced the "raw"
> variants, but both changes forgot to update the comments.
>
> Readd a similar reference to gpiod_set_value(), which was accidentally
> removed by commit 1e77fc82110ac36f ("gpio: Add missing open drain/source
> handling to gpiod_set_value_cansleep()").
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
