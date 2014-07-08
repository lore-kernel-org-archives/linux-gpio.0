From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rcar: Add support for DT IRQ flags
Date: Tue, 8 Jul 2014 10:48:27 +0200
Message-ID: <CACRpkdbVtUFOVkpVeqVWtmAE_Yj6iYXe9Y6O_ooqXSDsMk4mgg@mail.gmail.com>
References: <1396349886-26663-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<2822093.Rul4y5g8OD@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:64624 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752883AbaGHIs1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jul 2014 04:48:27 -0400
Received: by mail-ob0-f178.google.com with SMTP id wn1so6068951obc.9
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2014 01:48:27 -0700 (PDT)
In-Reply-To: <2822093.Rul4y5g8OD@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Magnus Damm <damm@opensource.se>

On Wed, Jul 2, 2014 at 4:37 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> Hi Linus,
>
> Could you please pick this patch up for v3.17 ?
>
> On Tuesday 01 April 2014 12:58:06 Laurent Pinchart wrote:
>> The gpio-rcar driver has no IRQ domain OF xlate function and thus
>> ignores IRQ flags specified in DT. Fix this by using the two-cell xlate
>> function.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I don't have this patch in my INBOX, dunno what has gone wrong :-(

Can you please resend it so I can apply it?

Yours,
Linus Walleij
