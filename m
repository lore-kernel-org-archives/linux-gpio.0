From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] pinctrl: bcm2835: fix build warning in
 bcm2835_gpio_irq_handle_bank
Date: Wed, 20 Sep 2017 09:08:46 +0200
Message-ID: <07247a0f-f933-3655-4469-6090fe91f8b5@i2se.com>
References: <20170919190456.26522-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:61050 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751000AbdITHJY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2017 03:09:24 -0400
In-Reply-To: <20170919190456.26522-1-clabbe.montjoie@gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>, linus.walleij@linaro.org, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, eric@anholt.net
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


Am 19.09.2017 um 21:04 schrieb Corentin Labbe:
> This patch fix the following build warning:
> drivers/pinctrl/bcm/pinctrl-bcm2835.c:376:15: warning: variable 'type' set but not used [-Wunused-but-set-variable]
>
> Furthermore, it is unused for a long time, at least since commit 85ae9e512f43 ("pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP")
> where a "FIXME no clue why the code looks up the type here" was added.
> A year after, nobody answeered this question, so its time to remove it.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
