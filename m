From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Subject: Re: [PATCH v4 3/3] selftest/gpio: add gpio test case
Date: Fri, 21 Oct 2016 22:43:12 +0800
Message-ID: <CAFy1USS+fXz-b0Rsfns9qaY27Dh+MOSYHU_-PMZH0QH3wmx6VA@mail.gmail.com>
References: <1476413307-1397-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1476413307-1397-4-git-send-email-bamvor.zhangjian@huawei.com> <CACRpkdbOnEs464MLoZDQ_eZ-O_stuyQJhy-L98ZzaKzcrn8FKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f169.google.com ([209.85.213.169]:36148 "EHLO
        mail-yb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934355AbcJUOnN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2016 10:43:13 -0400
Received: by mail-yb0-f169.google.com with SMTP id 191so41818241ybv.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2016 07:43:13 -0700 (PDT)
In-Reply-To: <CACRpkdbOnEs464MLoZDQ_eZ-O_stuyQJhy-L98ZzaKzcrn8FKg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Michael Welling <mwelling@ieee.org>, Shuah Khan <shuahkh@osg.samsung.com>, Ben Hutchings <ben@decadent.org.uk>, rdunlap@infradead.org, acme@redhat.com

Hi, Linus

On 21 October 2016 at 19:54, Linus Walleij <linus.walleij@linaro.org> wrote:
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
"/usr/include" is not correct for cross-compiling.

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
There are similar code in "tools/perf/tests/make". But I am not sure
if it is who I suppose to do.

> It looks a bit spaghetti, unfortunately.
>
>> +../../../../usr/include/linux/gpio.h:
>> +       make -C ../../../.. headers_install
>
> Don't do this please, you would have to be root and it's very
> fragile.
Sorry for this. At least, I should make use of INSTALL_HDR_PATH.

>How does tests in general resolve dependencies on
>kernel headers? Please look around a bit and check what
>they do. I think they just expect them to be installed.
I check the relative file through "grep usr.include tools/ -R -l",
there are three types:
1.  Use relative path like me but do not "make headers_install"
2.  Like my patch: use relative path and install headers when missing.
3.  Use /usr/include

And there is a discussion from Ben Hutchings[1]:
   Tools include UAPI headers in one of two ways, neither of which is
   reliable:
   - Assume the current headers are on the system include path
   - Include unprocessed UAPI headers through a relative path

   The right thing to do is to run 'make headers_install' and add
   usr/ to the front of the system include path.  But we'd want a
   way to avoid re-doing that when the UAPI headers haven't changed.

And there is a checker in "tools/perf/Makefile.perf" for $(PERF_IN)
target. But it is very long. We definitely need a better solution.
It may be in seperate patch.

how about introduce a dedicate Makefile in tools directory which
install necessary header to user defined path
(path/to/linux/usr/include by default)?

Or I just remove the following lines in this patch, and update it after
we find better solution?
../../../../usr/include/linux/gpio.h:
       make -C ../../../.. headers_install

cc: Ben Hutchings, Randy Dunlap and Arnaldo Carvalho de Melo.

>I like the tests overall, but I'm a bit suspicious about the
>sysfs tests. Maybe these should atleast print something
>about the sysfs ABI being deprecated.
Sound reasonable. I could add a prompt and wait user confirm when user
want to test through sysfs. Is it what you want?
I think we could remove the sysfs script when we remove the sysfs
interface of gpio in kernel.
>
>Anyways I merged the first two patches so now we only have to
>figure out this final patch!
Thanks all your help:)

Regards

Bamvor
>
>Yours,
>Linus Walleij

[1] https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2016-August/003270.html


> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
