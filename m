From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 2/3] x86: apuv2: fix input dependencies
Date: Thu, 7 Mar 2019 01:10:13 +0100
Message-ID: <82c978b2-e9c4-e178-e4b7-621729c2cee4@metux.net>
References: <20190304201930.1622839-1-arnd@arndb.de>
 <20190304201930.1622839-2-arnd@arndb.de>
 <a94c3c6a-481e-96a5-74e1-8c3299c74129@metux.net>
 <CAK8P3a0vdhCTNTF-K0mXjRWkPvv0qr3nf_52=8n6zTa7p3ELLw@mail.gmail.com>
 <54a7d035-155f-c47b-1db1-acb851b3aec6@metux.net>
 <CAHp75Vcd0eNCBtxb1huMBGFF9JXmropHv2YA1eh-yK3iMFfuFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vcd0eNCBtxb1huMBGFF9JXmropHv2YA1eh-yK3iMFfuFQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linus Walleij <linusw@kernel.org>, Enrico Weigelt <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 05.03.19 14:56, Andy Shevchenko wrote:
> 
> Darren gave a talk about merging kernel configs to get something like
> you want to.
> This tool is quite long already lying around. merge_config.sh in your
> kernel source tree.

Yes, that's similar to how some distros (eg. yocto) do it.

But my requirements are a bit more complex:

In my final meta-config, I just wanna say:

* i have board A (possibly multiple boards)
* i need features X, Y, Z (eg. eth, display, can, ext4, acl, ...)

And that shall be all to generate a minimal config for exactly those
requirements.

Doing that by just putting config snippets together, quickly turns into
a maintenance hell. At least you'd need recursive dependencies and some
if/else logic.

That's why I've written kmct:

https://github.com/metux/kmct


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
