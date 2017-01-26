From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: broxton: No need to take pointer of a pointer
Date: Thu, 26 Jan 2017 19:29:37 +0200
Message-ID: <20170126172937.GM17297@lahna.fi.intel.com>
References: <20170126151038.37977-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:54673 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753888AbdAZRfg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 12:35:36 -0500
Content-Disposition: inline
In-Reply-To: <20170126151038.37977-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Thu, Jan 26, 2017 at 05:10:38PM +0200, Andy Shevchenko wrote:
> There is no need to take pointer of a pointer to an array of SoC data in
> platform driver.
> 
> Do it in the same way as it's done for ACPI.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
