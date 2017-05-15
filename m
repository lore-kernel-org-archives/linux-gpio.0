From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] pinctrl: cherryview: Extend the DMI quirk to Intel_Strago systems
Date: Mon, 15 May 2017 14:01:00 +0300
Message-ID: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:58995 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933701AbdEOLBn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 07:01:43 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

Hi,

It turned out that there are bunch of other Chromebooks that need the DMI
quirk as well. Most of these are based on Intel_Strago reference design so
we can identify them by using DMI_PRODUCT_FAMILY introduced in this series.
The systems without the family string we add them separately.

Related bugzilla entry:

  https://bugzilla.kernel.org/show_bug.cgi?id=194945

I'm including fix from Yongjun as well because I did not find it in
v4.12-rc1 possibly because it just was forgotten.

Mika Westerberg (2):
  firmware: dmi: Add DMI_PRODUCT_FAMILY identification string
  pinctrl: cherryview: Extend the Chromebook DMI quirk to Intel_Strago systems

Wei Yongjun (1):
  pinctrl: cherryview: Add terminate entry for dmi_system_id tables

 drivers/firmware/dmi-id.c                  |  2 ++
 drivers/firmware/dmi_scan.c                |  1 +
 drivers/pinctrl/intel/pinctrl-cherryview.c | 26 +++++++++++++++++++++-----
 include/linux/mod_devicetable.h            |  1 +
 4 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.11.0

