From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: translate pin number in GPIO ACPI callbacks
Date: Thu, 19 Mar 2015 09:23:32 +0100
Message-ID: <CACRpkdYfiPM9iSfUiQUU3BgkGd=rsb95GRie6ehmkUyZ3Se05g@mail.gmail.com>
References: <1426007738-119736-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33450 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778AbbCSIXd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2015 04:23:33 -0400
Received: by oifl3 with SMTP id l3so28782704oif.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2015 01:23:32 -0700 (PDT)
In-Reply-To: <1426007738-119736-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, qi.zheng@intel.com, "jason.cj.chen" <jason.cj.chen@intel.com>

On Tue, Mar 10, 2015 at 6:15 PM, qipeng.zha <qipeng.zha@intel.com> wrote:

> From: "qipeng.zha" <qipeng.zha@intel.com>
>
> If GPIO driver use pin mapping, need to translate pin number
> between ACPI table and GPIO driver.
>
> This issue is found on one platform with Cherryview gpio
> controller, kernel is hang when executed _PS0 method of
> one ACPI device, since without this translation, it access
> invalid gpiodesc array.
>
> Verified it works again with this patch.
>
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
