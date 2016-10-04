From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 1/1] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Tue, 4 Oct 2016 14:13:26 +0200
Message-ID: <CACRpkdbQzigYvx61S__+=qW1+NWxDyxUyg-Tm0=8Sj42xy6EWg@mail.gmail.com>
References: <b77f588156e346037d7efda72f9ed1dc460b810a.1474670298.git.martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36546 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752242AbcJDMN1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2016 08:13:27 -0400
Received: by mail-oi0-f44.google.com with SMTP id m72so61773986oik.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2016 05:13:27 -0700 (PDT)
In-Reply-To: <b77f588156e346037d7efda72f9ed1dc460b810a.1474670298.git.martyn.welch@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>

On Sat, Sep 24, 2016 at 12:50 AM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:

> This patch adds support for the GPIO found on the CP2105.


> This device supports either push-pull or open-drain modes, it doesn't
> provide an explicit input mode, though the state of the GPIO can be read
> when used in open-drain mode. Like with pin use, the mode is configured in
> the one-time programable PROM and can't be changed at runtime.

I see.

So implement .direction_input() and .direction_output()
anyways.

Return failure on .direction_input() if it is in push-pull mode.

Return success on all .direction_output() calls.

Then implement .set_single_ended() and return success for open drain
if the is in open drain, success for push-pull if the line is in push-pull
mode, and failure in all other cases. Simple, but correct.

Add some comments to these functions so it is clear what is going on.

(...)
> +#ifdef CONFIG_GPIOLIB
> +static int cp210x_gpio_request(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct cp210x_serial_private *priv =
> +                       container_of(gc, struct cp210x_serial_private, gc);

Just:

struct cp210x_serial_private *priv = gpiochip_get_data(gc);

> +static int cp210x_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       return 0;
> +}

Aha no explicit input mode...

> +static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct cp210x_serial_private *priv =
> +                       container_of(gc, struct cp210x_serial_private, gc);

gpiochip_get_data

> +       struct usb_serial *serial = priv->serial;
> +       int result;
> +       u8 buf;
> +
> +       result = cp210x_read_vendor_block(serial, REQTYPE_INTERFACE_TO_HOST,
> +                                         CP210X_READ_LATCH, &buf, sizeof(buf));
> +       if (result < 0)
> +               return 0;

No just return the error code. We handle this nowadays.

> +
> +       return (buf >> gpio) & 0x1;

Do it like this:

return !!(buf & BIT(gpio));

> +static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
> +{
> +       struct cp210x_serial_private *priv =
> +                       container_of(gc, struct cp210x_serial_private, gc);

gpiochip_get_data()

(...)
+       result = gpiochip_add(&priv->gc);

Use devm_gpiochip_add_data(&serial->interface->dev, &priv->gc, gc);

And you get the pointer you need.

+void cp210x_shared_gpio_remove(struct usb_serial *serial)
+{
+       struct cp210x_serial_private *priv = usb_get_serial_data(serial);
+
+       if (priv->gc.label)
+               gpiochip_remove(&priv->gc);
+}

Should not be needed with the devm_* call above doing garbage collection.

Yours,
Linus Walleij
