From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: nsp: remove redundant dev_err call in nsp_pinmux_probe()
Date: Mon, 11 Jul 2016 09:55:35 +0200
Message-ID: <CACRpkdbcqjUFfThB_6mT0fYQca6VsLRAk1c1nTCEwptvPfqMjQ@mail.gmail.com>
References: <1467806571-23811-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33508 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757698AbcGKHzg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 03:55:36 -0400
Received: by mail-oi0-f44.google.com with SMTP id u201so136674548oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 00:55:36 -0700 (PDT)
In-Reply-To: <1467806571-23811-1-git-send-email-weiyj_lk@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: weiyj_lk@163.com
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Wed, Jul 6, 2016 at 2:02 PM,  <weiyj_lk@163.com> wrote:

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
