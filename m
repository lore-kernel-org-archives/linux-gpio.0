From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] gpio: set explicit nesting on drivers
Date: Fri, 25 Nov 2016 16:35:30 +0200
Message-ID: <20161125143530.GP1476@lahna.fi.intel.com>
References: <1479991141-24202-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:6904 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754291AbcKYOgd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Nov 2016 09:36:33 -0500
Content-Disposition: inline
In-Reply-To: <1479991141-24202-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Bin Gao <bin.gao@linux.intel.com>

On Thu, Nov 24, 2016 at 01:39:01PM +0100, Linus Walleij wrote:
> The ADNP, CrystalCove and WhiskeyCove are all nested GPIO
> irqchips, but were avoiding to connect the parent IRQ to
> the gpiochip. This works, but is kind of sloppy as the
> child IRQs are not marked as having the parent IRQ as
> parent.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
