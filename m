From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] pinctrl: pxa: guard sub-directory with CONFIG_PINCTRL_PXA
Date: Sat, 23 Jan 2016 23:22:02 +0100
Message-ID: <87bn8caqd1.fsf@belgarion.home>
References: <1453563068-30238-1-git-send-email-yamada.masahiro@socionext.com>
	<201601240153.JKh5FNDu%fengguang.wu@intel.com>
	<CAK7LNATA6wZUC_ASNHVbACD5rGFR9vZpRbfXaz7dfsne84nDfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:36497 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754822AbcAWWWE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2016 17:22:04 -0500
In-Reply-To: <CAK7LNATA6wZUC_ASNHVbACD5rGFR9vZpRbfXaz7dfsne84nDfQ@mail.gmail.com>
	(Masahiro Yamada's message of "Sun, 24 Jan 2016 04:35:19 +0900")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> 2016-01-24 2:56 GMT+09:00 kbuild test robot <lkp@intel.com>:
>> Hi Masahiro,
>>
>> [auto build test ERROR on next-20160122]
>> [cannot apply to v4.4-rc8 v4.4-rc7 v4.4-rc6 v4.4]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
>>
>> url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/pinctrl-pxa-guard-sub-directory-with-CONFIG_PINCTRL_PXA/20160123-233501
>> config: x86_64-allmodconfig (attached as .config)
>> reproduce:
>>         # save the attached .config to linux build tree
>>         make ARCH=x86_64
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ERROR: "pxa2xx_pinctrl_init" [drivers/pinctrl/pxa/pinctrl-pxa27x.ko] undefined!
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>
>
> driver/pinctrl/pxa/ has never been compile-tested before,
It was, and runtime tested also, in a builtin form. It was not activated in the
kernel at the arch/arm pxa architecture level would be a better statement.

> [2]  this driver is declared as tristate, but it cannot be a module,
> so I posted this:
> https://patchwork.kernel.org/patch/8097781/
Yes this certainly is a bug.

> I hope [2] will be applied before this patch
> in order to suppress the complaint by the kbuild test robot.
Let's see what Linus thinks of it.

Cheers.

-- 
Robert
