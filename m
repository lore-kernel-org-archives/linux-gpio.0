From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH][v2] mdio-mux-gpio: Use GPIO descriptor interface and new
 gpiod_set_array function
Date: Fri, 28 Nov 2014 14:48:43 +0100
Message-ID: <CACRpkdZx9KJzZ7fbQBUUDonzqPT-6qbOr8U7eccLpnFAKMeGmg@mail.gmail.com>
References: <2814617.OrXEO01vgP@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:40527 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751163AbaK1Nso (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Nov 2014 08:48:44 -0500
Received: by mail-ie0-f173.google.com with SMTP id y20so6073927ier.18
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2014 05:48:44 -0800 (PST)
In-Reply-To: <2814617.OrXEO01vgP@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, David Daney <david.daney@cavium.com>

On Tue, Nov 25, 2014 at 10:31 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:

> Convert mdio-mux-gpio to the GPIO descriptor interface and use the new
> gpiod_set_array function to set all output signals simultaneously.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> Acked-by: David S. Miller <davem@davemloft.net>

Patch applied.

Yours,
Linus Walleij
