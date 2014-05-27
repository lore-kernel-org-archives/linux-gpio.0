From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: PATCH: Fixed missing increase of count variable for devicetree
 path in driver probing
Date: Tue, 27 May 2014 15:57:46 +0200
Message-ID: <CACRpkdb9RtBF=0-JNE5NZ=m+qfGiHmcrtnLDuE1B-Cq7dMd7cQ@mail.gmail.com>
References: <5382F544.7000400@mycable.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:48138 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbaE0N5r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 09:57:47 -0400
Received: by mail-oa0-f41.google.com with SMTP id m1so9650512oag.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2014 06:57:46 -0700 (PDT)
In-Reply-To: <5382F544.7000400@mycable.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Stickel <ms@mycable.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lars Poeschel <larsi@wh2.tu-dresden.de>
Cc: Alexandre Courbot <gnurou@gmail.com>

I have tentatively applied this patch because it looks correct, on
future postings, please include the linux-gpio mailing list, Alexandre
Courbot and Lars Poeschel.

Yours,
Linus Walleij

On Mon, May 26, 2014 at 10:03 AM, Michael Stickel <ms@mycable.de> wrote:
> Fixed missing increase of count variable for devicetree path in driver
> probing.
>
> The gpio-mcp23s08 driver has two paths for getting the platform
> registration information. One for the classic platform initialization
> and one for openfirmware devicetree based initialization. The devicetree
> based path is missing the increase of the count variable, which results
> in the count variable to become negative in the later use, where it is
> decreased. The count variable is used as an index into a vector. This
> results in accessing invalid memory space and can result in an exception.
>
> Tested this with an AM3352 SoC with two mcp23s17 on two chip selects as
> well as on a shared chip select.
>
> Signed-off-by: Michael Stickel <ms@mycable.de>
>
> --- linux-3.14-rc8/drivers/gpio/gpio-mcp23s08.c 2014-03-25
> 03:31:17.000000000 +0100
> +++
> /work/ms/daimler-mm-b-bringup/build_xxsnet2/out/work/xxsnet2-poky-linux-gnueabi/linux/3.14-rc8-3/linux-3.14-rc8/drivers/gpio/gpio-mcp23s08.c
> 2014-05-26 09:44:25.083824057 +0200
> @@ -895,8 +895,13 @@ static int mcp23s08_probe(struct spi_dev
>                         return -ENODEV;
>                 }
>
> -               for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++)
> +               for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
>                         pullups[addr] = 0;
> +                       if (spi_present_mask & (1 << addr))
> +                               chips++;
> +               }
> +               if (!chips)
> +                       return -ENODEV;
>         } else {
>                 type = spi_get_device_id(spi)->driver_data;
>                 pdata = dev_get_platdata(&spi->dev);
> @@ -935,6 +940,10 @@ static int mcp23s08_probe(struct spi_dev
>                 if (!(spi_present_mask & (1 << addr)))
>                         continue;
>                 chips--;
> +               if (chips < 0) {
> +                       dev_err(&spi->dev, "FATAL: invalid negative chip id\n");
> +                       goto fail;
> +               }
>                 data->mcp[addr] = &data->chip[chips];
>                 status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
>                                             0x40 | (addr << 1), type, base,
> --
> Michael Stickel
>
