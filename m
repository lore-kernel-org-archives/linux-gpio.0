From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH v4 3/3] selftest/gpio: add gpio test case
Date: Wed, 16 Nov 2016 16:42:43 -0700
Message-ID: <7e8cac40-ccf1-d4c3-5a08-09969b273b11@osg.samsung.com>
References: <1476413307-1397-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1476413307-1397-4-git-send-email-bamvor.zhangjian@huawei.com>
 <CACRpkdbOnEs464MLoZDQ_eZ-O_stuyQJhy-L98ZzaKzcrn8FKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:47403
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753838AbcKPXmv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2016 18:42:51 -0500
In-Reply-To: <CACRpkdbOnEs464MLoZDQ_eZ-O_stuyQJhy-L98ZzaKzcrn8FKg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Michael Welling <mwelling@ieee.org>, Shuah Khan <shuahkh@osg.samsung.com>, Shuah Khan <shuah@kernel.org>

On 10/21/2016 05:54 AM, Linus Walleij wrote:
> On Fri, Oct 14, 2016 at 4:48 AM, Bamvor Jian Zhang
> <bamvor.zhangjian@huawei.com> wrote:
> 
>> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>>
>> This test script try to do whitebox testing for gpio subsystem(
>> based on gpiolib). It manipulate gpio device through chardev or
>> sysfs and check the result from debugfs. This script test
>> gpio-mockup through chardev by default.
>>
>> In details, it test the following things:
>> 1.  Add single, multi gpiochip to do overlap check.
>> 2.  Test direction and output value for valid pin.
>> 3.  Test dynamic allocation of gpio base.
>>
>> Run "tools/testing/selftests/gpio/gpio-mockup.sh -h" to know how to
>> use it.
>>
>> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
> 
> I like the overall idea with this, but some comments:
> 
>> +CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
> 
> Is this really what people are doing?
> 
> Isn't -I/usr/include the right way to express this?
> 
>> +LDLIBS += -lmount -I/usr/include/libmount
>> +
>> +$(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
>> +
>> +../../../gpio/gpio-utils.o:
>> +       make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
> 
> Ah, that is clever. I hope I can get an ACK from Shuah if this is
> how we're supposed to handle cross dependencies of common
> helper code in the kernel.
> 
> It looks a bit spaghetti, unfortunately.

Yeah it does. Let's get this in for now and we can try to improve
it.

Sorry for the delay, here is the ack


> 
>> +../../../../usr/include/linux/gpio.h:
>> +       make -C ../../../.. headers_install
> 
> Don't do this please, you would have to be root and it's very
> fragile. How does tests in general resolve dependencies on
> kernel headers? Please look around a bit and check what
> they do. I think they just expect them to be installed.

Yeah - it is a good idea to have the user install the headers.
It shouldn't be done in the script without use consent.

> 
> I like the tests overall, but I'm a bit suspicious about the
> sysfs tests. Maybe these should atleast print something
> about the sysfs ABI being deprecated.

Has this concern been addressed. Once the above are fixed.

Acked-by: Shuah Khan <shuahkh@osg.samsung.com>

> 
> Anyways I merged the first two patches so now we only have to
> figure out this final patch!

Acked-by: Shuah Khan <shuahkh@osg.samsung.com>


> 
> Yours,
> Linus Walleij
> 

