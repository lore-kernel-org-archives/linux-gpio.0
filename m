From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/2] gpio: designware: add gpio-signaled acpi events support
Date: Thu, 25 Feb 2016 11:01:58 +0100
Message-ID: <CACRpkdYN_7c30-cOp4F=3ZfLoWY7uU9DWcvRk7+xUEQuaDj4nQ@mail.gmail.com>
References: <1456210972-60639-1-git-send-email-qiujiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1456210972-60639-1-git-send-email-qiujiang@huawei.com>
Sender: linux-acpi-owner@vger.kernel.org
To: qiujiang <qiujiang@huawei.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linuxarm@huawei.com, haifeng.wei@huawei.com, charles.chenxin@huawei.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 23, 2016 at 8:02 AM, qiujiang <qiujiang@huawei.com> wrote:

> This patchset adds gpio-signaled acpi events support for power button
> on hisilicon D02 board.
>
> The two patches respectively:
>         - switch device_node to unified fwnode handle
>         - adds gpio-signaled acpi events support for power button
>
>    This patchset is based on
>    https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
>    branch "devel"
>
> Changes v1 -> v2:
>    - rebase to branch "devel" of Linus Walleij's repository
>    - split in two patchs as suggested by Andy S
>    - add Mika's ACKs

There is a build error on X86 for patch 1 so I guess a v3 is needed.

Yours,
Linus Walleij
