From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: cherryview: Add Setzer models to the
 Chromebook DMI quirk
Date: Wed, 26 Jul 2017 13:11:20 +0300
Message-ID: <20170726101120.GI2369@lahna.fi.intel.com>
References: <20170704125839.16093-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:33460 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750982AbdGZKPr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jul 2017 06:15:47 -0400
Content-Disposition: inline
In-Reply-To: <20170704125839.16093-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, mail@abhishek.geek.nz

On Tue, Jul 04, 2017 at 03:58:39PM +0300, Andy Shevchenko wrote:
> Add one more model to the Chromebook DMI quirk to make it working again.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> Fixes: 2a8209fa6823 ("pinctrl: cherryview: Extend the Chromebook DMI quirk to Intel_Strago systems")
> Reported-by: mail@abhishek.geek.nz
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
