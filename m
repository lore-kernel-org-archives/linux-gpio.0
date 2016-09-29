From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Thu, 29 Sep 2016 15:16:26 +0300
Message-ID: <77b229dc-3fce-b953-b53b-a94a1fb0e109@mentor.com>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch>
 <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
 <20160928020052.GB2551@vireshk-i7>
 <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch>
 <1a113c0f-4ee3-e61a-8927-b5e8b558822c@mentor.com>
 <20160929064605.GB14138@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:32868 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753722AbcI2MQe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2016 08:16:34 -0400
In-Reply-To: <20160929064605.GB14138@vireshk-i7>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stefan Agner <stefan@agner.ch>, linus.walleij@linaro.org, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/29/2016 09:46 AM, Viresh Kumar wrote:
> On 28-09-16, 15:07, Vladimir Zapolskiy wrote:
>> I would expect that the change below improves the situation, but I didn't
>> perform any tests and here the core change is governed by the accepted
>> i.MX i2c bus driver specific changes, thus conceptually it may be incorrect:
>>
>> diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
>> index da3a02ef4a31..3a4f59c3c3e6 100644
>> --- a/drivers/i2c/i2c-core.c
>> +++ b/drivers/i2c/i2c-core.c
>> @@ -697,9 +697,6 @@ static int i2c_generic_recovery(struct i2c_adapter *adap)
>>  	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
>>  	int i = 0, val = 1, ret = 0;
>> -	if (bri->prepare_recovery)
>> -		bri->prepare_recovery(adap);
>> -
>>  	bri->set_scl(adap, val);
>>  	ndelay(RECOVERY_NDELAY);
>> @@ -725,22 +722,34 @@ static int i2c_generic_recovery(struct i2c_adapter *adap)
>>  		ndelay(RECOVERY_NDELAY);
>>  	}
>> -	if (bri->unprepare_recovery)
>> -		bri->unprepare_recovery(adap);
>> -
>>  	return ret;
>>  }
>>  int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>>  {
>> -	return i2c_generic_recovery(adap);
>> +	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
>> +	int ret;
>> +
>> +	if (bri->prepare_recovery)
>> +		bri->prepare_recovery(adap);
>> +
>> +	ret = i2c_generic_recovery(adap);
>> +
>> +	if (bri->unprepare_recovery)
>> +		bri->unprepare_recovery(adap);
>> +
>> +	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(i2c_generic_scl_recovery);
>>  int i2c_generic_gpio_recovery(struct i2c_adapter *adap)
>>  {
>> +	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
>>  	int ret;
>> +	if (bri->prepare_recovery)
>> +		bri->prepare_recovery(adap);
>> +
>>  	ret = i2c_get_gpios_for_recovery(adap);
>>  	if (ret)
>>  		return ret;
>> @@ -748,6 +757,9 @@ int i2c_generic_gpio_recovery(struct i2c_adapter *adap)
>>  	ret = i2c_generic_recovery(adap);
>>  	i2c_put_gpios_for_recovery(adap);
>> +	if (bri->unprepare_recovery)
>> +		bri->unprepare_recovery(adap);
>> +
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(i2c_generic_gpio_recovery);
>
> That looks to like a hack made just to make things work on one platform.

If you look at the top I agree that this solution may be only one platform
specific, but it fixes the broken driver of i.MX I2C bus controller.

Why do you get an impression that it looks like a hack?

> I would rather wait for an answer to my query first, which I asked in a separate
> email.
>

Why pinctrl_select_state() is not done in gpio_request_one()? Because
the first function gets pin mux/config setting and the second does not.
How do you intend to get pin mux/config setting in gpio_request_one()?

Anyway I don't see any problems in pinctrl or gpio subsystems, the bugs
must be addressed and fixed in i2c.

--
With best wishes,
Vladimir
