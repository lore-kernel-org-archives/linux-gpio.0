From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 74x164: Introduce 'enable-gpios' property
Date: Mon, 14 Aug 2017 16:36:26 +0200
Message-ID: <CACRpkdYLn8_AZNCzJpnZLKJKDFXUMt+pA_-cts_-wKzq0xyn_A@mail.gmail.com>
References: <1502109710-31624-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33352 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751965AbdHNOg1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2017 10:36:27 -0400
Received: by mail-oi0-f47.google.com with SMTP id f11so85493619oic.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2017 07:36:27 -0700 (PDT)
In-Reply-To: <1502109710-31624-1-git-send-email-festevam@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, peng.fan@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>

On Mon, Aug 7, 2017 at 2:41 PM, Fabio Estevam <festevam@gmail.com> wrote:

> From: Fabio Estevam <fabio.estevam@nxp.com>
>
> 74HC595 has an /OE (output enable) pin that can be controlled by a GPIO.
>
> Introduce an optional property called 'enable-gpios' that allows
> controlling the /OE pin.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
