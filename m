From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: meson: use one uniform 'function' name
Date: Thu, 11 Jan 2018 10:46:38 +0100
Message-ID: <CACRpkdZ6pW_3QTeQMGVbpa=1WTgR59fi+0aWCqmbRBzOn+F0cA@mail.gmail.com>
References: <20180108073328.205769-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:40860 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754388AbeAKJqj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jan 2018 04:46:39 -0500
Received: by mail-qk0-f176.google.com with SMTP id d18so3489400qke.7
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2018 01:46:39 -0800 (PST)
In-Reply-To: <20180108073328.205769-1-yixun.lan@amlogic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Carlo Caione <carlo@caione.org>, Beniamino Galvani <b.galvani@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 8, 2018 at 8:33 AM, Yixun Lan <yixun.lan@amlogic.com> wrote:

> These two patches are general improvement for meson pinctrl driver.
> It make the two pinctrl trees (ee/ao) to share one uniform 'function' name for
> one hardware block even its pin groups live inside two differet hardware domains,
> which for example EE vs AO domain here.
>
> This idea is motivated by Martin's question at [1]
>
> [1]
>  http://lkml.kernel.org/r/CAFBinCCuQ-NK747+GHDkhZty_UMMgzCYOYFcNTrRDJgU8OM=Gw@mail.gmail.com

There seems to be controversy here so I'd like input from Carlo
and/or Beniamino if possible.

Yours,
Linus Walleij
