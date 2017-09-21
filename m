From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: fix incorrect usage of ENOSYS
Date: Thu, 21 Sep 2017 14:18:33 +0200
Message-ID: <CACRpkdaiXX3Wn9XO=_U9iCCnJiXnrBWWUFMqz_6rygnLYi6uRQ@mail.gmail.com>
References: <20170920140815.20776-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:45307 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751598AbdIUMSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2017 08:18:34 -0400
Received: by mail-io0-f179.google.com with SMTP id g32so10343973ioj.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2017 05:18:34 -0700 (PDT)
In-Reply-To: <20170920140815.20776-1-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 20, 2017 at 4:08 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> ENOSYS is special and should only be used for incorrect syscall number.
> It is not the case here. let's use ENOTSUPP instead.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij
