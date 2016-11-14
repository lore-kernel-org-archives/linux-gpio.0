From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv3 1/6] pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISABLE
Date: Mon, 14 Nov 2016 11:15:02 +0100
Message-ID: <CAMuHMdWzdEhwzovb=Y5PfDKgUoXA-XV8J0C2xDet0DR22peuDQ@mail.gmail.com>
References: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se> <20161112160429.12524-2-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34791 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754596AbcKNKPE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2016 05:15:04 -0500
In-Reply-To: <20161112160429.12524-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Nov 12, 2016 at 5:04 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> pin it dose not know about.

I'll fix up s/dose/does/ when applying ;-)

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
