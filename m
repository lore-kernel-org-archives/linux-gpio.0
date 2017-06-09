From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Right amount of info in the DT
Date: Fri, 9 Jun 2017 10:14:52 +0200
Message-ID: <CACRpkda-ZMMR5WbgVF-BXx1HiYY8VrkLN1QC64fvY4xS4zNUJA@mail.gmail.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com> <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com> <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
 <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com> <CACRpkdbB9kUaRbm-=1c_kzZ9p2ghh==HNb-8vkGkF3Zrx0rr_Q@mail.gmail.com>
 <42ae4b79-9917-3f9d-8962-d09fbe8c9b1c@sigmadesigns.com> <CACRpkdZg--owpSdpyGUzHKNDS+Wk9juvobGiCNt4vsMEytNPaQ@mail.gmail.com>
 <526a19bc-932a-3f84-eaf7-03c0b67bae2f@sigmadesigns.com> <CACRpkdY8Lfum4ahKrmvbtNDn9JZeZ1xi0eAsXdF9-8h4+VKaRA@mail.gmail.com>
 <64acfa45-b9ac-450a-96e5-a28c96790ff3@sigmadesigns.com> <CACRpkdaKHf+OZJCv-nCuihakv9Vcg=rN-NwGwk4N+FeEWDm9mg@mail.gmail.com>
 <d6ac5fea-5324-7321-744f-6b248ac7320c@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:33496 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751639AbdFIIOy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 04:14:54 -0400
Received: by mail-io0-f177.google.com with SMTP id t87so10373691ioe.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 01:14:53 -0700 (PDT)
In-Reply-To: <d6ac5fea-5324-7321-744f-6b248ac7320c@sigmadesigns.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Cc: Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>

On Wed, May 31, 2017 at 6:36 PM, Yves Lefloch
<YvesMarie_Lefloch@sigmadesigns.com> wrote:

> I tried to carry on and add the other IPs' pins, and I've got a question
> regarding pin requesting.
> See, adding the smartcard's pins was easy because we don't have a driver for
> it yet, so the pins are just straightforward GPIOs, which the user-space can
> request using /sys/class/gpio/export.

Please do not use sysfs for userspace tests, familiarize yourself with
tools/gpio in the kernel and use these for testing using the ioctl()s.

> But that's not the case for the ethernet device, whose pins are already in
> use, although not requested explicitly by its driver
> (drivers/net/ethernet/aurora/nb8800.c). Which means user-space can also
> request/set them within the sysfs, and that is wrong.

It is common that a device allows simultaneous use of a pin for
GPIO and a certain device. (E.g. so that GPIO can "spy" on the pin
or similar.)

If on a certain system, this is not allowed, one shall set
.strict = true on the struct pinmux_ops, see
include/linux/pinctrl/pinmux.h

> - Is there a mechanism in the device tree to automatically request some pins
> for a driver once it gets loaded? I have looked at the `stateN_nodeM' thing
> in the documentation, but that doesn't seem to do the job without changes in
> the ethernet driver's code.

Yes those are called pin control hogs. Then the pins get associated with the
pin controller itself. Try first to associate the pins with the device actually
using them if possible.

> - Should the pins be declared at all if we know they are not going to be used
> for anything else than, for instance, ethernet? What about some removable
> device then, for instance UART as Thibaud pointed out previously?

I guess it depends on how much control of things you need in your system.

Also you might not need it now, but later on it turns out that in order to
properly deal with things like suspend/resume, you all of a sudden need
to switch pin control states when going to sleep and then it is nice if
the driver can handle these pins.

When in doubt, implement a driver for everything you have hardware
registers for, anything that is software controlled, I guess.

Yours,
Linus Walleij
