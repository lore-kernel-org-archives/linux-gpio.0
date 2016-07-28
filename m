From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Pinctrl hogging
Date: Thu, 28 Jul 2016 18:12:58 +0200
Message-ID: <CACRpkdZxsdgMf+iAcMv1gC6p=JFg0dpZ=UW2TksKZhhOwA6G+A@mail.gmail.com>
References: <CAES_P+8mP6kOokwVcmtzyHsWRByJyaK=YynPa7vfYsvHD1k6Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35603 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759013AbcG1QM7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jul 2016 12:12:59 -0400
Received: by mail-oi0-f41.google.com with SMTP id l72so69834519oig.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2016 09:12:59 -0700 (PDT)
In-Reply-To: <CAES_P+8mP6kOokwVcmtzyHsWRByJyaK=YynPa7vfYsvHD1k6Bw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: noman pouigt <variksla@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jul 21, 2016 at 6:21 PM, noman pouigt <variksla@gmail.com> wrote:

> Is there any way to configure default settings for some of the gpios
> eventhough there is no one driving them?

There are gpio hogs but I don't remember which kernel we
introduced them in. Please keep in sync with upstream.
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/gpio/gpio.txt?id=6b516a1093006a39368dd11a5396be5bb00c99df

> I am also trying to configure
> some of the gpios as irq lines using just the device tree without
> writing any device driver for it as it will be used by userspace.

I don't recommend randomly using GPIO from userspace. Have you read:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/gpio/drivers-on-gpio.txt

If you still have a valid usecase for userspace GPIO, consider
getting the latest v4.8 kernel when it's out in some two months
and use the new chardev ABI that I just merged. The sysfs
ABI is not good, and that is why it has been obsolted.

We can name lines with gpio-line-names =""; in device tree and
there are example tools for how to use GPIOs from userspace
in a proper way:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/tools/gpio

> Just to workaround this problem I have created a dummy driver
> specifically for this purpose. Is there any better way?

Keeping in touch with upstream and driving changes upstream is
always the best solution.

Yours,
Linus Walleij
