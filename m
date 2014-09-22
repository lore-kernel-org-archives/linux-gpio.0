From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 2/2] gpio: Add support for Intel Cherryview/Braswell
 GPIO controller
Date: Mon, 22 Sep 2014 14:19:41 +0300
Message-ID: <20140922111941.GS1786@lahna.fi.intel.com>
References: <1410790185-31101-1-git-send-email-mika.westerberg@linux.intel.com>
 <1410790185-31101-2-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:48688 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751619AbaIVLTq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 22 Sep 2014 07:19:46 -0400
Content-Disposition: inline
In-Reply-To: <1410790185-31101-2-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alan Cox <alan@linux.intel.com>, Ning Li <ning.li@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Sep 15, 2014 at 05:09:45PM +0300, Mika Westerberg wrote:
> From: Ning Li <ning.li@intel.com>
> 
> This driver supports the GPIO controllers found in newer Intel SoCs like
> Cherryview and Braswell.
> 
> Signed-off-by: Ning Li <ning.li@intel.com>
> Signed-off-by: Alan Cox <alan@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/gpio/Kconfig           |   8 +
>  drivers/gpio/Makefile          |   1 +
>  drivers/gpio/gpio-cherryview.c | 947 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 956 insertions(+)
>  create mode 100644 drivers/gpio/gpio-cherryview.c

Hi GPIO maintainers,

Just checking if there is any comments to this driver?

If the ARCH_NR_GPIOS patch is not accepted as is (or we are even getting
rid of the limit), could you consider taking this driver patch to the
GPIO tree separately?
