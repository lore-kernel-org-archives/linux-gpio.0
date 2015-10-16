From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/5] gpiolib: provide generic request/free implementations
Date: Fri, 16 Oct 2015 22:11:48 +0200
Message-ID: <CACRpkdbDiDQWmyw6FmuKWWQV271vJG_+wxKU4yOjZUAnz3CwNg@mail.gmail.com>
References: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
	<1444577659-17621-2-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:35466 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753150AbbJPULt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 16:11:49 -0400
Received: by oiev17 with SMTP id v17so22875567oie.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 13:11:48 -0700 (PDT)
In-Reply-To: <1444577659-17621-2-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>

On Sun, Oct 11, 2015 at 5:34 PM, Jonas Gorski <jogo@openwrt.org> wrote:

> Provide generic request/free implementations that pinctrl aware gpio
> drivers can use instead of open coding if they use a 1:1 pin to gpio
> signal mapping.
>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
> RFC -> V2:
>  * renamed gpio to offset

Patch applied, thanks.

Yours,
Linus Walleij
