Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0F8C433F5
	for <linux-gpio@archiver.kernel.org>; Mon, 23 May 2022 08:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbiEWInt (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 23 May 2022 04:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbiEWInl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 04:43:41 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC5A3FDA6
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 01:43:32 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id p139so24115221ybc.11
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tR8YgTgLVwwB9nwX6o/CEidmhRU6xv31QNpeWR+KjO8=;
        b=lGut/nJv3WzvFh4Sq1ooxZy6eyYuTfzVPQNpqmlfygH9rQC7kT3R/1/OR/qXFlQftu
         p03oUyBhgwd5Z6AVoCj1vwxOIg7pZAu4wrLFJVJr+TMJylIoL69/5XTgB//gqVI7UzRL
         20RrV+UwRalxGySXdUAe+omfWy5iU3EBoaQ5xJekowFVqV5WVOjZ5mPuEN/osw7tnCir
         K3jdTOZqMEOtckPQnNga3kO0QAnvG0jNngs6ccnBIKoQaYsrpaYtYUABMO4gshZBKr5A
         KcXj1gYnRSxaK4lTGErIrbavplYIJTgKvAa+zXKFqeplM1XLqirLNrtK8Ef4sVhY9UNk
         9H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tR8YgTgLVwwB9nwX6o/CEidmhRU6xv31QNpeWR+KjO8=;
        b=iWy5TQaPLX3xLblggR2Y30FnG4ftpDzbO+i5P03FDDRZtvUMI4uM9HPw6E25z8pRNP
         YPw7wseiieZjp5OQkZ8Con4jDqieaBDjY8ErQ0v6LuTdjKMovtB9rXMMgLfTDc2Lsm5Q
         T3zC7ClfeqaLvOV7n8akEZXZQwc1Xft2ldK/5QT0in9RwsHK66ypqRmxRiYhm3Bu+oT/
         8fOaf8R7VmdESTJZQWiS31GqJJPn35jvSd27kDT/Owy74ECMbi9IPVoA3o4PwvwZuI8k
         CQTE3dR8g/cUOz0BJBzWCZnpMXfwYYx2jfBYJol5xVp8cL5XBj15S/r/nHIci4p2zRgw
         M+Nw==
X-Gm-Message-State: AOAM531zkRsJM+tNsPW0IGJQJzVxAOPzeJC5W+YSlSFGwQyqMO867L/H
        viHUKXmDXv3RXhIzcNkC+v0WX+KDeebDOjB21LpWwQ==
X-Google-Smtp-Source: ABdhPJwAVa2bqUei5MDRcSLMEiOI8WrOFKrNO0s6/NY/NoecbenneyDZiyYXMKZs8S0gqnu/a9OUKDaSnIE1qgOpPPk=
X-Received: by 2002:a05:6902:704:b0:64d:f270:22b0 with SMTP id
 k4-20020a056902070400b0064df27022b0mr20326345ybt.626.1653295411848; Mon, 23
 May 2022 01:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220523083947.840708-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220523083947.840708-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 May 2022 10:43:20 +0200
Message-ID: <CACRpkdb10ZdARL1cmAkYVeVzJz4HQs8djrNHs50k7hWfCZxrjg@mail.gmail.com>
Subject: Re: [PATCH] gpio: adp5588: Remove support for platform setup and
 teardown callbacks
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 23, 2022 at 10:40 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> If the teardown callback failed in the gpio driver, it fails to free the
> irq (if there is one). The device is removed anyhow. If later on the irq
> triggers, all sorts of unpleasant things might happen (e.g. accessing
> the struct adp5588_gpio which is already freed in the meantime or startin=
g
> i2c bus transfers for an unregistered device). Even before irq support wa=
s
> added to this driver, exiting early was wrong; back then it failed to
> unregister the gpiochip.
>
> Fortunately these callbacks aren't used any more since at least blackfin
> was removed in 2018. So just drop them.
>
> Note that they are not removed from struct adp5588_gpio_platform_data
> because the keyboard driver adp5588-keys.c also makes use of them.
> (I didn't check if the callbacks might have been called twice, maybe ther=
e
> is another reason hidden to better not call these functions.)
>
> This patch is a preparation for making i2c remove callbacks return void.
>
> Fixes: 80884094e344 ("gpio: adp5588-gpio: new driver for ADP5588 GPIO exp=
anders")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Good riddance!
But also remove the setup and teardown prototypes in
include/linux/platform_data/adp5588.h

With that fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
