From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: meson-gxl: Fix typo in AO I2S pins
Date: Mon, 29 May 2017 10:57:09 +0200
Message-ID: <CACRpkdYgzu052VFYCv6vQ0g2dLOS5Nz=DbV0iwRQuJLdjLbMtg@mail.gmail.com>
References: <1495614042-2676-1-git-send-email-narmstrong@baylibre.com> <1495614042-2676-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:33961 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750898AbdE2I5L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 04:57:11 -0400
Received: by mail-io0-f173.google.com with SMTP id k91so37865272ioi.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 01:57:10 -0700 (PDT)
In-Reply-To: <1495614042-2676-2-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>

On Wed, May 24, 2017 at 10:20 AM, Neil Armstrong
<narmstrong@baylibre.com> wrote:

> The AO I2S pins were incorrectly defined with the EE pin offset.
>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Fixes: 2899adf0422 ("pinctrl: meson: gxl: add i2s output pins")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied with Jerome's review tag.

Yours,
Linus Walleij
