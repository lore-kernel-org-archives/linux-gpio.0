From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 2/3] x86: apuv2: fix input dependencies
Date: Tue, 5 Mar 2019 01:18:53 +0100
Message-ID: <a94c3c6a-481e-96a5-74e1-8c3299c74129@metux.net>
References: <20190304201930.1622839-1-arnd@arndb.de>
 <20190304201930.1622839-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304201930.1622839-2-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Linus Walleij <linusw@kernel.org>, Enrico Weigelt <info@metux.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 04.03.19 21:19, Arnd Bergmann wrote:

> This could be fixed using either a dependency or a 'select' statement.
> I'm chosen 'depends on' here since it is simpler has a lower risk of
> introducing circular dependencies.

I'd rather prefer using 'select'.

Otherwise the driver won't appear at all if INPUT or INPUT_KEYBOARD
aren't enabled (eg. when you start w/ minimal config - which I do
frequently), and people have a hard time actually finding/enabling it.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
