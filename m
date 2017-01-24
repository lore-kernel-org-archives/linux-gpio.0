From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: How to ensure other module/driver is initialized?
Date: Tue, 24 Jan 2017 14:02:48 +0100
Message-ID: <CACRpkdYjUKimX+R0nZv5v+rhdUxAUtKv4pPu0dtGAYhEP1Ri7Q@mail.gmail.com>
References: <180b9075-7db0-1708-50f4-622333de2049@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:33254 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbdAXNCu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2017 08:02:50 -0500
Received: by mail-it0-f43.google.com with SMTP id d9so30189019itc.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2017 05:02:50 -0800 (PST)
In-Reply-To: <180b9075-7db0-1708-50f4-622333de2049@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ian Pilcher <arequipeno@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Dec 15, 2016 at 8:50 PM, Ian Pilcher <arequipeno@gmail.com> wrote:

> I maintain an out-of-tree kernel module that enables the front-panel
> LEDs on the Thecus N5550 NAS.
>
>   https://github.com/ipilcher/n5550/blob/master/modules/n5550_board.c

Generally I'm not very happy about boardfiles and such stuff being
maintained out-of-tree.

Is there work ongoing to:

(A) work upstream with this stuff
(B) convert the whole platform to use device tree

Because that is what is needed for long-term maintenance.

The file you point to corresponds to just a few lines of device tree
code. c.f. my recent submission of Gemini patches:
http://marc.info/?l=linux-arm-kernel&m=148508801709983&w=2

I know it is a bit up upfront work, but hey, it's fun.

> The drive activity LEDs are connected to GPIO pins on the ICH10R, so
> the gpio_ich driver must be loaded and initialized before my module is
> loaded.  Unfortunately, the "and initialized" part is giving me trouble
> after a recent CentOS kernel update.
>
> My modprobe configuration includes:
>
>   install n5550_board /sbin/modprobe gpio_ich; /sbin/modprobe i2c_i801;
>       /sbin/modprobe --ignore-install n5550_board
>
> But although the gpio_ich module does get loaded, it apparently hasn't
> finished initializing when my module is loaded.  The result looks like
> this:

I have no idea how modprobe works, but a SoC GPIO driver is often
such a critical component of a system (often provididing an irqchip
as well) that their Kconfig should be made bool and set to 'y' in the
config so it is compiled-in to the kernel.

Then any dependent modules can happily utilize it.

If this doesn't work, it should make use of deferred probe I guess?

Yours,
Linus Walleij
