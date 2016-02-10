From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] gpio: ath79: Make the driver removable
Date: Wed, 10 Feb 2016 11:13:38 +0100
Message-ID: <CACRpkdb88j_YrkzKnpJcJuH7JM9k92jDdBcL3WL2EeyJvMVNSg@mail.gmail.com>
References: <1454010273-21513-1-git-send-email-albeu@free.fr>
	<1454010273-21513-3-git-send-email-albeu@free.fr>
	<CAAVeFuL4c6PNnf+YdRZ2ePfk1FVOYmbsg9WnV_1hJe-OHv=77w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuL4c6PNnf+YdRZ2ePfk1FVOYmbsg9WnV_1hJe-OHv=77w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Alban Bedel <albeu@free.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 8, 2016 at 4:04 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Fri, Jan 29, 2016 at 4:44 AM, Alban Bedel <albeu@free.fr> wrote:
>> As we now allow the driver to be built as a module it should be
>> removable.
>>
>> Signed-off-by: Alban Bedel <albeu@free.fr>
>> ---
>>  drivers/gpio/gpio-ath79.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
>> index afb535e..6b15792 100644
>> --- a/drivers/gpio/gpio-ath79.c
>> +++ b/drivers/gpio/gpio-ath79.c
>> @@ -46,6 +46,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
>>         ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
>>         if (!ctrl)
>>                 return -ENOMEM;
>> +       platform_set_drvdata(pdev, ctrl);
>>
>>         if (np) {
>>                 err = of_property_read_u32(np, "ngpios", &ath79_gpio_count);
>> @@ -97,12 +98,21 @@ static int ath79_gpio_probe(struct platform_device *pdev)
>>         return 0;
>>  }
>>
>> +static int ath79_gpio_remove(struct platform_device *pdev)
>> +{
>> +       struct ath79_gpio_ctrl *ctrl = platform_get_drvdata(pdev);
>
> platform_get_drvdata will return a gpio_chip *.

No it will return a struct ath79_gpio_ctrl * AFAICT.

bgpio will set the driver data to the gc but not when using generic gpio
as library like this driver does, only when it is used as a stand-alone device.

Yours,
Linus Walleij
