From: Deepak <deepak_das@mentor.com>
Subject: [PATCH] driver: base: pinctrl: return error from pinctrl_bind_pins()
Date: Tue, 13 Sep 2016 12:43:04 +0530
Message-ID: <57D7A700.8080402@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:47893 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751608AbcIMHNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 03:13:09 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, vzapolsk <Vladimir_Zapolskiy@mentor.com>

strict pin controller returns -EINVAL in case of pin request which
is already claimed by somebody else.
Following is the sequence of calling pin_request() from
pinctrl_bind_pins():-
pinctrl_bind_pins()->pinctrl_select_state()->pinmux_enable_setting()->
pin_request()

But pinctrl_bind_pins() only returns -EPROBE_DEFER which makes device
driver probe successful even if the pin request is rejected by the pin
controller subsystem.

This commit modifies pinctrl_bind_pins() to return error if the pin is
rejected by pin control subsystem.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
---
  drivers/base/pinctrl.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/pinctrl.c b/drivers/base/pinctrl.c
index 0762975..e65c1af 100644
--- a/drivers/base/pinctrl.c
+++ b/drivers/base/pinctrl.c
@@ -92,7 +92,7 @@ cleanup_alloc:
      dev->pins = NULL;

      /* Only return deferrals */
-    if (ret != -EPROBE_DEFER)
+    if ((ret != -EPROBE_DEFER) && (ret != -EINVAL))
          ret = 0;

      return ret;
-- 
1.9.1

