From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 17:22:18 +0200
Message-ID: <20160322152218.GA2099@lahna.fi.intel.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:9970 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751946AbcCVPW0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 22 Mar 2016 11:22:26 -0400
Content-Disposition: inline
In-Reply-To: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Mar 22, 2016 at 11:09:51AM -0400, Martin Langhoff wrote:
>    Hi pinctrl_cherryview maintainers.
>    I unsuspectingly bought a laptop for a family member which hits trouble
>    with pinctrl_cherryview; it only boots with the module blacklisted or
>    acpi=off .
>    System is (trying) to run Fedora 23 -- made more difficult by recent
>    Fedora kernels having the module built-in.
>    Are there any useful debugging steps I can follow to narrow this down?
>    Already tried the acpi diagnostics steps (acpi=ht, etc) to no avail.
>    thank you!

I think this is a known issue.

Please disable dw_dmac from your .config (or blacklist the module):

  CONFIG_DW_DMAC_CORE=n
  CONFIG_DW_DMAC=n

You can also enable pinctrl-cherryview.c.

Andy (Cc'd) is working a fix for this DMA hang issue.
