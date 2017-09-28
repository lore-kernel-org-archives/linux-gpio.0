From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 4/4] gpio: pxa: Use library functions
Date: Thu, 28 Sep 2017 08:32:41 +0200
Message-ID: <87efqrbaeu.fsf@belgarion.home>
References: <20170922092243.7546-1-linus.walleij@linaro.org>
        <20170922092243.7546-4-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:60628 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750914AbdI1Gcq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2017 02:32:46 -0400
In-Reply-To: <20170922092243.7546-4-linus.walleij@linaro.org> (Linus Walleij's
        message of "Fri, 22 Sep 2017 11:22:43 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> These request/free functions are just reimplementations of the
> standard helpers in gpiolib. Delete them and replace with the
> helpers.
>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

FWIW, pxa platforms are now working again in upstream so I can test things for
you if you have a doubt on a patch serie.

Cheers.

--
Robert
