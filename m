From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Right amount of info in the DT
Date: Wed, 31 May 2017 02:24:05 +0200
Message-ID: <CACRpkdaKHf+OZJCv-nCuihakv9Vcg=rN-NwGwk4N+FeEWDm9mg@mail.gmail.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com> <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com> <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
 <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com> <CACRpkdbB9kUaRbm-=1c_kzZ9p2ghh==HNb-8vkGkF3Zrx0rr_Q@mail.gmail.com>
 <42ae4b79-9917-3f9d-8962-d09fbe8c9b1c@sigmadesigns.com> <CACRpkdZg--owpSdpyGUzHKNDS+Wk9juvobGiCNt4vsMEytNPaQ@mail.gmail.com>
 <526a19bc-932a-3f84-eaf7-03c0b67bae2f@sigmadesigns.com> <CACRpkdY8Lfum4ahKrmvbtNDn9JZeZ1xi0eAsXdF9-8h4+VKaRA@mail.gmail.com>
 <64acfa45-b9ac-450a-96e5-a28c96790ff3@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:34963 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750925AbdEaAYH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 20:24:07 -0400
Received: by mail-it0-f51.google.com with SMTP id f72so5084005ite.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2017 17:24:07 -0700 (PDT)
In-Reply-To: <64acfa45-b9ac-450a-96e5-a28c96790ff3@sigmadesigns.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Cc: Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>

On Tue, May 30, 2017 at 3:59 PM, Yves Lefloch
<YvesMarie_Lefloch@sigmadesigns.com> wrote:

> I've put together a draft to try and solve this problem using approach (A).
> Each IP node gets a GPIO child node, since this is what the hardware looks like,
> and they are all tied together using phandles to a central pin controller node.

I like the looks of this!

> The draft only demonstrates the solution for the pins dedicated to GPIO,
> namely `gpio_sys', and for the smartcard pins, namely `gpio_smcard'.

It is elegant and it will scale.

> As before, bindings are not yet commented.
>
> BTW, I'm sure there is a far better way than this `all_pins' array, let me know
> if you have feedback on that.

So that is this:

> +static const unsigned int all_pins[] = {
> +       0,  1,  2,  3,  4,  5,  6,  7,  8,  9,
> +       10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
> +       20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
> +       30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
> +       40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
> +       50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
> +       60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
> +       70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
> +       80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
> +       90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
> +};

That looks a bit like what we usually put in pin descriptors.

(...)

This:

> +       struct pinctrl_gpio_range *prange;
> +
(...)
> +       prange->name = group->label;
> +       prange->id = group->base;
> +       prange->base = group->base;
> +       prange->pin_base = group->base;
> +       prange->npins = group->ngpio;
> +       prange->gc = gchip;
> +       pinctrl_add_gpio_range(pindev, prange);

Can't you just add that to the device tree using the gpio-ranges
property? It is handled in the core and should "just work".

The documentation for that is a bit terse in
Documentation/devicetree/bindings/gpio/gpio.txt
but if you just grep for gpio-ranges you will get the hang of it.

It is handled from the gpiochip side which is advisible, even if
you hardcode it in the driver.

Yours,
Linus Walleij
