From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH] gpiolib: translate pin number in GPIO ACPI callbacks
Date: Tue, 10 Mar 2015 17:04:38 +0200
Message-ID: <20150310150438.GR1563@lahna.fi.intel.com>
References: <1426007738-119736-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:4595 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751496AbbCJPFw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 10 Mar 2015 11:05:52 -0400
Content-Disposition: inline
In-Reply-To: <1426007738-119736-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, qi.zheng@intel.com, jason.cj.chen@intel.com

On Wed, Mar 11, 2015 at 01:15:38AM +0800, qipeng.zha wrote:
> From: "qipeng.zha" <qipeng.zha@intel.com>
> 
> If GPIO driver use pin mapping, need to translate pin number
> between ACPI table and GPIO driver.
> 
> This issue is found on one platform with Cherryview gpio
> controller, kernel is hang when executed _PS0 method of
> one ACPI device, since without this translation, it access
> invalid gpiodesc array.
> 
> Verified it works again with this patch.
> 
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
