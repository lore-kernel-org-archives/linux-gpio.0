From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH RESEND] pinctrl: intel: Turn Baytrail support to tristate
Date: Thu, 26 Jan 2017 11:38:23 +0200
Message-ID: <20170126093823.GG17297@lahna.fi.intel.com>
References: <20170125162608.58bfbfb1@endymion>
 <CACRpkdb9npDaMe07+v-ZzntD1Z_U2Swstk6bv=7uhHLmpM5LVA@mail.gmail.com>
 <20170126091931.GD17297@lahna.fi.intel.com>
 <s5hpojajhnj.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:12742 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753169AbdAZJi2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 04:38:28 -0500
Content-Disposition: inline
In-Reply-To: <s5hpojajhnj.wl-tiwai@suse.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>

On Thu, Jan 26, 2017 at 10:26:56AM +0100, Takashi Iwai wrote:
> I guess it would break things on some machines if the module loading
> order isn't setup properly.  For example, it's known that
> pinctrl-cherrytrail breaks MMC or others if it's loaded too lately.

Yes, if you have rootfs on eMMC and it requires a GPIO then of course
you need to make sure your initrd includes the necessary drivers. Same
goes with other media that can be used as rootfs.
