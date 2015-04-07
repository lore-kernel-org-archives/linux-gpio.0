From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Patch] pinctrl: fix warning from static analysis tools for AMD
 GPIO driver
Date: Tue, 7 Apr 2015 11:38:39 +0200
Message-ID: <CACRpkdZOtzLRy1FDHKcCJksfL575=3zFjZUQeVPUFHVJq+izZQ@mail.gmail.com>
References: <1422949788.18208.4.camel@kxue-X58A-UD3R>
	<CACRpkda2CQf6ucrLUdzbbFHjmRsRscBZspCf3taGD8t7armwQw@mail.gmail.com>
	<1425087698.14876.28.camel@kxue-X58A-UD3R>
	<1427449466.2874.2.camel@kxue-X58A-UD3R>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:35907 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752518AbbDGJik (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 05:38:40 -0400
Received: by iebrs15 with SMTP id rs15so41638109ieb.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 02:38:39 -0700 (PDT)
In-Reply-To: <1427449466.2874.2.camel@kxue-X58A-UD3R>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ken Xue <Ken.Xue@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Mar 27, 2015 at 10:44 AM, Ken Xue <Ken.Xue@amd.com> wrote:

> Fix inconsistent spinlock of AMD GPIO driver which can be
> recognized by static analysis tool smatch. Declare constant
> Variables with Sparse's suggestion.
>
> Signed-off-by: Ken Xue <Ken.Xue@amd.com>

Patch applied.

Yours,
Linus Walleij
