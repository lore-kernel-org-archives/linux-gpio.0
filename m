From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 0/4] gpio: pxa: integrate with pincontrol
Date: Thu, 10 Dec 2015 18:31:08 +0100
Message-ID: <87d1uejjmr.fsf@belgarion.home>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
	<CACRpkdZ0JZOsU7VuFyeM8akWTKHjksEC3-wB4zrx0NJBRD+agQ@mail.gmail.com>
	<87lh92kbjg.fsf@belgarion.home>
	<CACRpkdZP=3mDWxoX6PRskztoeow41T9RgDyh82NP1=xnY+S1nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZP=3mDWxoX6PRskztoeow41T9RgDyh82NP1=xnY+S1nQ@mail.gmail.com>
	(Linus Walleij's message of "Thu, 10 Dec 2015 16:02:12 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

>>    - the GPDR (gpio direction register) shared access bothers me a bit
>
> How is it shared and between what users?
It's shared between the pin controller and the gpio controller.

The odd thing with the pxa architecture is that the GPDR bit selects between 2
different alternate functions, even when the pin is not a GPIO. Strange design,
isn't it ?

As a consequence, both the gpio driver and pinctrl have to modify it, for
different purposes :
 - pinctrl will modify it to select a specific alternate function
 - gpio driver will modify it when the pin is a GPIO, to modify its direction.

Cheers.

-- 
Robert
