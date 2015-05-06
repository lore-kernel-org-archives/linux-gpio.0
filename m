From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1 linux-next RESEND] pinctrl: use ERR_CAST instead of ERR_PTR/PTR_ERR
Date: Wed, 6 May 2015 15:35:13 +0200
Message-ID: <CACRpkdYAJEfnAsYNjYv0GCtMCLPSj1e+wCJFpwyfxMQDEWp77w@mail.gmail.com>
References: <1430150646-21946-1-git-send-email-fabf@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35754 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124AbbEFNfO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2015 09:35:14 -0400
Received: by obcux3 with SMTP id ux3so6893667obc.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2015 06:35:13 -0700 (PDT)
In-Reply-To: <1430150646-21946-1-git-send-email-fabf@skynet.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabian Frederick <fabf@skynet.be>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Apr 27, 2015 at 6:04 PM, Fabian Frederick <fabf@skynet.be> wrote:

> Inspired by scripts/coccinelle/api/err_cast.cocci
>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Patch applied.

Yours,
Linus Walleij
