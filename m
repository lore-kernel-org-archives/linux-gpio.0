From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rcar: Support both edge trigger with DT
Date: Fri, 29 Nov 2013 13:23:55 +0100
Message-ID: <CACRpkdZdggOu9h58hABix3=x6dETipzueCDKMKxVLP+yYjHSeQ@mail.gmail.com>
References: <1384359983-29178-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<CANqRtoRhHhWp0zDcc8jN3eqV=O-=4uBG_a9Xb1-+Lk4eEiZoiw@mail.gmail.com>
	<2124422.xP76KsfKRo@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:39402 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752975Ab3K2MXz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 07:23:55 -0500
Received: by mail-oa0-f48.google.com with SMTP id l6so10307893oag.35
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 04:23:55 -0800 (PST)
In-Reply-To: <2124422.xP76KsfKRo@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, SH-Linux <linux-sh@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, Simon Horman <horms@verge.net.au>

On Thu, Nov 28, 2013 at 4:31 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Linus,
> On Thursday 14 November 2013 15:12:46 Magnus Damm wrote:
>> On Thu, Nov 14, 2013 at 1:26 AM, Laurent Pinchart wrote:
>> > Some versions of the R-Car GPIO controller support triggering on both
>> > edges of the input signal. Whether this capability is supported is
>> > currently specified in platform data. R-Car GPIO devices instantiated
>> > from the device tree have the capability turned off even when the
>> > hardware supports it.
>> >
>> > To fix this, add DT match data support to the driver, initialize both
>> > edge trigger support from match data and enable both edge trigger in
>> > r8a7790 and r8a7791 match data.
>> >
>> > Signed-off-by: Laurent Pinchart
>> > <laurent.pinchart+renesas@ideasonboard.com>
>> > ---
>> >
>> >  drivers/gpio/gpio-rcar.c | 56 +++++++++++++++++++++++++++++++++----------
>> >  1 file changed, 43 insertions(+), 13 deletions(-)
>>
>> Looks fine to me, thanks!
>>
>> Acked-by: Magnus Damm <damm@opensource.se>
>
> Could you please pick this patch up for v3.14 ?

I have never seen this patch before.

I checked my spam folder and all, and it's not on the
marc.info mail archive for linux-gpio either, so something
has really screwed up here :-(

Care to resend with Magus' ACK?

Yours,
Linus Walleij
