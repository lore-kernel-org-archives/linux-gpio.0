From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/14] pinctrl-sx150x: Rely on of_modalias_node for OF matching
Date: Fri, 4 Nov 2016 13:28:55 +0100
Message-ID: <CACRpkdaNRSM0JR7FJOBOstjaZXbMAV+xzNyT=UevNzVVwOO30A@mail.gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com> <1478015868-10309-2-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:33932 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932486AbcKDM24 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2016 08:28:56 -0400
Received: by mail-qk0-f179.google.com with SMTP id q130so94740381qke.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2016 05:28:56 -0700 (PDT)
In-Reply-To: <1478015868-10309-2-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>

On Tue, Nov 1, 2016 at 4:57 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> None of the OF match table entries contain any compatiblity strings that
> could not be matched against using i2c_device_id table above and
> of_modalias_node. Besides that entries in OF match table do not cary
> proper device variant information which is need by the drive. Those two
> facts combined, IMHO, make a compelling case for removal of that code
> altogether.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
(...)
> -static const struct of_device_id sx150x_of_match[] = {
> -       { .compatible = "semtech,sx1508q" },
> -       { .compatible = "semtech,sx1509q" },
> -       { .compatible = "semtech,sx1506q" },
> -       { .compatible = "semtech,sx1502q" },
> -       {},
> -};

I'm a bit hesitant about this since we should ideally first match on the
compatible string for any device. We have tried to alleviate the situation
in I2C devices but it has been a bit so-so.

It would be best if we make a separate patch after this tjat adds it
back, set the variant data also in the .data of the match and
use of_device_get_match_data().

It's no strong preference: I will still apply this patch set because
it is overall very very good.

Yours,
Linus Walleij
