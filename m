From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio: mcp23s08: Add option to configure pullups.
Date: Mon, 24 Oct 2016 08:13:54 +0200
Message-ID: <11644726.TmP4uu3h4l@ws-stein>
References: <1477062035-30825-1-git-send-email-enric.balletbo@collabora.com> <CACRpkdY15Hv_ydHyOXRM6G0ewVTHkVa1w3Z89AdvSDR=eyi7sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:51570 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1757038AbcJXGOB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Oct 2016 02:14:01 -0400
In-Reply-To: <CACRpkdY15Hv_ydHyOXRM6G0ewVTHkVa1w3Z89AdvSDR=eyi7sQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>

On Monday 24 October 2016 02:53:31, Linus Walleij wrote:
> On Fri, Oct 21, 2016 at 5:00 PM, Enric Balletbo i Serra
> 
> <enric.balletbo@collabora.com> wrote:
> > Default is without pullups, but if property is specified in DT and the bit
> > is set, set a pullup on GPIO-n.
> > 
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> I don't generally like this.
> 
> In device tree it is the consumer that specifies how the line is used,
> not the producer (gpiochip).
> 
> We currently only specify polarity, open drain and open source
> for consumers though.
> 
> And the entire pin control system came into being *exactly* because
> Grant didn't like me adding these things to the GPIO drivers.
> 
> So how many other things does the MCP support? Drive strength?
> Schmitt trigger? Is there a datasheet?

Some unsupported features (AFAIK):
* Input polarity (IPOL register)
* open-drain interrupt pin
* pullup on pins (proposed patch)

Datasheet is here: http://ww1.microchip.com/downloads/en/DeviceDoc/21919e.pdf

Best regards,
Alexander

