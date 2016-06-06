From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/5] pinctrl: cherryview: add option to set open-drain
 pin config
Date: Mon, 6 Jun 2016 13:32:27 +0300
Message-ID: <20160606103227.GW1743@lahna.fi.intel.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1464904543-4094-3-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:3527 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751039AbcFFKcd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 6 Jun 2016 06:32:33 -0400
Content-Disposition: inline
In-Reply-To: <1464904543-4094-3-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: linus.walleij@linaro.org, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org

On Thu, Jun 02, 2016 at 10:55:40PM +0100, Dan O'Donovan wrote:
> On some CHV platforms, we need an option to configure the
> open-drain setting for these pins.  This adds support for the
> PIN_CONFIG_DRIVE_PUSH_PULL and PIN_CONFIG_DRIVE_OPEN_DRAIN to
> disable/enable open-drain mode for a specific pin.
> 
> Signed-off-by: Dan O'Donovan <dan@emutex.com>

These should come after the locking fix. Looks reasonable to me.
