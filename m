From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] drivers/gpio/gpio-sch311x: check return value of gpiochip_remove()
Date: Wed, 9 Jul 2014 09:50:45 +0200
Message-ID: <CACRpkdaVNeY2KLnKSL=3dOPcXwzDX+fQW4xVPSjvUZhuV6Pi_g@mail.gmail.com>
References: <1404457379-4193-1-git-send-email-varkab@cdac.in>
	<CAAVeFuK8oQStjAozf_3e3YTWBx3JYzBxEvLUq6n6uke1qaxXvg@mail.gmail.com>
	<53B94DC6.7070308@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53B94DC6.7070308@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Varka Bhadram <varkab@cdac.in>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jul 6, 2014 at 3:23 PM, Varka Bhadram <varkabhadram@gmail.com> =
wrote:
> On Sunday 06 July 2014 02:52 PM, Alexandre Courbot wrote:
>> On Fri, Jul 4, 2014 at 4:02 PM, Varka Bhadram <varkabhadram@gmail.co=
m>
>> wrote:
>>>
>>> This patch eliminates the following warning
>>>
>>> drivers/gpio/gpio-sch311x.c: In function =E2=80=98sch311x_gpio_prob=
e=E2=80=99:
>>> drivers/gpio/gpio-sch311x.c:286:18: warning: ignoring return value =
of
>>> =E2=80=98gpiochip_remove=E2=80=99, declared with attribute warn_unu=
sed_result
>>
>> gpiochip_remove() is to have its return value set to void in another
>> patch, so I'm not sure we need this one in the meantime?
>
>
> I also saw that patch from abdoulaye berthe<berthe.ab@gmail.com>  .
>
> If that is accepted its good. If not this may require.

Yeah I'll go remove that. Just working out the patch mechanics right no=
w,
we'll probably remove all return value checks in v3.17 and then delete
the code in gpiolib in late v3.17 cycle or the next merge window.

Yours,
Linus Walleij
