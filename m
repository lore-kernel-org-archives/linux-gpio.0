From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH V2 2/5] gpio: replace trivial implementations of request/free with generic one
Date: Mon, 12 Oct 2015 15:08:04 +0200
Message-ID: <87egh06xqj.fsf@free-electrons.com>
References: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
	<1444577659-17621-3-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:38107 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751426AbbJLNIG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2015 09:08:06 -0400
In-Reply-To: <1444577659-17621-3-git-send-email-jogo@openwrt.org> (Jonas
	Gorski's message of "Sun, 11 Oct 2015 17:34:16 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Sriniv

Hi Jonas,
 
 On dim., oct. 11 2015, Jonas Gorski <jogo@openwrt.org> wrote:

> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: James Hogan <james.hogan@imgtec.com>
> Acked-by: Stefan Agner <stefan@agner.ch>
> Acked-by: Joachim Eastwood <manabian@gmail.com>
> ---
>  drivers/gpio/gpio-lpc18xx.c    | 14 ++------------
>  drivers/gpio/gpio-moxart.c     | 14 ++------------
>  drivers/gpio/gpio-mvebu.c      | 14 ++------------

For mvebu:

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
