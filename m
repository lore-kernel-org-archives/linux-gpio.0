From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH v2 1/1] pinctrl: baytrail: Add missing spinlock usage in byt_gpio_irq_handler
Date: Wed, 01 Feb 2017 08:47:05 +0100
Message-ID: <1572471.RPgeE8YS6g@ws-stein>
References: <20170130113528.17838-1-alexander.stein@systec-electronic.com> <20170130115149.GM17297@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:40385 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751292AbdBAHrN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 02:47:13 -0500
In-Reply-To: <20170130115149.GM17297@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Monday 30 January 2017 13:51:49, Mika Westerberg wrote:
> On Mon, Jan 30, 2017 at 12:35:28PM +0100, Alexander Stein wrote:
> > According to VLI64 Intel Atom E3800 Specification Update (#329901)
> > concurrent read accesses may result in returning 0xffffffff and write
> > accesses may be dropped silently.
> > To workaround all accesses must be protected by locks.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Should probably go to stable as well.

Sure, but I don't know which stable kernels this should go in.

Best regards,
Alexander

