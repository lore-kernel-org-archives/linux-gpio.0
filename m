From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Tue, 15 Mar 2016 09:29:21 +0100
Message-ID: <CACRpkdZko+MAKn-JGCNPhnSVJOHJQ1GG_0HNN33Z6zpbu9ZddQ@mail.gmail.com>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:33453 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934112AbcCOI3W (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2016 04:29:22 -0400
Received: by mail-ob0-f171.google.com with SMTP id fz5so9909785obc.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2016 01:29:22 -0700 (PDT)
In-Reply-To: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 7, 2016 at 7:40 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> If pinctrl_provide_dummies() is used unconditionally, then the dummy
> state will be used even on DT platforms when the "init" state was
> intentionally left out. Instead of "default", the dummy "init" state
> will then be used during probe. Thus, when probing an I2C controller on
> cold boot, communication triggered by bus notifiers broke because the
> pins were not initialized.
>
> Do it like OMAP2: use the dummy state only for non-DT platforms.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Patch applied for fixes with all the ACKs etc.

This unfortiunately coincide with the merge window so was slow
to pick it up, but it will be in the first round of fixes to Torvalds,
possibly at -rc1 possibly earlier.

> -       pinctrl_provide_dummies();
> +       /* Enable dummy states for those platforms without pinctrl support */
> +       if (!of_have_populated_dt())
> +               pinctrl_provide_dummies();

So remind we: what Renesas platforms are still not using DT?
arch/sh?

Yours,
Linus Walleij
