From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv3 0/6] pinctrl: sh-pfc: Fixups for bias handling and
 preparation for none GPIO pins
Date: Tue, 15 Nov 2016 10:42:53 +0100
Message-ID: <CAMuHMdU1jmUnwAY1pRXdEUuTW1gxf3AGvFm7LMg6Xhxc_NUZWw@mail.gmail.com>
References: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33952 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934210AbcKOJmz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2016 04:42:55 -0500
In-Reply-To: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Nov 12, 2016 at 5:04 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This series fixes two issues I encounter for bias handling in the PFC
> while preparing my drive strength patch set.
>
> I also attached a new patch 6/6 that adds the macro
> SH_PFC_PIN_NAMED_CFG() and was previously part of the series 'pinctrl:
> sh-pfc: r8a7795: Support none GPIO pins with configurable
> drive-strength'.
>
> The reason I moved this patch to this series are both 6/6 and the new
> bias helper function introduced in 2/6 are dependencies for other PFC
> patch series I wish to send out. So to simplify the dependencies between
> series this looked like the best option, if not please let me know.

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
