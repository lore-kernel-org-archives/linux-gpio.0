From: "Gerd v. Egidy" <lists@egidy.de>
Subject: controlling pinctrl GPIOs from userspace on x86
Date: Tue, 06 Dec 2016 23:34:56 +0100
Message-ID: <9201895.LkQO1ovFfJ@rdx.n.i2n>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from rp02.intra2net.com ([62.75.181.28]:60632 "EHLO
        rp02.intra2net.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752131AbcLFWkU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2016 17:40:20 -0500
Received: from intragerd.n.i2n (unknown [172.28.128.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by rp02.intra2net.com (Postfix) with ESMTPS id 4EBA810031F
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2016 23:34:59 +0100 (CET)
Received: from localhost (intragerd.n.i2n [127.0.0.1])
        by localhost (Postfix) with ESMTP id 02BEC1F462
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2016 23:34:59 +0100 (CET)
Received: from rdx.n.i2n (rdx.n.i2n [172.28.128.8])
        by intragerd.n.i2n (Postfix) with ESMTP id 898E01F476
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2016 23:34:56 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,

I have a x86 mainboard with a Intel Sunrise Point chipset. One function I want 
to control is tied to a specific GPIO on the chipset (GPP_E1 / SATAXPCIE_1). 
There seems to be a driver for this in the kernel: 
pinctrl/intel/pinctrl-sunrisepoint.c

The easiest solution for me would be if I could control this GPIO from 
userspace. 

I have seen examples where a pin from pinctrl is made available to the "gpio" 
driver with a devicetree setting on arm devices. But I have a x86 system with 
a classic BIOS, so no devicetree here to help me.

I have seen that there is pinconf which should give some info and control over 
pinctrl through debugfs, correct?. So I enabled CONFIG_PINCONF, but after 
loading the pinctrl-sunrisepoint module I could not see anything relating to 
this show up in /sys/kernel/debug.

Do I need to manually register the driver with the device somehow? I have 
/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/INT345D:00 which seems to be 
what the driver is looking for.

Am I missing something?

Or is pinconf not going to help me? What to use instead?

Thanks.

Kind regards,

Gerd

