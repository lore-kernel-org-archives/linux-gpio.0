From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add tps65218 gpio driver
Date: Fri, 16 Oct 2015 22:26:16 +0200
Message-ID: <CACRpkdbmw4TKxs+nozBmONmrBNTW1ETnyX83WPRAUyOGHxy3Bg@mail.gmail.com>
References: <1444581663-31066-1-git-send-email-nicolassaenzj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:35322 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753004AbbJPU0R (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 16:26:17 -0400
Received: by obbzf10 with SMTP id zf10so99563643obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 13:26:16 -0700 (PDT)
In-Reply-To: <1444581663-31066-1-git-send-email-nicolassaenzj@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Oct 11, 2015 at 6:41 PM, Nicolas Saenz Julienne
<nicolassaenzj@gmail.com> wrote:

> Driver for the GPIO block found in ti's tps65218 pmics.
>
> The device has two GPIOs and one GPO pin which can be configured as follows:
> GPIO1:
>         -general-purpose, open-drain output controlled by GPO1 user bit and/or
>          sequencer
>         -DDR3 reset input signal from SOC. Signal is either latched or
>          passed-trough to GPO2 pin. See below for details.
> GPO2:
>         -general-purpose output controlled by GPO2 user bit
>         -DDR3 reset output signal. Signal is controlled by GPIO1 and PGOOD.
>          See below for details.
>         -Output buffer can be configured as open-drain or push-pull.
> GPIO3:
>         -general-purpose, open-drain output controlled by GPO3 user bit and/or
>          sequencer
>         -reset input-signal for DCDC1 and DCDC2.
>
> The input configurations are not meant to be used by the user so the driver
> only offers GPOs. Also GPO2 is set-up as open drain by default.
>
> Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

It seems we are currently seeing an influx of drivers that can selectively
enable open drain on some pins. Can you please look at the
patches submitted by Laurent Pinchart for this so we get a
generic solution that works for everyone.

It's important that consumers can request open drain from
descriptor tables or device trees and that the driver says "no"
if this can not be satisfied.

Yours,
Linus Walleij
