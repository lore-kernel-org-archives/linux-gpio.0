From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 3/5] gpio: gpio-xz: use the generic request/free implementations
Date: Fri, 16 Oct 2015 22:16:15 +0200
Message-ID: <CACRpkdZ+vretrO7mtZzxzRPC1Bobdp8Ou+Sm3TcmuVQOho7mAg@mail.gmail.com>
References: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
	<1444577659-17621-4-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36727 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753504AbbJPUQQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 16:16:16 -0400
Received: by oiao187 with SMTP id o187so13343354oia.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 13:16:16 -0700 (PDT)
In-Reply-To: <1444577659-17621-4-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>

On Sun, Oct 11, 2015 at 5:34 PM, Jonas Gorski <jogo@openwrt.org> wrote:

> Instead of storing in the chip data whether the chip uses pinctrl and
> conditionally call pinctrl_{request,free}_gpio, just don't populate
> request/free in that case.
>
> This makes the implementations trivial and the same as the generic
> implementations, thus we can just use them.
>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>

Patch applied.

Yours,
Linus Walleij
