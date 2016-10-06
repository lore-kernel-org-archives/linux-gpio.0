From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: fix struct gpio_chip comment
Date: Thu, 6 Oct 2016 09:47:40 +0200
Message-ID: <CACRpkdbpAQ8-kaD_VGBhjnPOL+1QFfABW=eyn9sNLoVP4qJHdg@mail.gmail.com>
References: <20161004201542.20869-1-anthonybest@bestanthony.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36781 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751288AbcJFHrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2016 03:47:42 -0400
Received: by mail-oi0-f47.google.com with SMTP id m72so12739382oik.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2016 00:47:41 -0700 (PDT)
In-Reply-To: <20161004201542.20869-1-anthonybest@bestanthony.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anthony Best <anthonybest@bestanthony.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Please include the mailing list linux-gpio (CC) on patches.

On Tue, Oct 4, 2016 at 10:15 PM, Anthony Best
<anthonybest@bestanthony.com> wrote:

> It should have been @reg_clr instead of @reg_clk
>
> Signed-off-by: Anthony Best <anthonybest@bestanthony.com>
> ---
>  include/linux/gpio/driver.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 1f0be72..d799c7f 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -92,7 +92,7 @@ enum single_ended_mode {
>   *     bit. This callback assigns the right bit mask.
>   * @reg_dat: data (in) register for generic GPIO
>   * @reg_set: output set register (out=high) for generic GPIO
> - * @reg_clk: output clear register (out=low) for generic GPIO
> + * @reg_clr: output clear register (out=low) for generic GPIO
>   * @reg_dir: direction setting register for generic GPIO
>   * @bgpio_bits: number of register bits used for a generic GPIO i.e.
>   *     <register width> * 8


Patch applied.

Yours,
Linus Walleij
