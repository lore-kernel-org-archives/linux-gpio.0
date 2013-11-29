From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] gpio: better lookup method for platform GPIOs
Date: Fri, 29 Nov 2013 13:59:20 +0200
Message-ID: <20131129115920.GC3942@xps8300>
References: <1385628388-23827-1-git-send-email-acourbot@nvidia.com>
 <20131129115748.GB3942@xps8300>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:46114 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753168Ab3K2L7Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 06:59:24 -0500
Content-Disposition: inline
In-Reply-To: <20131129115748.GB3942@xps8300>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rhyland Klein <rklein@nvidia.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 29, 2013 at 01:57:48PM +0200, Heikki Krogerus wrote:
> > -	gpiod_add_table(gpios_table, ARRAY_SIZE(gpios_table));
> > +	gpiod_add_lookup_table(&gpios_table);
> 
> Remove "&" from the above.

Sorry, ignore that :).

-- 
heikki
