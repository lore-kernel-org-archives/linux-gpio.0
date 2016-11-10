From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v10 6/6] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Thu, 10 Nov 2016 13:39:39 +0200
Message-ID: <1478777979.5295.106.camel@linux.intel.com>
References: <201611101847.t3kV2sXf%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201611101847.t3kV2sXf%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>, Tan Jui Nee <jui.nee.tan@intel.com>
Cc: kbuild-all@01.org, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

On Thu, 2016-11-10 at 18:40 +0800, kbuild test robot wrote:
> Hi Tan,
> 
> [auto build test WARNING on v4.9-rc4]
> [cannot apply to ljones-mfd/for-mfd-next platform-drivers-x86/for-next 
> tip/x86/core next-20161110]
> [if your patch is applied to the wrong git tree, please drop us a note
> to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Tan-Jui-Nee/pinctrl-b
> roxton-enable-platform-device-in-the-absent-of-ACPI-
> enumeration/20161110-170808
> config: x86_64-randconfig-x012-201645 (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All warnings (new ones prefixed by >>):
> 
> warning: (LPC_ICH) selects P2SB which has unmet direct dependencies
> (X86 && X86_PLATFORM_DEVICES && PCI)

Since it will need to be fixed and new version is suggested, I dare to
comment couple of patches.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
