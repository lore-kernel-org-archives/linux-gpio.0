From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: don't try to print function groups if we can't
 get them
Date: Wed, 10 Jun 2015 10:44:52 +0200
Message-ID: <CACRpkdZw7Epf2h+SB61T1sM2zLu8nmaqM0E5_UesY5XXjNJJqQ@mail.gmail.com>
References: <1433776597-615-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:36614 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753984AbbFJIow (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 04:44:52 -0400
Received: by obbqz1 with SMTP id qz1so30243045obb.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 01:44:52 -0700 (PDT)
In-Reply-To: <1433776597-615-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>

On Mon, Jun 8, 2015 at 5:16 PM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:

> There is no reason to try to print groups associated to a function if
> get_function_groups returns an error. Moreover, it can lead to a NULL
> pointer dereference error.
>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>

Patch applied.

Yours,
Linus Walleij
