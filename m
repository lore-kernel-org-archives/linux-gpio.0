From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: move pincontrol calls to <linux/gpio/driver.h>
Date: Wed, 18 Mar 2015 10:29:50 +0900
Message-ID: <CAAVeFuLxQZYQOWB41jhL7=L_JvGAiAySV9-jXTu1x8u+U5yDag@mail.gmail.com>
References: <1426640683-22185-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:36579 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752963AbbCRBaL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 21:30:11 -0400
Received: by igbue6 with SMTP id ue6so88026553igb.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 18:30:10 -0700 (PDT)
In-Reply-To: <1426640683-22185-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Mar 18, 2015 at 10:04 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> These functions do not belong in <asm-generic/gpio.h> since the
> split into separate GPIO headers under <linux/gpio/*>. Move them
> to <linux/gpio/driver.h> as is apropriate.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
