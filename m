From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH] gpiolib: change gpio pin from unsigned to signed in acpi
 callback
Date: Fri, 10 Apr 2015 10:43:02 +0300
Message-ID: <20150410074302.GN1734@lahna.fi.intel.com>
References: <1428618310-10229-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:47103 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754416AbbDJHnJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 10 Apr 2015 03:43:09 -0400
Content-Disposition: inline
In-Reply-To: <1428618310-10229-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Alan Cox <alan@linux.intel.com>

On Fri, Apr 10, 2015 at 06:25:10AM +0800, qipeng.zha wrote:
> From: "qipeng.zha" <qipeng.zha@intel.com>
> 
> The signed error will be wrongly used as valid gpio offset
> 
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Alan Cox <alan@linux.intel.com>
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
