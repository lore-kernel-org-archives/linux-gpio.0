From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH] Fix one issue in pinctrl-cherryview.c
Date: Thu, 26 Feb 2015 09:11:09 +0200
Message-ID: <20150226071109.GY1758@lahna.fi.intel.com>
References: <C6287702A945AC47BE5DB5DFD4B5C6DD01841877@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:26892 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750983AbbBZHNU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 26 Feb 2015 02:13:20 -0500
Content-Disposition: inline
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD01841877@SHSMSX104.ccr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 'Linus Walleij' <linus.walleij@linaro.org>

On Thu, Feb 26, 2015 at 05:10:13AM +0200, Zha, Qipeng wrote:
>    Hi
> 
>    Please check below patch(or attached), thanks.
> 
>    this is verified on Intel cherrytrail platform on linux 3.19-rc6.

In general you should send your patches inline and plain text to the
interested parties. Please take some time reading Documentation/SubmittingPatches.

Then do this:

 1) git format-patch -1

This results 0001-pinctrl-update-direction_output-function-of-cherryvi.patch

 2) git send-email --dry-run --to self 0001-pinctrl-update-direction_output-function-of-cherryvi.patch

Verify that it sends the patch only to you

 3) git send-email --to self 0001-pinctrl-update-direction_output-function-of-cherryvi.patch

Verify that the patch formatting and content is ok. If not, apply fixes
and start from 1).

Once you are happy with the result you can then send the patch like:

 4) git send-email --to ... --cc ...

and everyone is happy :)

The patch itself looks good to me.
