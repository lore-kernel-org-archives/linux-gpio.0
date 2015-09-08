From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pwm: lpss: add PM support for LPSS PWM
Date: Tue, 8 Sep 2015 10:46:46 +0200
Message-ID: <CACRpkdZFDtu6kF+xA=X+8j823DjG=RaM6GF6TpK=eVPnR1pSjg@mail.gmail.com>
References: <1440429498-92957-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35008 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753193AbbIHIqs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 04:46:48 -0400
Received: by oiww128 with SMTP id w128so54707557oiw.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 01:46:47 -0700 (PDT)
In-Reply-To: <1440429498-92957-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, Huiquan Zhong <huiquan.zhong@intel.com>

On Mon, Aug 24, 2015 at 5:18 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:

> Without this PM support, PWM controller can't enter into
> D3 state, and then kernel will fail to enter S3.
>
> Signed-off-by: Huiquan Zhong <huiquan.zhong@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> ---
>  drivers/pwm/pwm-lpss-pci.c      | 11 +++++++++++
>  drivers/pwm/pwm-lpss-platform.c | 11 +++++++++++
>  drivers/pwm/pwm-lpss.c          | 41 +++++++++++++++++++++++++++++++++++++++++
>  drivers/pwm/pwm-lpss.h          |  1 +

Why is this sent to the GPIO list? I don't get this at all.

Send it to the PWM maintainer, and make sure to send it to
Rafael Wysocki as well, because:

A) He knows about all PM hooks and
B) He's your colleague at Intel

Yours,
Linus Walleij
