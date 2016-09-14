From: Deepak Das <deepak_das@mentor.com>
Subject: [PATCH v2] driver: base: pinctrl: return error from,
 pinctrl_bind_pins()
Date: Wed, 14 Sep 2016 12:04:18 +0530
Message-ID: <57D8EF6A.2050200@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: vzapolsk <Vladimir_Zapolskiy@mentor.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

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
Changes from v1 to v2:
* Modified the comment to indicate return error in case of
   invalid pin requests

  drivers/base/pinctrl.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/pinctrl.c b/drivers/base/pinctrl.c
index 5fb74b4..12f0eb5 100644
--- a/drivers/base/pinctrl.c
+++ b/drivers/base/pinctrl.c
@@ -80,8 +80,8 @@ cleanup_alloc:
         devm_kfree(dev, dev->pins);
         dev->pins = NULL;

-       /* Only return deferrals */
-       if (ret != -EPROBE_DEFER)
+       /* Return deferrals & invalid pin requests */
+       if ((ret != -EPROBE_DEFER) && (ret != -EINVAL))
                 ret = 0;

         return ret;
--
1.9.1
