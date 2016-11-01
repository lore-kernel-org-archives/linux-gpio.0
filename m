From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mxc: fix build error introduced by pin_ranges
Date: Tue, 1 Nov 2016 23:53:01 +0100
Message-ID: <CACRpkdbOCKi5qLfW2rWpy76UkbWap1G6KyxLvMthF=PwhP7=bg@mail.gmail.com>
References: <1477983808-14358-1-git-send-email-deepak_das@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:36338 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbcKAWxD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2016 18:53:03 -0400
Received: by mail-qt0-f173.google.com with SMTP id w33so62047976qtc.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Nov 2016 15:53:02 -0700 (PDT)
In-Reply-To: <1477983808-14358-1-git-send-email-deepak_das@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Deepak Das <deepak_das@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <Vladimir_Zapolskiy@mentor.com>

On Tue, Nov 1, 2016 at 8:03 AM, Deepak Das <deepak_das@mentor.com> wrote:

> 'commit 964a7e51240df ("gpio: mxc: Shift
> generic request/free after gpiochip registration")'
> introduced a build error because pin_ranges now moved to
> struct gpio_device.
>
> This commit fixes this build error by dereferencing gpio_device
> inside struct gpio_chip for pin_ranges.
>
> Signed-off-by: Deepak Das <deepak_das@mentor.com>

NAK and I backed out the patch causing this.

> +#include "gpiolib.h"

Nothing should dereference the gpiolib internals, that is pretty clear
from the way it is split out of the public headers.

We need to go back to the first patch and look things over,

Yours,
Linus Walleij
