From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: meson: meson8: add the PWM pins
Date: Thu, 11 May 2017 16:03:38 +0200
Message-ID: <CACRpkdYQ0wkG0_e1htvNc=8vrs3sa9AQC7b7jtAXbmSPAhSU-Q@mail.gmail.com>
References: <20170504184932.5372-1-martin.blumenstingl@googlemail.com>
 <20170506165751.12442-1-martin.blumenstingl@googlemail.com> <20170506165751.12442-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:35419 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932212AbdEKODv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 10:03:51 -0400
Received: by mail-it0-f47.google.com with SMTP id c15so44249837ith.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 07:03:40 -0700 (PDT)
In-Reply-To: <20170506165751.12442-2-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, May 6, 2017 at 6:57 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> This adds the missing pins for the PWM controllers found in Amlogic
> Meson8 SoCs. This includes the pins for PWM_A, PWM_B, PWM_C, PWM_D,
> PWM_E and PWM_F controllers.
> There is an additional PWM function with the name PWM_VS in the vendor
> kernel sources which seems to be used for external video input. Thus
> it's not part of this change as the IP block behind the pwm-meson driver
> is not responsible for these pins.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Took out the older patch and applied this instead.

Yours,
Linus Walleij
