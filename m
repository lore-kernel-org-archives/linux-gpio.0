From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1] pinctrl:pxa:pinctrl-pxa2xx:- No need of devm functions
Date: Fri, 30 Dec 2016 14:02:56 +0100
Message-ID: <CACRpkdYaBmoik8W81h=2RH0_Q2MJPjSRTtgKb3tkwwAsKbFVAg@mail.gmail.com>
References: <1481207730-6332-1-git-send-email-arvind.yadav.cs@gmail.com>
 <CACRpkdY8mwHD1yyHZSHsDsJNPjrgLTfEok38FNons6oabn5ZPw@mail.gmail.com> <87o9zvw69a.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87o9zvw69a.fsf@belgarion.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 29, 2016 at 8:20 AM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> On Thu, Dec 8, 2016 at 3:35 PM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
>>
>>> In functions pxa2xx_build_functions, the memory allocated for
>>> 'functions' is live within the function only. After the
>>> allocation it is immediately freed with devm_kfree. There is
>>> no need to allocate memory for 'functions' with devm function
>>> so replace devm_kcalloc  with kcalloc and devm_kfree with kfree.
>>>
>>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>>
>> I want the maintainer Robert Jarzmik to review this before I do anything
>
> Hi Linus,
>
> I did review, on December the 10th. I wasn't very enthusiastic about the patch,
> if you check back my reply.

Sorry I missed it (mail overload as usual).

OK dropping this.

Yours,
Linus Walleij
