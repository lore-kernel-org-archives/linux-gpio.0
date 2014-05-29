From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2][v3] gpio-mpc8xxx: add mpc8xxx_gpio_set_multiple function
Date: Thu, 29 May 2014 15:27:54 +0200
Message-ID: <CACRpkdbneBDv0HxmZr6puthzAx_h-f9FnjUuBWbPEMBu9B8v5g@mail.gmail.com>
References: <4658251.3PbME5bghW@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:46260 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932421AbaE2N1z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 May 2014 09:27:55 -0400
Received: by mail-oa0-f48.google.com with SMTP id g18so309622oah.7
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2014 06:27:55 -0700 (PDT)
In-Reply-To: <4658251.3PbME5bghW@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>, Grant Likely <grant.likely@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Gerhard Sittig <gsi@denx.de>, Mark Brown <broonie@kernel.org>

On Tue, May 27, 2014 at 1:14 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:

> Add a set_multiple function to the MPC8xxx GPIO chip driver and thereby allow
> for actual performance improvements when setting multiple outputs
> simultaneously. In my case the time needed to configure an FPGA goes down from
> 48 s to 19 s.

OK that's substantial. We cannot deny this. Performance is awesome.

> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> ---
> This patch depends on my previous patch "gpiolib: allow simultaneous setting
> of multiple GPIO outputs".
>
> Change log:
>   v3: - change commit message
>   v2: - add this patch (v1 included only changes to gpiolib)
>
>  drivers/gpio/gpio-mpc8xxx.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index d7d6d72..d226f5c 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -105,6 +105,33 @@ static void mpc8xxx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>         spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
>  }
>
> +static void mpc8xxx_gpio_set_multiple(struct gpio_chip *gc,
> +                                     u32 *mask, u32 *bits)
> +{
> +       struct of_mm_gpio_chip *mm = to_of_mm_gpio_chip(gc);
> +       struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
> +       unsigned long flags;
> +       int i;
> +
> +       spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
> +
> +       for (i = 0; i < gc->ngpio; i++) {
> +               if (*mask == 0)
> +                       break;
> +               if (*mask & (1 << i)) {
> +                       if ((*bits >> i) & 1)

Use
#include <linux/bitops.h>

if (*mask & BIT(i)) {
    if ((*bits & BIT(i))

....

> +                               mpc8xxx_gc->data |= mpc8xxx_gpio2mask(i);
> +                       else
> +                               mpc8xxx_gc->data &= ~mpc8xxx_gpio2mask(i);

But hey:

#define MPC8XXX_GPIO_PINS       32

static inline u32 mpc8xxx_gpio2mask(unsigned int gpio)
{
        return 1u << (MPC8XXX_GPIO_PINS - 1 - gpio);
}

So what is happening? Bits are swizzled: bit 0 becomes
bit 31, bit 1 becomes bit 30 ... bit 31 becomes bit 0.
I'm actually for having a function

u32 swizzle(u32 foo) {}

In the kernel doing exactly this, because I read somewhere
that there are ultimax ways for doing this. Namely so
(drivers/crypto/ux500/cryp/cryp_core.c):

/**
 * swap_bits_in_byte - mirror the bits in a byte
 * @b: the byte to be mirrored
 *
 * The bits are swapped the following way:
 *  Byte b include bits 0-7, nibble 1 (n1) include bits 0-3 and
 *  nibble 2 (n2) bits 4-7.
 *
 *  Nibble 1 (n1):
 *  (The "old" (moved) bit is replaced with a zero)
 *  1. Move bit 6 and 7, 4 positions to the left.
 *  2. Move bit 3 and 5, 2 positions to the left.
 *  3. Move bit 1-4, 1 position to the left.
 *
 *  Nibble 2 (n2):
 *  1. Move bit 0 and 1, 4 positions to the right.
 *  2. Move bit 2 and 4, 2 positions to the right.
 *  3. Move bit 3-6, 1 position to the right.
 *
 *  Combine the two nibbles to a complete and swapped byte.
 */

static inline u8 swap_bits_in_byte(u8 b)
{
#define R_SHIFT_4_MASK  (0xc0) /* Bits 6 and 7, right shift 4 */
#define R_SHIFT_2_MASK  (0x28) /* (After right shift 4) Bits 3 and 5,
                                  right shift 2 */
#define R_SHIFT_1_MASK  (0x1e) /* (After right shift 2) Bits 1-4,
                                  right shift 1 */
#define L_SHIFT_4_MASK  (0x03) /* Bits 0 and 1, left shift 4 */
#define L_SHIFT_2_MASK  (0x14) /* (After left shift 4) Bits 2 and 4,
                                  left shift 2 */
#define L_SHIFT_1_MASK  (0x78) /* (After left shift 1) Bits 3-6,
                                  left shift 1 */

        u8 n1;
        u8 n2;

        /* Swap most significant nibble */
        /* Right shift 4, bits 6 and 7 */
        n1 = ((b  & R_SHIFT_4_MASK) >> 4) | (b  & ~(R_SHIFT_4_MASK >> 4));
        /* Right shift 2, bits 3 and 5 */
        n1 = ((n1 & R_SHIFT_2_MASK) >> 2) | (n1 & ~(R_SHIFT_2_MASK >> 2));
        /* Right shift 1, bits 1-4 */
        n1 = (n1  & R_SHIFT_1_MASK) >> 1;

        /* Swap least significant nibble */
        /* Left shift 4, bits 0 and 1 */
        n2 = ((b  & L_SHIFT_4_MASK) << 4) | (b  & ~(L_SHIFT_4_MASK << 4));
        /* Left shift 2, bits 2 and 4 */
        n2 = ((n2 & L_SHIFT_2_MASK) << 2) | (n2 & ~(L_SHIFT_2_MASK << 2));
        /* Left shift 1, bits 3-6 */
        n2 = (n2  & L_SHIFT_1_MASK) << 1;

        return n1 | n2;
}

This can be extended to 16 and 32 bits so if this happens on
many places in the kernel then it should be moved to
<linux/bitops.h> or similar.

> +                       *mask &= ~(1 << i);

*mask &= ~BIT(i);

> +               }
> +       }
> +       out_be32(mm->regs + GPIO_DAT, mpc8xxx_gc->data);

Yours,
Linus Walleij
