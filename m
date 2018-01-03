From: Julia Lawall <julia.lawall@lip6.fr>
Subject: [gpio:gpio-descriptors-regulator 26/26] drivers/regulator/gpio-regulator.c:340:1-6:
 WARNING: invalid free of devm_ allocated data (fwd)
Date: Wed, 3 Jan 2018 11:42:28 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801031141370.3229@hadrien>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-469662152-1514976149=:3229"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:10960
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751185AbeACKmd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jan 2018 05:42:33 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, kbuild-all@01.org

--8323329-469662152-1514976149=:3229
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

It looks like the probe function was updated without updating the remove
function.  Actually both kfrees should be dropped.

julia

---------- Forwarded message ----------
Date: Wed, 3 Jan 2018 18:36:20 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: [gpio:gpio-descriptors-regulator 26/26]
    drivers/regulator/gpio-regulator.c:340:1-6: WARNING: invalid free of devm_
    allocated data

CC: kbuild-all@01.org
CC: linux-gpio@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-regulator
head:   095f8ac81c996886518e33df51266eee595e667a
commit: 095f8ac81c996886518e33df51266eee595e667a [26/26] regulator: gpio: Simplify probe path
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago

>> drivers/regulator/gpio-regulator.c:340:1-6: WARNING: invalid free of devm_ allocated data
   drivers/regulator/gpio-regulator.c:341:1-6: WARNING: invalid free of devm_ allocated data

# https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=095f8ac81c996886518e33df51266eee595e667a
git remote add gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
git remote update gpio
git checkout 095f8ac81c996886518e33df51266eee595e667a
vim +340 drivers/regulator/gpio-regulator.c

3f0292ae Heiko Stübner  2011-10-05  334
8dc995f5 Bill Pemberton 2012-11-19  335  static int gpio_regulator_remove(struct platform_device *pdev)
3f0292ae Heiko Stübner  2011-10-05  336  {
3f0292ae Heiko Stübner  2011-10-05  337  	struct gpio_regulator_data *drvdata = platform_get_drvdata(pdev);
3f0292ae Heiko Stübner  2011-10-05  338
3f0292ae Heiko Stübner  2011-10-05  339  	regulator_unregister(drvdata->dev);
3f0292ae Heiko Stübner  2011-10-05 @340  	kfree(drvdata->states);
3f0292ae Heiko Stübner  2011-10-05  341  	kfree(drvdata->desc.name);
3f0292ae Heiko Stübner  2011-10-05  342
3f0292ae Heiko Stübner  2011-10-05  343  	return 0;
3f0292ae Heiko Stübner  2011-10-05  344  }
3f0292ae Heiko Stübner  2011-10-05  345

:::::: The code at line 340 was first introduced by commit
:::::: 3f0292ae8bb100cc8f96106a3de277df48134887 regulator: Add driver for gpio-controlled regulators

:::::: TO: Heiko Stübner <heiko@sntech.de>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--8323329-469662152-1514976149=:3229--
