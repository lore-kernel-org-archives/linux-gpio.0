From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: update direction_output function of cherryview driver
Date: Tue, 10 Mar 2015 09:02:03 +0100
Message-ID: <CACRpkdYw6L8CXiP8cgjhQqAop6GcWzUVgn0gw2rTcFpq6GYjSw@mail.gmail.com>
References: <1425377602-6649-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:40979 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752140AbbCJICE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Mar 2015 04:02:04 -0400
Received: by obcva8 with SMTP id va8so27827759obc.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2015 01:02:03 -0700 (PDT)
In-Reply-To: <1425377602-6649-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "jason.cj.chen" <jason.cj.chen@intel.com>

On Tue, Mar 3, 2015 at 11:13 AM, qipeng.zha <qipeng.zha@intel.com> wrote:

> From: "qipeng.zha" <qipeng.zha@intel.com>
>
> From the comments of gpiod_direction_output(), need to set @value
> as initial output, so update the lowlevel routine to make it work.
>
> Signed-off-by: jason.cj.chen<jason.cj.chen@intel.com>
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
