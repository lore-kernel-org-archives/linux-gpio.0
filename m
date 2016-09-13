From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: meson-gxbb: add the missing SDIO
 interrupt pin
Date: Tue, 13 Sep 2016 13:38:34 +0200
Message-ID: <CACRpkdaRzbVuK2SPGLf9UwFJXq28iU3pRzo9ozaxAB-Nop9GKQ@mail.gmail.com>
References: <20160828164725.19429-1-martin.blumenstingl@googlemail.com>
 <20160911123903.20027-1-martin.blumenstingl@googlemail.com> <20160911123903.20027-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36000 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751476AbcIMLif (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 07:38:35 -0400
Received: by mail-oi0-f54.google.com with SMTP id q188so261326903oia.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 04:38:35 -0700 (PDT)
In-Reply-To: <20160911123903.20027-2-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sun, Sep 11, 2016 at 2:39 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> This adds the SDIO interrupt pin which can be used by sd_emmc_a.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Fixes: 29885a656511 ("pinctrl: meson-gxbb: add the pins for the
> SDIO/sd_emmc_a controller")

Patch applied with Kevin's ACK.

Yours,
Linus Walleij
