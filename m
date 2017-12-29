From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: baytrail: Enable glitch filter on some systems
Date: Fri, 29 Dec 2017 12:54:54 +0200
Message-ID: <20171229105454.GD27654@lahna.fi.intel.com>
References: <20171228224128.29065-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:49427 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754826AbdL2Ky6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Dec 2017 05:54:58 -0500
Content-Disposition: inline
In-Reply-To: <20171228224128.29065-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

On Thu, Dec 28, 2017 at 11:41:28PM +0100, Hans de Goede wrote:
> On some systems, some PCB traces attached to edge triggered GpioInts
> are routed in such a way that they pick up enough interference to
> constantly (many times per second) trigger.
> 
> Enabling glitch-filtering fixes this. This commit introduces a DMI
> list with systems which need this, but maybe we should enable this on
> all Bay Trail GPIOs used as edge-triggered interrupts?

I think it makes sense to always enable it for GPIOs used as interrupts
(regardless whether it is edge or level).
