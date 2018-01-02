From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] pinctrl: baytrail: Enable glitch filter for GPIOs
 used as interrupts
Date: Tue, 2 Jan 2018 09:31:13 +0200
Message-ID: <20180102073113.GU27654@lahna.fi.intel.com>
References: <20180101122357.10465-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:6730 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751254AbeABHbR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jan 2018 02:31:17 -0500
Content-Disposition: inline
In-Reply-To: <20180101122357.10465-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

On Mon, Jan 01, 2018 at 01:23:57PM +0100, Hans de Goede wrote:
> On some systems, some PCB traces attached to GpioInts are routed in such
> a way that they pick up enough interference to constantly (many times per
> second) trigger.
> 
> Enabling glitch-filtering fixes this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
