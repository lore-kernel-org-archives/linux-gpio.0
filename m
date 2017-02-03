From: Ye Xiaolong <xiaolong.ye@intel.com>
Subject: Re: [kbuild-all] [PATCH 1/3] pinctrl: intel: Add support for
 hardware debouncer
Date: Fri, 3 Feb 2017 10:34:44 +0800
Message-ID: <20170203023444.GD23647@yexl-desktop>
References: <20170127100716.194910-2-mika.westerberg@linux.intel.com>
 <201701271939.n1zsFVXi%fengguang.wu@intel.com>
 <20170127204905.GZ17297@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:65077 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751622AbdBCCfT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Feb 2017 21:35:19 -0500
Content-Disposition: inline
In-Reply-To: <20170127204905.GZ17297@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: kbuild test robot <lkp@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, kbuild-all@01.org, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On 01/27, Mika Westerberg wrote:
>On Fri, Jan 27, 2017 at 07:51:03PM +0800, kbuild test robot wrote:
>> Hi Mika,
>> 
>> [auto build test ERROR on pinctrl/for-next]
>> [also build test ERROR on v4.10-rc5 next-20170125]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>> 
>> url:    https://github.com/0day-ci/linux/commits/Mika-Westerberg/pinctrl-intel-Add-support-for-hardware-debouncer/20170127-181144
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
>> config: x86_64-randconfig-s5-01271855 (attached as .config)
>> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
>> reproduce:
>>         # save the attached .config to linux build tree
>>         make ARCH=x86_64 
>> 
>> All errors (new ones prefixed by >>):
>> 
>> >> drivers/pinctrl/intel/pinctrl-intel.c:754:2: error: unknown field 'set_config' specified in initializer
>>      .set_config = gpiochip_generic_config,
>>      ^
>> >> drivers/pinctrl/intel/pinctrl-intel.c:754:16: error: 'gpiochip_generic_config' undeclared here (not in a function)
>>      .set_config = gpiochip_generic_config,
>>                    ^~~~~~~~~~~~~~~~~~~~~~~
>
>Dear kbuild robot, thanks for spotting this. However, in this case the
>series is based on top of linux-pinctrl.git/devel branch which should
>include the missing changes.
>

Thanks for the message, we've added the devel branch as the apply base to fix it.

Thanks,
Xiaolong

>Keep up the good work, though :)
>_______________________________________________
>kbuild-all mailing list
>kbuild-all@lists.01.org
>https://lists.01.org/mailman/listinfo/kbuild-all
