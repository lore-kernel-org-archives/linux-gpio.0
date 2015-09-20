From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH RFT 5/5] pinctrl: replace trivial implementations of gpio_chip request/free
Date: Sun, 20 Sep 2015 15:40:19 +0200
Message-ID: <2032053.ZmUYfKDm7S@ubix>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org> <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:34634 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbbITNkX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Sep 2015 09:40:23 -0400
Received: by wicfx3 with SMTP id fx3so114325435wic.1
        for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2015 06:40:22 -0700 (PDT)
In-Reply-To: <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@ch>

On Sunday, September 13, 2015 03:21:38 PM Jonas Gorski wrote:
> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
[...]
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++------------

For the Mediatek part:
Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
