From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC/RFT 1/2] gpio: allow atomic registration of gpio chip
 with pin ranges
Date: Fri, 16 Oct 2015 23:10:09 +0200
Message-ID: <CACRpkdYjD0VzGOERf+4v7K5PRphpGYT6i+1EQVeixvLYDqGsUw@mail.gmail.com>
References: <1444578499-17980-1-git-send-email-jogo@openwrt.org>
	<1444578499-17980-2-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36379 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752180AbbJPVKK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 17:10:10 -0400
Received: by oiao187 with SMTP id o187so14039012oia.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 14:10:09 -0700 (PDT)
In-Reply-To: <1444578499-17980-2-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>

On Sun, Oct 11, 2015 at 5:48 PM, Jonas Gorski <jogo@openwrt.org> wrote:

> Allow registering gpio chip with ranges at the same time, so we know
> at registration time whether there is an associated pin controller.
>
> This allows us to automatically populate the request/free callbacks,
> so that drivers are free to omit the assignment, if they do not need
> any special handling.
>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>

I think this looks elegant. I guess this will work nicely for pl061
where we just set the range from DT?

Yours,
Linus Walleij
