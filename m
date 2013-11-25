From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpiolib: add missing declarations
Date: Mon, 25 Nov 2013 10:58:31 +0200
Message-ID: <20131125085831.GO2281@intel.com>
References: <1385186069-28986-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:22300 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753989Ab3KYIwP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 25 Nov 2013 03:52:15 -0500
Content-Disposition: inline
In-Reply-To: <1385186069-28986-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Nov 23, 2013 at 02:54:29PM +0900, Alexandre Courbot wrote:
> Add missing declarations and include files to avoid warnings during
> compilation of include/gpio/driver.h.

It would be good to have those warnings included in the changelog as well.

> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reported-by: Stephen Warren <swarren@wwwdotorg.org>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
