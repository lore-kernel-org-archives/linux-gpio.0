From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: always include all subdirectories in build
Date: Mon, 12 Oct 2015 13:55:09 +0300
Message-ID: <20151012105509.GZ1506@lahna.fi.intel.com>
References: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:48215 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751346AbbJLKzR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 12 Oct 2015 06:55:17 -0400
Content-Disposition: inline
In-Reply-To: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Viresh Kumar <vireshk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Tony Prisk <linux@prisktech.co.nz>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionex>

On Sun, Oct 11, 2015 at 05:40:44PM +0200, Jonas Gorski wrote:
> All pinctrl drivers in subdirectories are properly guarded by individual
> configuration symbols, so there is no need to limit the directories to
> the belonging machines.
> 
> This allows wider COMPILE_TEST coverage on "foreign" targets.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>

...

> +obj-y				+= intel/

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
