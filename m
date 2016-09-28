From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Wed, 28 Sep 2016 15:07:46 +0300
Message-ID: <1a113c0f-4ee3-e61a-8927-b5e8b558822c@mentor.com>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch>
 <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
 <20160928020052.GB2551@vireshk-i7>
 <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:51574 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753235AbcI1MHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2016 08:07:54 -0400
In-Reply-To: <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linus.walleij@linaro.org, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org



On 09/28/2016 06:38 AM, Stefan Agner wrote:
> On 2016-09-27 19:00, Viresh Kumar wrote:
>> On 27-09-16, 12:34, Stefan Agner wrote:
>>> Added Viresh Kumar to the discussion, he implemented the I2C recovery
>>> functions.
>>>
>>> Yes, reordering the pinctrl/gpio_free calls would fix the problem too.
>>>
>>> However, I guess there is no explicit rule to that ("request/free GPIOs
>>> only when they are muxed as GPIO"), so I think of it that the issue is
>>> actually in the pinctrl driver.
>>>
>>> On top of that it is not entirely trivial to reorder the calls the way
>>> i2c_generic_gpio_recovery and i2c_generic_recovery are set up right now.
>>
>> AFAICT, these routines don't touch the muxing part at all. Perhaps it is done
>> internally by the GPIO calls. Can you please elaborate the exact change you are
>> hinting towards here ?
>
> The i.MX I2C driver touches the pinctrl in its prepare/unprepare
> callbacks.
>
> So, on a i.MX or Vybrid, the call chain looks like this:
>
> i2c_generic_gpio_recovery
>     -> i2c_get_gpios_for_recovery
>        -> gpio_request_one
>     -> i2c_generic_recovery
>        -> prepare_recovery (i2c_imx_prepare_recovery)
>           -> pinctrl_select_state [gpio]
>        -> unprepare_recovery (i2c_imx_unprepare_recovery)
>           -> pinctrl_select_state [default]
>     -> i2c_put_gpios_for_recovery
>        -> gpio_free

I would expect that the change below improves the situation, but I didn't
perform any tests and here the core change is governed by the accepted
i.MX i2c bus driver specific changes, thus conceptually it may be incorrect:

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index da3a02ef4a31..3a4f59c3c3e6 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -697,9 +697,6 @@ static int i2c_generic_recovery(struct i2c_adapter *adap)
  	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
  	int i = 0, val = 1, ret = 0;
  
-	if (bri->prepare_recovery)
-		bri->prepare_recovery(adap);
-
  	bri->set_scl(adap, val);
  	ndelay(RECOVERY_NDELAY);
  
@@ -725,22 +722,34 @@ static int i2c_generic_recovery(struct i2c_adapter *adap)
  		ndelay(RECOVERY_NDELAY);
  	}
  
-	if (bri->unprepare_recovery)
-		bri->unprepare_recovery(adap);
-
  	return ret;
  }
  
  int i2c_generic_scl_recovery(struct i2c_adapter *adap)
  {
-	return i2c_generic_recovery(adap);
+	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
+	int ret;
+
+	if (bri->prepare_recovery)
+		bri->prepare_recovery(adap);
+
+	ret = i2c_generic_recovery(adap);
+
+	if (bri->unprepare_recovery)
+		bri->unprepare_recovery(adap);
+
+	return ret;
  }
  EXPORT_SYMBOL_GPL(i2c_generic_scl_recovery);
  
  int i2c_generic_gpio_recovery(struct i2c_adapter *adap)
  {
+	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
  	int ret;
  
+	if (bri->prepare_recovery)
+		bri->prepare_recovery(adap);
+
  	ret = i2c_get_gpios_for_recovery(adap);
  	if (ret)
  		return ret;
@@ -748,6 +757,9 @@ int i2c_generic_gpio_recovery(struct i2c_adapter *adap)
  	ret = i2c_generic_recovery(adap);
  	i2c_put_gpios_for_recovery(adap);
  
+	if (bri->unprepare_recovery)
+		bri->unprepare_recovery(adap);
+
  	return ret;
  }
  EXPORT_SYMBOL_GPL(i2c_generic_gpio_recovery);


Alternatively you may consider to add contents of i2c_get_gpios_for_recovery()
into i2c_imx_prepare_recovery(), contents of i2c_put_gpios_for_recovery() into
i2c_imx_unprepare_recovery() in the i.MX I2C bus driver and change the recovery
callback .recover_bus to i2c_generic_scl_recovery().

>
> And for the pinctrl/GPIO driver of Vybrid this is actually a problem
> because gpio_free disables the output driver of the pad, and when that
> happens after the (I2C) default pinctrl state gets selected the pad is
> no longer active.
>

--
With best wishes,
Vladimir
