From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: change gpio pin from unsigned to signed in acpi callback
Date: Mon, 27 Apr 2015 15:21:28 +0200
Message-ID: <CACRpkdasZJpBQLSp_pcv+Uzqez4OwM3GhDoggWcWXMY_budLvA@mail.gmail.com>
References: <1428618310-10229-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:34799 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932620AbbD0NV3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2015 09:21:29 -0400
Received: by obfe9 with SMTP id e9so82767463obf.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2015 06:21:28 -0700 (PDT)
In-Reply-To: <1428618310-10229-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, Alan Cox <alan@linux.intel.com>

On Fri, Apr 10, 2015 at 12:25 AM, qipeng.zha <qipeng.zha@intel.com> wrote:

> From: "qipeng.zha" <qipeng.zha@intel.com>
>
> The signed error will be wrongly used as valid gpio offset
>
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Alan Cox <alan@linux.intel.com>
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>

Patch applied for fixes with Mika's ACK.

Yours,
Linus Walleij
