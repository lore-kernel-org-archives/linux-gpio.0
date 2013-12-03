From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCHv4] ARM: tegra: add gpiod_lookup table for paz00
Date: Tue, 3 Dec 2013 15:10:36 +0200
Message-ID: <20131203131036.GP2281@intel.com>
References: <1385460350-17543-2-git-send-email-mika.westerberg@linux.intel.com>
 <1386074998-17833-1-git-send-email-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:48127 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752485Ab3LCNEA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 3 Dec 2013 08:04:00 -0500
Content-Disposition: inline
In-Reply-To: <1386074998-17833-1-git-send-email-heikki.krogerus@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Chris Ball <cjb@laptop.org>, Johannes Berg <johannes@sipsolutions.net>, Rhyland Klein <rklein@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, Alexandre Courbot <acourbot@nvidia.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

On Tue, Dec 03, 2013 at 02:49:58PM +0200, Heikki Krogerus wrote:
> This makes it possible to request the gpio descriptors in
> rfkill_gpio driver regardless of the platform.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  arch/arm/mach-tegra/board-paz00.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> Changes since v3:
> -----------------
> Rebased on top of Alexandre's patch "gpio: better lookup method for
> platform GPIOs".

Thanks Heikki.

Linus, are you OK with picking patches 2-6 from this series and replacing
patch 1 with this v4 from Heikki or should I resend the whole series?
