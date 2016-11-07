From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISABLE
Date: Mon, 7 Nov 2016 11:33:00 +0100
Message-ID: <CAMuHMdWgzpnMATuYn7ER=XQo0SvGZOidgonG-P4xnC_fGd+5hA@mail.gmail.com>
References: <20161103153421.15527-1-niklas.soderlund+renesas@ragnatech.se> <20161103153421.15527-2-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33333 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752071AbcKGKda (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 05:33:30 -0500
In-Reply-To: <20161103153421.15527-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Nov 3, 2016 at 4:34 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Always stating PIN_CONFIG_BIAS_DISABLE is supported gives untrue output
> when examining /sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins if
> the operation get_bias() are implemented but the pin are not handled by

is implemented
is not handled

> the get_bias() implementation. In that case the output will state that
> "input bias disabled" indicating that this pin have bias control

has

> support.
>
> Make support for PIN_CONFIG_BIAS_DISABLE depend on that the pin either
> support SH_PFC_PIN_CFG_PULL_UP or SH_PFC_PIN_CFG_PULL_DOWN. This also

supports

> solves the issue where SoC specific implementations print error messages
> if there particular implementation of {set,get}_bias() is called with a

their

> pin it do not know about.

does

> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
