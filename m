Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6E6C388F7
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Nov 2020 13:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC18020797
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Nov 2020 13:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQc4irTY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbgKJNn6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 10 Nov 2020 08:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730099AbgKJNn5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:43:57 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CC1C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:43:57 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id y16so8664545ljh.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OMks7TCxypfO5zEMmipqoyz9iMqo2n6lpAYXT3GQdZE=;
        b=ZQc4irTYSXr7Uynl52t5lAyJ3t7rTZZ8zDrkNuxqhTZ559c4Nxt5sAfq+M1mF8/i9C
         QPupN+mkrcVfSsMuRoQj+Y4XOc9YEjOV9wjN6M36AqOSNzzteZhNd+Vyn70PWrI2Aj41
         t/d1+IncCak1EMA7w+3fUuX5sC7yIpR6tl2/dyQMM8aPnFt3IyMuMGVb4g8Wrb3tP8k/
         j4AxzVLYvDj+IRXt2Mhq6G63LnLXa2pbc+aHxdsbHUFcPT0Rd7C8TXtbB7aTevfBagkz
         EADOPXaglrGnKqrxS4q1KJy4zz6wGtBMg0qYp55j62Hm7k+6e7H6zZQuVkPck7UDpE0u
         PVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OMks7TCxypfO5zEMmipqoyz9iMqo2n6lpAYXT3GQdZE=;
        b=A9EZaUH601n8qPyU66ZgEeF1UM0QuA0KUqJ9x883nLAUdnNm1eZUtzbM8/o+ikIurQ
         ByqjiXKkGTqOGMaBgPumJqipS6KLvSdFm8mE3ldTHUjaRP+t1OU+D/yd5l1MJb2jzcYB
         39tdUl/6s9Qu9KtBh4mmVwolGvK3Kxb5sg8e8GYK/ZTKykpPvbk8X9t/wvqyhosMwmo+
         tDedj6W3f3OQMNlh/DYPgQ3cVkCTWM83nukWjF6ZX2bLmvIeZWlQai7QrCEQPNYggYoP
         YOH8NZnRLm6J9Lrj71I/NDOfOUm6//ku18aDpPVPjeJlrJXuzqfj+1WHivUG7O0qnaNy
         QblA==
X-Gm-Message-State: AOAM530eoWrQKjOsn+WSqWarx+LNbZrZMQOCQa3+I5EfHCAWeYi/EZ1z
        KBVDzo2pB5ChSasXl0JpzftxGzkQNa7DEqZMY0YWZA==
X-Google-Smtp-Source: ABdhPJw2JVrii/Lp5BJnQVyUrauPeK2zgq1rilJyDhm5OQIL+Qesys0TTnEHOCRlwDICOKoIfiL4zx/thHFdAq7Q0Ws=
X-Received: by 2002:a2e:86d4:: with SMTP id n20mr8854254ljj.293.1605015836059;
 Tue, 10 Nov 2020 05:43:56 -0800 (PST)
MIME-Version: 1.0
References: <CAHNNwZAucoc00gJrUsPRMpFc9U2r+os6NJfc1axsGh0m6ES=xQ@mail.gmail.com>
In-Reply-To: <CAHNNwZAucoc00gJrUsPRMpFc9U2r+os6NJfc1axsGh0m6ES=xQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:43:45 +0100
Message-ID: <CACRpkdZzLNY1B7e3CECpxNfgxAQsB=-Z9WmVSAT-EwKBgN9krg@mail.gmail.com>
Subject: Re: gpiolib sysfs access when CONFIG_GPIO_CDEV is not set
To:     Nicolas Schichan <nschichan@freebox.fr>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 6:27 PM Nicolas Schichan <nschichan@freebox.fr> wrote:

> I have tracked it to the fact that I have CONFIG_GPIO_CDEV is disabled in
> my kernel config: Enabling CONFIG_GPIO_CDEV made export work again.

We have deliberately made it hard to remove the character device
because we want to encourage people to use it.

> Yes, we have no users of the character device gpio interface on our
> platform, so I have disabled it explicitly when updating the defconfig
> to the 5.10-rc1 kernel.

Please consider getting users of the character device, since if they
are using the sysfs they are using an explicitly obsoleted interface.

Yours,
Linus Walleij
