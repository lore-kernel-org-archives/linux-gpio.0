From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Tue, 19 May 2015 17:37:48 +0300
Message-ID: <555B4ABC.60304@linaro.org>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>	<20150518110214.GC28127@localhost>	<5559E3C0.1040207@linaro.org>	<20150518150815.GH28127@localhost>	<555A0299.3030803@linaro.org> <CACRpkdYs+r+oSegZuMjvg9PueWr6xB7Z-BmsHD+cmgeV=XD=Sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYs+r+oSegZuMjvg9PueWr6xB7Z-BmsHD+cmgeV=XD=Sg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On 05/19/2015 05:12 PM, Linus Walleij wrote:
> On Mon, May 18, 2015 at 5:17 PM, Grygorii.Strashko@linaro.org
> <grygorii.strashko@linaro.org> wrote:
>> On 05/18/2015 06:08 PM, Johan Hovold wrote:
> 
>>>        GPIOs 160-191, platform/4805d000.gpio, gpio:
>>>        gpio-171 (<irq-only>          ) in  hi IRQ-209
>>
>> In general agree, but i propose to do it as
>>          GPIOs 160-191, platform/4805d000.gpio, gpio:
>>          gpio-171 ((null)          ) in  hi IRQ-209 <irq-only>
>>
>> My intention is - this interface could be considered as more or less stable, so
>> it is better to add additional information at the end of each line to avoid
>> potential breakage of User space SW (test/debug scripts).
> 
> What? If I wanted a stable interface I would use sysfs and document
> the ABI in Documentation/ABI/*.
> 
> debugfs is not ABI.
> 
> Debugfs is instable by definition, it is not for production. If tests depend on
> it they need to be ready to break and be updated, and in such case
> it is a very very good idea to put any such tests in tools/* in the
> kernel itself, as does trace-cmd and friends so you can patch the
> tests at the same time you patch the code.

Okay. Sorry, My comment was not fully correct - keyword was "more or less stable"
and of course it is not ABI.

Any way, the question is till here - How would it better to do?
  gpio-171 (<irq-only>          ) in  hi IRQ-209
-- or --
  gpio-171 ((null)          ) in  hi IRQ-209 <irq-only>

Thanks a lot for your comments.

-- 
regards,
-grygorii
