From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Tue, 20 Jun 2017 18:10:35 -0500
Message-ID: <9e5bc3fb-e3c8-1c5d-c358-adb4fa68bc55@codeaurora.org>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
 <20170616150721.GJ20170@codeaurora.org>
 <9bdc5f51-0045-53bf-4b5f-be2a930f1965@codeaurora.org>
 <20170616154125.GK20170@codeaurora.org>
 <bac5136c-e98f-d6ef-bf30-0c22b01c1ac7@codeaurora.org>
 <20170616160644.GA17640@tuxbook>
 <826fe45c-ada4-75dc-8b72-767d690b4964@codeaurora.org>
 <CAPBZ5QcEAtp4CxQE09O=UeLVquxbXEu_dnccF_hgTy_R4Qca+Q@mail.gmail.com>
 <c32b0c54-652c-69ce-4bbc-a24e443afbf2@codeaurora.org>
 <20170616174438.GC17640@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:39976 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752392AbdFTXKi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 19:10:38 -0400
In-Reply-To: <20170616174438.GC17640@tuxbook>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org

On 06/16/2017 12:44 PM, Bjorn Andersson wrote:
> I think that it would be nice to come up with a solution that works for
> the other users of pinctrl-msm as well.

I need help making that work.  I'm at my wits' end trying to figure it out.

This is what I currently have:

@@ -835,11 +836,14 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
                 return ret;
         }

