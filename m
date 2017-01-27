From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] gpio: mcp23s08: add pinconf support
Date: Sat, 28 Jan 2017 01:16:44 +0800
Message-ID: <201701280001.W3qfbUZY%fengguang.wu@intel.com>
References: <20170127144738.21107-3-sre@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="d6Gm4EdcadzBjdND"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170127144738.21107-3-sre@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

[auto build test ERROR on gpio/for-next]
[also build test ERROR on v4.10-rc5 next-20170125]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Sebastian-Reichel/mcp23s08-pinconf-support/20170127-230243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: x86_64-randconfig-x003-201704 (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All error/warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-mcp23s08.c:86:22: error: field 'pinctrl_desc' has incomplete type
     struct pinctrl_desc pinctrl_desc;
                         ^~~~~~~~~~~~
>> drivers/gpio/gpio-mcp23s08.c:139:38: error: array type has incomplete element type 'struct pinctrl_pin_desc'
    static const struct pinctrl_pin_desc mcp23x08_pins[] = {
                                         ^~~~~~~~~~~~~
>> drivers/gpio/gpio-mcp23s08.c:140:2: error: implicit declaration of function 'PINCTRL_PIN' [-Werror=implicit-function-declaration]
     PINCTRL_PIN(0, "gpio0"),
     ^~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c:150:38: error: array type has incomplete element type 'struct pinctrl_pin_desc'
    static const struct pinctrl_pin_desc mcp23x17_pins[] = {
                                         ^~~~~~~~~~~~~
>> drivers/gpio/gpio-mcp23s08.c:188:21: error: variable 'mcp_pinctrl_ops' has initializer but incomplete type
    static const struct pinctrl_ops mcp_pinctrl_ops = {
                        ^~~~~~~~~~~
>> drivers/gpio/gpio-mcp23s08.c:189:2: error: unknown field 'get_groups_count' specified in initializer
     .get_groups_count = mcp_pinctrl_get_groups_count,
     ^
>> drivers/gpio/gpio-mcp23s08.c:189:22: warning: excess elements in struct initializer
     .get_groups_count = mcp_pinctrl_get_groups_count,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c:189:22: note: (near initialization for 'mcp_pinctrl_ops')
>> drivers/gpio/gpio-mcp23s08.c:190:2: error: unknown field 'get_group_name' specified in initializer
     .get_group_name = mcp_pinctrl_get_group_name,
     ^
   drivers/gpio/gpio-mcp23s08.c:190:20: warning: excess elements in struct initializer
     .get_group_name = mcp_pinctrl_get_group_name,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c:190:20: note: (near initialization for 'mcp_pinctrl_ops')
>> drivers/gpio/gpio-mcp23s08.c:191:2: error: unknown field 'get_group_pins' specified in initializer
     .get_group_pins = mcp_pinctrl_get_group_pins,
     ^
   drivers/gpio/gpio-mcp23s08.c:191:20: warning: excess elements in struct initializer
     .get_group_pins = mcp_pinctrl_get_group_pins,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c:191:20: note: (near initialization for 'mcp_pinctrl_ops')
>> drivers/gpio/gpio-mcp23s08.c:193:2: error: unknown field 'dt_node_to_map' specified in initializer
     .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
     ^
>> drivers/gpio/gpio-mcp23s08.c:193:20: error: 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)
     .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c:193:20: warning: excess elements in struct initializer
   drivers/gpio/gpio-mcp23s08.c:193:20: note: (near initialization for 'mcp_pinctrl_ops')
>> drivers/gpio/gpio-mcp23s08.c:194:2: error: unknown field 'dt_free_map' specified in initializer
     .dt_free_map = pinconf_generic_dt_free_map,
     ^
>> drivers/gpio/gpio-mcp23s08.c:194:17: error: 'pinconf_generic_dt_free_map' undeclared here (not in a function)
     .dt_free_map = pinconf_generic_dt_free_map,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c:194:17: warning: excess elements in struct initializer
   drivers/gpio/gpio-mcp23s08.c:194:17: note: (near initialization for 'mcp_pinctrl_ops')
   drivers/gpio/gpio-mcp23s08.c: In function 'mcp_pinconf_get':
>> drivers/gpio/gpio-mcp23s08.c:201:25: error: implicit declaration of function 'pinctrl_dev_get_drvdata' [-Werror=implicit-function-declaration]
     struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
                            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-mcp23s08.c:201:25: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   drivers/gpio/gpio-mcp23s08.c: In function 'mcp_pinconf_set':
   drivers/gpio/gpio-mcp23s08.c:226:25: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c: At top level:
>> drivers/gpio/gpio-mcp23s08.c:252:21: error: variable 'mcp_pinconf_ops' has initializer but incomplete type
    static const struct pinconf_ops mcp_pinconf_ops = {
                        ^~~~~~~~~~~
>> drivers/gpio/gpio-mcp23s08.c:253:2: error: unknown field 'pin_config_get' specified in initializer
     .pin_config_get = mcp_pinconf_get,
     ^
   drivers/gpio/gpio-mcp23s08.c:253:20: warning: excess elements in struct initializer
     .pin_config_get = mcp_pinconf_get,
                       ^~~~~~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c:253:20: note: (near initialization for 'mcp_pinconf_ops')
>> drivers/gpio/gpio-mcp23s08.c:254:2: error: unknown field 'pin_config_set' specified in initializer
     .pin_config_set = mcp_pinconf_set,
     ^
   drivers/gpio/gpio-mcp23s08.c:254:20: warning: excess elements in struct initializer
     .pin_config_set = mcp_pinconf_set,
                       ^~~~~~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c:254:20: note: (near initialization for 'mcp_pinconf_ops')
>> drivers/gpio/gpio-mcp23s08.c:255:2: error: unknown field 'is_generic' specified in initializer
     .is_generic = true,
     ^
   drivers/gpio/gpio-mcp23s08.c:255:16: warning: excess elements in struct initializer
     .is_generic = true,
                   ^~~~
   drivers/gpio/gpio-mcp23s08.c:255:16: note: (near initialization for 'mcp_pinconf_ops')
   drivers/gpio/gpio-mcp23s08.c: In function 'mcp23s08_probe_one':
>> drivers/gpio/gpio-mcp23s08.c:776:17: error: implicit declaration of function 'pinctrl_register' [-Werror=implicit-function-declaration]
     mcp->pctldev = pinctrl_register(&mcp->pinctrl_desc, dev, mcp);
                    ^~~~~~~~~~~~~~~~
   drivers/gpio/gpio-mcp23s08.c: At top level:
>> drivers/gpio/gpio-mcp23s08.c:188:33: error: storage size of 'mcp_pinctrl_ops' isn't known
    static const struct pinctrl_ops mcp_pinctrl_ops = {
                                    ^~~~~~~~~~~~~~~

vim +/pinctrl_desc +86 drivers/gpio/gpio-mcp23s08.c

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
 > 140		PINCTRL_PIN(0, "gpio0"),
   141		PINCTRL_PIN(1, "gpio1"),
   142		PINCTRL_PIN(2, "gpio2"),
   143		PINCTRL_PIN(3, "gpio3"),
   144		PINCTRL_PIN(4, "gpio4"),
   145		PINCTRL_PIN(5, "gpio5"),
   146		PINCTRL_PIN(6, "gpio6"),
   147		PINCTRL_PIN(7, "gpio7"),
   148	};
   149	
 > 150	static const struct pinctrl_pin_desc mcp23x17_pins[] = {
   151		PINCTRL_PIN(0, "gpio0"),
   152		PINCTRL_PIN(1, "gpio1"),
   153		PINCTRL_PIN(2, "gpio2"),
   154		PINCTRL_PIN(3, "gpio3"),
   155		PINCTRL_PIN(4, "gpio4"),
   156		PINCTRL_PIN(5, "gpio5"),
   157		PINCTRL_PIN(6, "gpio6"),
   158		PINCTRL_PIN(7, "gpio7"),
   159		PINCTRL_PIN(8, "gpio8"),
   160		PINCTRL_PIN(9, "gpio9"),
   161		PINCTRL_PIN(10, "gpio10"),
   162		PINCTRL_PIN(11, "gpio11"),
   163		PINCTRL_PIN(12, "gpio12"),
   164		PINCTRL_PIN(13, "gpio13"),
   165		PINCTRL_PIN(14, "gpio14"),
   166		PINCTRL_PIN(15, "gpio15"),
   167	};
   168	
   169	static int mcp_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
   170	{
   171		return 0;
   172	}
   173	
   174	static const char *mcp_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
   175							unsigned int group)
   176	{
   177		return NULL;
   178	}
   179	
   180	static int mcp_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
   181						unsigned int group,
   182						const unsigned int **pins,
   183						unsigned int *num_pins)
   184	{
   185		return -ENOTSUPP;
   186	}
   187	
 > 188	static const struct pinctrl_ops mcp_pinctrl_ops = {
 > 189		.get_groups_count = mcp_pinctrl_get_groups_count,
 > 190		.get_group_name = mcp_pinctrl_get_group_name,
 > 191		.get_group_pins = mcp_pinctrl_get_group_pins,
   192	#ifdef CONFIG_OF
 > 193		.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
 > 194		.dt_free_map = pinconf_generic_dt_free_map,
   195	#endif
   196	};
   197	
   198	static int mcp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
   199				      unsigned long *config)
   200	{
 > 201		struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
   202		enum pin_config_param param = pinconf_to_config_param(*config);
   203		unsigned int data, status;
   204		int ret;
   205	
   206		switch (param) {
   207		case PIN_CONFIG_BIAS_PULL_UP:
   208			ret = mcp_read(mcp, MCP_GPPU, &data);
   209			if (ret < 0)
   210				return ret;
   211			status = (data & BIT(pin)) ? 1 : 0;
   212			break;
   213		default:
   214			dev_err(mcp->dev, "Invalid config param %04x\n", param);
   215			return -ENOTSUPP;
   216		}
   217	
   218		*config = 0;
   219	
   220		return status ? 0 : -EINVAL;
   221	}
   222	
   223	static int mcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
   224				      unsigned long *configs, unsigned int num_configs)
   225	{
   226		struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
   227		enum pin_config_param param;
   228		u32 arg, mask;
   229		u16 val;
   230		int ret = 0;
   231		int i;
   232	
   233		for (i = 0; i < num_configs; i++) {
   234			param = pinconf_to_config_param(configs[i]);
   235			arg = pinconf_to_config_argument(configs[i]);
   236	
   237			switch (param) {
   238			case PIN_CONFIG_BIAS_PULL_UP:
   239				val = arg ? 0xFFFF : 0x0000;
   240				mask = BIT(pin);
   241				ret = mcp_set_bit(mcp, MCP_GPPU, pin, arg);
   242				break;
   243			default:
   244				dev_err(mcp->dev, "Invalid config param %04x\n", param);
   245				return -ENOTSUPP;
   246			}
   247		}
   248	
   249		return ret;
   250	}
   251	
 > 252	static const struct pinconf_ops mcp_pinconf_ops = {
 > 253		.pin_config_get = mcp_pinconf_get,
 > 254		.pin_config_set = mcp_pinconf_set,
 > 255		.is_generic = true,
   256	};
   257	
   258	/*----------------------------------------------------------------------*/

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--d6Gm4EdcadzBjdND
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
VgJxAQA=

--d6Gm4EdcadzBjdND--
