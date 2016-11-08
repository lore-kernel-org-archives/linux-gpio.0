From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v9 4/6] mfd: move enum lpc_chipsets into lpc_ich.h
Date: Tue, 8 Nov 2016 13:04:02 +0200
Message-ID: <20161108110402.GQ1447@lahna.fi.intel.com>
References: <1478595443-6306-1-git-send-email-jui.nee.tan@intel.com>
 <1478595443-6306-5-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:32862 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932219AbcKHLEK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Nov 2016 06:04:10 -0500
Content-Disposition: inline
In-Reply-To: <1478595443-6306-5-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com

On Tue, Nov 08, 2016 at 04:57:21PM +0800, Tan Jui Nee wrote:
> Move the enum's definition into a standalone header file which can be used
> wherever its definition is needed.
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