-       ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev), 
0, 0, c
-       if (ret) {
-               dev_err(pctrl->dev, "Failed to add pin range\n");
-               gpiochip_remove(&pctrl->chip);
-               return ret;
+       for (i = 0; i < ngpio; i++) {
+               ret = gpiochip_add_pin_range(&pctrl->chip, 
dev_name(pctrl->dev),
+                                            pctrl->soc->groups[i].pins[0],
+ 
pctrl->soc->groups[i].pins[0], 1);
+               if (ret) {
+                       dev_err(pctrl->dev, "Failed to add pin range\n");
+                       gpiochip_remove(&pctrl->chip);
+                       return ret;
+               }

When I run it, I get this out

gpio gpiochip0: (QCOM8001:00): created GPIO range 116->116 ==> 
QCOM8001:00 PIN 116->116
gpio gpiochip0: (QCOM8001:00): created GPIO range 117->117 ==> 
QCOM8001:00 PIN 117->117
gpio gpiochip0: (QCOM8001:00): created GPIO range 118->118 ==> 
QCOM8001:00 PIN 118->118
gpio gpiochip0: (QCOM8001:00): created GPIO range 119->119 ==> 
QCOM8001:00 PIN 119->119
gpio gpiochip0: (QCOM8001:00): created GPIO range 120->120 ==> 
QCOM8001:00 PIN 120->120
gpio gpiochip0: (QCOM8001:00): created GPIO range 121->121 ==> 
QCOM8001:00 PIN 121->121
gpio gpiochip0: (QCOM8001:00): created GPIO range 122->122 ==> 
QCOM8001:00 PIN 122->122
gpio gpiochip0: (QCOM8001:00): created GPIO range 123->123 ==> 
QCOM8001:00 PIN 123->123
gpio gpiochip0: (QCOM8001:00): created GPIO range 124->124 ==> 
QCOM8001:00 PIN 124->124
gpio gpiochip0: (QCOM8001:00): created GPIO range 125->125 ==> 
QCOM8001:00 PIN 125->125
gpio gpiochip0: (QCOM8001:00): created GPIO range 126->126 ==> 
QCOM8001:00 PIN 126->126
gpio gpiochip0: (QCOM8001:00): created GPIO range 127->127 ==> 
QCOM8001:00 PIN 127->127
gpio gpiochip0: (QCOM8001:00): created GPIO range 128->128 ==> 
QCOM8001:00 PIN 128->128
gpio gpiochip0: (QCOM8001:00): created GPIO range 129->129 ==> 
QCOM8001:00 PIN 129->129
gpio gpiochip0: (QCOM8001:00): created GPIO range 130->130 ==> 
QCOM8001:00 PIN 130->130
gpio gpiochip0: (QCOM8001:00): created GPIO range 131->131 ==> 
QCOM8001:00 PIN 131->131
gpio gpiochip0: (QCOM8001:00): created GPIO range 80->80 ==> QCOM8001:00 
PIN 80->80
gpio gpiochip0: (QCOM8001:00): created GPIO range 81->81 ==> QCOM8001:00 
PIN 81->81
gpio gpiochip0: (QCOM8001:00): created GPIO range 82->82 ==> QCOM8001:00 
PIN 82->82
gpio gpiochip0: (QCOM8001:00): created GPIO range 83->83 ==> QCOM8001:00 
PIN 83->83
gpio gpiochip0: (QCOM8001:00): created GPIO range 84->84 ==> QCOM8001:00 
PIN 84->84
gpio gpiochip0: (QCOM8001:00): created GPIO range 85->85 ==> QCOM8001:00 
PIN 85->85
gpio gpiochip0: (QCOM8001:00): created GPIO range 86->86 ==> QCOM8001:00 
PIN 86->86
gpio gpiochip0: (QCOM8001:00): created GPIO range 87->87 ==> QCOM8001:00 
PIN 87->87
gpio gpiochip0: (QCOM8001:00): created GPIO range 88->88 ==> QCOM8001:00 
PIN 88->88
gpio gpiochip0: (QCOM8001:00): created GPIO range 89->89 ==> QCOM8001:00 
PIN 89->89
gpio gpiochip0: (QCOM8001:00): created GPIO range 90->90 ==> QCOM8001:00 
PIN 90->90
gpio gpiochip0: (QCOM8001:00): created GPIO range 50->50 ==> QCOM8001:00 
PIN 50->50
gpio gpiochip0: (QCOM8001:00): created GPIO range 36->36 ==> QCOM8001:00 
PIN 36->36
gpio gpiochip0: (QCOM8001:00): created GPIO range 37->37 ==> QCOM8001:00 
PIN 37->37
gpio gpiochip0: (QCOM8001:00): created GPIO range 38->38 ==> QCOM8001:00 
PIN 38->38
gpio gpiochip0: (QCOM8001:00): created GPIO range 39->39 ==> QCOM8001:00 
PIN 39->39


Which looks promising, except that I cannot export any GPIOs:


root@ubuntu:~# cd /sys/class/gpio/
root@ubuntu:/sys/class/gpio# echo 0 > export
-su: echo: write error: No such device
root@ubuntu:/sys/class/gpio# echo 37 > export
[  229.639992] export_store: invalid GPIO 37
-su: echo: write error: Invalid argument
root@ubuntu:/sys/class/gpio# echo 1 > export
-su: echo: write error: No such device

I was really hoping that "echo 37 > export" would work, but it doesn't.

And then I realized.  Even if I could get this to work, the only way the 
user would know GPIOs are actually exported is via /sys/kernel/debug/gpio:

# cat gpio
gpiochip0: GPIOs 0-31, parent: platform/QCOM8001:00, QCOM8001:00:
  gpio[116]: in  0 2mA pull down
  gpio[117]: in  0 2mA pull down
  gpio[118]: in  0 2mA pull down
  gpio[119]: in  0 2mA pull down
  gpio[120]: in  0 2mA pull down
  gpio[121]: in  0 2mA pull down
  gpio[122]: in  0 2mA pull down
  gpio[123]: in  0 2mA pull down
  gpio[124]: in  0 2mA pull down
  gpio[125]: in  0 2mA pull down
  gpio[126]: in  0 2mA pull down
  gpio[127]: in  0 2mA pull down
  gpio[128]: in  0 2mA pull down
  gpio[129]: in  0 2mA pull down
  gpio[130]: in  0 2mA pull down
  gpio[131]: in  0 2mA pull down
  gpio[80]: in  0 2mA pull down
  gpio[81]: in  0 2mA pull down
  gpio[82]: in  0 2mA pull down
  gpio[83]: in  0 2mA pull down
  gpio[84]: in  0 2mA pull down
  gpio[85]: in  0 2mA pull down
  gpio[86]: in  0 2mA pull down
  gpio[87]: in  0 2mA pull down
  gpio[88]: in  0 2mA pull down
  gpio[89]: in  0 2mA pull down
  gpio[90]: in  0 2mA pull down
  gpio[50]: in  0 2mA pull down
  gpio[36]: in  0 2mA pull down
  gpio[37]: in  0 2mA pull down
  gpio[38]: in  0 2mA pull down
  gpio[39]: in  0 2mA pull down

I'm not sure it's wise to depend on debugfs to know which GPIOs actually 
exist.  I just don't see a good solution here.  My initial solution 
would be to create 32 GPIOs, numbered 0-13, but have 'gpio0" map to 
"gpio 116", and so on.  It would be confusing at but, and you would 
still depend on debugfs to figure out what "gpio0" really is, but at 
least it would work.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
