From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/2] i2c: mux: ltc4306: LTC4306 and LTC4305 I2C multiplexer/switch
Date: Wed, 12 Apr 2017 10:26:43 +0200
Message-ID: <CACRpkdbOQtJvwtNRuPWh9VQyupH3kXK9-3Vu7qMemngg6O5j1w@mail.gmail.com>
References: <1491912976-8396-1-git-send-email-michael.hennerich@analog.com> <1491912976-8396-2-git-send-email-michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:33982 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753387AbdDLI0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Apr 2017 04:26:45 -0400
Received: by mail-io0-f173.google.com with SMTP id a103so32752247ioj.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Apr 2017 01:26:44 -0700 (PDT)
In-Reply-To: <1491912976-8396-2-git-send-email-michael.hennerich@analog.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 11, 2017 at 2:16 PM,  <michael.hennerich@analog.com> wrote:

> From: Michael Hennerich <michael.hennerich@analog.com>
>
> This patch adds support for the Analog Devices / Linear Technology
> LTC4306 and LTC4305 4/2 Channel I2C Bus Multiplexer/Switches.
> The LTC4306 optionally provides two general purpose input/output pins
> (GPIOs) that can be configured as logic inputs, opendrain outputs or
> push-pull outputs via the generic GPIOLIB framework.
>
> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
(...)
> Changes since v4:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please go ahead and merge to the i2c tree if you like.

Yours,
Linus Walleij
