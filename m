From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv2 2/4] pinctrl: sh-pfc: r8a7795: Support none GPIO pins
 with configurable drive-strength
Date: Mon, 7 Nov 2016 12:18:23 +0100
Message-ID: <CAMuHMdVVO_mfbmQnB4wM6VQmJRTbKma7fc16HHJn-8AgW8YitA@mail.gmail.com>
References: <20161103161530.11763-1-niklas.soderlund+renesas@ragnatech.se> <20161103161530.11763-3-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35396 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751541AbcKGLS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 06:18:26 -0500
In-Reply-To: <20161103161530.11763-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Niklas,

On Thu, Nov 3, 2016 at 5:15 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> There are pins on the r8a7795 which are not part of a GPIO bank nor
> can be muxed between different functions. They do however allow for the
> drive-strength to be configured. Add those pins to the list of pins and
> to the drive-strength configuration registers.
>
> The pins can now be referred to in DT by their physical location and the

s/their physical location/function names/

> drive-strength modified.

and their drive-strengths

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
