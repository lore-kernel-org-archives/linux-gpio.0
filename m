From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] gpio: rcar: Fine-grained Runtime PM support
Date: Fri, 9 Dec 2016 11:26:21 +0100
Message-ID: <CAMuHMdV8k4v4MZGGwxEv3oRhogwPQM-8SvA4muVcABuYQjYXxg@mail.gmail.com>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se> <20161208173228.16835-3-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36550 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932960AbcLIK0W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2016 05:26:22 -0500
In-Reply-To: <20161208173228.16835-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>

Hi Niklas,

On Thu, Dec 8, 2016 at 6:32 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Currently gpio modules are runtime-resumed at probe time. This means the
> gpio module will be active all the time (except during system suspend,
> if not configured as a wake-up source).
>
> While an R-Car Gen2 gpio module retains pins configured for output at
> the requested level while put in standby mode, gpio register cannot be
> accessed while suspended.  Unfortunately pm_runtime_get_sync() cannot be
> called from all contexts where gpio register access is needed. Hence
> move the Runtime PM handling from probe/remove time to gpio request/free
> time, which is probably the best we can do.
>
> On r8a7791/koelsch, gpio modules 0, 1, 3, and 4 are now suspended during
> normal use (gpio2 is used for LEDs and regulators, gpio5 for keys, gpio6
> for SD-Card CD & WP, gpio7 for keys and regulators).

FWIW, gpio module 3 is no longer suspended, as gpio3 is used by HDMI since
commit 83a0731b39f3bc24 ("ARM: shmobile: koelsch: Add DU HDMI output suppor=
t").

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [Niklas: s/gpio_to_priv(chip)/gpiochip_get_data(chip)/]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for fixing and resurrecting!

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
