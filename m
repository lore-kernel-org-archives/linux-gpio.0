From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] pinctrl: sh-pfc: r8a7794: Implement voltage switching
 for SDHI
Date: Fri, 9 Sep 2016 18:57:54 +0200
Message-ID: <CAMuHMdWKO3d5RWJt+zUosNc9kFa7voN+udBX8KDuzzUfHpOHBQ@mail.gmail.com>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
 <1473334608-24638-4-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdW4=89ro4E2zLRs6fPZk3fPfkHmowNybO107nkJtZqGbw@mail.gmail.com> <20160909152635.GB13747@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33769 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750796AbcIIQ54 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2016 12:57:56 -0400
In-Reply-To: <20160909152635.GB13747@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

Hi Simon,

On Fri, Sep 9, 2016 at 5:26 PM, Simon Horman <horms@verge.net.au> wrote:
>> > +       /* GP6_16-23 -> bits 31-24 of pocctrl
>> > +        * GP6_06    -> bit  23    of pocctrl
>> > +        * GP6_00-05 -> bits 22-17 of pocctrl
>> > +        * GP6_07    -> bit  16    of pocctrl
>> > +        * GP6_14    -> bit  15    of pocctrl
>> > +        * GP6_08-13 -> bits 14-09 of pocctrl
>> > +        * GP6_15    -> bit  08    of pocctrl
>> > +        */
>> > +       if (pin == RCAR_GP_PIN(6, 6) || pin == RCAR_GP_PIN(6, 14))
>> > +               return 31 - 2 - (pin & 0x1f);
>> > +       else if (pin == RCAR_GP_PIN(6, 7) || pin == RCAR_GP_PIN(6, 15))
>> > +               return 31 - 8 - (pin & 0x1f);
>> > +       else if (pin < RCAR_GP_PIN(6, 14))
>> > +               return 31 - 9 - (pin & 0x1f);
>> > +       else
>> > +               return 31 + 16 - (pin & 0x1f);
>>
>> While your code is correct, I think it's easier for the casual reader to use
>> a plain switch () statement, and let the optimizer handle the rest.
>
> Like this? If so I don't particularly mind but it doesn't seem clearer to
> me.
>
> +static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
> +{
> +       *pocctrl = 0xe606006c;
> +
> +       switch (pin) {
> +       case RCAR_GP_PIN(6, 0):
> +               return 22;
> +       case RCAR_GP_PIN(6, 1):
> +               return 21;

Right, a full list of cases indeed doesn't look that much better.

Note that you can use "switch (pin & 0x1f)", and have ranges in case
statements:

        switch (pin & 0x1f) {
        case 6: return 23:
        case 7: return 16;
        case 14: return 15;
        case 15: return 8;
        case 0...5:
        case 7...13:
                return 22 - (pin & 0x1f);
        case 16..23:
                return 47 - (pin & 0x1f);
        }

Does that look better?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
