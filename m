From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH][next] pinctrl: intel: ensure error return ret is
 initialized
Date: Mon, 4 Dec 2017 19:23:04 +0200
Message-ID: <20171204172304.GE22431@lahna.fi.intel.com>
References: <20171204170815.14779-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:52000 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751421AbdLDR3l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Dec 2017 12:29:41 -0500
Content-Disposition: inline
In-Reply-To: <20171204170815.14779-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 04, 2017 at 05:08:15PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the (unlikely) event that community->ngpps is zero, or if every
> gpp->gpio_base is less than zero, then an ininitialized value in
> ret is returned by function intel_gpio_add_pin_ranges. Fix this by
> ensuring ret is initialized to zero.  It's a moot point, but I think
> it is worthwhile ensuring this corner case is fixed.

I agree.

> Detected by CoverityScan, CID#1462415 ("Uninitialized scalar variable")
> 
> Fixes: a60eac3239f0 ("pinctrl: intel: Allow custom GPIO base for pad groups")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
