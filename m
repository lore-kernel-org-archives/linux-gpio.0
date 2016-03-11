From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH 1/3] pinctrl: Intel: add RX invertion config
Date: Fri, 11 Mar 2016 11:38:56 +0200
Message-ID: <20160311093856.GN1796@lahna.fi.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:51363 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750742AbcCKJjA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Mar 2016 04:39:00 -0500
Content-Disposition: inline
In-Reply-To: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Qi Zheng <qi.zheng@intel.com>

On Sat, Mar 12, 2016 at 01:06:00AM +0800, Qipeng Zha wrote:
> Some module need to enable RX invertion config on BXT platform.
> 
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Can I ask what module might need this? I'm not so certain we want to add
anything like this to the driver to be honest.
