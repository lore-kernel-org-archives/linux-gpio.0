From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/8] gpio: pci-idio-16: Implement get_multiple callback
Date: Tue, 13 Mar 2018 18:04:33 +0200
Message-ID: <CAHp75Vf9+=rie5oqmAp7yW3_AirGuvBtxGS=6y9UBHzjpvD9ww@mail.gmail.com>
References: <cover.1520886945.git.vilhelm.gray@gmail.com> <e6a13288c45f824ba23ee8d1410cf0bf9c55fe60.1520886945.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e6a13288c45f824ba23ee8d1410cf0bf9c55fe60.1520886945.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 12, 2018 at 10:49 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> +static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
> +       unsigned long *mask, unsigned long *bits)
> +{


> +       /* clear bits array to a clean slate */
> +       for (i = 0; i < chip->ngpio; i += BITS_PER_LONG)
> +               bits[i / BITS_PER_LONG] = 0;

bitmap_clear() or bitmap_zero()

> +       /* get bits are evaluated a gpio register size at a time */
> +       for (i = 0; i < chip->ngpio; i += gpio_reg_size) {
> +               bit_word_offset = i % BITS_PER_LONG;
> +               bits_mask = mask[BIT_WORD(i)] & (reg_mask << bit_word_offset);
> +               if (!bits_mask) {
> +                       /* no get bits in this register so skip to next one */
> +                       continue;
> +               }

for_each_set_bit() ?

> +               /* store acquired bits */
> +               bits[BIT_WORD(i)] |= port_state << bit_word_offset;

__set_bit()
__clear_bit()

We have bitmap API for *ages*. Is it too hard to check?

-- 
With Best Regards,
Andy Shevchenko
