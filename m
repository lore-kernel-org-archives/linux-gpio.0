From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/PATCH] gpio/pinctrl: baytrail: move gpio driver from pinctrl
 to gpio directory
Date: Tue, 28 Oct 2014 16:10:26 +0100
Message-ID: <CACRpkdafsd3VDiEKbdooXx+mdAtf-3B6QBOEGeHgyJf9GKHqhQ@mail.gmail.com>
References: <1413227857-555-1-git-send-email-david.a.cohen@linux.intel.com>
	<543CFC7F.2070607@linux.intel.com>
	<20141014174535.GA6516@psi-dev26.jf.intel.com>
	<20141015070812.GM2255@lahna.fi.intel.com>
	<20141015165542.GA4529@psi-dev26.jf.intel.com>
	<20141016080123.GW2255@lahna.fi.intel.com>
	<20141017015322.GB4513@psi-dev26.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:51139 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647AbaJ1PK1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 11:10:27 -0400
Received: by mail-ig0-f172.google.com with SMTP id h15so6934956igd.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2014 08:10:26 -0700 (PDT)
In-Reply-To: <20141017015322.GB4513@psi-dev26.jf.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Oct 17, 2014 at 3:53 AM, David Cohen
<david.a.cohen@linux.intel.com> wrote:
> On Thu, Oct 16, 2014 at 11:01:23AM +0300, Mika Westerberg wrote:

>> In an ideal world, yes. However, the reality has shown that BIOS/FW gets
>> these wrong and we need to work it around in the OS.
>
> But we never upstream these workarounds, right? :)

Unless you discover it after it hits the market, right?

I think this driver is just fine exactly where it is. Besides, the driver
is fully aware of all its pins, and just look at all the pull up etc
information displayed by byt_gpio_dbg_show(), it doesn't get more
pin control than that even if you don't implement the pin control
API.

Yours,
Linus Walleij
