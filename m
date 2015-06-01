From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpiolib: debugfs: show linux irq number for gpios
 requested as irq
Date: Mon, 1 Jun 2015 14:51:20 +0200
Message-ID: <CACRpkdYMRByQ8Xb6FK3DTcLsN5HiqE+WcP1RDsUc8_2_db1KkA@mail.gmail.com>
References: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
	<1432117823-1834-3-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33265 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751800AbbFAMvU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 08:51:20 -0400
Received: by obbnx5 with SMTP id nx5so102013226obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 05:51:20 -0700 (PDT)
In-Reply-To: <1432117823-1834-3-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On Wed, May 20, 2015 at 12:30 PM, Grygorii Strashko
<grygorii.strashko@linaro.org> wrote:

> This patch updates GPIO debugfs code to show Linux IRQ number
> for GPIOs requested as irq.
>
> After this patch sys/kernel/debug/gpio will produce following output:
>     ...
>     GPIOs 160-191, platform/4805d000.gpio, gpio:
>      gpio-171 ((null)              ) in  hi IRQ-209
>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>

Patch applied.

Yours,
Linus Walleij
