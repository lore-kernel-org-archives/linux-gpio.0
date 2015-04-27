From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom-spmi: Fix pin direction configuration
Date: Mon, 27 Apr 2015 15:34:20 +0200
Message-ID: <CACRpkdY+vV0uznsthJukOWQxMexj_yesj1g5Z68wMc8aAsg+GA@mail.gmail.com>
References: <1429282249-30450-1-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35588 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752935AbbD0NeV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2015 09:34:21 -0400
Received: by oign205 with SMTP id n205so88782412oig.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2015 06:34:20 -0700 (PDT)
In-Reply-To: <1429282249-30450-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Soren Brinkmann <soren.brinkmann@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>

On Fri, Apr 17, 2015 at 4:50 PM, Ivan T. Ivanov <ivan.ivanov@linaro.org=
> wrote:

> Pin direction configuration was incorrectly overwritten
> by output and function values in set_mux(). Fix this.
>
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>

Patch applied for fixes, I guess Bj=C3=B6rn is also happy with this.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
