From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 06/15] pinctrl-sx150x: Move some code out of sx150x_init_hw
Date: Tue, 8 Nov 2016 09:38:00 +0100
Message-ID: <CACRpkdY2B=X5jHozRBgRw5JJh1t5aGq9D_mwi-G+7bNSNmuXwg@mail.gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com> <1478537603-23653-7-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:34188 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752595AbcKHIo7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 03:44:59 -0500
Received: by mail-qk0-f175.google.com with SMTP id q130so208414331qke.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 00:44:59 -0800 (PST)
In-Reply-To: <1478537603-23653-7-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>

On Mon, Nov 7, 2016 at 5:53 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> Move the code configuring explicit IRQ acking into a standalone function
> to declutter sx150x_init_hw a bit and make that code somewhat less
> repetitious.
>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Patch applied!

Yours,
Linus Walleij
