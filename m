From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 0/3] pinctrl: cherryview: fixes and enhancements
Date: Mon, 13 Jun 2016 12:21:22 +0300
Message-ID: <20160613092122.GE1791@lahna.fi.intel.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1465561416-29732-1-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:35898 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964807AbcFMJV1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 13 Jun 2016 05:21:27 -0400
Content-Disposition: inline
In-Reply-To: <1465561416-29732-1-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: linus.walleij@linaro.org, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org

On Fri, Jun 10, 2016 at 01:23:33PM +0100, Dan O'Donovan wrote:
> This series includes a number of fixes and enhancements for the
> Cherryview pinctrl/gpio driver, developed during integration on the
> UP Board (based on the Intel X5-Z8350 "Cherry Trail" Atom SoC).
> 
> Patch 1 provides a workaround for a documented silicon bug which
> causes data corruption of concurrent accesses to the GPIO controller
> registers on this SoC.
> 
> The other patches implement additional pin config functions/options
> for this driver.
> 
> Changes since v1:
>  * Addressed review comments from Mika Westerberg:
>    - Drop clean-up of checkpatch warnings (impacts back-porting)
>    - Re-order series to put fixes ahead of enhancements
>    - Rename a variable
>    - Tag concurrency fix (patch 1) for stable
>    - Drop fix restoring PADCTRL1 bits when GPIO disabled (rejected)
> 
> Dan O'Donovan (3):
>   pinctrl: cherryview: prevent concurrent access to GPIO controllers
>   pinctrl: cherryview: add option to set open-drain pin config
>   pinctrl: cherryview: add handlers for pin_config_group_get/set

Looks good to me now, thanks.

For the whole series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
