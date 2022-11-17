Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67B3C433FE
	for <linux-gpio@archiver.kernel.org>; Thu, 17 Nov 2022 14:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbiKQOMh (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 17 Nov 2022 09:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234866AbiKQOMg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 09:12:36 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7F462065
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 06:12:34 -0800 (PST)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NChgb5M1kzRpHL;
        Thu, 17 Nov 2022 22:12:11 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 22:12:32 +0800
Message-ID: <3ccf3b72-a3dd-66fe-4d8a-b22140ed9364@huawei.com>
Date:   Thu, 17 Nov 2022 22:12:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3] gpiolib: fix memory leak in gpiochip_setup_dev()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     <brgl@bgdev.pl>, <linux@roeck-us.net>, <linus.walleij@linaro.org>,
        <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>,
        <liwei391@huawei.com>
References: <f118d0b1-1bf2-b710-c3b4-2745c72f02b3@huawei.com>
 <20221117090247.122980-1-zengheng4@huawei.com>
 <Y3YR0rBSWHu5WhfL@smile.fi.intel.com>
From:   Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <Y3YR0rBSWHu5WhfL@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2022/11/17 18:49, Andy Shevchenko wrote:
> On Thu, Nov 17, 2022 at 05:02:47PM +0800, Zeng Heng wrote:
>> Here is a report about memory leak detected in gpiochip_setup_dev():
>>
>> unreferenced object 0xffff88810b406400 (size 512):
>>    comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
>>    backtrace:
>>      kmalloc_trace
>>      device_add 		device_private_init at drivers/base/core.c:3361
> Seems like unneeded space after device_add. Also note, we refer to
> the functions as func().
Just emphasize the location of memory leak happened.
>> 			(inlined by) device_add at drivers/base/core.c:3411
>>      cdev_device_add
>>      gpiolib_cdev_register
>>      gpiochip_setup_dev
>>      gpiochip_add_data_with_key
>>
>> gcdev_register() & gcdev_unregister() would call device_add() &
>> device_del() (no matter CONFIG_GPIO_CDEV is enabled or not) to
>> register/unregister device.
>>
>> However, if device_add() succeeds, some resource (like
>> struct device_private allocated by device_private_init())
>> is not released by device_del().
>>
>> Therefore, after device_add() succeeds by gcdev_register(), it
>> needs to call put_device() to release resource in the error handle
>> path.
>>
>> Here we move forward the register of release function, and let it
>> release every piece of resource by put_device() instead of kfree().
>>
>> Fixes: 159f3cd92f17 ("gpiolib: Defer gpio device setup until after gpiolib initialization")
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> ---
> Where is changelog since we see this as v3?
>
> ...

change in v3:

     - use put_device() instead of kfree()

>>   err_free_gpiochip_mask:
>>   	gpiochip_remove_pin_ranges(gc);
>>   	gpiochip_free_valid_mask(gc);
>> +	/*
>> +	 * If gdev->dev.release has been registered by
>> +	 * gpiochip_setup_dev(), print err msg and
>> +	 * call put_device() to release all.
>> +	 */
>> +	if (gdev->dev.release)
>> +		goto err_free_gdev;
> (1)
>
>>   err_remove_from_list:
>>   	spin_lock_irqsave(&gpio_lock, flags);
>>   	list_del(&gdev->list);
> ...
>
>> -	kfree(gdev);
>> +	if (gdev->dev.release)
>> +		put_device(&gdev->dev);
> Why you can't do this above at (1)?
> Is there any other hidden way to get here with release set?

As already mentioned in the mail, keep the error print info.

B.R.，

Zeng Heng

>> +	else
>> +		kfree(gdev);
>>   	return ret;
