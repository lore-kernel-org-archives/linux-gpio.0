From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/15] pinctrl-sx150x: Fix incorrect constant in sx150x_init_hw
Date: Tue, 8 Nov 2016 09:37:12 +0100
Message-ID: <CACRpkdaeudDSbOGAZ=6Mu7ZH0Zuc-=r09GLFfE3gsOFj7YRLMg@mail.gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com> <1478537603-23653-6-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:35296 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752812AbcKHIhN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 03:37:13 -0500
Received: by mail-qk0-f180.google.com with SMTP id n204so197747054qke.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 00:37:13 -0800 (PST)
In-Reply-To: <1478537603-23653-6-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>

On Mon, Nov 7, 2016 at 5:53 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> According to the datasheet for SX1504/5/6, RegAdvanced's
> "Autoclear NINT" bit that turns the feature when set and disables it
> when cleared, so writing 0x04 to the register will have the opposite
> from desirable effect.
>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Patch applied!

Yours,
Linus Walleij
