From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2 0/3] gpiolib: debugfs: update to show more info for
 gpios requested as irq
Date: Thu, 21 May 2015 13:02:30 +0900
Message-ID: <CAAVeFuJ20AYEOWG04Nszt+2FF=Uz-ugMyrbWYPjpoPzveVgstw@mail.gmail.com>
References: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:36088 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750729AbbEUECv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 21 May 2015 00:02:51 -0400
In-Reply-To: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On Wed, May 20, 2015 at 7:30 PM, Grygorii Strashko
<grygorii.strashko@linaro.org> wrote:
> This series updates gpiolib debugfs code to show more information about
> GPIOs requested as IRQ.
>
> First patch ensures that information about GPIOs requested as IRQ only
> will be provided through GPIO debugfs.
>
> Other two patches extend information for GPIOs requested as IRQ
> - show Linux irq number
> - show marker '<irq-only>' for GPIOs requested as IRQ only
>
> After this series sys/kernel/debug/gpio will produce following output:
>   ...
>  GPIOs 160-191, platform/4805d000.gpio, gpio:
>   gpio-171 ((null)              ) in  hi IRQ-209 <irq-only>
>  ^^^ GPIO requested as IRQ only and its Linux IRQ number is 209
>   gpio-172 (xxyy              ) in  hi IRQ-210
>  ^^^ GPIO requested as IRQ and as GPIO and its Linux IRQ number is 209
>
>  GPIOs 192-223, platform/48051000.gpio, gpio:
>   gpio-203 (vtt_fixed           ) out hi
>  ^^^ GPIO requested as GPIO only
>
> Changes in v2:
> - split original patch on three patcehs
> - apply comments from Linus and Johan

This looks like useful information indeed.

The series,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
