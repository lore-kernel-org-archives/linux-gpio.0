From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 3/3] selftest/gpio: add gpio test case
Date: Fri, 21 Oct 2016 13:54:42 +0200
Message-ID: <CACRpkdbOnEs464MLoZDQ_eZ-O_stuyQJhy-L98ZzaKzcrn8FKg@mail.gmail.com>
References: <1476413307-1397-1-git-send-email-bamvor.zhangjian@huawei.com> <1476413307-1397-4-git-send-email-bamvor.zhangjian@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:34633 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752880AbcJULyn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2016 07:54:43 -0400
Received: by mail-qt0-f171.google.com with SMTP id q7so83024733qtq.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2016 04:54:43 -0700 (PDT)
In-Reply-To: <1476413307-1397-4-git-send-email-bamvor.zhangjian@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Michael Welling <mwelling@ieee.org>, shuahkh@osg.samsung.com

On Fri, Oct 14, 2016 at 4:48 AM, Bamvor Jian Zhang
<bamvor.zhangjian@huawei.com> wrote:

> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>
> This test script try to do whitebox testing for gpio subsystem(
> based on gpiolib). It manipulate gpio device through chardev or
> sysfs and check the result from debugfs. This script test
> gpio-mockup through chardev by default.
>
> In details, it test the following things:
> 1.  Add single, multi gpiochip to do overlap check.
> 2.  Test direction and output value for valid pin.
> 3.  Test dynamic allocation of gpio base.
>
> Run "tools/testing/selftests/gpio/gpio-mockup.sh -h" to know how to
> use it.
>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

I like the overall idea with this, but some comments:

> +CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/

Is this really what people are doing?

Isn't -I/usr/include the right way to express this?

> +LDLIBS += -lmount -I/usr/include/libmount
> +
> +$(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
> +
> +../../../gpio/gpio-utils.o:
> +       make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio

Ah, that is clever. I hope I can get an ACK from Shuah if this is
how we're supposed to handle cross dependencies of common
helper code in the kernel.

It looks a bit spaghetti, unfortunately.

> +../../../../usr/include/linux/gpio.h:
> +       make -C ../../../.. headers_install

Don't do this please, you would have to be root and it's very
fragile. How does tests in general resolve dependencies on
kernel headers? Please look around a bit and check what
they do. I think they just expect them to be installed.

I like the tests overall, but I'm a bit suspicious about the
sysfs tests. Maybe these should atleast print something
about the sysfs ABI being deprecated.

Anyways I merged the first two patches so now we only have to
figure out this final patch!

Yours,
Linus Walleij
