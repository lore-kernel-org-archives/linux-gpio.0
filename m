From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 112/182] pinctrl: samsung: use gpiochip data pointer
Date: Fri, 11 Dec 2015 15:14:10 +0900
Message-ID: <CA+Ln22HrFVwtMDRg4wC10EwESf+PixDa4-3eKsqnD4ELEGqSXQ@mail.gmail.com>
References: <1449667992-3104-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f42.google.com ([209.85.192.42]:34399 "EHLO
	mail-qg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753840AbbLKGOL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 01:14:11 -0500
Received: by qgeb1 with SMTP id b1so186495161qge.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 22:14:10 -0800 (PST)
In-Reply-To: <1449667992-3104-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

Hi Linus,

2015-12-09 22:33 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().

I always thought container_of() was preferred because of higher type
safety than void *data pointers. Is there any reason for mandating the
(IMHO worse) new method of accessing data, even though the one
currently used seems to be still valid?

Best regards,
Tomasz
