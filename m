From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH] pwm: lpss: add PM support for LPSS PWM
Date: Mon, 24 Aug 2015 13:20:20 +0300
Message-ID: <20150824102020.GQ30005@lahna.fi.intel.com>
References: <1440434317-51406-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:14388 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754119AbbHXKUY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 24 Aug 2015 06:20:24 -0400
Content-Disposition: inline
In-Reply-To: <1440434317-51406-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Huiquan Zhong <huiquan.zhong@intel.com>

On Tue, Aug 25, 2015 at 12:38:37AM +0800, Qipeng Zha wrote:
> Without this PM support, PWM controller can't enter into
> D3 state, and then kernel will fail to enter S3.

You should Cc the PWM subsystem maintainer as well. Please check what 

	% scripts/get_maintainer.pl 0001-your-patch.patch

outputs.

Also it would be good idea to include bit more analysis to the
changelog. For example why it prevents system S3?

Does this happen on Baytrail, Braswell?
