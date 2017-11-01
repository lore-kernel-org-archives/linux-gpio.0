From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: Re: [PATCH 4/4] pinctrl: gemini: Implement clock skew/delay config
Date: Wed, 1 Nov 2017 06:57:22 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1711010656440.4454@T420s>
References: <20171028133719.27528-1-linus.walleij@linaro.org> <20171028133719.27528-4-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:52223 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750973AbdKAF7v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Nov 2017 01:59:51 -0400
Received: by mail-wm0-f68.google.com with SMTP id b9so2847530wmh.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 22:59:50 -0700 (PDT)
In-Reply-To: <20171028133719.27528-4-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, linux-arm-kernel@lists.infradead.org

Hi Linus,

On Sat, 28 Oct 2017, Linus Walleij wrote:

> This enabled pin config on the Gemini driver and implements
> pin skew/delay so that the ethernet pins clocking can be
> properly configured.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/pinctrl/cortina,gemini-pinctrl.txt    |  10 +-
>  drivers/pinctrl/pinctrl-gemini.c                   | 178 ++++++++++++++++++++-
>  2 files changed, 182 insertions(+), 6 deletions(-)
> 

Acked-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>

