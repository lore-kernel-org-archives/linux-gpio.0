From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Wed, 11 Jan 2017 20:17:30 +0000
Message-ID: <SG2PR06MB1165A22C577C408E37C7FDB78A660@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <7332833.bE664ByKOm@avalon> <10eda4a0-55de-4716-b92f-17dcf599af34@jmondi.org>
 <1928005.z8ulDpGmNF@avalon> <3347aca7-5984-44dc-6b23-9eb1fa4712f5@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:46426 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751741AbdAKURf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Jan 2017 15:17:35 -0500
In-Reply-To: <3347aca7-5984-44dc-6b23-9eb1fa4712f5@jmondi.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jacopo and Laurent,

On Wednesday, January 11, 2017, jacopo mondi wrote:
> A big difference from what pinctrl-single does and what the table-based
> approach does is that it creates groups, pins and functions at run-time,
> parsing the dts...

See, this makes me think that this will chew up even more system memory.

The thing about the RZ/A1 series is that it has internal RAM and we use
that along with XIP_KERNEL in order to build systems that do not require
external RAM.
So in the end, even if we can get sh-pfc to functionally work for RZ/A1,
it would be pretty sad if the device driver that uses the most system
memory is one that is really only used at boot time just to change some
pin configurations.


> As a final note: maybe we need to decide what to do with this series,
> people is spending time reviewing it, and I've just sent v2 out. If we
> want to go in a different direction, we should stop here :)

Personally, for the RZ/A series, I don't see the sh-pfc driver as a long
term solution. If people need something in the kernel today to general
testing, that's one thing. But if someone starts laying out a board
with any differences from the Renesas reference design, they might be
in for a rude awaking when trying to put together a BSP for their board.


If people really want this sh-pcf based driver upstreamed, I will try
to do some testing on my boards to make sure it at least does what it
is supposed to do. (wait for V3 patch set???)

Even so, I still plan on mocking up a new driver with the ideas from
this discussion (create a renesas-pfc.c) as a long term solution for
the RZ/A series. Whether that new driver architecture is worth upstreaming
or not, I guess we'll have to wait and see.

Cheers

Chris
