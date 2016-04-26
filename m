From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 21/23] sparc: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Tue, 26 Apr 2016 14:07:02 +0200
Message-ID: <CACRpkdbZngH3QgXO0CZ3+qw4oSzkuoAj0CaoiW_jj5OssgLp=Q@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-22-git-send-email-linus.walleij@linaro.org>
	<20160421.145830.1101835916715485213.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20160421.145830.1101835916715485213.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Buesch <m@bues.ch>, sparclinux@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 21, 2016 at 8:58 PM, David Miller <davem@davemloft.net> wro=
te:

> From: Linus Walleij <linus.walleij@linaro.org>
> Date: Wed, 20 Apr 2016 10:58:19 +0200
>
>> This symbols is not needed to get access to selecting the
>> GPIOLIB anymore: any arch can select GPIOLIB.
>>
>> Cc: Michael B=C3=BCsch <m@bues.ch>
>> Cc: David S. Miller <davem@davemloft.net>
>> Cc: sparclinux@vger.kernel.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Acked-by: David S. Miller <davem@davemloft.net>

Patch applied to the GPIO tree with your ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
