From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] pinctrl: always include all subdirectories in build
Date: Sun, 11 Oct 2015 21:57:25 +0530
Message-ID: <20151011162725.GC5386@linux>
References: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:36317 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751168AbbJKQ13 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Oct 2015 12:27:29 -0400
Received: by pablk4 with SMTP id lk4so132076677pab.3
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2015 09:27:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Viresh Kumar <vireshk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Tony Prisk <linux@prisktech.co.nz>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonbo>

On 11-10-15, 17:40, Jonas Gorski wrote:
> All pinctrl drivers in subdirectories are properly guarded by individual
> configuration symbols, so there is no need to limit the directories to
> the belonging machines.
> 
> This allows wider COMPILE_TEST coverage on "foreign" targets.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  drivers/pinctrl/Makefile | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 

For SPEAr:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
