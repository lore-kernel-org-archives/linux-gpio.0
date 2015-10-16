From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 5/5] pinctrl: replace trivial implementations of
 gpio_chip request/free
Date: Fri, 16 Oct 2015 22:20:04 +0200
Message-ID: <CACRpkdZvFeb40CQdcXLZi3pEX3hRdadTtB=LaqU4Ws3LrLpaMA@mail.gmail.com>
References: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
	<1444577659-17621-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33965 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753004AbbJPUUF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 16:20:05 -0400
Received: by oies66 with SMTP id s66so30831446oie.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 13:20:04 -0700 (PDT)
In-Reply-To: <1444577659-17621-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>

On Sun, Oct 11, 2015 at 5:34 PM, Jonas Gorski <jogo@openwrt.org> wrote:

> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Eric Anholt <eric@anholt.net>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Andrew Bresticker <abrestic@chromium.org>
> Acked-by: Baruch Siach <baruch@tkos.co.il>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Lee Jones <lee@kernel.org>
> Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

Patch applied, also added Maxime's ACK.

Now I hope this does not collide with pinctrl in linux-next.

Yours,
Linus Walleij
