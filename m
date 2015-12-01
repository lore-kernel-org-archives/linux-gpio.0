From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH V4 2/2] pinctrl: intel: fix offset calculation issue of
 register PAD_OWN
Date: Tue, 1 Dec 2015 11:20:42 +0200
Message-ID: <20151201092042.GA2774@lahna.fi.intel.com>
References: <1448882416-40845-1-git-send-email-qipeng.zha@intel.com>
 <1448882416-40845-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:64130 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755555AbbLAJWw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 1 Dec 2015 04:22:52 -0500
Content-Disposition: inline
In-Reply-To: <1448882416-40845-2-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, qi.zheng@intel.com

On Mon, Nov 30, 2015 at 07:20:16PM +0800, Qipeng Zha wrote:
> The calculation equation of PAD_OWN register offset is not
> correct for Broxton, verified this fix will get right
> offset for Broxton.
> 
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
