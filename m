From: kbuild test robot <fengguang.wu@intel.com>
Subject: [gpio:fixes 6/6] drivers/gpio/gpio-mcp23s08.c:491:13: error: invalid
 storage class for function 'mcp23s08_dbg_show'
Date: Wed, 15 Mar 2017 04:51:43 +0800
Message-ID: <201703150435.nO7zK9GW%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:1679 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752166AbdCNUwW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Mar 2017 16:52:22 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Middleton <robert.middleton@rm5248.com>
Cc: kbuild-all@01.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git fixes
head:   7b74feff6fdb0820252b75b2313ad7bccfc8515b
commit: 7b74feff6fdb0820252b75b2313ad7bccfc8515b [6/6] gpio:mcp23s08 Fixed missing interrupts
config: i386-randconfig-x074-201711 (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        git checkout 7b74feff6fdb0820252b75b2313ad7bccfc8515b
        # save the attached .config to linux build tree
        make ARCH=i386 

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpio-mcp23s08.c: In function 'mcp23s08_irq':
   drivers/gpio/gpio-mcp23s08.c:294:12: error: 'struct mcp23s08' has no member named 'ops'
     gpio = mcp->ops->read(mcp, MCP_GPIO);
               ^~
   In file included from include/linux/kdev_t.h:4:0,
                    from include/linux/fs.h:6,
                    from include/linux/seq_file.h:10,
                    from drivers/gpio/gpio-mcp23s08.c:485:
>> include/uapi/linux/kdev_t.h:13:0: error: unterminated argument list invoking macro "if"
    #endif /* _UAPI_LINUX_KDEV_T_H */
    
   In file included from include/linux/fs.h:6:0,
                    from include/linux/seq_file.h:10,
                    from drivers/gpio/gpio-mcp23s08.c:485:
>> include/linux/kdev_t.h:23:1: error: expected '(' before 'static'
    static inline bool old_valid_dev(dev_t dev)
    ^~~~~~
   In file included from include/linux/rculist_bl.h:7:0,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:7,
                    from include/linux/seq_file.h:10,
                    from drivers/gpio/gpio-mcp23s08.c:485:
>> include/linux/list_bl.h:37:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    struct hlist_bl_node {
    ^~~~~~
>> include/linux/list_bl.h:43:20: error: invalid storage class for function 'INIT_HLIST_BL_NODE'
    static inline void INIT_HLIST_BL_NODE(struct hlist_bl_node *h)
                       ^~~~~~~~~~~~~~~~~~
>> include/linux/list_bl.h:51:21: error: invalid storage class for function 'hlist_bl_unhashed'
    static inline bool  hlist_bl_unhashed(const struct hlist_bl_node *h)
                        ^~~~~~~~~~~~~~~~~
>> include/linux/list_bl.h:56:59: warning: 'struct hlist_bl_head' declared inside parameter list will not be visible outside of this definition or declaration
    static inline struct hlist_bl_node *hlist_bl_first(struct hlist_bl_head *h)
                                                              ^~~~~~~~~~~~~
>> include/linux/list_bl.h:56:37: error: invalid storage class for function 'hlist_bl_first'
    static inline struct hlist_bl_node *hlist_bl_first(struct hlist_bl_head *h)
                                        ^~~~~~~~~~~~~~
   include/linux/list_bl.h: In function 'hlist_bl_first':
>> include/linux/list_bl.h:59:20: error: dereferencing pointer to incomplete type 'struct hlist_bl_head'
      ((unsigned long)h->first & ~LIST_BL_LOCKMASK);
                       ^~
   include/linux/list_bl.h: In function 'mcp23s08_irq':
   include/linux/list_bl.h:62:46: warning: 'struct hlist_bl_head' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void hlist_bl_set_first(struct hlist_bl_head *h,
                                                 ^~~~~~~~~~~~~
>> include/linux/list_bl.h:62:20: error: invalid storage class for function 'hlist_bl_set_first'
    static inline void hlist_bl_set_first(struct hlist_bl_head *h,
                       ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from drivers/gpio/gpio-mcp23s08.c:13:
   include/linux/list_bl.h: In function 'hlist_bl_set_first':
   include/linux/list_bl.h:66:34: error: dereferencing pointer to incomplete type 'struct hlist_bl_head'
     LIST_BL_BUG_ON(((unsigned long)h->first & LIST_BL_LOCKMASK) !=
                                     ^
   include/linux/compiler.h:160:30: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                 ^~~~
   include/asm-generic/bug.h:55:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:150:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:55:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
>> include/linux/list_bl.h:27:27: note: in expansion of macro 'BUG_ON'
    #define LIST_BL_BUG_ON(x) BUG_ON(x)
                              ^~~~~~
>> include/linux/list_bl.h:66:2: note: in expansion of macro 'LIST_BL_BUG_ON'
     LIST_BL_BUG_ON(((unsigned long)h->first & LIST_BL_LOCKMASK) !=
     ^~~~~~~~~~~~~~
   In file included from include/linux/rculist_bl.h:7:0,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:7,
                    from include/linux/seq_file.h:10,
                    from drivers/gpio/gpio-mcp23s08.c:485:
   include/linux/list_bl.h: In function 'mcp23s08_irq':
   include/linux/list_bl.h:71:48: warning: 'struct hlist_bl_head' declared inside parameter list will not be visible outside of this definition or declaration
    static inline bool hlist_bl_empty(const struct hlist_bl_head *h)
                                                   ^~~~~~~~~~~~~
>> include/linux/list_bl.h:71:20: error: invalid storage class for function 'hlist_bl_empty'
    static inline bool hlist_bl_empty(const struct hlist_bl_head *h)
                       ^~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from drivers/gpio/gpio-mcp23s08.c:13:
   include/linux/list_bl.h: In function 'hlist_bl_empty':
>> include/linux/list_bl.h:73:37: error: dereferencing pointer to incomplete type 'const struct hlist_bl_head'
     return !((unsigned long)READ_ONCE(h->first) & ~LIST_BL_LOCKMASK);
                                        ^
   include/linux/compiler.h:316:17: note: in definition of macro '__READ_ONCE'
     union { typeof(x) __val; char __c[1]; } __u;   \
                    ^
>> include/linux/list_bl.h:73:26: note: in expansion of macro 'READ_ONCE'
     return !((unsigned long)READ_ONCE(h->first) & ~LIST_BL_LOCKMASK);
                             ^~~~~~~~~
   In file included from include/linux/rculist_bl.h:7:0,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:7,
                    from include/linux/seq_file.h:10,
                    from drivers/gpio/gpio-mcp23s08.c:485:
   include/linux/list_bl.h: In function 'mcp23s08_irq':
   include/linux/list_bl.h:77:13: warning: 'struct hlist_bl_head' declared inside parameter list will not be visible outside of this definition or declaration
         struct hlist_bl_head *h)
                ^~~~~~~~~~~~~
>> include/linux/list_bl.h:76:20: error: invalid storage class for function 'hlist_bl_add_head'
    static inline void hlist_bl_add_head(struct hlist_bl_node *n,
                       ^~~~~~~~~~~~~~~~~
   include/linux/list_bl.h: In function 'hlist_bl_add_head':
>> include/linux/list_bl.h:79:47: error: passing argument 1 of 'hlist_bl_first' from incompatible pointer type [-Werror=incompatible-pointer-types]
     struct hlist_bl_node *first = hlist_bl_first(h);
                                                  ^
   include/linux/list_bl.h:56:37: note: expected 'struct hlist_bl_head *' but argument is of type 'struct hlist_bl_head *'
    static inline struct hlist_bl_node *hlist_bl_first(struct hlist_bl_head *h)
                                        ^~~~~~~~~~~~~~
   include/linux/list_bl.h:84:15: error: dereferencing pointer to incomplete type 'struct hlist_bl_head'
     n->pprev = &h->first;
                  ^~
>> include/linux/list_bl.h:85:21: error: passing argument 1 of 'hlist_bl_set_first' from incompatible pointer type [-Werror=incompatible-pointer-types]
     hlist_bl_set_first(h, n);
                        ^
   include/linux/list_bl.h:62:20: note: expected 'struct hlist_bl_head *' but argument is of type 'struct hlist_bl_head *'
    static inline void hlist_bl_set_first(struct hlist_bl_head *h,
                       ^~~~~~~~~~~~~~~~~~
   include/linux/list_bl.h: In function 'mcp23s08_irq':
>> include/linux/list_bl.h:88:20: error: invalid storage class for function '__hlist_bl_del'
    static inline void __hlist_bl_del(struct hlist_bl_node *n)
                       ^~~~~~~~~~~~~~
>> include/linux/list_bl.h:104:20: error: invalid storage class for function 'hlist_bl_del'
    static inline void hlist_bl_del(struct hlist_bl_node *n)
                       ^~~~~~~~~~~~
>> include/linux/list_bl.h:111:20: error: invalid storage class for function 'hlist_bl_del_init'
    static inline void hlist_bl_del_init(struct hlist_bl_node *n)
                       ^~~~~~~~~~~~~~~~~
   include/linux/list_bl.h:119:41: warning: 'struct hlist_bl_head' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void hlist_bl_lock(struct hlist_bl_head *b)
                                            ^~~~~~~~~~~~~

vim +/mcp23s08_dbg_show +491 drivers/gpio/gpio-mcp23s08.c

e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  485  #include <linux/seq_file.h>
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  486  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  487  /*
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  488   * This shows more info than the generic gpio dump code:
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  489   * pullups, deglitching, open drain drive.
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  490   */
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04 @491  static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  492  {
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  493  	struct mcp23s08	*mcp;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  494  	char		bank;
1d1c1d9b drivers/gpio/mcp23s08.c      Roel Kluin            2008-05-23  495  	int		t;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  496  	unsigned	mask;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  497  
9e03cf0b drivers/gpio/gpio-mcp23s08.c Linus Walleij         2015-12-07  498  	mcp = gpiochip_get_data(chip);
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  499  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  500  	/* NOTE: we only handle one bank for now ... */
0b7bb77f drivers/gpio/mcp23s08.c      Peter Korsgaard       2011-03-09  501  	bank = '0' + ((mcp->addr >> 1) & 0x7);
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  502  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  503  	mutex_lock(&mcp->lock);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  504  	t = mcp_update_cache(mcp);
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  505  	if (t < 0) {
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  506  		seq_printf(s, " I/O ERROR %d\n", t);
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  507  		goto done;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  508  	}
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  509  
0b7bb77f drivers/gpio/mcp23s08.c      Peter Korsgaard       2011-03-09  510  	for (t = 0, mask = 1; t < chip->ngpio; t++, mask <<= 1) {
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  511  		const char	*label;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  512  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  513  		label = gpiochip_is_requested(chip, t);
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  514  		if (!label)
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  515  			continue;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  516  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  517  		seq_printf(s, " gpio-%-3d P%c.%d (%-12s) %s %s %s",
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  518  			chip->base + t, bank, t, label,
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  519  			(mcp->cache[MCP_IODIR] & mask) ? "in " : "out",
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  520  			(mcp->cache[MCP_GPIO] & mask) ? "hi" : "lo",
eb1567f7 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2012-04-25  521  			(mcp->cache[MCP_GPPU] & mask) ? "up" : "  ");
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  522  		/* NOTE:  ignoring the irq-related registers */
33bc8411 drivers/gpio/gpio-mcp23s08.c Gary Servin           2014-03-06  523  		seq_puts(s, "\n");
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  524  	}
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  525  done:
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  526  	mutex_unlock(&mcp->lock);
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  527  }
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  528  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  529  #else
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  530  #define mcp23s08_dbg_show	NULL
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  531  #endif
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  532  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  533  /*----------------------------------------------------------------------*/
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  534  
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15 @535  static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  536  			      void *data, unsigned addr, unsigned type,
3af0dbd5 drivers/gpio/gpio-mcp23s08.c Sonic Zhang           2014-09-01  537  			      struct mcp23s08_platform_data *pdata, int cs)
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  538  {
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  539  	int status, ret;
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  540  	bool mirror = false;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  541  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  542  	mutex_init(&mcp->lock);
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  543  
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  544  	mcp->dev = dev;
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  545  	mcp->addr = addr;
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  546  	mcp->irq_active_high = false;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  547  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  548  	mcp->chip.direction_input = mcp23s08_direction_input;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  549  	mcp->chip.get = mcp23s08_get;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  550  	mcp->chip.direction_output = mcp23s08_direction_output;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  551  	mcp->chip.set = mcp23s08_set;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04 @552  	mcp->chip.dbg_show = mcp23s08_dbg_show;
60f749f8 drivers/gpio/gpio-mcp23s08.c Linus Walleij         2016-09-07  553  #ifdef CONFIG_OF_GPIO
97ddb1c8 drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2013-04-04  554  	mcp->chip.of_gpio_n_cells = 2;
97ddb1c8 drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2013-04-04  555  	mcp->chip.of_node = dev->of_node;
97ddb1c8 drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2013-04-04  556  #endif
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  557  
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  558  	switch (type) {
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  559  #ifdef CONFIG_SPI_MASTER
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  560  	case MCP_TYPE_S08:
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  561  		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  562  					       &mcp23x08_regmap);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  563  		mcp->reg_shift = 0;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  564  		mcp->chip.ngpio = 8;
0b7bb77f drivers/gpio/mcp23s08.c      Peter Korsgaard       2011-03-09  565  		mcp->chip.label = "mcp23s08";
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  566  		break;
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  567  
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  568  	case MCP_TYPE_S17:
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  569  		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  570  					       &mcp23x17_regmap);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  571  		mcp->reg_shift = 1;
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  572  		mcp->chip.ngpio = 16;
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  573  		mcp->chip.label = "mcp23s17";
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  574  		break;
28c5a41e drivers/gpio/gpio-mcp23s08.c Phil Reid             2016-03-01  575  
28c5a41e drivers/gpio/gpio-mcp23s08.c Phil Reid             2016-03-01  576  	case MCP_TYPE_S18:
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  577  		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  578  					       &mcp23x17_regmap);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  579  		mcp->reg_shift = 1;
28c5a41e drivers/gpio/gpio-mcp23s08.c Phil Reid             2016-03-01  580  		mcp->chip.ngpio = 16;
28c5a41e drivers/gpio/gpio-mcp23s08.c Phil Reid             2016-03-01  581  		mcp->chip.label = "mcp23s18";
28c5a41e drivers/gpio/gpio-mcp23s08.c Phil Reid             2016-03-01  582  		break;
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  583  #endif /* CONFIG_SPI_MASTER */
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  584  
cbf24fad drivers/gpio/gpio-mcp23s08.c Daniel M. Weeks       2012-11-06  585  #if IS_ENABLED(CONFIG_I2C)
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  586  	case MCP_TYPE_008:
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  587  		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x08_regmap);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  588  		mcp->reg_shift = 0;
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  589  		mcp->chip.ngpio = 8;
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  590  		mcp->chip.label = "mcp23008";
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  591  		break;
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  592  
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  593  	case MCP_TYPE_017:
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  594  		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x17_regmap);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  595  		mcp->reg_shift = 1;
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  596  		mcp->chip.ngpio = 16;
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  597  		mcp->chip.label = "mcp23017";
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  598  		break;
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  599  #endif /* CONFIG_I2C */
752ad5e8 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  600  
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  601  	default:
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  602  		dev_err(dev, "invalid device type (%d)\n", type);
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  603  		return -EINVAL;
0b7bb77f drivers/gpio/mcp23s08.c      Peter Korsgaard       2011-03-09  604  	}
d62b98f3 drivers/gpio/gpio-mcp23s08.c Peter Korsgaard       2011-07-15  605  
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  606  	if (IS_ERR(mcp->regmap))
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  607  		return PTR_ERR(mcp->regmap);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  608  
3af0dbd5 drivers/gpio/gpio-mcp23s08.c Sonic Zhang           2014-09-01  609  	mcp->chip.base = pdata->base;
9fb1f39e drivers/gpio/gpio-mcp23s08.c Linus Walleij         2013-12-04  610  	mcp->chip.can_sleep = true;
58383c78 drivers/gpio/gpio-mcp23s08.c Linus Walleij         2015-11-04  611  	mcp->chip.parent = dev;
d72cbed0 drivers/gpio/mcp23s08.c      Guennadi Liakhovetski 2008-04-28  612  	mcp->chip.owner = THIS_MODULE;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  613  
8f1cc3b1 drivers/gpio/mcp23s08.c      David Brownell        2008-07-25  614  	/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
8f1cc3b1 drivers/gpio/mcp23s08.c      David Brownell        2008-07-25  615  	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
8f1cc3b1 drivers/gpio/mcp23s08.c      David Brownell        2008-07-25  616  	 */
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  617  
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  618  	ret = mcp_read(mcp, MCP_IOCON, &status);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  619  	if (ret < 0)
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  620  		goto fail;
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  621  
3af0dbd5 drivers/gpio/gpio-mcp23s08.c Sonic Zhang           2014-09-01  622  	mcp->irq_controller = pdata->irq_controller;
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  623  	if (mcp->irq && mcp->irq_controller) {
170680ab drivers/gpio/gpio-mcp23s08.c Linus Walleij         2014-12-12  624  		mcp->irq_active_high =
58383c78 drivers/gpio/gpio-mcp23s08.c Linus Walleij         2015-11-04  625  			of_property_read_bool(mcp->chip.parent->of_node,
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  626  					      "microchip,irq-active-high");
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  627  
3af0dbd5 drivers/gpio/gpio-mcp23s08.c Sonic Zhang           2014-09-01  628  		mirror = pdata->mirror;
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  629  	}
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  630  
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  631  	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  632  	     mcp->irq_active_high) {
0b7bb77f drivers/gpio/mcp23s08.c      Peter Korsgaard       2011-03-09  633  		/* mcp23s17 has IOCON twice, make sure they are in sync */
0b7bb77f drivers/gpio/mcp23s08.c      Peter Korsgaard       2011-03-09  634  		status &= ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
0b7bb77f drivers/gpio/mcp23s08.c      Peter Korsgaard       2011-03-09  635  		status |= IOCON_HAEN | (IOCON_HAEN << 8);
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  636  		if (mcp->irq_active_high)
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  637  			status |= IOCON_INTPOL | (IOCON_INTPOL << 8);
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  638  		else
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  639  			status &= ~(IOCON_INTPOL | (IOCON_INTPOL << 8));
a4e63554 drivers/gpio/gpio-mcp23s08.c Alexander Stein       2014-12-01  640  
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  641  		if (mirror)
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  642  			status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  643  
3539699c drivers/gpio/gpio-mcp23s08.c Phil Reid             2016-03-15  644  		if (type == MCP_TYPE_S18)
3539699c drivers/gpio/gpio-mcp23s08.c Phil Reid             2016-03-15  645  			status |= IOCON_INTCC | (IOCON_INTCC << 8);
3539699c drivers/gpio/gpio-mcp23s08.c Phil Reid             2016-03-15  646  
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  647  		ret = mcp_write(mcp, MCP_IOCON, status);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  648  		if (ret < 0)
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  649  			goto fail;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  650  	}
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  651  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  652  	/* configure ~100K pullups */
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  653  	ret = mcp_write(mcp, MCP_GPPU, pdata->chip[cs].pullups);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  654  	if (ret < 0)
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  655  		goto fail;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  656  
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  657  	ret = mcp_update_cache(mcp);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  658  	if (ret < 0)
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  659  		goto fail;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  660  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  661  	/* disable inverter on input */
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  662  	if (mcp->cache[MCP_IPOL] != 0) {
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  663  		mcp->cache[MCP_IPOL] = 0;
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  664  		ret = mcp_write(mcp, MCP_IPOL, 0);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  665  		if (ret < 0)
0b7bb77f drivers/gpio/mcp23s08.c      Peter Korsgaard       2011-03-09  666  			goto fail;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  667  	}
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  668  
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  669  	/* disable irqs */
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  670  	if (mcp->cache[MCP_GPINTEN] != 0) {
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  671  		mcp->cache[MCP_GPINTEN] = 0;
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  672  		ret = mcp_write(mcp, MCP_GPINTEN, 0);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  673  		if (ret < 0)
8f1cc3b1 drivers/gpio/mcp23s08.c      David Brownell        2008-07-25  674  			goto fail;
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  675  	}
e58b9e27 drivers/gpio/mcp23s08.c      David Brownell        2008-02-04  676  
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  677  	ret = gpiochip_add_data(&mcp->chip, mcp);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  678  	if (ret < 0)
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  679  		goto fail;
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  680  
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  681  	if (mcp->irq && mcp->irq_controller) {
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27 @682  		ret = mcp23s08_irq_setup(mcp);
3d84fdb3 drivers/gpio/gpio-mcp23s08.c Sebastian Reichel     2017-01-27  683  		if (ret)
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  684  			goto fail;
4e47f91b drivers/gpio/gpio-mcp23s08.c Lars Poeschel         2014-01-16  685  	}

:::::: The code at line 491 was first introduced by commit
:::::: e58b9e2762a6ef99e20dba47aba21b911658541d mcp23s08 spi gpio expander support

:::::: TO: David Brownell <dbrownell@users.sourceforge.net>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--EeQfGwPcQSOJBaQU
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
X7fnswMo3gEA

--EeQfGwPcQSOJBaQU--
