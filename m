From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] pinctrl: sh-pfc: r8a7795: Support none GPIO pins with
 configurable drive-strength
Date: Tue, 4 Oct 2016 21:09:08 +0200
Message-ID: <CAMuHMdV0PMg3VOorxgzm6jCs5VECEuL7XHWAemaVS3c0hH0BkQ@mail.gmail.com>
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

On Tue, Sep 13, 2016 at 4:03 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> I did not add FSCLKST since I can't figure out which physical pin it's
> mapped to. Looking at the code that is already there and documentation
> it should be a GPIO pin controlled by IPSR7[15:12] but the documentation
> and code is lacking that part and I can't with a 100% certainty figure
> out which physical pin it is.

FSCLKST is pin AD38, according to R-CarH3SiP_pin_arrangement rev1.01.

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
