From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Wed, 20 May 2015 09:21:16 +0200
Message-ID: <CACRpkdbupBQBsymB4wcC9XxbFJMhzxoZVXhyKxZT+xxuSxwifA@mail.gmail.com>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
	<20150518110214.GC28127@localhost>
	<5559E3C0.1040207@linaro.org>
	<20150518150815.GH28127@localhost>
	<555A0299.3030803@linaro.org>
	<CACRpkdYs+r+oSegZuMjvg9PueWr6xB7Z-BmsHD+cmgeV=XD=Sg@mail.gmail.com>
	<20150519153940.GP28127@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150519153940.GP28127@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 19, 2015 at 5:39 PM, Johan Hovold <johan@kernel.org> wrote:
> On Tue, May 19, 2015 at 04:12:35PM +0200, Linus Walleij wrote:

>> What? If I wanted a stable interface I would use sysfs and document
>> the ABI in Documentation/ABI/*.
>>
>> debugfs is not ABI.
>
> As I mentioned in my response to Grygorii, not everyone -- and most
> notably apparently not even Linus Torvalds -- agrees on this:

Yeah I was sloppy I guess.

What I mean, precisely is that sysfs is ABI, whether documented or
not.

Even debugfs is actually blurry, as per
Documentation/filesystems/debugfs.txt:

"The debugfs filesystem is also intended to not serve as a stable
ABI to user space; in theory, there are no stability constraints placed on
files exported there.  The real world is not always so simple, though [1];
even debugfs interfaces are best designed with the idea that they will need
to be maintained forever."

But I haven't been bitten by it yet so that's why I allow some poetic
license.

Yours,
Linus Walleij
