From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Fix OF build problem on UM
Date: Fri, 19 Aug 2016 10:53:17 +0200
Message-ID: <CACRpkdY+8beEcyvx1TYZr_=Q9zdvj8PoWX4qL+UoiEGS1ppBpA@mail.gmail.com>
References: <1471334801-2814-1-git-send-email-linus.walleij@linaro.org> <CAMuHMdU3j6_sye_WqKgcReD+Nym-2=ymEh98D50nD2jEifOXRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU3j6_sye_WqKgcReD+Nym-2=ymEh98D50nD2jEifOXRQ@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 17, 2016 at 11:03 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Aug 16, 2016 at 10:06 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> The UserMode (UM) Linux build was failing in gpiolib-of as it requires
>> ioremap()/iounmap() to exist, which is absent from UM. The non-existence
>> of IO memory is negatively defined as CONFIG_NO_IOMEM so put a reverse
>> dependency on !NO_IOMEM for OF_GPIO to fix the build.
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: kbuild test robot <fengguang.wu@intel.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/gpio/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 98dd47a30fc7..a6026f2fe7f5 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -50,6 +50,7 @@ config GPIO_DEVRES
>>  config OF_GPIO
>>         def_bool y
>>         depends on OF
>> +       depends on !NO_IOMEM
>
> depends on HAS_IOMEM?

Apparently not, and that is the scary thing.

HAS_IOMEM depends on !NO_IOMEM indeed but
it also selects GENERIC_IO, and AFAICT there are
some configs out there in the intersection between,
that have IOMEM but are not using GENERIC_IO,
tell me if I'm wrong :/

Linus Walleij
