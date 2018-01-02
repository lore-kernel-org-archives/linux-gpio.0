From: kbuild test robot <fengguang.wu@intel.com>
Subject: [gpio:gpio-descriptors-regulator 25/26]
 arch/arm/mach-pxa/hx4700.c:703:33: error: expected identifier or '(' before
 '[' token
Date: Tue, 2 Jan 2018 23:28:45 +0800
Message-ID: <201801022343.DTv0ADM4%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:50364 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751263AbeABP3C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jan 2018 10:29:02 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild-all@01.org, linux-gpio@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-regulator
head:   0e78939e6e7091d8e0cb6d259758eab6874145e6
commit: 799f4f3ffaaa280304c4991c85da49f546067e62 [25/26] regulator: gpio: Convert to fully use descriptors
config: arm-magician_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 799f4f3ffaaa280304c4991c85da49f546067e62
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

All error/warnings (new ones prefixed by >>):

>> arch/arm/mach-pxa/hx4700.c:703:33: error: expected identifier or '(' before '[' token
    static enum bq24022_gpiod_gflags[] = { GPIOD_OUT_LOW };
                                    ^
>> arch/arm/mach-pxa/hx4700.c:715:12: error: 'bq24022_gpiod_flags' undeclared here (not in a function); did you mean 'bq24022_gpiod_gflags'?
     .gflags = bq24022_gpiod_flags,
               ^~~~~~~~~~~~~~~~~~~
               bq24022_gpiod_gflags
   In file included from arch/arm/mach-pxa/hx4700.c:17:0:
>> arch/arm/mach-pxa/hx4700.c:716:23: error: 'bq24022_gpiod_gflags' undeclared here (not in a function)
     .ngpios = ARRAY_SIZE(bq24022_gpiod_gflags),
                          ^
   include/linux/kernel.h:71:33: note: in definition of macro 'ARRAY_SIZE'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                    ^~~
   In file included from include/linux/kernel.h:15:0,
                    from arch/arm/mach-pxa/hx4700.c:17:
   include/linux/build_bug.h:30:45: error: bit-field '<anonymous>' width not an integer constant
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
                                                ^
   include/linux/compiler-gcc.h:65:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                               ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:71:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^~~~~~~~~~~~~~~
>> arch/arm/mach-pxa/hx4700.c:716:12: note: in expansion of macro 'ARRAY_SIZE'
     .ngpios = ARRAY_SIZE(bq24022_gpiod_gflags),
               ^~~~~~~~~~
--
>> arch/arm/mach-pxa/magician.c:649:33: error: expected identifier or '(' before '[' token
    static enum bq24022_gpiod_gflags[] = { GPIOD_OUT_LOW };
                                    ^
>> arch/arm/mach-pxa/magician.c:661:12: error: 'bq24022_gpiod_flags' undeclared here (not in a function); did you mean 'bq24022_gpiod_gflags'?
     .gflags = bq24022_gpiod_flags,
               ^~~~~~~~~~~~~~~~~~~
               bq24022_gpiod_gflags
   In file included from arch/arm/mach-pxa/magician.c:16:0:
>> arch/arm/mach-pxa/magician.c:662:23: error: 'bq24022_gpiod_gflags' undeclared here (not in a function)
     .ngpios = ARRAY_SIZE(bq24022_gpiod_gflags),
                          ^
   include/linux/kernel.h:71:33: note: in definition of macro 'ARRAY_SIZE'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                    ^~~
   In file included from include/linux/kernel.h:15:0,
                    from arch/arm/mach-pxa/magician.c:16:
   include/linux/build_bug.h:30:45: error: bit-field '<anonymous>' width not an integer constant
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
                                                ^
   include/linux/compiler-gcc.h:65:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                               ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:71:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^~~~~~~~~~~~~~~
>> arch/arm/mach-pxa/magician.c:662:12: note: in expansion of macro 'ARRAY_SIZE'
     .ngpios = ARRAY_SIZE(bq24022_gpiod_gflags),
               ^~~~~~~~~~

vim +703 arch/arm/mach-pxa/hx4700.c

   702	
 > 703	static enum bq24022_gpiod_gflags[] = { GPIOD_OUT_LOW };
   704	
   705	static struct gpio_regulator_state bq24022_states[] = {
   706		{ .value = 100000, .gpios = (0 << 0) },
   707		{ .value = 500000, .gpios = (1 << 0) },
   708	};
   709	
   710	static struct gpio_regulator_config bq24022_info = {
   711		.supply_name = "bq24022",
   712	
   713		.enabled_at_boot = 0,
   714	
 > 715		.gflags = bq24022_gpiod_flags,
 > 716		.ngpios = ARRAY_SIZE(bq24022_gpiod_gflags),
   717	
   718		.states = bq24022_states,
   719		.nr_states = ARRAY_SIZE(bq24022_states),
   720	
   721		.type = REGULATOR_CURRENT,
   722		.init_data = &bq24022_init_data,
   723	};
   724	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--C7zPtVaVf+AK4Oqc
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--C7zPtVaVf+AK4Oqc--
