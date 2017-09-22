From: Kyle Roeschley <kyle.roeschley@ni.com>
Subject: Re: [PATCH] pinctrl: intel: Mask interrupts on driver probe
Date: Fri, 22 Sep 2017 09:01:25 -0500
Message-ID: <20170922140124.ptueogzngqaq3hcv@senary>
References: <20170921192003.17324-1-kyle.roeschley@ni.com>
 <20170922054712.GW4630@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-00010702.pphosted.com ([148.163.158.57]:44744 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751882AbdIVOIJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Sep 2017 10:08:09 -0400
Content-Disposition: inline
In-Reply-To: <20170922054712.GW4630@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 22, 2017 at 08:47:12AM +0300, Mika Westerberg wrote:
> On Thu, Sep 21, 2017 at 02:20:03PM -0500, Kyle Roeschley wrote:
> > Powering off the system on Apollo Lake does not clear the interrupt
> > enable registers for the GPIOs. To avoid an interrupt storm on driver
> > probe, clear all interrupt enables before enabling our interrupt line.
> 
> It is up to the BIOS to set the proper mask and program the pads
> accordingly. Which platform and BIOS this is?
> 
> I would rather not do this because it might cause other problems.

I haven't seen any issues in testing. This is on a platform based on the Oxbow
Hill CRB, but it's entirely possible that there's a bug in the BIOS power
sequencing behavior. I'll dig around and see if something's been missed.

-- 
Kyle Roeschley
Software Engineer
National Instruments
