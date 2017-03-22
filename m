From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] pinctrl: cherryview: Add support for GMMR GPIO
 opregion
Date: Wed, 22 Mar 2017 17:42:57 +0200
Message-ID: <20170322154257.GV2957@lahna.fi.intel.com>
References: <20170322153858.19656-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:16520 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760238AbdCVPtt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Mar 2017 11:49:49 -0400
Content-Disposition: inline
In-Reply-To: <20170322153858.19656-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

On Wed, Mar 22, 2017 at 04:38:58PM +0100, Hans de Goede wrote:
> On some Cherry Trail devices the ASL uses the GMMR GPIO to access
> GPIOs so as to serialize MMIO accesses to GPIO registers with the
> OS, because:
> 
> "Due to a silicon issue, a shared lock must be used to prevent concurrent
> accesses across the 4 GPIO controllers.
> 
> See Intel Atom Z8000 Processor Series Specification Update (Rev. 005),
> errata #CHT34, for further information."
> 
> This commit adds support for this opregion, this fixes a number of
> ASL errors on my Ezpad mini3 tablet and makes the otg port device/host
> muxing which is controlled in firmware on this model work properly.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
