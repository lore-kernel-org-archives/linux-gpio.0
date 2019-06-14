From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/2] pinctrl: remove unneeded #ifdef around declarations
Date: Fri, 14 Jun 2019 15:21:27 +0200
Message-ID: <cc68b375-6011-6bbf-8f0b-c2963237a743@metux.net>
References: <20190613015532.19685-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613015532.19685-1-yamada.masahiro@socionext.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 13.06.19 03:55, Masahiro Yamada wrote:
> What is the point in surrounding the whole of declarations with
> ifdef like this?
> 
>   #ifdef CONFIG_FOO
>   int foo(void);
>   #endif
> 
> If CONFIG_FOO is not defined, all callers of foo() will fail
> with implicit declaration errors since the top Makefile adds
> -Werror-implicit-function-declaration to KBUILD_CFLAGS.
> 
> This breaks the build earlier when you are doing something wrong.
> That's it.

hmm, in general I like the idea of breaking the build as early as
possible. depending on your available cpu power, a kernel build can
take a while, and it could be a huge waste of time when having to
wait for link stage, just to find out about missing functions.

@linus: what's your oppinion ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
