From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] ARM64: dts: meson-gxbb: add the SDIO pins
Date: Wed, 7 Sep 2016 16:23:21 +0200
Message-ID: <CACRpkdaQLLTi6wGX5duvgLpzHQ4jRTpHTQ4E-jicOoVsnn7KkQ@mail.gmail.com>
References: <20160828164725.19429-1-martin.blumenstingl@googlemail.com> <20160828164725.19429-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35771 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751201AbcIGOXW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 10:23:22 -0400
Received: by mail-oi0-f48.google.com with SMTP id s131so27693811oie.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 07:23:22 -0700 (PDT)
In-Reply-To: <20160828164725.19429-3-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sun, Aug 28, 2016 at 6:47 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> This can be passed to the sd_emmc_a controller to which the SDIO module
> is connected (when available).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please merge this through the ARM SoC tree.

Yours,
Linus Walleij
