From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 11/17] pinctrl: uniphier: support per-pin input enable for
 new SoCs
Date: Tue, 31 May 2016 12:50:22 +0200
Message-ID: <CACRpkdYUusdcLR2Q-KCwyg=_PDbLkrn22gvDx27nb9YhSdQnRw@mail.gmail.com>
References: <1464681923-7469-1-git-send-email-yamada.masahiro@socionext.com>
	<1464681923-7469-12-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35088 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905AbcEaKuX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 06:50:23 -0400
Received: by mail-oi0-f48.google.com with SMTP id w184so288247645oiw.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 03:50:23 -0700 (PDT)
In-Reply-To: <1464681923-7469-12-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 31, 2016 at 10:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Upcoming new pinctrl drivers for PH1-LD11 and PH-LD20 support input
> signal gating for each pin.  (While, existing ones only support it
> per pin-group.)  This commit updates the core part for that.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
