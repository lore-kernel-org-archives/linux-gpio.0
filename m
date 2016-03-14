From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH 2/3] pinctrl:Intel: clear interrupt status for every IRQ
 setup
Date: Mon, 14 Mar 2016 11:20:00 +0200
Message-ID: <20160314092000.GB1796@lahna.fi.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
 <20160311094517.GO1796@lahna.fi.intel.com>
 <0DD381DBF8F68D419C32ACFCEB28EB2521D10345@SHSMSX101.ccr.corp.intel.com>
 <20160314084457.GX1796@lahna.fi.intel.com>
 <0DD381DBF8F68D419C32ACFCEB28EB2521D10664@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:45030 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932086AbcCNJWQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 14 Mar 2016 05:22:16 -0400
Content-Disposition: inline
In-Reply-To: <0DD381DBF8F68D419C32ACFCEB28EB2521D10664@SHSMSX101.ccr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zheng, Qi" <qi.zheng@intel.com>
Cc: "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>

On Mon, Mar 14, 2016 at 11:02:04AM +0200, Zheng, Qi wrote:
> I agree with you that the driver need deal with spurious interrupts,
> but it is expected that the GPIO driver eliminate this spurious
> interrupts as well which the patch can help.  And IMHO, adding ACK in
> the irq_set_type makes sense since a clean interrupt status is
> expected behavior before enabling the interrupt.

But it does not solve anything if the pin status changes right after you
call ack.
