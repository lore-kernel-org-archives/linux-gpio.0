From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio-pca953x: fall back to byte-at-a-time for 24-bit io
Date: Fri, 29 Dec 2017 11:44:47 +0200
Message-ID: <CAHp75Vcpdh36yjXCCOQthYKdY3vPi5EDrqFWauyv9WDgjcZPYQ@mail.gmail.com>
References: <1512440242-8983-1-git-send-email-andrew.cooks@opengear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512440242-8983-1-git-send-email-andrew.cooks@opengear.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Cooks <andrew.cooks@opengear.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, platypus-sw@opengear.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 5, 2017 at 4:17 AM, Andrew Cooks <andrew.cooks@opengear.com> wrote:
> Using TCA6424A with i2c-piix4 bus driver requires byte-at-a-time IO,
> because the i2c-piix4 driver (and probably some SMBus controllers) don't
> support I2C_SMBUS_I2C_BLOCK_DATA.

Why not to fix piix4 for now?

>  static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
>  {
> +       int ret, i;
>         int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>
> -       return i2c_smbus_write_i2c_block_data(chip->client,
> +       if (i2c_check_functionality(chip->client->adapter,
> +                                   I2C_FUNC_SMBUS_WRITE_I2C_BLOCK)) {
> +               return i2c_smbus_write_i2c_block_data(chip->client,
>                                               (reg << bank_shift) | REG_ADDR_AI,
>                                               NBANK(chip), val);

> +       } else {

Redundant and makes useless indentation level below.

> +               for (i = 0; i < NBANK(chip); i++) {
> +                       ret = i2c_smbus_write_byte_data(chip->client,
> +                                                       (reg << 1) + i, val[i]);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               return ret;
> +       }
>  }
>
>  static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
> @@ -249,7 +261,7 @@ static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
>  {
>         int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>
> -       return i2c_smbus_read_i2c_block_data(chip->client,
> +       return i2c_smbus_read_i2c_block_data_or_emulated(chip->client,
>                                              (reg << bank_shift) | REG_ADDR_AI,
>                                              NBANK(chip), val);

Don't we have a counter part for writing?

Perhaps, it might be another option.

-- 
With Best Regards,
Andy Shevchenko
