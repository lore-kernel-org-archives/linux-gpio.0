From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH RFT 5/5] pinctrl: replace trivial implementations of
 gpio_chip request/free
Date: Wed, 16 Sep 2015 14:07:13 +0300
Message-ID: <20150916110713.GL11632@tarshish>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
 <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:51866 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753754AbbIPLHU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 16 Sep 2015 07:07:20 -0400
Content-Disposition: inline
In-Reply-To: <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>Andrew Bresticker <ab>

Hi Jonas,

On Sun, Sep 13, 2015 at 03:21:38PM +0200, Jonas Gorski wrote:
> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---

[...]

>  drivers/pinctrl/pinctrl-digicolor.c           | 14 ++------------

For Digicolor:

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
