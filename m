From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Tue, 19 May 2015 16:12:35 +0200
Message-ID: <CACRpkdYs+r+oSegZuMjvg9PueWr6xB7Z-BmsHD+cmgeV=XD=Sg@mail.gmail.com>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
	<20150518110214.GC28127@localhost>
	<5559E3C0.1040207@linaro.org>
	<20150518150815.GH28127@localhost>
	<555A0299.3030803@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555A0299.3030803@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 18, 2015 at 5:17 PM, Grygorii.Strashko@linaro.org
<grygorii.strashko@linaro.org> wrote:
> On 05/18/2015 06:08 PM, Johan Hovold wrote:

>>       GPIOs 160-191, platform/4805d000.gpio, gpio:
>>       gpio-171 (<irq-only>          ) in  hi IRQ-209
>
> In general agree, but i propose to do it as
>         GPIOs 160-191, platform/4805d000.gpio, gpio:
>         gpio-171 ((null)          ) in  hi IRQ-209 <irq-only>
>
> My intention is - this interface could be considered as more or less stable, so
> it is better to add additional information at the end of each line to avoid
> potential breakage of User space SW (test/debug scripts).

What? If I wanted a stable interface I would use sysfs and document
the ABI in Documentation/ABI/*.

debugfs is not ABI.

Debugfs is instable by definition, it is not for production. If tests depend on
it they need to be ready to break and be updated, and in such case
it is a very very good idea to put any such tests in tools/* in the
kernel itself, as does trace-cmd and friends so you can patch the
tests at the same time you patch the code.

Yours,
Linus Walleij
