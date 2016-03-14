From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH 1/3] pinctrl: Intel: add RX invertion config
Date: Mon, 14 Mar 2016 10:50:02 +0200
Message-ID: <20160314085002.GY1796@lahna.fi.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <20160311093856.GN1796@lahna.fi.intel.com>
 <0DD381DBF8F68D419C32ACFCEB28EB2521D1032C@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:33285 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755228AbcCNIuG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 14 Mar 2016 04:50:06 -0400
Content-Disposition: inline
In-Reply-To: <0DD381DBF8F68D419C32ACFCEB28EB2521D1032C@SHSMSX101.ccr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zheng, Qi" <qi.zheng@intel.com>
Cc: "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>

On Mon, Mar 14, 2016 at 03:10:07AM +0200, Zheng, Qi wrote:
> On Sat, Mar 12, 2016 at 01:06:00AM +0800, Qipeng Zha wrote:
> > Some module need to enable RX invertion config on BXT platform.
> > 
> > Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> 
> > Can I ask what module might need this? I'm not so certain we want to add anything like this to the driver to be honest.
> 
> The "pi330532" device on Broxton requires this function to manually trigger an GPIO input interrupt.
>
> That is to say, actually no signal change on the pin but toggling this
> RX inversion bit to make the GPIO controller believes there is voltage
> change on the pin thus triggering the interrupt.

That sounds rather hackish thing and definitely should not be part of
the driver IMHO.

I'm pretty sure there are better ways to do what you are doing.
