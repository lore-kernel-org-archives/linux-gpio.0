From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: rzn1: Fix check for used MDIO bus
Date: Fri, 23 Nov 2018 13:04:48 +0100
Message-ID: <CAMuHMdUNNvkwsFXizEm6-QSCc2JUJa+3rXuwBZdjypFdFcM7tg@mail.gmail.com>
References: <20181123105428.13457-1-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181123105428.13457-1-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 23, 2018 at 11:54 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> This fixes the check for unused mdio bus setting and the following static
> checker warning:
>  drivers/pinctrl/pinctrl-rzn1.c:198 rzn1_pinctrl_mdio_select()
>  warn: always true condition '(ipctl->mdio_func[mdio] >= 0) => (0-u32max >= 0)'
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> v3:
>  - Split fixing the return var when calling of_get_child_count() into
>    a separate patch.
> v2:
>  - Don't rely on rely on the implicit typecast from -1 to uint

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
