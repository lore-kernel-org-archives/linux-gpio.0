From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson-axg: adjust uart_ao_b pin group naming
Date: Wed, 7 Feb 2018 13:31:58 +0100
Message-ID: <CACRpkdYvC3wokib4ixjzJ8wWSTU1XQ90ix+iH_3vh70xOnkCcg@mail.gmail.com>
References: <20180118141757.41290-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:51290 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753630AbeBGMb7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Feb 2018 07:31:59 -0500
Received: by mail-it0-f53.google.com with SMTP id p139so2075299itb.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2018 04:31:59 -0800 (PST)
In-Reply-To: <20180118141757.41290-1-yixun.lan@amlogic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-gpio@vger.kernel.org, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 18, 2018 at 3:17 PM, Yixun Lan <yixun.lan@amlogic.com> wrote:

> Simply adjust the pin group to _x _y _z style, as to
> keep the consistency in DT with previous naming scheme.
>
> Fixes: 83c566806a68 ("pinctrl: meson-axg: Add new pinctrl driver for Meson AXG SoC")
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Patch applied for fixes.

Yours,
Linus Walleij
