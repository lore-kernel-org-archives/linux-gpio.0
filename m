From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V5 0/3] gpio: Add APM X-Gene SoC platform GPIO driver
Date: Sat, 28 Jun 2014 12:14:57 +0900
Message-ID: <CAAVeFuLZNr-bkXM-1S15tpz0da7pnppjNbJ6iOZ-6RzEDBZ_Jg@mail.gmail.com>
References: <1403823587-23404-1-git-send-email-fkan@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:43216 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752196AbaF1DPS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jun 2014 23:15:18 -0400
In-Reply-To: <1403823587-23404-1-git-send-email-fkan@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Feng Kan <fkan@apm.com>
Cc: patches <patches@apm.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Jun 27, 2014 at 7:59 AM, Feng Kan <fkan@apm.com> wrote:
> This patch add the GPIO controller in the APM X-Gene platform. The GPIO
> controller pins are muxed with the generic flash controller pins on the
> system.
>
> V5 Change:
>         1. Remove gpio->dev
>         2. Remove not needed headers.
>         3. Change to use latest driver.h for gpio.
>         4. Set chip base to -1
>         5. Put back label as it is needed sys interface.

Let's see what Linus has to say, but to me this iteration looks good!

The series,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
