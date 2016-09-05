From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/5] gpio: pca953x: code shrink
Date: Mon, 5 Sep 2016 16:40:25 +0200
Message-ID: <CAMuHMdVrpTrXyE_J3qKhpLa9_9xSHvcqJ6dw5-FutDzKn45P_w@mail.gmail.com>
References: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com> <1473085895-31711-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:32778 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755164AbcIEOk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 10:40:26 -0400
In-Reply-To: <1473085895-31711-3-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Sep 5, 2016 at 4:31 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -94,6 +94,24 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
>
>  #define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
>
> +struct pca953x_offset {
> +       int direction;
> +       int output;
> +       int input;
> +};
> +
> +static struct pca953x_offset pca953x_offsets = {

const

> +       .direction = PCA953X_DIRECTION,
> +       .output = PCA953X_OUTPUT,
> +       .input = PCA953X_INPUT,
> +};
> +
> +static struct pca953x_offset pca957x_offsets = {

const

> +       .direction = PCA957X_CFG,
> +       .output = PCA957X_OUT,
> +       .input = PCA957X_IN,
> +};
> +
>  struct pca953x_chip {
>         unsigned gpio_start;
>         u8 reg_output[MAX_BANK];
> @@ -113,6 +131,8 @@ struct pca953x_chip {
>         const char *const *names;
>         int     chip_type;
>         unsigned long driver_data;
> +
> +       struct pca953x_offset *offset;

const

>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
