From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 01/29] pinctrl.txt: standardize document format
Date: Fri, 19 May 2017 14:46:15 +0200
Message-ID: <CAMuHMdXJ2Wc3MOCKY2QCm6xU1vOoZY_ttwORUVLHvj3rz0hyrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, MTD Maling List <linux-mtd@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Mauro,

On Fri, May 19, 2017 at 3:25 AM, Mauro Carvalho Chehab
<mchehab@s-opensource.com> wrote:
> Each text file under Documentation follows a different
> format. Some doesn't even have titles!
>
> Change its representation to follow the adopted standard,
> using ReST markups for it to be parseable by Sphinx.
>
> This document is almost following the standard stile.
>
> There are only two things to adjust on it:
>
> - promote the level of the document title;
> - mark literal blocks as such.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

Thanks for your patch!

> --- a/Documentation/pinctrl.txt
> +++ b/Documentation/pinctrl.txt
> @@ -1,4 +1,7 @@
> +===============================
>  PINCTRL (PIN CONTROL) subsystem
> +===============================
> +
>  This document outlines the pin control subsystem in Linux
>
>  This subsystem deals with:
> @@ -33,7 +36,7 @@ When a PIN CONTROLLER is instantiated, it will register a descriptor to the
>  pin control framework, and this descriptor contains an array of pin descriptors
>  describing the pins handled by this specific pin controller.
>
> -Here is an example of a PGA (Pin Grid Array) chip seen from underneath:
> +Here is an example of a PGA (Pin Grid Array) chip seen from underneath::
>
>          A   B   C   D   E   F   G   H
>
> @@ -54,39 +57,40 @@ Here is an example of a PGA (Pin Grid Array) chip seen from underneath:
>     1    o   o   o   o   o   o   o   o
>
>  To register a pin controller and name all the pins on this package we can do
> -this in our driver:
> +this in our driver::
>
> -#include <linux/pinctrl/pinctrl.h>
> +       #include <linux/pinctrl/pinctrl.h>
>
> -const struct pinctrl_pin_desc foo_pins[] = {
> -      PINCTRL_PIN(0, "A8"),
> -      PINCTRL_PIN(1, "B8"),
> -      PINCTRL_PIN(2, "C8"),
> -      ...
> -      PINCTRL_PIN(61, "F1"),
> -      PINCTRL_PIN(62, "G1"),
> -      PINCTRL_PIN(63, "H1"),
> -};
> +       const struct pinctrl_pin_desc foo_pins[] = {
> +       PINCTRL_PIN(0, "A8"),
> +       PINCTRL_PIN(1, "B8"),
> +       PINCTRL_PIN(2, "C8"),
> +       ...
> +       PINCTRL_PIN(61, "F1"),
> +       PINCTRL_PIN(62, "G1"),
> +       PINCTRL_PIN(63, "H1"),
> +       };

The above block is no longer indented correctly.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
