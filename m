From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 2/2] pinctrl: intel: fix offset calculation issue of
 register PAD_OWN
Date: Thu, 10 Dec 2015 18:05:24 +0100
Message-ID: <CACRpkdaXe0-SaV_d-KMYJ-mvC=ezjqcMnkVmCyj2MeH7TKUYmw@mail.gmail.com>
References: <1448882416-40845-1-git-send-email-qipeng.zha@intel.com>
	<1448882416-40845-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34527 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752571AbbLJRFZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 12:05:25 -0500
Received: by oigl9 with SMTP id l9so10161820oig.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 09:05:24 -0800 (PST)
In-Reply-To: <1448882416-40845-2-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, Qi Zheng <qi.zheng@intel.com>

On Mon, Nov 30, 2015 at 12:20 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:

> The calculation equation of PAD_OWN register offset is not
> correct for Broxton, verified this fix will get right
> offset for Broxton.
>
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
>
> ---
> change in v4
>  fix the equation regarding to sunprisepoint platform.

Patch applied for fixes with Mika's ACK.

Yours,
Linus Walleij
