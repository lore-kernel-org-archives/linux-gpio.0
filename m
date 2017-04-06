From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add a quirk to make Acer Chromebook
 keyboard work again
Date: Thu, 6 Apr 2017 11:19:58 +0300
Message-ID: <20170406081958.GR2957@lahna.fi.intel.com>
References: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
 <20170403185218.GE34530@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:22777 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751283AbdDFIUD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Apr 2017 04:20:03 -0400
Content-Disposition: inline
In-Reply-To: <20170403185218.GE34530@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, linux-gpio@vger.kernel.org

On Mon, Apr 03, 2017 at 11:52:18AM -0700, Dmitry Torokhov wrote:
> Is there a BIOS version (I do not have my Cyan with me)? Because if
> Intel happens to release a fixes for this hard-coded mapping, we would
> not want to continue applying this quirk, would we?

Good point. I think there is a BIOS version string in the DMI
information as well. I'll include it in the next revision of the patch.
