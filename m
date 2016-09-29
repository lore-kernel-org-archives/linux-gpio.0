From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v7 5/6] mfd: lpc_ich: Add Device IDs for Intel Apollo
 Lake PCH
Date: Thu, 29 Sep 2016 14:08:59 +0300
Message-ID: <20160929110859.GN1218@lahna.fi.intel.com>
References: <1475056343-31907-1-git-send-email-jui.nee.tan@intel.com>
 <1475056343-31907-6-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:20172 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752355AbcI2LRv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Sep 2016 07:17:51 -0400
Content-Disposition: inline
In-Reply-To: <1475056343-31907-6-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Wed, Sep 28, 2016 at 05:52:22PM +0800, Tan Jui Nee wrote:
> Adding Intel codename Apollo Lake platform device IDs for PCH.
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> ---
>  drivers/mfd/lpc_ich-core.c  | 6 ++++++

It should be either lpc_ich_core.c or lpc-ich-core.c. Ditto for -apl.c
thing.
