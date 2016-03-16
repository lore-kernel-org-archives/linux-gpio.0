From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH 1/2] pinctrl:Intel: make the high level interrupt working
Date: Wed, 16 Mar 2016 12:00:04 +0200
Message-ID: <20160316100004.GC1793@lahna.fi.intel.com>
References: <1458120064-74635-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:44757 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934448AbcCPKAI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 16 Mar 2016 06:00:08 -0400
Content-Disposition: inline
In-Reply-To: <1458120064-74635-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Qi Zheng <qi.zheng@intel.com>

On Wed, Mar 16, 2016 at 05:21:03PM +0800, Qipeng Zha wrote:
> High level trigger mode of GPIO interrupt is not set correctly
> in intel_gpio_irq_type(), and will make this kind of interrupt
> not respond.
> 
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
