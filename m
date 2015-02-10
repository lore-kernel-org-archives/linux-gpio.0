From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v3 4/4] mdio-mux-gpio: use new gpiod_get_array and
 gpiod_put_array functions
Date: Tue, 10 Feb 2015 15:22:52 +0900
Message-ID: <CAAVeFu+KKdN=PuPKtau_kjKRO66m+b2XbgSF=W0hHBvtMzpkWw@mail.gmail.com>
References: <2799887.8ZynysBVJj@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:61228 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785AbbBJGXN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Feb 2015 01:23:13 -0500
In-Reply-To: <2799887.8ZynysBVJj@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, David Miller <davem@davemloft.net>, netdev <netdev@vger.kernel.org>

On Tue, Feb 10, 2015 at 2:07 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> Use the new gpiod_get_array and gpiod_put_array functions for obtaining and
> disposing of GPIO descriptors.
>
> Cc: David Miller <davem@davemloft.net>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>

I really like the way this looks. Could we have a Tested-by on this so
we can merge the whole series light-heartedly?
