From: Harini Katakam <harinikatakamlinux@gmail.com>
Subject: Re: [PATCH 5/5] gpio: zynq: use container_of() to get state container
Date: Fri, 28 Aug 2015 11:12:34 +0530
Message-ID: <CAFcVECJVt2rVLXPRoCtpZjaDuZaw1ZPqKHYVdBQN6wWrxn2adA@mail.gmail.com>
References: <1440687417-17227-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33716 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbbH1Fmg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2015 01:42:36 -0400
Received: by lbbsx3 with SMTP id sx3so23997095lbb.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2015 22:42:34 -0700 (PDT)
In-Reply-To: <1440687417-17227-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Harini Katakam <harini.katakam@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>, Ezra Savard <ezra.savard@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Alexandre Courbot <acourbot@nvidia.com>

On Thu, Aug 27, 2015 at 8:26 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The state container of the Zynq GPIO driver is sometimes
> extracted from the gpio_chip exploiting the fact that offsetof()
> the struct gpio_chip inside the struct zynq_gpio is 0, so
> the container_of() is in practice a noop. However if a member
> is added to struct zynq_gpio in front of struct gpio_chip,
> things will break. Using proper container_of() avoids this
> problem.
>
> Semantically this is a noop, the compiler will optimize it away,
> but syntactically it makes me happier.
>
> Also replace some explicit container_of() calls with the helper
> function.
>
> Cc: Harini Katakam <harini.katakam@xilinx.com>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Ezra Savard <ezra.savard@xilinx.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Harini Katakam <harinik@xilinx.com>

Thanks!

Regards,
Harini
