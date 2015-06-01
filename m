From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Mon, 1 Jun 2015 12:23:48 +0300
Message-ID: <20150601092348.GK1747@lahna.fi.intel.com>
References: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:52787 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751384AbbFAJXw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 1 Jun 2015 05:23:52 -0400
Content-Disposition: inline
In-Reply-To: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 22, 2015 at 10:56:08AM +0300, Mika Westerberg wrote:
> BIOS/platform may use some of the pins by themselves, such as providing SCI
> (System Control Interrupt) from the embedded controller. The driver masks
> all interrupts at probe time which prevents those pins from triggering
> interrupts properly.
> 
> Fix this by not masking all interrupts at probe -- it should be enough just
> to clear the status register.
> 
> Reported-by: Yu C Chen <yu.c.chen@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Please ignore this patch for now. It turned out to be causing spurious
interrupts on another platform.

I'll need to rethink how to fix the reported issue.
