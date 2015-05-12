From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] Revert "gpio: generic: clamp retured value to [0,1]"
Date: Tue, 12 May 2015 13:52:44 +0200
Message-ID: <CACRpkdZ-o5fKv=S2OVvH+8LXqFXfHmi4sVk2dROBN5W+=QiUmQ@mail.gmail.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
	<1430321701-13758-2-git-send-email-vladimir_zapolskiy@mentor.com>
	<CACRpkdYWEygtL3h4Z6uaWGxc1ac2Q7_X9gddCobUj_dHpSiK0g@mail.gmail.com>
	<5550AAB2.4060308@mentor.com>
	<CAAVeFuLW6xzgMa0AxA_MW9idkwohyC6c93ZhG-hGvE+OdyJ+jg@mail.gmail.com>
	<5551B1B2.4070606@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:32827 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932379AbbELLwp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 07:52:45 -0400
Received: by obblk2 with SMTP id lk2so3341561obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 04:52:44 -0700 (PDT)
In-Reply-To: <5551B1B2.4070606@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 12, 2015 at 9:54 AM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
> On 12.05.2015 10:45, Alexandre Courbot wrote:

>> Actually, with implicit type conversion doing most of the job, I
>> wonder if it would be that hard to do - maybe you will want to give it
>> a quick try?
>
> it should be quite a simple and straightforward change, I'll prepare
> patches for review, thank you for offering the task.

Awesome, thanks for proposing this to be done guys.

Yours,
Linus Walleij
