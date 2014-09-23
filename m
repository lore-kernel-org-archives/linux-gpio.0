From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [periperi] How to set default GPIO pin ?
Date: Tue, 23 Sep 2014 17:06:28 +0200
Message-ID: <CACRpkdb1jF-ro3XcFHFC+Lhgi+0dEHzQYVSSLV6AWnAxiwNLdw@mail.gmail.com>
References: <8738cc0vx9.wl%kuninori.morimoto.gx@gmail.com>
	<2862746.g5u9pdpKDi@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:48431 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755039AbaIWPG3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Sep 2014 11:06:29 -0400
Received: by mail-ie0-f180.google.com with SMTP id ar1so6474640iec.25
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2014 08:06:29 -0700 (PDT)
In-Reply-To: <2862746.g5u9pdpKDi@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, "goda (Renesas)" <yusuke.goda.sx@renesas.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Sep 10, 2014 at 10:55 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Sunday 31 August 2014 22:08:52 Kuninori Morimoto wrote:
>>
>> I know we can use "defalt" PFC settings on DT.
>> But, how to use "defalt" GPIO pin settings on DT ?
>>
>> We would like to use GPIO 7-17 as Low output,
>> and do nothing after boot.
>
> From a DT point of view I believe this is supposed to be done by specifying
> the output-low or output-high properties in the pinctrl configuration node.
> However, these properties are not supported by the PFC driver, and there's no
> easy way for the PFC driver to configure GPIOs handled by a different driver
> such as the gpio-rcar driver for instance.
>
> Linus, do you have any hindsight on how this should be implemented ?

I have suggested adding GPIO hogs, so that a GPIO node can specify
that some GPIO's specified on the local ship be hogged high or
low at probe. Generic DT bindings and generic code in gpiolib.c.

gpios-hog-high = <....>;
gpios-hog-low = <....>;

Yours,
Linus Walleij
