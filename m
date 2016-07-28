From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: pca954x: Add optional regulator enable.
Date: Thu, 28 Jul 2016 10:46:23 +0200
Message-ID: <CACRpkdZ6R+YX_V25t9esEj=VyzxhuHiPDz53tO4AMSEJ+GOXng@mail.gmail.com>
References: <1469693621-17851-1-git-send-email-preid@electromag.com.au> <1469693621-17851-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34589 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754AbcG1IqY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jul 2016 04:46:24 -0400
Received: by mail-oi0-f41.google.com with SMTP id l65so53695693oib.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2016 01:46:24 -0700 (PDT)
In-Reply-To: <1469693621-17851-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@linaro.org>

On Thu, Jul 28, 2016 at 10:13 AM, Phil Reid <preid@electromag.com.au> wrote:

> Some i2c gpio devices are connected to a switchale power supply
> which needs to be enabled prior to probing the device. This patch
> allows the drive to enable the devices vcc regulator prior to probing.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Overall good, I would change the subject to just
"add a regulator" and not use _get_optional.

The regulators should be added to *all* devices
that have VDD/VDDIO etc lines. Whether the platform will
supply them with a real backing regulator or just use a
dummy or even stubs (of CONFIG_REGULATOR) is not
set) is no concern of the individual driver.

Just grab them and handle the errors, like you do.

> +       reg = devm_regulator_get_optional(&client->dev, "vcc");

So use devm_regulator_get()

> +       if (IS_ERR(reg)) {
> +               ret = PTR_ERR(reg);
> +               if (ret != -ENODEV) {
> +                       if (ret != -EPROBE_DEFER)
> +                               dev_err(&client->dev, "reg get err: %d\n", ret);
> +                       return ret;
> +               }

Just bail out if IS_ERR(), one of the possible errors would
be deferral but -ENODEV need no special handling.

> +       } else {
> +               ret = regulator_enable(reg);
> +               if (ret) {
> +                       dev_err(&client->dev, "reg en err: %d\n", ret);
> +                       return ret;
> +               }
> +       }

Then just de-indent the else clause. We should always get
something that we can call regulator_enable() on, even if it
is a dummy or a stub.

There is another problem: you do not call regulator_disable()
anywhere. Call it in the remove() function, and on the error path
in probe following this call, possibly with a goto-try/catch
construction.

Yours,
Linus Walleij
