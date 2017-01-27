From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] gpio: mcp23s08: add pinconf support
Date: Sat, 28 Jan 2017 03:00:51 +0800
Message-ID: <201701280248.Eo1WWeIL%fengguang.wu@intel.com>
References: <20170127144738.21107-3-sre@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:13768 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750894AbdA0TBx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 14:01:53 -0500
Content-Disposition: inline
In-Reply-To: <20170127144738.21107-3-sre@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: kbuild-all@01.org, Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

[auto build test ERROR on gpio/for-next]
[also build test ERROR on v4.10-rc5 next-20170125]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Sebastian-Reichel/mcp23s08-pinconf-support/20170127-230243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: i386-randconfig-c0-01280104 (attached as .config)
compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-mcp23s08.c:86:22: error: field 'pinctrl_desc' has incomplete type
     struct pinctrl_desc pinctrl_desc;
                         ^
>> drivers/gpio/gpio-mcp23s08.c:139:38: error: array type has incomplete element type
    static const struct pinctrl_pin_desc mcp23x08_pins[] = {
                                         ^
   drivers/gpio/gpio-mcp23s08.c:140:2: error: implicit declaration of function 'PINCTRL_PIN' [-Werror=implicit-function-declaration]
     PINCTRL_PIN(0, "gpio0"),
     ^
   drivers/gpio/gpio-mcp23s08.c:150:38: error: array type has incomplete element type
    static const struct pinctrl_pin_desc mcp23x17_pins[] = {
                                         ^
   drivers/gpio/gpio-mcp23s08.c:188:21: error: variable 'mcp_pinctrl_ops' has initializer but incomplete type
    static const struct pinctrl_ops mcp_pinctrl_ops = {
                        ^
   drivers/gpio/gpio-mcp23s08.c:189:2: error: unknown field 'get_groups_count' specified in initializer
     .get_groups_count = mcp_pinctrl_get_groups_count,
     ^
   drivers/gpio/gpio-mcp23s08.c:189:2: warning: excess elements in struct initializer
   drivers/gpio/gpio-mcp23s08.c:189:2: warning: (near initialization for 'mcp_pinctrl_ops')
   drivers/gpio/gpio-mcp23s08.c:190:2: error: unknown field 'get_group_name' specified in initializer
     .get_group_name = mcp_pinctrl_get_group_name,
     ^
   drivers/gpio/gpio-mcp23s08.c:190:2: warning: excess elements in struct initializer
   drivers/gpio/gpio-mcp23s08.c:190:2: warning: (near initialization for 'mcp_pinctrl_ops')
   drivers/gpio/gpio-mcp23s08.c:191:2: error: unknown field 'get_group_pins' specified in initializer
     .get_group_pins = mcp_pinctrl_get_group_pins,
     ^
   drivers/gpio/gpio-mcp23s08.c:191:2: warning: excess elements in struct initializer
   drivers/gpio/gpio-mcp23s08.c:191:2: warning: (near initialization for 'mcp_pinctrl_ops')
   drivers/gpio/gpio-mcp23s08.c:193:2: error: unknown field 'dt_node_to_map' specified in initializer
     .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
     ^
   drivers/gpio/gpio-mcp23s08.c:193:20: error: 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)
     .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
                       ^
   drivers/gpio/gpio-mcp23s08.c:193:2: warning: excess elements in struct initializer
     .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
     ^
   drivers/gpio/gpio-mcp23s08.c:193:2: warning: (near initialization for 'mcp_pinctrl_ops')
   drivers/gpio/gpio-mcp23s08.c:194:2: error: unknown field 'dt_free_map' specified in initializer
     .dt_free_map = pinconf_generic_dt_free_map,
     ^
   drivers/gpio/gpio-mcp23s08.c:194:17: error: 'pinconf_generic_dt_free_map' undeclared here (not in a function)
     .dt_free_map = pinconf_generic_dt_free_map,
                    ^
   drivers/gpio/gpio-mcp23s08.c:194:2: warning: excess elements in struct initializer
     .dt_free_map = pinconf_generic_dt_free_map,
     ^
   drivers/gpio/gpio-mcp23s08.c:194:2: warning: (near initialization for 'mcp_pinctrl_ops')
   drivers/gpio/gpio-mcp23s08.c: In function 'mcp_pinconf_get':
   drivers/gpio/gpio-mcp23s08.c:201:9: error: implicit declaration of function 'pinctrl_dev_get_drvdata' [-Werror=implicit-function-declaration]
     struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
            ^
   drivers/gpio/gpio-mcp23s08.c:201:25: warning: initialization makes pointer from integer without a cast
     struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
                            ^
   drivers/gpio/gpio-mcp23s08.c: In function 'mcp_pinconf_set':
   drivers/gpio/gpio-mcp23s08.c:226:25: warning: initialization makes pointer from integer without a cast
     struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
                            ^
   drivers/gpio/gpio-mcp23s08.c: At top level:
   drivers/gpio/gpio-mcp23s08.c:252:21: error: variable 'mcp_pinconf_ops' has initializer but incomplete type
    static const struct pinconf_ops mcp_pinconf_ops = {
                        ^
   drivers/gpio/gpio-mcp23s08.c:253:2: error: unknown field 'pin_config_get' specified in initializer
     .pin_config_get = mcp_pinconf_get,
     ^
   drivers/gpio/gpio-mcp23s08.c:253:2: warning: excess elements in struct initializer
   drivers/gpio/gpio-mcp23s08.c:253:2: warning: (near initialization for 'mcp_pinconf_ops')
   drivers/gpio/gpio-mcp23s08.c:254:2: error: unknown field 'pin_config_set' specified in initializer
     .pin_config_set = mcp_pinconf_set,
     ^
   drivers/gpio/gpio-mcp23s08.c:254:2: warning: excess elements in struct initializer
   drivers/gpio/gpio-mcp23s08.c:254:2: warning: (near initialization for 'mcp_pinconf_ops')
   drivers/gpio/gpio-mcp23s08.c:255:2: error: unknown field 'is_generic' specified in initializer
     .is_generic = true,
     ^
   drivers/gpio/gpio-mcp23s08.c:255:2: warning: excess elements in struct initializer
   drivers/gpio/gpio-mcp23s08.c:255:2: warning: (near initialization for 'mcp_pinconf_ops')
   drivers/gpio/gpio-mcp23s08.c: In function 'mcp23s08_probe_one':
   drivers/gpio/gpio-mcp23s08.c:776:2: error: implicit declaration of function 'pinctrl_register' [-Werror=implicit-function-declaration]
     mcp->pctldev = pinctrl_register(&mcp->pinctrl_desc, dev, mcp);
     ^
   drivers/gpio/gpio-mcp23s08.c: At top level:
   drivers/gpio/gpio-mcp23s08.c:139:38: warning: 'mcp23x08_pins' defined but not used [-Wunused-variable]
    static const struct pinctrl_pin_desc mcp23x08_pins[] = {
                                         ^
   drivers/gpio/gpio-mcp23s08.c:150:38: warning: 'mcp23x17_pins' defined but not used [-Wunused-variable]
    static const struct pinctrl_pin_desc mcp23x17_pins[] = {
                                         ^
   cc1: some warnings being treated as errors

vim +139 drivers/gpio/gpio-mcp23s08.c

    80		struct gpio_chip	chip;
    81	
    82		struct regmap		*regmap;
    83		struct device		*dev;
    84	
    85		struct pinctrl_dev	*pctldev;
  > 86		struct pinctrl_desc	pinctrl_desc;
    87	};
    88	
    89	static const struct regmap_config mcp23x08_regmap = {
    90		.reg_bits = 8,
    91		.val_bits = 8,
    92	
    93		.reg_stride = 1,
    94		.max_register = MCP_OLAT,
    95	};
    96	
    97	static const struct regmap_config mcp23x17_regmap = {
    98		.reg_bits = 8,
    99		.val_bits = 16,
   100	
   101		.reg_stride = 2,
   102		.max_register = MCP_OLAT << 1,
   103		.val_format_endian = REGMAP_ENDIAN_LITTLE,
   104	};
   105	
   106	static int mcp_read(struct mcp23s08 *mcp, unsigned int reg, unsigned int *val)
   107	{
   108		return regmap_read(mcp->regmap, reg << mcp->reg_shift, val);
   109	}
   110	
   111	static int mcp_write(struct mcp23s08 *mcp, unsigned int reg, unsigned int val)
   112	{
   113		return regmap_write(mcp->regmap, reg << mcp->reg_shift, val);
   114	}
   115	
   116	static int mcp_set_bit(struct mcp23s08 *mcp, unsigned int reg,
   117			       unsigned int pin, bool enabled)
   118	{
   119		u16 val  = enabled ? 0xffff : 0x0000;
   120		u16 mask = BIT(pin);
   121		return regmap_update_bits(mcp->regmap, reg << mcp->reg_shift,
   122					  mask, val);
   123	}
   124	
   125	static int mcp_update_cache(struct mcp23s08 *mcp)
   126	{
   127		int ret, reg, i;
   128	
   129		for (i = 0; i < ARRAY_SIZE(mcp->cache); i++) {
   130			ret = mcp_read(mcp, i, &reg);
   131			if (ret < 0)
   132				return ret;
   133			mcp->cache[i] = reg;
   134		}
   135	
   136		return 0;
   137	}
   138	
 > 139	static const struct pinctrl_pin_desc mcp23x08_pins[] = {
   140		PINCTRL_PIN(0, "gpio0"),
   141		PINCTRL_PIN(1, "gpio1"),
   142		PINCTRL_PIN(2, "gpio2"),

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--BOKacYhQ+x31HxR3
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--BOKacYhQ+x31HxR3--
