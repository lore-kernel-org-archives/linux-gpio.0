From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH v2] Documentation: gpio: consumer: describe active low
 property
Date: Sun, 16 Aug 2015 22:18:38 -0500
Message-ID: <20150817031837.GA31195@deathstar>
References: <1437199327-4410-1-git-send-email-dirk.behme@gmail.com>
 <55CED248.101@gmail.com>
 <55D14E76.5050804@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:33824 "EHLO
	mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753719AbbHQDSq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2015 23:18:46 -0400
Received: by iodb91 with SMTP id b91so136854768iod.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2015 20:18:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55D14E76.5050804@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

On Mon, Aug 17, 2015 at 12:01:10PM +0900, Alexandre Courbot wrote:
> On 08/15/2015 02:46 PM, Dirk Behme wrote:
> >On 18.07.2015 08:02, Dirk Behme wrote:
> >>I've been searching for any documentation of 'the active-low property
> >>of a GPIO'
> >>already mentioned in this documenation. But couldn't find any. Add it.
> >>
> >>Sigend-off-by: Dirk Behme <dirk.behme@gmail.com>
> >>Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> >>---
> >>Changes in v2: Incorporate the review comments from Alexandre.
> >>
> >>  Documentation/gpio/consumer.txt | 33 +++++++++++++++++++++++++++++++++
> >>  1 file changed, 33 insertions(+)
> >>
> >>diff --git a/Documentation/gpio/consumer.txt
> >>b/Documentation/gpio/consumer.txt
> >>index 75542b9..df7c51a 100644
> >>--- a/Documentation/gpio/consumer.txt
> >>+++ b/Documentation/gpio/consumer.txt
> >>@@ -237,6 +237,39 @@ Note that these functions should only be used
> >>with great moderation ; a driver
> >>  should not have to care about the physical line level.
> >>
> >>
> >>+The active-low property
> >>+-----------------------
> >>+
> >>+As a driver should not have to care about the physical line level,
> >>all of the
> >>+gpiod_set_value_xxx() or gpiod_set_array_value_xxx() functions
> >>operate with
> >>+the *logical* value. With this they take the active-low property into
> >>account.
> >>+This does mean that they check whether the GPIO is configured to be
> >>active-low.
> >>+And if so, they manipulate the passed value before the physical line
> >>level is
> >>+driven.
> >>+
> >>+With this, all the gpiod_set_(array)_value_xxx() functions interpret
> >>the parameter
> >>+"value" as "active" ("1") or "inactive" ("0"). The physical line
> >>level will be
> >>+driven accordingly.
> >>+

Property is misspelled here. poperty

> >>+As an example, if the active-low poperty for a dedicated GPIO is set,
> >>and the
> >>+gpiod_set_(array)_value_xxx() passes "active" ("1"), the physical
> >>line level will be
> >>+driven low.
> >>+
> >>+To summarize:
> >>+

Property is also spelled wrong here too. proporty

> >>+Function (example)               active-low proporty  physical line
> >>+gpiod_set_raw_value(desc, 0);        don't care           low
> >>+gpiod_set_raw_value(desc, 1);        don't care           high
> >>+gpiod_set_value(desc, 0);       default (active-high)     low
> >>+gpiod_set_value(desc, 1);       default (active-high)     high
> >>+gpiod_set_value(desc, 0);             active-low          high
> >>+gpiod_set_value(desc, 1);             active-low          low
> >>+
> >>+Please note again that the set_raw/get_raw functions should be
> >>avoided as much
> >>+as possible, especially by drivers which should not care about the
> >>actual physical
> >>+line level and worry about the logical value instead.
> >>+
> >>+
> >>  Set multiple GPIO outputs with a single function call
> >>  -----------------------------------------------------
> >>  The following functions set the output values of an array of GPIOs:
> >
> >
> >Any further comments on this? Could this be applied?
> 
> I am ok with it - Linus?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
