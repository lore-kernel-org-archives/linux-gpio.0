From: "Tan, Jui Nee" <jui.nee.tan@intel.com>
Subject: RE: [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Tue, 12 Apr 2016 08:34:15 +0000
Message-ID: <0158A29DB680F54A88142ED28D55B1D008209DC3@PGSMSX107.gar.corp.intel.com>
References: <1460343044-1474-4-git-send-email-jui.nee.tan@intel.com>
 <201604111231.JOsx2OGx%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:13488 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755615AbcDLIeV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Apr 2016 04:34:21 -0400
In-Reply-To: <201604111231.JOsx2OGx%fengguang.wu@intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: lkp <lkp@intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>



> -----Original Message-----
> From: lkp
> Sent: Monday, April 11, 2016 12:35 PM
> To: Tan, Jui Nee <jui.nee.tan@intel.com>
> Cc: kbuild-all@01.org; mika.westerberg@linux.intel.com;
> heikki.krogerus@linux.intel.com; andriy.shevchenko@linux.intel.com;
> tglx@linutronix.de; mingo@redhat.com; hpa@zytor.com; x86@kernel.org;
> ptyser@xes-inc.com; lee.jones@linaro.org; linux-gpio@vger.kernel.org;
> linux-kernel@vger.kernel.org; Tan, Jui Nee <jui.nee.tan@intel.com>; Yong,
> Jonathan <jonathan.yong@intel.com>; Yu, Ong Hock
> <ong.hock.yu@intel.com>; Voon, Weifeng <weifeng.voon@intel.com>; Wan
> Mohamad, Wan Ahmad Zainie
> <wan.ahmad.zainie.wan.mohamad@intel.com>
> Subject: Re: [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO
> pinctrl in non-ACPI system
> 
> Hi Tan,
> 
> [auto build test ERROR on tip/x86/core]
> [also build test ERROR on v4.6-rc3 next-20160408] [if your patch is applied to
> the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Tan-Jui-Nee/pinctrl-
> broxton-enable-platform-device-in-the-absent-of-ACPI-
> enumeration/20160411-105542
> config: x86_64-randconfig-n0-04111131 (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
> 
> All error/warnings (new ones prefixed by >>):
> 
>    drivers/mfd/lpc_ich.c:204:22: error: invalid application of 'sizeof' to
> incomplete type 'struct pinctrl_pin_desc'
>      .pdata_size = sizeof(apl_pinctrl_pdata),
>                          ^
>    drivers/mfd/lpc_ich.c: In function 'lpc_ich_misc':
>    drivers/mfd/lpc_ich.c:1146:4: error: invalid use of undefined type 'struct
> pinctrl_pin_desc'
>        apl_pinctrl_pdata.name = kasprintf(GFP_KERNEL, "%u",
>        ^
>    drivers/mfd/lpc_ich.c:1148:4: error: invalid use of undefined type 'struct
> pinctrl_pin_desc'
>        if (apl_pinctrl_pdata.name)
>        ^
>    drivers/mfd/lpc_ich.c:1148:4: error: invalid use of undefined type 'struct
> pinctrl_pin_desc'
>    In file included from include/linux/linkage.h:4:0,
>                     from include/linux/kernel.h:6,
>                     from drivers/mfd/lpc_ich.c:63:
> >> include/linux/compiler.h:150:17: error: invalid use of undefined type
> 'struct pinctrl_pin_desc'
>       static struct ftrace_branch_data   \
>                     ^
>    include/linux/compiler.h:145:23: note: in expansion of macro '__trace_if'
>     #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
>                           ^
> >> drivers/mfd/lpc_ich.c:1148:4: note: in expansion of macro 'if'
>        if (apl_pinctrl_pdata.name)
>        ^
>    drivers/mfd/lpc_ich.c:1158:7: error: invalid use of undefined type 'struct
> pinctrl_pin_desc'
>           apl_pinctrl_pdata.name, ret);
>           ^
>    drivers/mfd/lpc_ich.c:1160:4: error: invalid use of undefined type 'struct
> pinctrl_pin_desc'
>        kfree(apl_pinctrl_pdata.name);
>        ^
> 
> vim +150 include/linux/compiler.h
> 
> 2bcd521a Steven Rostedt 2008-11-21  144   */
> ab3c9c68 Linus Torvalds 2009-04-07  145  #define if(cond, ...) __trace_if(
> (cond , ## __VA_ARGS__) )
> ab3c9c68 Linus Torvalds 2009-04-07  146  #define __trace_if(cond) \
> ab3c9c68 Linus Torvalds 2009-04-07  147  	if
> (__builtin_constant_p((cond)) ? !!(cond) :			\
> 2bcd521a Steven Rostedt 2008-11-21  148  	({
> 					\
> 2bcd521a Steven Rostedt 2008-11-21  149  		int ______r;
> 					\
> 2bcd521a Steven Rostedt 2008-11-21 @150  		static struct
> ftrace_branch_data			\
> 2bcd521a Steven Rostedt 2008-11-21  151
> 	__attribute__((__aligned__(4)))			\
> 2bcd521a Steven Rostedt 2008-11-21  152
> 	__attribute__((section("_ftrace_branch")))	\
> 2bcd521a Steven Rostedt 2008-11-21  153  			______f = {
> 					\
> 
> :::::: The code at line 150 was first introduced by commit
> :::::: 2bcd521a684cc94befbe2ce7d5b613c841b0d304 trace: profile all if
> conditionals
> 
> :::::: TO: Steven Rostedt <srostedt@redhat.com>
> :::::: CC: Ingo Molnar <mingo@elte.hu>
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
Hi Andy, I will send patch v2 that looks like:

+static int lpc_ich_misc(struct pci_dev *dev, enum lpc_chipsets chipset)
+{
...
+	const char *name;
...
+			/* Fill IRQ resource */
+			res->start = APL_GPIO_IRQ;
+			res->end = res->start;
+			res->flags = IORESOURCE_IRQ;
+
+			name = kasprintf(GFP_KERNEL, "%u", i + 1);
+			if (name)
+				ret = mfd_add_devices(&dev->dev, i,
+					&apl_gpio_devices, 1, NULL, 0, NULL);
+			else
+				ret = -ENOMEM;
+
+warn_continue:
+			if (ret)
+				dev_warn(&dev->dev,
+					"Failed to add Apollo Lake GPIO %s: %d\n",
+						name, ret);
+
+			kfree(name);
...
Please let me know if that isn't the right thing. Thanks.
