From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: rzn1: Fix check for used MDIO bus
Date: Fri, 23 Nov 2018 10:40:56 +0100
Message-ID: <CAMuHMdU2ski3S4FhD5kOhtzxvpin8M5MoYwK7X5gqYZ+HoL0DA@mail.gmail.com>
References: <20181119161838.10610-1-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119161838.10610-1-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Phil,

Thanks for your patch!

On Mon, Nov 19, 2018 at 5:18 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> This fixes the check for unused mdio bus setting and the following static
> checker warning:
>  drivers/pinctrl/pinctrl-rzn1.c:198 rzn1_pinctrl_mdio_select()
>  warn: always true condition '(ipctl->mdio_func[mdio] >= 0) => (0-u32max >= 0)'
>
> It also fixes the return var when calling of_get_child_count()

I think this should be a separate patch.

> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

BTW, I have a question about rzn1_pinctrl_mdio_select():

static void rzn1_pinctrl_mdio_select(struct rzn1_pinctrl *ipctl, int mdio,
                                     u32 func)
{
        if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != func)
                dev_warn(ipctl->dev, "conflicting setting for mdio%d!\n", mdio);
        ipctl->mdio_func[mdio] = func;

        dev_dbg(ipctl->dev, "setting mdio%d to %u\n", mdio, func);

        writel(func, &ipctl->lev2->l2_mdio[mdio]);
}

The check warns the user if it overrides an already initialized MDIO function
with a different value.
However, there is no method to uninitialize (reset to -1) mdio_func[], to
avoid getting the warning.

For a use case, I was thinking about a DT overlay that would cause the
MDIO function to be initialized on loading, and needs to uninitialize the
MDIO function on removing.

Perhaps that is very unlikely or even impossible, given the function of the
pins controlled by the MDIO function?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
