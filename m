From: Jonas Jensen <jonas.jensen@gmail.com>
Subject: Re: [PATCH 0/2] Make generic MMIO GPIO aware of the pinctrl subsystem
Date: Fri, 17 Jul 2015 22:38:40 +0200
Message-ID: <CACmBeS0zPM9AipkGzOKbH-Mu8Ryf9Hg_Tvfey+k1d+Y_3vf+8g@mail.gmail.com>
References: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:34859 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752756AbbGQUil (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 16:38:41 -0400
Received: by ykdu72 with SMTP id u72so98818493ykd.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 13:38:41 -0700 (PDT)
In-Reply-To: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael van der Westhuizen <michael@smart-africa.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Kamlakant Patel <kamlakant.patel@linaro.org>

On 19 June 2015 at 14:58, Michael van der Westhuizen
<michael@smart-africa.com> wrote:
>   gpio: bgpio: Teach gpio-generic about the pinctrl subsystem
>   gpio: moxart-gpio: Use generic-gpio pinctrl integration

Thanks,

Patches applied (to v4.1) and verified OK on UC-7112-LX.

https://bitbucket.org/Kasreyn/linux-next/commits/1f113e8e2083d88a8b7972e952e4550dcc79e4fb


Tested-by: Jonas Jensen <jonas.jensen@gmail.com>
