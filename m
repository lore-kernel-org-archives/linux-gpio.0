From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] linux/kernel.h: merge ARRAY_AND_SIZE defines
Date: Tue, 23 Dec 2014 21:44:39 -0800
Message-ID: <1419399879.6157.9.camel@perches.com>
References: <1419399496-5955-1-git-send-email-yamada.m@jp.panasonic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtprelay0065.hostedemail.com ([216.40.44.65]:49238 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750893AbaLXFoq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 24 Dec 2014 00:44:46 -0500
In-Reply-To: <1419399496-5955-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Russell King <linux@arm.linux.org.uk>, Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Rusty Russell <rusty@rustcorp.com.au>, Michal Nazarewicz <mina86@mina86.com>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Daniel Borkmann <dborkman@redhat.com>, Alex Elder <alex.elder@linaro.org>, Daniel Walter <dwalter@google.com>, Peter Hurley <peter@hurleysoftware.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

On Wed, 2014-12-24 at 14:38 +0900, Masahiro Yamada wrote:
> ARRAY_AND_SIZE is a useful macro.  Its definition is already
> duplicated in some headers.  Move it to include/linux/kernel.h.

I think it's not a good/useful macro and
would prefer the uses expanded instead.

The uses of ARRAY_AND_SIZE in structure
definitions aren't particularly bad, but the
ARRAY_AND_SIZE uses that hide the number of
arguments in a function I think are suboptimal.


