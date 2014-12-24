From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH] linux/kernel.h: merge ARRAY_AND_SIZE defines
Date: Wed, 24 Dec 2014 08:02:30 -0600
Message-ID: <549AC776.8090905@linaro.org>
References: <1419399496-5955-1-git-send-email-yamada.m@jp.panasonic.com> <1419399879.6157.9.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:40628 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798AbaLXOCd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Dec 2014 09:02:33 -0500
Received: by mail-ig0-f176.google.com with SMTP id l13so7424724iga.9
        for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2014 06:02:32 -0800 (PST)
In-Reply-To: <1419399879.6157.9.camel@perches.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joe Perches <joe@perches.com>, Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Russell King <linux@arm.linux.org.uk>, Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Rusty Russell <rusty@rustcorp.com.au>, Michal Nazarewicz <mina86@mina86.com>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Daniel Borkmann <dborkman@redhat.com>, Alex Elder <alex.elder@linaro.org>, Daniel Walter <dwalter@google.com>, Peter Hurley <peter@hurleysoftware.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

On 12/23/2014 11:44 PM, Joe Perches wrote:
> On Wed, 2014-12-24 at 14:38 +0900, Masahiro Yamada wrote:
>> ARRAY_AND_SIZE is a useful macro.  Its definition is already
>> duplicated in some headers.  Move it to include/linux/kernel.h.
> 
> I think it's not a good/useful macro and
> would prefer the uses expanded instead.

For what it's worth, I agree.	-Alex

> The uses of ARRAY_AND_SIZE in structure
> definitions aren't particularly bad, but the
> ARRAY_AND_SIZE uses that hide the number of
> arguments in a function I think are suboptimal.
> 
> 

