From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 15/28] pinctrl: intel: drop owner assignment from
 platform_drivers
Date: Mon, 22 Dec 2014 15:35:19 +0200
Message-ID: <20141222133519.GC1314@lahna.fi.intel.com>
References: <1419196495-9626-1-git-send-email-wsa@the-dreams.de>
 <1419196495-9626-16-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:23403 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754400AbaLVNgI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 22 Dec 2014 08:36:08 -0500
Content-Disposition: inline
In-Reply-To: <1419196495-9626-16-git-send-email-wsa@the-dreams.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-kernel@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Sun, Dec 21, 2014 at 10:14:36PM +0100, Wolfram Sang wrote:
> This platform_driver does not need to set an owner, it will be populated by the
> driver core.
> 
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
