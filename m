From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: mcp23s08: Use common error handling code in mcp23s08_dbg_show()
Date: Wed, 29 Nov 2017 13:55:06 +0100
Message-ID: <CACRpkdbhh9CcqMw1Wp0-JsMRGt=koZJ_FCi67gCyFHSxVf-sxQ@mail.gmail.com>
References: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net> <3e95d8b5-8306-ae4c-487b-44c6dc1811d6@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3e95d8b5-8306-ae4c-487b-44c6dc1811d6@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 30, 2017 at 4:47 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> +       if (t)
> +               goto report_failure;
>
>         for (t = 0, mask = BIT(0); t < chip->ngpio; t++, mask <<= 1) {
>                 const char *label;
> @@ -758,8 +753,13 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>                 /* NOTE:  ignoring the irq-related registers */
>                 seq_puts(s, "\n");
>         }
> -done:
> +unlock:
>         mutex_unlock(&mcp->lock);
> +       return;
> +
> +report_failure:
> +       seq_puts(s, " I/O Error\n");
> +       goto unlock;
>  }

This is spaghetti coding. Not applied.
https://en.wikipedia.org/wiki/Spaghetti_code

Yours,
Linus Walleij
