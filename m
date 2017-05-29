From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] pinctrl: meson-gxl: Add Ethernet PHY LEDS pins
Date: Mon, 29 May 2017 11:01:36 +0200
Message-ID: <CACRpkdY6rwx=Z2YZRA=DUjvRDe6cCc7cyFrdb3JbiisHVK+kCQ@mail.gmail.com>
References: <1495614042-2676-1-git-send-email-narmstrong@baylibre.com> <1495614042-2676-6-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:37285 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750837AbdE2JBi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 05:01:38 -0400
Received: by mail-it0-f51.google.com with SMTP id g126so23818963ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 02:01:38 -0700 (PDT)
In-Reply-To: <1495614042-2676-6-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 24, 2017 at 10:20 AM, Neil Armstrong
<narmstrong@baylibre.com> wrote:

> The Amlogic Meson GXL SoCs embeds an 10/100 Ethernet PHY, this patchs enables
> the Link and Activity LEDs signals.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied with Jerome's review tag.

Yours,
Linus Walleij
