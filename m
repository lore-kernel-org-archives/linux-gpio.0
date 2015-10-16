From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: baytrail: Fix compilation warnings when !CONFIG_PM
Date: Fri, 16 Oct 2015 22:54:58 +0200
Message-ID: <CACRpkdY+OqSG5NfUQTGDru5qTERZ6APP6urNQDMCfMLE8CMAMQ@mail.gmail.com>
References: <1444747886-70568-1-git-send-email-mika.westerberg@linux.intel.com>
	<1444747886-70568-2-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35035 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932365AbbJPUy7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 16:54:59 -0400
Received: by obbzf10 with SMTP id zf10so100079890obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 13:54:59 -0700 (PDT)
In-Reply-To: <1444747886-70568-2-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 13, 2015 at 4:51 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> When CONFIG_PM is not set we get following compilation warnings:
>
>  warning: =E2=80=98byt_gpio_runtime_suspend=E2=80=99 defined but not =
used [-Wunused-function]
>  warning: =E2=80=98byt_gpio_runtime_resume=E2=80=99 defined but not u=
sed [-Wunused-function]
>
> Fix this by guarding byt_gpio_runtime_suspend()/byt_gpio_runtime_resu=
me()
> with #ifdef CONFIG_PM.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
