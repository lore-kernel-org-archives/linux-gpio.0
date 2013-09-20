From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/7] staging: media/lirc: switch to use gpiolib
Date: Fri, 20 Sep 2013 21:24:12 +0200
Message-ID: <CACRpkdb9vdaJsURFx0-P_G-quGGm5Uwdn9_Bqy0QVtRZ7_g2qg@mail.gmail.com>
References: <1378816283-8164-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdaBeYTchtQn6-QThAv2XWAT=vd=YarHA1TgVZeLoLNfpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaBeYTchtQn6-QThAv2XWAT=vd=YarHA1TgVZeLoLNfpA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 13, 2013 at 9:14 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> Hi Mauro,
>
> On Tue, Sep 10, 2013 at 2:31 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> The lirc serial module has special hooks to work with NSLU2,
>> switch these over to use gpiolib, as that is available on the
>> ixp4 platform.
>>
>> Not even compile tested as there is no way to select this
>> driver from menuconfig on the ixp4 platform.
>>
>> Cc: Imre Kaloz <kaloz@openwrt.org>
>> Cc: Krzysztof Halasa <khc@pm.waw.pl>
>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Hi Greg: I'm seeking an ACK on this patch to take it through
>> the GPIO tree as part of a clean-up attempt to remove custom
>> GPIO APIs.
>
> Could you ACK this patch if it looks OK to you?

Mauro, ping on this.

Yours,
Linus Walleij
