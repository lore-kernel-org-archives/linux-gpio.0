From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH RFT 5/5] pinctrl: replace trivial implementations of
 gpio_chip request/free
Date: Mon, 14 Sep 2015 17:41:38 +0300
Message-ID: <20150914144138.GC1525@lahna.fi.intel.com>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
 <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:11148 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751496AbbINOls (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 14 Sep 2015 10:41:48 -0400
Content-Disposition: inline
In-Reply-To: <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.o>

On Sun, Sep 13, 2015 at 03:21:38PM +0200, Jonas Gorski wrote:
[..]
>  drivers/pinctrl/intel/pinctrl-cherryview.c    | 14 ++------------
>  drivers/pinctrl/intel/pinctrl-intel.c         | 14 ++------------

For the above two:

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
