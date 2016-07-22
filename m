From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: ns2: remove redundant dev_err call in ns2_pinmux_probe()
Date: Fri, 22 Jul 2016 16:38:04 +0200
Message-ID: <CACRpkdakYUAVKyCygM4TKp4kb3pA8e4JoESLwySSSbW47cXisA@mail.gmail.com>
References: <1468333185-8047-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36448 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901AbcGVOiG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2016 10:38:06 -0400
Received: by mail-oi0-f52.google.com with SMTP id w18so165378032oiw.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2016 07:38:05 -0700 (PDT)
In-Reply-To: <1468333185-8047-1-git-send-email-weiyj_lk@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: weiyj_lk@163.com
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jul 12, 2016 at 4:19 PM,  <weiyj_lk@163.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied with Ray's ACK.

Yours,
Linus Walleij
