From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/2] pinctrl: intel: Read back TX buffer state
Date: Thu, 24 Aug 2017 12:29:10 +0300
Message-ID: <20170824092910.GM2327@lahna.fi.intel.com>
References: <20170824081934.85859-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:22921 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751274AbdHXJ3N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Aug 2017 05:29:13 -0400
Content-Disposition: inline
In-Reply-To: <20170824081934.85859-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Bourque, Francis" <francis.bourque@intel.com>

On Thu, Aug 24, 2017 at 11:19:33AM +0300, Andy Shevchenko wrote:
> In the same way as it's done in pinctrl-cherryview.c we would provide
> a readback TX buffer state.
> 
> Fixes: 17fab473693 ("pinctrl: intel: Set pin direction properly")
> Reported-by: "Bourque, Francis" <francis.bourque@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks Andy for taking care of this!

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
