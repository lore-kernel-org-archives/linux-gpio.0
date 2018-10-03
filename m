From: Sodagudi Prasad <psodagud@codeaurora.org>
Subject: protected pins and debugfs
Date: Wed, 03 Oct 2018 05:38:24 -0700
Message-ID: <9aec322678417753fe4022691f4bfdbe@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@codeaurora.org, bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi All,

This is regarding the protected pins configuration reading and printing 
from non-secure operating systems.
GPIO framework is checking whether pin is in use(flag FLAG_REQUESTED) or 
not in gpiolib_dbg_show().

If GPIO chip drivers are overriding the dbg_show callback, drivers are 
not checking whether a pin is really in use or not to print 
configuration details.
     if (chip->dbg_show)
                 chip->dbg_show(s, chip);
         else
                 gpiolib_dbg_show(s, gdev);

I think, reserved-gpio-ranges solution may move the problem to dts 
settings maintenance as they change from platform to platform.
https://lore.kernel.org/patchwork/patch/878107/
https://lore.kernel.org/patchwork/patch/878106/
https://lore.kernel.org/patchwork/patch/878109/

Can we use a simple/common solution like below?  It will check whether a 
pin is in use or not before printing configuration data with the help of 
gpiochip_is_requested().

index fef0970..2ca1440 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -579,16 +579,20 @@ static void msm_gpio_dbg_show_one(struct seq_file 
*s,
         seq_printf(s, " %-8s: %-3s %d", g->name, is_out ? "out" : "in", 
func);
         seq_printf(s, " %dmA", msm_regval_to_drive(drive));
         seq_printf(s, " %s", pulls[pull]);
+       seq_puts(s, "\n");
  }

  static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip 
*chip)
  {
         unsigned gpio = chip->base;
         unsigned i;
+       const char *label;

         for (i = 0; i < chip->ngpio; i++, gpio++) {
+               label = gpiochip_is_requested(chip, i);
+               if (!label)
+                       continue;
                 msm_gpio_dbg_show_one(s, NULL, chip, i, gpio);
-               seq_puts(s, "\n");
         }
  }

-Thanks, Prasad

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
Linux Foundation Collaborative Project
