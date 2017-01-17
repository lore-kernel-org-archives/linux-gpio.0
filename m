From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 0/3] gpio: davinci: Redesign driver to accommodate ngpios
 in one gpio chip
Date: Tue, 17 Jan 2017 21:44:08 +0530
Message-ID: <9681e3d1-b769-286c-82e7-6cff85707c9e@ti.com>
References: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
 <CACRpkdbXZ3ZCLAUz-2WfVvMx5H2kaDVCOoJAX=zHhNFv5z-zpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:33899 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751250AbdAQQOP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2017 11:14:15 -0500
In-Reply-To: <CACRpkdbXZ3ZCLAUz-2WfVvMx5H2kaDVCOoJAX=zHhNFv5z-zpQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tero Kristo <t-kristo@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>



On Tuesday 17 January 2017 08:22 PM, Linus Walleij wrote:
> On Wed, Jan 11, 2017 at 6:00 AM, Keerthy <j-keerthy@ti.com> wrote:
>
>> The Davinci GPIO driver is implemented to work with one monolithic
>> Davinci GPIO platform device which may have up to Y(144) gpios.
>
> I'm a bit confused by the different DaVinci series since there seem
> to be different series floating and I don't know what order to apply them,
> it fails for me.
>
> Can you:
>
> - Rebase *ALL* your DaVinci work on top of the "devel" branch in the
>   GPIO tree.
>
> - Repost *ALL* patches that should be applied, in one batch.
>
> - Include any accumulated ACKs etc.

:-)

I have already posted a consolidated v2:
http://www.spinics.net/lists/linux-gpio/msg19109.html

Then seems like patch 6/6 is not required. So i will be posting the 
final set with Grygorii's reviewed-by. You can directly pick the v3 set.

Thanks,
Keerthy


>
> Yours,
> Linus Walleij
>
