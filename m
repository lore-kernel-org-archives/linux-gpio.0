From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: gpio-rcar: Support S2RAM
Date: Thu, 7 Dec 2017 10:26:53 +0100
Message-ID: <CAMuHMdX05GAXX3b-kcZ0yEBR_+3i0zbRgzZ0VnFXWP90wiRjoQ@mail.gmail.com>
References: <1512586115-4698-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdXRLuXeVmE9UAFGMdKV4gFSNO3kiVkh-q2MYM8spPkF7Q@mail.gmail.com>
 <20171207090810.zzltv5567d62w4ka@verge.net.au> <CAMuHMdVZuUmy-X5hwYO4SBB_dEQC5Fk2_sWhunojgcOKc1d7rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVZuUmy-X5hwYO4SBB_dEQC5Fk2_sWhunojgcOKc1d7rw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 7, 2017 at 10:21 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>>> >  struct gpio_rcar_priv {
>>> >         void __iomem *base;
>>> >         spinlock_t lock;
>>> > @@ -41,6 +51,7 @@ struct gpio_rcar_priv {
>>> >         unsigned int irq_parent;
>>> >         bool has_both_edge_trigger;
>>> >         bool needs_clk;
>>> > +       struct gpio_rcar_bank_info bank_info[32];
>>>
>>> That's 32 x 7 = 224 bytes in total.
>>>
>>> What about just using 7 u32s instead, one for each register to save?
>>> That way you only need 7 x 4 = 28 bytes, and you can probably optimize
>>> the code to just save/restore the whole register at once.
>>
>> So the suggestion is to use a u32 instead of struct gpio_rcar_bank_info,
>> and for each field of struct gpio_rcar_bank_info use a bit in the u32?
>>
>> If so, probably one could go a step further and use a u8 as there are
>> currently only 7 fields, thus using 32 x 1 = 32 bytes rather than
>> 32 x 4 = 128 bytes.
>
> I think you misunderstood.
> The patch has one gpio_rcar_bank_info for each GPIO.
> Each bank has 7 bits (bools), one for each register.
> Indexing is done through bank_info[<gpio>].<reg>.
> Saving/restoring bits requires converting from hardware register layout to
> stored layout ("transposing a 32 x 7 matrix to a 7 x 32 matrix").
>
> I proposed 7 u32s, one for each register, storing the similar bits for all
> 32 GPIOs.
> So indexing is reversed, becoming regs[<reg>] & BIT(<gpio>), which is
> similar to how the data is stored in hardware registers.
> Storing all bits related to a single register in a single u32 may allow to
> save/restore all bits of the register in a single operation.

More clarification: it's the difference between "int array[7][32]" and
"int array[32][7]".  Both store the same amount of data.
But if the hardware uses the former organization, you want to
save/restore using the same organization, else it requires an expensive
transformation.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
