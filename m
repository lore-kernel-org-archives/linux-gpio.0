From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Thu, 14 Jan 2016 01:57:16 +0800
Message-ID: <201601140128.israexFi%fengguang.wu@intel.com>
References: <1452688237-30385-1-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:18458 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755005AbcAMR7P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 13 Jan 2016 12:59:15 -0500
Content-Disposition: inline
In-Reply-To: <1452688237-30385-1-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: kbuild-all@01.org, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, Martyn Welch <martyn.welch@collabora.co.uk>

Hi Martyn,

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on next-20160113]
[cannot apply to v4.4]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Martyn-Welch/USB-serial-cp210x-Adding-GPIO-support-for-CP2105/20160113-203435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing


coccinelle warnings: (new ones prefixed by >>)

>> drivers/usb/serial/cp210x.c:1132:15-21: ERROR: application of sizeof to pointer

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
