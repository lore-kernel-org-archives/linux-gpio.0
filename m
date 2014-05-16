From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: janzttl: use devm function
Date: Fri, 16 May 2014 17:22:01 +0200
Message-ID: <CACRpkda2E7u9=7MH1v7MSUyH2Ubsi9vzxWE2X4LwHVV8Uzm3Eg@mail.gmail.com>
References: <1399999332-23279-1-git-send-email-berthe.ab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:61184 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932668AbaEPPWD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 May 2014 11:22:03 -0400
Received: by mail-ob0-f173.google.com with SMTP id wm4so3115483obc.32
        for <linux-gpio@vger.kernel.org>; Fri, 16 May 2014 08:22:01 -0700 (PDT)
In-Reply-To: <1399999332-23279-1-git-send-email-berthe.ab@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: abdoulaye berthe <berthe.ab@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 13, 2014 at 6:42 PM, abdoulaye berthe <berthe.ab@gmail.com> wrote:

> This uses dem function for mem allocation
>
> Signed-off-by: abdoulaye berthe <berthe.ab@gmail.com>

Patch applied after fixing up some collission with the other
patch cleaning up the OOM exit path.

Yours,
Linus Walleij
