From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: dt-bindings: add mcp23018 to mcp23s08 documentation
Date: Sun, 8 Oct 2017 01:41:26 +0200
Message-ID: <CACRpkdY-NRR1wcBbaeCLHfWwCVoQB+s=P=nMxZgMSyuqdmkA6g@mail.gmail.com>
References: <1507166615-4530-1-git-send-email-preid@electromag.com.au> <1507166615-4530-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:52049 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752812AbdJGXl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Oct 2017 19:41:27 -0400
Received: by mail-io0-f171.google.com with SMTP id l15so18695329iol.8
        for <linux-gpio@vger.kernel.org>; Sat, 07 Oct 2017 16:41:27 -0700 (PDT)
In-Reply-To: <1507166615-4530-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Thu, Oct 5, 2017 at 3:23 AM, Phil Reid <preid@electromag.com.au> wrote:

> This adds the required definitions for the mcp23018 which is the i2c
> variant of the mcp23s18.

Which is logical if "s" stands for "SPI", "0" is normal or I2C.

>      - "microchip,mcp23s18" for 16 GPIO SPI version

So that is the SPI version

>      - "microchip,mcp23008" for  8 GPIO I2C version or
>      - "microchip,mcp23017" for 16 GPIO I2C version of the chip
> +    - "microchip,mcp23018" for 16 GPIO SPI version

And right here you say that this is also the SPI version, but the
commit message says it is the I2C version.

Yours,
Linus Walleij
