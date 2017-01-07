From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: krealloc potential issue
Date: Sat, 7 Jan 2017 21:19:07 +0200
Message-ID: <CAHp75Vd9DQeGxQoNmk0M7ZqzshCB1ryKRTOU_MDNt0rwNGHK=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:36444 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752155AbdAGTTJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Jan 2017 14:19:09 -0500
Received: by mail-qt0-f176.google.com with SMTP id k15so335730461qtg.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Jan 2017 11:19:08 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

We don't want to assing result to old variable.

drivers/pinctrl/berlin/berlin.c:239:    pctrl->functions =
krealloc(pctrl->functions,
drivers/pinctrl/sh-pfc/pinctrl.c:192:   maps = krealloc(maps,
sizeof(*maps) * nmaps, GFP_KERNEL);
drivers/pinctrl/sunxi/pinctrl-sunxi.c:400:      *map = krealloc(*map,
i * sizeof(struct pinctrl_map), GFP_KERNEL);
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1088:     pctl->functions =
krealloc(pctl->functions,


I have checked them, and seems all listed have a flaw.

-- 
With Best Regards,
Andy Shevchenko
