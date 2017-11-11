From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3] pinctrl: intel: merrifield: Introduce ACPI device
 table
Date: Sat, 11 Nov 2017 10:47:03 +0200
Message-ID: <20171111084703.GK18997@lahna.fi.intel.com>
References: <20171110193928.28313-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:23038 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751366AbdKKIrG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 11 Nov 2017 03:47:06 -0500
Content-Disposition: inline
In-Reply-To: <20171110193928.28313-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

On Fri, Nov 10, 2017 at 09:39:28PM +0200, Andy Shevchenko wrote:
> On Intel Merrifield the pin control device is a separate IP block
> without any PCI ID assigned.
> 
> Though, recently we got an allocated ACPI ID for it, so, let's use fresh
> ID.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
