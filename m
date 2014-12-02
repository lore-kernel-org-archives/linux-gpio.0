From: Yunlei He <heyunlei@huawei.com>
Subject: [PATCH 0/2] gpio: pl061: hook request if gpio-ranges avaiable
Date: Tue, 2 Dec 2014 12:32:58 +0800
Message-ID: <1417494780-3704-1-git-send-email-heyunlei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:61304 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754080AbaLBEd2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 23:33:28 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: haojian.zhuang@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: bintian.wang@huawei.com, peifeiyue@huawei.com, liguozhu@hisilicon.com, Yunlei He <heyunlei@huawei.com>

Hi,

This series includes two patches for sloving pinctrl_request_gpio() returns
EPROBE_DEFER problem. We find this problem when we use gpio device without
"gpio-ranges" property in gpio device node. 

 - First patch provides solutions to this problem
 
 - Second patch documents gpio-ranges property for bindings file.

Yunlei He (2):
  gpio: pl061: hook request if gpio-ranges avaiable
  gpio: pl061: document gpio-ranges property for bindings file

 .../devicetree/bindings/gpio/pl061-gpio.txt          |  2 +-
 drivers/gpio/gpio-pl061.c                            | 20 ++++++++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

-- 
1.9.1


