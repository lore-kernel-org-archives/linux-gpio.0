From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add tps65218 gpio
Date: Thu, 11 Feb 2016 12:25:57 +0100
Message-ID: <CACRpkdZqZ946xQcnh_cmGgx4P4_ovSk7HQWuwnzZtJUzFw8n3Q@mail.gmail.com>
References: <1454173604-22334-1-git-send-email-nicolassaenzj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:34208 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751248AbcBKLZ6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 06:25:58 -0500
Received: by mail-ob0-f169.google.com with SMTP id wb13so69600958obb.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 03:25:58 -0800 (PST)
In-Reply-To: <1454173604-22334-1-git-send-email-nicolassaenzj@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Jan 30, 2016 at 6:06 PM, Nicolas Saenz Julienne
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
> only offers GPOs.
>
> v2: Added request routine that evaluates the fw config flags and removed module
>     owner
> v3: Added .direction_input() routine, and took care of all Linus Walleij
> suggestions (clamp to bool, use proper include)
>
> Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

OK nice! Patch applied.

Yours,
Linus Walleij
