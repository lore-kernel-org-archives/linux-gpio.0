From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] drivers/pinctrl: Add pinctrl-ast2400
Date: Thu, 26 May 2016 11:24:24 +0200
Message-ID: <CACRpkda3PVrOQVQH9hcGSd=GdkP4j9bYuXRRdLwzW-KJRT+b1w@mail.gmail.com>
References: <1462515608-20566-1-git-send-email-andrew@aj.id.au>
	<1462515608-20566-2-git-send-email-andrew@aj.id.au>
	<CACRpkdb+xG53oRYro5NecwDL=JTfsxb=3AFgruPj4j=U+Gbh=A@mail.gmail.com>
	<1464153722.20948.81.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464153722.20948.81.camel@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Milton Miller II <miltonm@us.ibm.com>, Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 25, 2016 at 7:22 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> [Me]
>> > +#define A4 2
>> > +SSSF_PIN_DECL(A4, GPIOA2, TIMER3, FUNC_DESC_SET(SCU80, 2));
>> > +
>> > +FUNC_EXPR_DECL_SINGLE(SD1, FUNC_DESC_SET(SCU90, 0));
>> > +
>> > +FUNC_EXPR_DECL_SINGLE(I2C10, FUNC_DESC_SET(SCU90, 23));
>> > +
>> > +#define C4 16
>> > +MS_PIN_DECL(C4, GPIOC0, SD1, I2C10);
>> > +#define B3 17
>> > +MS_PIN_DECL(B3, GPIOC1, SD1, I2C10);
>>
>> These things look very terse. But I guess there is no way to alleviate
>> the terseness that you can think of?
>
> Less terse in what way? Something other than more descriptive/longer
> the macro names?

Well I was just thinking that it's hard to read and understand.

But if it's complicated, it's complicated and that cannot be fixed
by syntax. Algebra books are not and easy read either, hehe :)

Yours,
Linus Walleij
