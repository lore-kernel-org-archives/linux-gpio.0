From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] GPIO / ACPI: export acpi_gpiochip_request(free)_interrupts
 for module use
Date: Wed, 10 Jun 2015 15:30:21 +0200
Message-ID: <CACRpkdaYdKU6MhLGCN8RqY-aW-NrG74q8OptRr0xS6K6MQQo6Q@mail.gmail.com>
References: <1433927527-9980-1-git-send-email-hanjun.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33891 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933716AbbFJNaV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 09:30:21 -0400
Received: by oigz2 with SMTP id z2so32179636oig.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 06:30:21 -0700 (PDT)
In-Reply-To: <1433927527-9980-1-git-send-email-hanjun.guo@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hanjun Guo <hanjun.guo@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mark Brown <broonie@kernel.org>, Y Vo <yvo@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jun 10, 2015 at 11:12 AM, Hanjun Guo <hanjun.guo@linaro.org> wrote:

> acpi_gpiochip_request(free)_interrupts can be used for modules,
> so export them. This also fixs a compile error when xgene-sb
> configured as kernel module.
>
> Fixes: 733cf014f020 "gpio: xgene: add ACPI support for APM X-Gene GPIO standby driver"
> Signed-off-by: Hanjun Guo <hanjun.guo@linaro.org>

Patch applied.

Yours,
Linus Walleij
