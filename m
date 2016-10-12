From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 4/6] mfd: move enum lpc_chipsets into lpc_ich.h
Date: Wed, 12 Oct 2016 13:24:49 +0300
Message-ID: <1476267889.11323.446.camel@linux.intel.com>
References: <1476255066-22653-1-git-send-email-jui.nee.tan@intel.com>
         <1476255066-22653-5-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:20663 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932557AbcJLK0G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Oct 2016 06:26:06 -0400
In-Reply-To: <1476255066-22653-5-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Wed, 2016-10-12 at 14:51 +0800, Tan Jui Nee wrote:
> Move the enum's definition into a standalone header file which can be
> used
> wherever its definition is needed.
> 
> --- a/include/linux/mfd/lpc_ich.h
> +++ b/include/linux/mfd/lpc_ich.h
> @@ -43,4 +43,75 @@ struct lpc_ich_info {
>  	u8 use_gpio;
>  };
>  
> +/* chipset related info */
> +enum lpc_chipsets {

Maybe it worth to add that the list should be not shuffled, new items
should go at the end.

But it is up to you.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
