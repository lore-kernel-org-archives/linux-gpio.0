From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] iio: stx104: Add GPIO support for the Apex Embedded
 Systems STX104
Date: Tue, 14 Jun 2016 08:53:48 +0200
Message-ID: <CACRpkdZ__YaP24hC9y17tnsXC5HybzmQmHdpTCUYSNWciKg5zA@mail.gmail.com>
References: <20160613130628.GA28944@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35208 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751316AbcFNGxu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 02:53:50 -0400
Received: by mail-oi0-f45.google.com with SMTP id w5so163598979oib.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2016 23:53:50 -0700 (PDT)
In-Reply-To: <20160613130628.GA28944@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 13, 2016 at 3:06 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The Apex Embedded Systems STX104 device features eight lines of digital
> I/O (four digital inputs and four digital outputs). This patch adds GPIO
> support for these eight lines of digital I/O via GPIOLIB.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
> Changes in v3:
>   - Revert v2 change; any arch should be able to select GPIOLIB
>   - Return -EINVAL when attempting to set a GPIO to a direction it
>     cannot be
>   - Call stx104_gpio_set to have an initial value when setting a GPIO to
>     output direction

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
