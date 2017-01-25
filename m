From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH RESEND] pinctrl: intel: Turn Baytrail support to tristate
Date: Wed, 25 Jan 2017 18:16:51 +0200
Message-ID: <20170125161651.GX17297@lahna.fi.intel.com>
References: <20170125162608.58bfbfb1@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:45341 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750906AbdAYQQz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Jan 2017 11:16:55 -0500
Content-Disposition: inline
In-Reply-To: <20170125162608.58bfbfb1@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Takashi Iwai <tiwai@suse.de>

On Wed, Jan 25, 2017 at 04:26:08PM +0100, Jean Delvare wrote:
> The pinctrl-baytrail driver builds just fine as a module so give
> users this option.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Assuming you have checked that nothing breaks in Baytrail, I'm fine with
this change,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
