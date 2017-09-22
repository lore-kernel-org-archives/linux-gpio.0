From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Mask interrupts on driver probe
Date: Fri, 22 Sep 2017 08:47:12 +0300
Message-ID: <20170922054712.GW4630@lahna.fi.intel.com>
References: <20170921192003.17324-1-kyle.roeschley@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:19784 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751637AbdIVFrR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Sep 2017 01:47:17 -0400
Content-Disposition: inline
In-Reply-To: <20170921192003.17324-1-kyle.roeschley@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kyle Roeschley <kyle.roeschley@ni.com>
Cc: heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 21, 2017 at 02:20:03PM -0500, Kyle Roeschley wrote:
> Powering off the system on Apollo Lake does not clear the interrupt
> enable registers for the GPIOs. To avoid an interrupt storm on driver
> probe, clear all interrupt enables before enabling our interrupt line.

It is up to the BIOS to set the proper mask and program the pads
accordingly. Which platform and BIOS this is?

I would rather not do this because it might cause other problems.
