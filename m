From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] gpio: rcar: set IRQ chip parent_device
Date: Fri, 9 Dec 2016 11:43:24 +0100
Message-ID: <CAMuHMdWo+D4Fqc-jb_ioWVQ5TRBXPQiqgmhe--o4BtM4tzVeyA@mail.gmail.com>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se> <20161208173228.16835-2-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33752 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752228AbcLIKn0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2016 05:43:26 -0500
In-Reply-To: <20161208173228.16835-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Thu, Dec 8, 2016 at 6:32 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This enables Runtime PM handling for interrupts.
>
> By setting the parent_device in struct irq_chip genirq will call the
> pm_runtime_get/put APIs when an IRQ is requested/freed.
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
