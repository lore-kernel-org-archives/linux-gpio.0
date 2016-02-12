From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Remove unneeded header includes
Date: Fri, 12 Feb 2016 12:46:12 +0200
Message-ID: <20160212104612.GC16826@lahna.fi.intel.com>
References: <20160212111313.514dc4ee@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:65482 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751937AbcBLKqP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 12 Feb 2016 05:46:15 -0500
Content-Disposition: inline
In-Reply-To: <20160212111313.514dc4ee@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>

On Fri, Feb 12, 2016 at 11:13:13AM +0100, Jean Delvare wrote:
> pinctrl-intel doesn't use anything from <linux/init.h>,
> <linux/acpi.h>, <linux/gpio.h> or <linux/pm.h>, so it should not
> include these header files.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
