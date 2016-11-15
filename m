From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv3 0/3] pinctrl: sh-pfc: r8a7795: Support none GPIO pins
 with configurable drive-strength
Date: Tue, 15 Nov 2016 10:43:12 +0100
Message-ID: <CAMuHMdU2E-8WH_zH3-M0Zaoha6Wb_OExnSkH6WmQWbd0_=Oqzg@mail.gmail.com>
References: <20161111203341.3636-1-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36031 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941510AbcKOJnO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2016 04:43:14 -0500
In-Reply-To: <20161111203341.3636-1-niklas.soderlund@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

On Fri, Nov 11, 2016 at 9:33 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> This series adds support to control the drive strength for none GPIO
> pins. All pins which can have its drive strength controlled is now suppor=
ted. I
> have also added the new pins to the correct groups, or added groups to mi=
mic
> other sh-pfc drivers. One notable exception is the group avb_mdc which on=
 other
> SoC are called avb_mdio, see commit 2/3 for explanation.
>
> The series depends on the series '[PATCHv2 0/6] pinctrl: sh-pfc: Fixups
> for bias handling and preparation for none GPIO pins'.

Thanks, queuing up.

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
