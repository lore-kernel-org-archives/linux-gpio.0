From: kbuild test robot <fengguang.wu@intel.com>
Subject: [gpio:gpio-descriptors-regulator 7/26]
 arch/arm/mach-mmp/brownstone.c:164:15: error: variable
 'brownstone_v_5vp_gpiod_table' has initializer but incomplete type
Date: Sun, 14 Jan 2018 22:03:43 +0800
Message-ID: <201801142241.UGC9epH2%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:61018 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751015AbeANOEn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 14 Jan 2018 09:04:43 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild-all@01.org, linux-gpio@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-regulator
head:   21d37183887389f3d500017630fe3298124c25b9
commit: 04651f599b68f9dc3abeb0925c652709b5076c4e [7/26] regulator: fixed: Convert to use GPIO descriptor only
config: arm-mmp2_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 04651f599b68f9dc3abeb0925c652709b5076c4e
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

All errors (new ones prefixed by >>):

>> arch/arm/mach-mmp/brownstone.c:164:15: error: variable 'brownstone_v_5vp_gpiod_table' has initializer but incomplete type
    static struct gpiod_lookup_table brownstone_v_5vp_gpiod_table = {
                  ^~~~~~~~~~~~~~~~~~
>> arch/arm/mach-mmp/brownstone.c:165:3: error: 'struct gpiod_lookup_table' has no member named 'dev_id'
     .dev_id = "reg-fixed-voltage.1", /* .id set to 1 above */
      ^~~~~~
   arch/arm/mach-mmp/brownstone.c:165:12: warning: excess elements in struct initializer
     .dev_id = "reg-fixed-voltage.1", /* .id set to 1 above */
               ^~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-mmp/brownstone.c:165:12: note: (near initialization for 'brownstone_v_5vp_gpiod_table')
>> arch/arm/mach-mmp/brownstone.c:166:3: error: 'struct gpiod_lookup_table' has no member named 'table'
     .table = {
      ^~~~~
>> arch/arm/mach-mmp/brownstone.c:166:11: error: extra brace group at end of initializer
     .table = {
              ^
   arch/arm/mach-mmp/brownstone.c:166:11: note: (near initialization for 'brownstone_v_5vp_gpiod_table')
>> arch/arm/mach-mmp/brownstone.c:167:3: error: implicit declaration of function 'GPIO_LOOKUP'; did you mean 'IOP_LOOKUP'? [-Werror=implicit-function-declaration]
      GPIO_LOOKUP("gpio-pxa", GPIO_5V_ENABLE,
      ^~~~~~~~~~~
      IOP_LOOKUP
>> arch/arm/mach-mmp/brownstone.c:168:18: error: 'GPIO_ACTIVE_HIGH' undeclared here (not in a function); did you mean 'LRU_ACTIVE_FILE'?
           "enable", GPIO_ACTIVE_HIGH),
                     ^~~~~~~~~~~~~~~~
                     LRU_ACTIVE_FILE
   arch/arm/mach-mmp/brownstone.c:169:3: error: extra brace group at end of initializer
      { },
      ^
   arch/arm/mach-mmp/brownstone.c:169:3: note: (near initialization for 'brownstone_v_5vp_gpiod_table')
   arch/arm/mach-mmp/brownstone.c:166:11: warning: excess elements in struct initializer
     .table = {
              ^
   arch/arm/mach-mmp/brownstone.c:166:11: note: (near initialization for 'brownstone_v_5vp_gpiod_table')
   arch/arm/mach-mmp/brownstone.c: In function 'brownstone_init':
>> arch/arm/mach-mmp/brownstone.c:228:2: error: implicit declaration of function 'gpiod_add_lookup_table'; did you mean 'pinctrl_lookup_state'? [-Werror=implicit-function-declaration]
     gpiod_add_lookup_table(&brownstone_v_5vp_gpiod_table);
     ^~~~~~~~~~~~~~~~~~~~~~
     pinctrl_lookup_state
   arch/arm/mach-mmp/brownstone.c: At top level:
>> arch/arm/mach-mmp/brownstone.c:164:34: error: storage size of 'brownstone_v_5vp_gpiod_table' isn't known
    static struct gpiod_lookup_table brownstone_v_5vp_gpiod_table = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/brownstone_v_5vp_gpiod_table +164 arch/arm/mach-mmp/brownstone.c

   163	
 > 164	static struct gpiod_lookup_table brownstone_v_5vp_gpiod_table = {
 > 165		.dev_id = "reg-fixed-voltage.1", /* .id set to 1 above */
 > 166		.table = {
 > 167			GPIO_LOOKUP("gpio-pxa", GPIO_5V_ENABLE,
 > 168				    "enable", GPIO_ACTIVE_HIGH),
 > 169			{ },
   170		},
   171	};
   172	
   173	static struct max8925_platform_data brownstone_max8925_info = {
   174		.irq_base		= MMP_NR_IRQS,
   175	};
   176	
   177	static struct i2c_board_info brownstone_twsi1_info[] = {
   178		[0] = {
   179			.type		= "max8649",
   180			.addr		= 0x60,
   181			.platform_data	= &brownstone_max8649_info,
   182		},
   183		[1] = {
   184			.type		= "max8925",
   185			.addr		= 0x3c,
   186			.irq		= IRQ_MMP2_PMIC,
   187			.platform_data	= &brownstone_max8925_info,
   188		},
   189	};
   190	
   191	static struct sdhci_pxa_platdata mmp2_sdh_platdata_mmc0 = {
   192		.clk_delay_cycles = 0x1f,
   193	};
   194	
   195	static struct sdhci_pxa_platdata mmp2_sdh_platdata_mmc2 = {
   196		.clk_delay_cycles = 0x1f,
   197		.flags = PXA_FLAG_CARD_PERMANENT
   198			| PXA_FLAG_SD_8_BIT_CAPABLE_SLOT,
   199	};
   200	
   201	static struct sram_platdata mmp2_asram_platdata = {
   202		.pool_name	= "asram",
   203		.granularity	= SRAM_GRANULARITY,
   204	};
   205	
   206	static struct sram_platdata mmp2_isram_platdata = {
   207		.pool_name	= "isram",
   208		.granularity	= SRAM_GRANULARITY,
   209	};
   210	
   211	static void __init brownstone_init(void)
   212	{
   213		mfp_config(ARRAY_AND_SIZE(brownstone_pin_config));
   214	
   215		/* on-chip devices */
   216		mmp2_add_uart(1);
   217		mmp2_add_uart(3);
   218		platform_device_add_data(&mmp2_device_gpio, &mmp2_gpio_pdata,
   219					 sizeof(struct pxa_gpio_platform_data));
   220		platform_device_register(&mmp2_device_gpio);
   221		mmp2_add_twsi(1, NULL, ARRAY_AND_SIZE(brownstone_twsi1_info));
   222		mmp2_add_sdhost(0, &mmp2_sdh_platdata_mmc0); /* SD/MMC */
   223		mmp2_add_sdhost(2, &mmp2_sdh_platdata_mmc2); /* eMMC */
   224		mmp2_add_asram(&mmp2_asram_platdata);
   225		mmp2_add_isram(&mmp2_isram_platdata);
   226	
   227		/* enable 5v regulator */
 > 228		gpiod_add_lookup_table(&brownstone_v_5vp_gpiod_table);
   229		platform_device_register(&brownstone_v_5vp_device);
   230	}
   231	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--XsQoSWH+UP9D9v3l
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
HmngyX7ojNB46CXfRyvN/wHImrmqdeoAAA==

--XsQoSWH+UP9D9v3l--
