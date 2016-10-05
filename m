From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and
 MII pins
Date: Wed, 5 Oct 2016 09:41:02 +0200
Message-ID: <CAMuHMdUUxeQUkOdMcZBUqnpYcLc68cA__p1wceJ9SK6Zi00QfA@mail.gmail.com>
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se> <20160913140314.22035-4-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160913140314.22035-4-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2016 at 4:03 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Group the AVB pins into similar groups found in other sh-pfc drivers.
> The pins can not be muxed between functions other then AVB but there

s/there/their/

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
