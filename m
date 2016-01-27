From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: imx: implement gpio_disable_free for Vybrid
Date: Wed, 27 Jan 2016 15:04:56 +0100
Message-ID: <CACRpkdZ0oneKhFmug9k+zGP2Y0dncwHTEoQ35-ccQ=3MqQzSqw@mail.gmail.com>
References: <1452279030-5459-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:33807 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754261AbcA0OE5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 09:04:57 -0500
Received: by mail-ob0-f175.google.com with SMTP id vt7so7694918obb.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 06:04:56 -0800 (PST)
In-Reply-To: <1452279030-5459-1-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Adrian Alonso <aalonso@freescale.com>, Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 8, 2016 at 7:50 PM, Stefan Agner <stefan@agner.ch> wrote:

> The Freescale Vybrid SoC has GPIO capabilities as part of the
> IOMUXC. To enable GPIO's, the gpio_request_enable callback has
> been implemented, however the corsponding gpio_disable_free
> callback is missing. So far, disabling (unexporting) a GPIO left
> the pin in its last state.
>
> Implement a proper gpio_disable_free function which clears the
> three enable bits which influence the state (IBE, OBE and PUE).
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Patch applied.

Yours,
Linus Walleij
