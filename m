From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/5] pinctrl: cherryview: convert bare unsigned to
 unsigned int
Date: Mon, 6 Jun 2016 13:28:19 +0300
Message-ID: <20160606102819.GU1743@lahna.fi.intel.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1464904543-4094-2-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:58664 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751632AbcFFK2Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 6 Jun 2016 06:28:25 -0400
Content-Disposition: inline
In-Reply-To: <1464904543-4094-2-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: linus.walleij@linaro.org, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org

On Thu, Jun 02, 2016 at 10:55:39PM +0100, Dan O'Donovan wrote:
> Addresses checkpatch warnings such as the following for this driver:
> 
>  WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

I don't know if this is useful. Things like this make backporting real
fixes harder. For new code, it makes sense but not for converting existing.
