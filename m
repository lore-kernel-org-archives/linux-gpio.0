From: Jean Delvare <jdelvare@suse.de>
Subject: Re: Suspicious debounce handling code in pintctrl-baytrail
Date: Thu, 26 Jan 2017 15:24:25 +0100
Message-ID: <20170126152425.403374d7@endymion>
References: <20170126142020.7bfd1229@endymion>
        <20170126134341.GI17297@lahna.fi.intel.com>
        <20170126150046.2ca78ed6@endymion>
        <20170126140811.GJ17297@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60739 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752685AbdAZOYe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 09:24:34 -0500
In-Reply-To: <20170126140811.GJ17297@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Cristina Ciocan <cristina.ciocan@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>

On Thu, 26 Jan 2017 16:08:11 +0200, Mika Westerberg wrote:
> We will fix this, thanks!

Great, thanks.

BTW I think that Andy's patch which fixes a bug that "even might break
something physically" would deserve to be Cc'd to stable@ (once the fix
itself is fixed, that is.)

-- 
Jean Delvare
SUSE L3 Support
