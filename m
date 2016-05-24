From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Moving pinctrl node under syscon for UniPhier pinctrl driver
Date: Tue, 24 May 2016 13:49:03 +0900
Message-ID: <CAK7LNARp2t8y=8OaCTLG3ozBO-ZpyxVdEpo2M74TQ9ctcSnepQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:42005 "EHLO
	conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752666AbcEXEtN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 00:49:13 -0400
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com [209.85.161.172]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id u4O4n4cA027820
	for <linux-gpio@vger.kernel.org>; Tue, 24 May 2016 13:49:04 +0900
Received: by mail-yw0-f172.google.com with SMTP id h19so5483469ywc.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2016 21:49:04 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hi Linus,


I made my pinctrl drivers upstreamed last year, but
now found the current binding is not good.


Currently, the pinctrl node is a syscon node,
but I noticed that it should be moved under the syscon node
to ease my next development.


Current DT
-----------

    pinctrl {
            compatible = "socionext,foo-pinctrl", "syscon";
            ....
    };


New DT
------

    soc_glue {
            compatible = "socionext,foo-socglue", "syscon",
                         "simple-mfd";

            pinctrl {
                    compatible = "socionext,foo-pinctrl";
            };

            phy {
                     .....
            };
    }


(The "soc_glue" node is a syscon node
that consists of a bunch of system-configuration registers,
such as pinctrl, some phys, and some misc registers.
Various registers are mixed in one hardware block,
so it is difficult to split it.)



But, this effectively breaks the current DT binding.

So, my migration plan is

[1] Add the new binding support with a new compatible string.
    (note the old binding is still supported for backward compatibility)

[2] Wait a couple of releases, keeping both of the two bindings

[3] Drop the old binding support


If it is OK, I want to move it forward.

Thanks.



-- 
Best Regards
Masahiro Yamada
