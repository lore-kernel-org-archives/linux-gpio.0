From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH V1] pinctrl:pxa:pinctrl-pxa2xx:- No need of devm functions
Date: Thu, 29 Dec 2016 08:20:49 +0100
Message-ID: <87o9zvw69a.fsf@belgarion.home>
References: <1481207730-6332-1-git-send-email-arvind.yadav.cs@gmail.com>
        <CACRpkdY8mwHD1yyHZSHsDsJNPjrgLTfEok38FNons6oabn5ZPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:42090 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751788AbcL2HU5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Dec 2016 02:20:57 -0500
In-Reply-To: <CACRpkdY8mwHD1yyHZSHsDsJNPjrgLTfEok38FNons6oabn5ZPw@mail.gmail.com>
        (Linus Walleij's message of "Tue, 27 Dec 2016 13:49:06 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Linus Walleij <linus.walleij@linaro.org> writes:

> On Thu, Dec 8, 2016 at 3:35 PM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
>
>> In functions pxa2xx_build_functions, the memory allocated for
>> 'functions' is live within the function only. After the
>> allocation it is immediately freed with devm_kfree. There is
>> no need to allocate memory for 'functions' with devm function
>> so replace devm_kcalloc  with kcalloc and devm_kfree with kfree.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>
> I want the maintainer Robert Jarzmik to review this before I do anything

Hi Linus,

I did review, on December the 10th. I wasn't very enthusiastic about the patch,
if you check back my reply.

Cheers.

-- 
Robert
