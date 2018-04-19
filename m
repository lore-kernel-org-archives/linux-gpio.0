From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/21] regulator: arizona-ldo1: Look up a descriptor and
 pass to the core
Date: Thu, 19 Apr 2018 15:43:22 +0200
Message-ID: <CACRpkdbOfycfGD-13OTEk7xT5FqLQsvcHrN-mn-vgjQ93cPHyQ@mail.gmail.com>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
 <20180212131717.27193-6-linus.walleij@linaro.org> <20180213110631.o3zn5bifvypofsyg@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180213110631.o3zn5bifvypofsyg@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 13, 2018 at 12:06 PM, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Mon, Feb 12, 2018 at 02:17:01PM +0100, Linus Walleij wrote:
>> Instead of passing a global GPIO number, pass a descriptor looked
>> up with the standard devm_gpiod_get_optional() call.
>>
>> We have augmented the GPIO core to look up the regulator special
>> GPIO "wlf,ldoena" in a separate patch.
>>
>> Cc: patches@opensource.cirrus.com
>> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/regulator/arizona-ldo1.c       | 19 ++++++-------------
>>  include/linux/regulator/arizona-ldo1.h |  3 ---
>>  2 files changed, 6 insertions(+), 16 deletions(-)
>>
>
> Does this patch not also need to update the hookups in
> arch/arm/mach-s3c64xx/mach-crag6410-module.c? There is
> wm5102_reva_pdata and wm5102_pdata both of which use the ldoena
> you are removing here?

OK fixed this!

> Also looking at this more you will need to you
> devm_gpio_get_from_of_node here since the device tree binding is
> for wlf,ldoena not wlf,ldoena-gpio. So this patch currently
> breaks the binding.

Actually not, because I fixed that in  the special quirk patch
6a537d48461d
"gpio: of: Support regulator nonstandard GPIO properties"
as mentioned in the commit message. (Will clarify.)

Yours,
Linus Walleij
