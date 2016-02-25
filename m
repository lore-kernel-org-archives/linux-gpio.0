From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFD] does abi of sysfs of gpio change?
Date: Thu, 25 Feb 2016 16:12:03 +0100
Message-ID: <CACRpkdYeDBkpfQrQDiLV_NLGaHYPzfO6DrBJLAp__sQHQGcFBw@mail.gmail.com>
References: <CAFy1UST8fzsM6tq4_yAZ1XbPyaMg4a0kBm5-_8r0E8NpgwGYag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:32880 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932951AbcBYPMF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 10:12:05 -0500
Received: by mail-ob0-f171.google.com with SMTP id jq7so50441627obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 07:12:04 -0800 (PST)
In-Reply-To: <CAFy1UST8fzsM6tq4_yAZ1XbPyaMg4a0kBm5-_8r0E8NpgwGYag@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Markus Pargmann <mpa@pengutronix.de>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Feb 24, 2016 at 3:35 PM, Bamvor Zhang Jian
<bamvor.zhangjian@linaro.org> wrote:

> I am working on writing a gpio mockup driver(for test the gpio framework).
> I found that in the lastest for-next branch of linux-gpio, the path of gpiochip
> in device directory is changed from
> `/sys/devices/platform/gpio-mockup/gpio/gpiochip*`
> to
> `/sys/devices/platform/gpio-mockup/gpiochip*/gpio`.
(...)
> IIUC, this change may break the script which depend on it.
> Is it intended to do it?

No, I screwed up :(

> From be7699ddea0fd0e2b0712cc8f50318595cad553c Mon Sep 17 00:00:00 2001
> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
> Date: Wed, 24 Feb 2016 22:17:19 +0800
> Subject: [PATCH] fix abi changes of sysfs

It was impossible to extract this patch because of some
HTML formatting, but I rewrote the patch, adding some extra
comments and commit message, and applied. Check the result
in my devel branch.

I also have a bad conscience for not looking at you patches,
I've been swamped, sorry :(

Yours,
Linus Walleij
