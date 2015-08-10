From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] gpiolib-of: Reuse 'line-name' from DT as gpio
 descriptor name
Date: Mon, 10 Aug 2015 11:38:34 +0200
Message-ID: <CACRpkdY+jOxZY4_uvhQ75nKkoA2hJ7k=cv2OZwv4D86Jn4QnGw@mail.gmail.com>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
	<1438680203-13432-4-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:35769 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754172AbbHJJif (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2015 05:38:35 -0400
Received: by obbop1 with SMTP id op1so119919448obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2015 02:38:34 -0700 (PDT)
In-Reply-To: <1438680203-13432-4-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Aug 4, 2015 at 11:23 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> The DT describes gpios with subnodes. These subnodes can contain a
> property 'line-name'. This information can be useful in other areas
> where we want to identify a GPIO by its name.
>
> This patch stores the line-name in the gpio descriptor.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

This patch looks correct given the context works as intended.

Yours,
Linus Walleij
