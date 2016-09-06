From: Peter Rosin <peda@axentia.se>
Subject: Re: [RFC PATCH] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Tue, 6 Sep 2016 08:44:48 +0200
Message-ID: <85f4ae6f-2563-967c-1e75-28a864405f53@axentia.se>
References: <1472130692-14404-1-git-send-email-narmstrong@baylibre.com>
 <CACRpkdZJy6N2uCnPLrM0V=67=xJzge94bYesHjL3r4itgE-9GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZJy6N2uCnPLrM0V=67=xJzge94bYesHjL3r4itgE-9GA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Wei Chen <Wei.Chen@csr.com>, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 2016-09-06 00:47, Linus Walleij wrote:
> On Thu, Aug 25, 2016 at 3:11 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> Since the I2C sx150x GPIO expander driver uses platform_data to managed
>> the pins configurations, rewrite the driver as a pinctrl driver using
>> pinconf to get pin configurations from DT.
>>
>> The pinctrl driver is functionnally as the gpio-only driver equivalent
>> and can use DT for pinconf.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Overall I'd say this is a nice rewrite. I'd like the following:
> 
> - Include Peter Rosin, Wei Chen, Roland Stigge and Vladimir
>   Zapolskiy on subsequent posts
>   (Added on To:) ideally I want Tested-by: tags from them
>   to verify that it doesn't break their current set-ups
>   (does it? Especially LPC32xx)

I intend to test this, but it might be a couple of days. I need
to bring the damn thing out of the closet and find the right
cables etc etc. And I of course have other stuff to do as well...

> - We need a migration plan: everything that was selecting
>   GPIO_SX150X before should now select this instead.
>   Just let the Kconfig entry in the drivers/gpio/Kconfig select
>   this new driver?
> 
> - Make sure it is a slot-in replacement. Else make sure it
>   is.
> 
> - Delete the old sx150x driver from drivers/gpio in the same
>   patch. I'd hate to maintain them side by side. If I apply this,
>   the old one must go out at the same time. Conversely I can
>   revert the patch and get the old driver back.
> 
> - Strangely I don't see refernces to this driver in any
>   device tree. Are people not upstreaming their boards?

No, we have not, because we depend on yet to be upstreamed drivers
for all of our boards, sometimes written by us, sometimes from
the CPU vendor. For this driver, we were using a rejected patch
to configure the pins from DT in the gpio driver written by
Wei Chen [1] that I adapted to also handle sx1502. I in fact had
vague plans to move sx150x over to pinctrl myself so this is most
welcome. It also means that *we* do not really need it to be a
slot-in replacement, as there will be DT changes for our board
because of this anyway given that we will have to back out that
old gpio-dt patch. But that is not a problem *for* *us*, and I'll
be pleased to take the churn, assuming it works in the end :-)

One thing I noted at the very end of the patch was that I on
first glance did not see any i2c_del_driver call, maybe use the
module_i2c_driver macro?

Cheers,
Peter

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/316615.html
