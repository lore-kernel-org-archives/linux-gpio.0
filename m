From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Fri, 16 Jun 2017 08:07:21 -0700
Message-ID: <20170616150721.GJ20170@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:55368 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752609AbdFPPHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2017 11:07:23 -0400
Content-Disposition: inline
In-Reply-To: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

(Updating Andy's mail and adding Bjorn)

On 06/13, Timur Tabi wrote:
> I've run into a problem with our ACPI system where it turns out that
> one a subset of GPIOs are actually available to Linux.  Attempting to
> access anything that's not "approve" generates an XPU violation and
> halts the system.
> 
> Our pin control driver, pinctrl-qdf2xxx.c, is a client on
> pintrl-msm.c.  As such, it has to package the GPIO information in a
> way that pinctrl-msm can use.  I just want to get confirmation that
> there is no way to provide a list of specific GPIOs.
> 
> The actual list are these GPIOs: 116, 117, 118, 119, 120, 121, 122,
> 123, 124, 125, 126, 127, 128, 129, 130, 131, 80, 81, 82, 83, 84, 85,
> 86, 87, 88, 89, 90, 50, 36, 37, 38, 39.  These correspond to
> qdss_tracedata[0 - 31].  I can create these as gpio0 - gpio31, but
> that doesn't work because then no one will know (without using
> debug_fs) that "gpio3" is actually GPIO 119.
> 
> I can instead create all 150 GPIOs, and then specify NULL data for the
> 118 unavailable GPIOs, but then if anyone tries to access any of those
> (e.g. "echo 7 > /sys/class/gpio/gexport") will case a violation.
> 
> Is there a way, in pinctrl-msm, to specify a GPIO that doesn't
> actually exist, and therefore should never be exported?
> 

I'm not aware of anything in pinctrl-msm to support this. Is this
really a problem though? The only user that could cause an XPU
violation would be root. So just "don't do that" and things will
work fine.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
