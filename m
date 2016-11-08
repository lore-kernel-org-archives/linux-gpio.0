From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 10/15] pinctrl-sx150x: Remove excessive locking
Date: Tue, 8 Nov 2016 09:44:55 +0100
Message-ID: <CACRpkdYQ=Fzo9-HRyf9_UTajK4MRsRF33_ONVpLKzovzyi5muw@mail.gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com> <1478537603-23653-11-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:33181 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752789AbcKHIo5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 03:44:57 -0500
Received: by mail-qk0-f179.google.com with SMTP id x190so206490771qkb.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 00:44:56 -0800 (PST)
In-Reply-To: <1478537603-23653-11-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>

On Mon, Nov 7, 2016 at 5:53 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> Gpiochip and irqchip aspects of this driver do not access any shared
> registers on the chip itself and atomicity of various regmap operations
> is ensured by that API's implementation, so there doesn't seem to be a
> reason to hold the lock in as many places as it is held now.
>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Patch applied!

Yours,
Linus Walleij
