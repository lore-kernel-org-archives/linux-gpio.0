From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/8] IOP GPIO refactoring
Date: Fri, 20 Sep 2013 21:50:59 +0200
Message-ID: <CACRpkdZHt7b10mNz6+8UYHE7BT81whU-8uwTU6HiOh8H-AKHvw@mail.gmail.com>
References: <1378741198-12847-1-git-send-email-linus.walleij@linaro.org>
	<20130910141434.GD3379@blackmetal.musicnaut.iki.fi>
	<CACRpkdYbHTF0XGu-wLAeaw-nnSTEPh-ej9iizMbojmB8gzvb=Q@mail.gmail.com>
	<20130913161710.GA22033@blackmetal.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:50717 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751721Ab3ITTu7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 15:50:59 -0400
Received: by mail-ob0-f181.google.com with SMTP id gq1so1102819obb.26
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 12:50:59 -0700 (PDT)
In-Reply-To: <20130913161710.GA22033@blackmetal.musicnaut.iki.fi>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>, Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Sep 13, 2013 at 6:17 PM, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> On Fri, Sep 13, 2013 at 10:15:58AM +0200, Linus Walleij wrote:
>> On Tue, Sep 10, 2013 at 4:14 PM, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>> > With patch 6 it starts to crash on first gpio_get_value(), I guess
>> > because gpio-iop platform device is not registered on N2100...?
>>
>> I think I've fixed this with the v2 versions of patches 1-3, you can
>> pull in and test the entire stack on Torvalds HEAD from here:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git iop-cleanup
>
> It's still crashing.

Hm I've missed a couple of boards, I misunderstood the arrangement
of files here, let me iterate the set.

Yours,
Linus Walleij
