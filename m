From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH V3 2/2] pinctrl: intel: fix bug of register offset
 calculation
Date: Wed, 25 Nov 2015 16:14:36 +0200
Message-ID: <20151125141436.GA1587@lahna.fi.intel.com>
References: <1448471391-1115-1-git-send-email-qipeng.zha@intel.com>
 <1448471391-1115-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:54392 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754489AbbKYOOj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 25 Nov 2015 09:14:39 -0500
Content-Disposition: inline
In-Reply-To: <1448471391-1115-2-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, qi.zheng@intel.com

On Thu, Nov 26, 2015 at 01:09:51AM +0800, Qipeng Zha wrote:
> The group size for registers PADCFGLOCK, HOSTSW_OWN, GPI_IS,
> GPI_IE, are not 24 for Broxton, Add a parameter to allow
> different platform to set correct value.
> 
> ---
> change in v3:
>  use community->gpp_size directly, not macro.
> 
> change in v2:
>  define gpp_size for sunrisepoint in its private structure.
> 
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

My previous ack still applies to this patch.
