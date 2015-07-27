From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] tracing: gpio: add Kconfig option for
 enabling/disabling trace events
Date: Mon, 27 Jul 2015 13:57:49 +0200
Message-ID: <CACRpkdZc9hiq93q0U9RgSACW-Avc0NQkoQTEuLA+PYF=rDxLVA@mail.gmail.com>
References: <20150713143459.09582cb9@gandalf.local.home>
	<1437068376-24617-1-git-send-email-tal.shorer@gmail.com>
	<1437068376-24617-3-git-send-email-tal.shorer@gmail.com>
	<20150717143606.200d97d7@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33428 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751998AbbG0L5u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 07:57:50 -0400
Received: by obdeg2 with SMTP id eg2so57534705obd.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 04:57:50 -0700 (PDT)
In-Reply-To: <20150717143606.200d97d7@gandalf.local.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Tal Shorer <tal.shorer@gmail.com>, Ingo Molnar <mingo@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jul 17, 2015 at 8:36 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Thu, 16 Jul 2015 20:39:36 +0300
> Tal Shorer <tal.shorer@gmail.com> wrote:
>
>> Add a new options to gpio Kconfig, CONFIG_GPIO_TRACING, that is used
>> for enabling/disabling compilation of gpio function trace events.
>>
>
> If I can get acks from the gpio maintainers, I can take this in my
> tree, as it depends on code that modifies the core tracing facility.

What works for the tracing maintainer works for me.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Now you can decide if you want this or not... there are some
comments from Tal Shorer I see.

Yours,
Linus Walleij
