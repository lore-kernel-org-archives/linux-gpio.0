From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Tue, 6 Sep 2016 00:47:33 +0200
Message-ID: <CACRpkdZJy6N2uCnPLrM0V=67=xJzge94bYesHjL3r4itgE-9GA@mail.gmail.com>
References: <1472130692-14404-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33758 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753471AbcIEWrf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 18:47:35 -0400
Received: by mail-oi0-f48.google.com with SMTP id y2so41625773oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2016 15:47:34 -0700 (PDT)
In-Reply-To: <1472130692-14404-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Peter Rosin <peda@axentia.se>, Wei Chen <Wei.Chen@csr.com>, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Aug 25, 2016 at 3:11 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Since the I2C sx150x GPIO expander driver uses platform_data to managed
> the pins configurations, rewrite the driver as a pinctrl driver using
> pinconf to get pin configurations from DT.
>
> The pinctrl driver is functionnally as the gpio-only driver equivalent
> and can use DT for pinconf.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Overall I'd say this is a nice rewrite. I'd like the following:

- Include Peter Rosin, Wei Chen, Roland Stigge and Vladimir
  Zapolskiy on subsequent posts
  (Added on To:) ideally I want Tested-by: tags from them
  to verify that it doesn't break their current set-ups
  (does it? Especially LPC32xx)

- We need a migration plan: everything that was selecting
  GPIO_SX150X before should now select this instead.
  Just let the Kconfig entry in the drivers/gpio/Kconfig select
  this new driver?

- Make sure it is a slot-in replacement. Else make sure it
  is.

- Delete the old sx150x driver from drivers/gpio in the same
  patch. I'd hate to maintain them side by side. If I apply this,
  the old one must go out at the same time. Conversely I can
  revert the patch and get the old driver back.

- Strangely I don't see refernces to this driver in any
  device tree. Are people not upstreaming their boards?

Yours,
Linus Walleij
