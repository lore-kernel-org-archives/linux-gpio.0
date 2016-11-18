From: "Zhangjian (Bamvor)" <bamvor.zhangjian@huawei.com>
Subject: Re: [PATCH v4 3/3] selftest/gpio: add gpio test case
Date: Fri, 18 Nov 2016 19:41:21 +0800
Message-ID: <e1094e1e-9af6-0eea-84ca-aa1ce50e9220@huawei.com>
References: <1476413307-1397-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1476413307-1397-4-git-send-email-bamvor.zhangjian@huawei.com>
 <CACRpkdbOnEs464MLoZDQ_eZ-O_stuyQJhy-L98ZzaKzcrn8FKg@mail.gmail.com>
 <7e8cac40-ccf1-d4c3-5a08-09969b273b11@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga04-in.huawei.com ([119.145.14.52]:37590 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751662AbcKRLvU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2016 06:51:20 -0500
In-Reply-To: <7e8cac40-ccf1-d4c3-5a08-09969b273b11@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Michael Welling <mwelling@ieee.org>, Shuah Khan <shuah@kernel.org>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>

Hi, Shuah

On 2016/11/17 7:42, Shuah Khan wrote:
> On 10/21/2016 05:54 AM, Linus Walleij wrote:
>> On Fri, Oct 14, 2016 at 4:48 AM, Bamvor Jian Zhang
>> <bamvor.zhangjian@huawei.com> wrote:
>>
>>> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>>>
>>> This test script try to do whitebox testing for gpio subsystem(
>>> based on gpiolib). It manipulate gpio device through chardev or
>>> sysfs and check the result from debugfs. This script test
>>> gpio-mockup through chardev by default.
>>>
>>> In details, it test the following things:
>>> 1.  Add single, multi gpiochip to do overlap check.
>>> 2.  Test direction and output value for valid pin.
>>> 3.  Test dynamic allocation of gpio base.
>>>
>>> Run "tools/testing/selftests/gpio/gpio-mockup.sh -h" to know how to
>>> use it.
>>>
>>> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>>
>> I like the overall idea with this, but some comments:
>>
>>> +CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
>>
>> Is this really what people are doing?
>>
>> Isn't -I/usr/include the right way to express this?
>>
>>> +LDLIBS += -lmount -I/usr/include/libmount
>>> +
>>> +$(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
>>> +
>>> +../../../gpio/gpio-utils.o:
>>> +       make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
>>
>> Ah, that is clever. I hope I can get an ACK from Shuah if this is
>> how we're supposed to handle cross dependencies of common
>> helper code in the kernel.
>>
>> It looks a bit spaghetti, unfortunately.
>
> Yeah it does. Let's get this in for now and we can try to improve
> it.
>
> Sorry for the delay, here is the ack
>
>
>>
>>> +../../../../usr/include/linux/gpio.h:
>>> +       make -C ../../../.. headers_install
>>
>> Don't do this please, you would have to be root and it's very
>> fragile. How does tests in general resolve dependencies on
>> kernel headers? Please look around a bit and check what
>> they do. I think they just expect them to be installed.
>
> Yeah - it is a good idea to have the user install the headers.
> It shouldn't be done in the script without use consent.
I am tring to follow you. Do you want a better solution or just
install to usr/include(and update all the similar issue in
tools or selftests in another patch)?

../../../../usr/include/linux/gpio.h:
         make -C ../../../.. headers_install INSTALL_HDR_PATH=`pwd`/../../../../usr/
>
>>
>> I like the tests overall, but I'm a bit suspicious about the
>> sysfs tests. Maybe these should atleast print something
>> about the sysfs ABI being deprecated.
>
> Has this concern been addressed. Once the above are fixed.
Sure. I will add a warning for sysfs ABI of gpio.

Regards

Bamvor
>
> Acked-by: Shuah Khan <shuahkh@osg.samsung.com>
>
>>
>> Anyways I merged the first two patches so now we only have to
>> figure out this final patch!
>
> Acked-by: Shuah Khan <shuahkh@osg.samsung.com>
>
>
>>
>> Yours,
>> Linus Walleij
>>
>

