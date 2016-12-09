From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] pinctrl: sh-pfc: r8a7791: Add ADI pinconf support
Date: Fri, 9 Dec 2016 10:03:12 +0100
Message-ID: <CAMuHMdW0KSs+m-f-38=r0-qcMkbJRDVsoy8ZgZj4cGaPbQpTeQ@mail.gmail.com>
References: <1480410716-25993-1-git-send-email-jacopo@jmondi.org> <1480630452-10958-1-git-send-email-jacopo@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1480630452-10958-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Thu, Dec 1, 2016 at 11:14 PM, Jacopo Mondi <jacopo@jmondi.org> wrote:
> Add pin configuration support for Gyro-ADC, named ADI on r8a7791 SoC.

Thanks!

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'll wait with queuing it up for upstream until it's been tested, but in
the mean time, I'll add it to a topic branch in renesas-drivers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
