From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv3 2/6] pinctrl: sh-pfc: Add helper to handle bias lookup table
Date: Tue, 15 Nov 2016 10:32:49 +0100
Message-ID: <CAMuHMdWepScfNoyzRGZdsUSE3eajJ9F72rScc8OGziKeM=ffYg@mail.gmail.com>
References: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se> <20161112160429.12524-3-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161112160429.12524-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 12, 2016 at 5:04 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On some SoC there are no simple mapping of pins to bias register bits
> and a lookup table is needed. This logic is already implemented in some
> SoC specific drivers that could benefit from a generic implementation.
>
> Add helpers to deal with the lookup which later can be used by the SoC
> specific drivers. The logic used to lookup are different from the one it
> aims to replace, this is intentional. This new method reduces the memory
> consumption at the cost of increased CPU usage and fix a bug where a
> WARN() would incorrectly be triggered if the register offset is 0.
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
