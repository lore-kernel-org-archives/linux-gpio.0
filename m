From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: Support named pins with custom configuration
Date: Tue, 4 Oct 2016 21:08:31 +0200
Message-ID: <CAMuHMdVJfBXrih_rXB2=nj11xV4aPwRte+FS+GmHW9OgiuZqaA@mail.gmail.com>
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se> <20160913140314.22035-2-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35869 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754146AbcJDTId (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2016 15:08:33 -0400
In-Reply-To: <20160913140314.22035-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Sep 13, 2016 at 4:03 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Pins not associated with a GPIO port can still have other configuration
> parameters. Add a new macro SH_PFC_PIN_NAMED_CFG which allows for named
> pins to be declared with a set of configurations. The new macro is an
> modification of SH_PFC_PIN_NAMED to allow for optional configuration to
> be assigned.
>
> The flag SH_PFC_PIN_CFG_NO_GPIO is still enforced as this should only be
> used to define pins not associated with a GPIO port.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
