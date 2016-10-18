From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: drivers/gpio/gpio-stmpe.c:412: bad if test ?
Date: Tue, 18 Oct 2016 15:12:40 +0200
Message-ID: <cc26a7ff-4592-6a22-b478-576837a194ba@st.com>
References: <VI1PR08MB1022FEB07B283A740340D49C9CD00@VI1PR08MB1022.eurprd08.prod.outlook.com>
 <CACRpkdaZfhtUN3dspGne8QkkTKsrWsk9CQU1yR_HRRAHu4TtoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:47090 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1760287AbcJRNMr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Oct 2016 09:12:47 -0400
In-Reply-To: <CACRpkdaZfhtUN3dspGne8QkkTKsrWsk9CQU1yR_HRRAHu4TtoQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, David Binderman <dcb314@hotmail.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi David

This issue has been already fixed by Dan Carpenter few days ago

see : https://patchwork.ozlabs.org/patch/681055/

Thanks


On 10/18/2016 02:32 PM, Linus Walleij wrote:
> I think this need to be discussed with Patrice.
> 
> Sorry for top-posting.
> 
> Yours,
> Linus Walleij
> 
> On Mon, Oct 17, 2016 at 1:21 PM, David Binderman <dcb314@hotmail.com> wrote:
>> Hello there,
>>
>> drivers/gpio/gpio-stmpe.c:412:34: warning: logical ‘or’ of collectively exhaustive tests is always true [-Wlogical-op]
>>
>> Source code is
>>
>>         if (stmpe->partnum != STMPE801 || stmpe->partnum != STMPE1600 ||
>>             stmpe->partnum != STMPE1801) {
>>
>> Maybe better code
>>
>>         if (stmpe->partnum != STMPE801 && stmpe->partnum != STMPE1600 &&
>>             stmpe->partnum != STMPE1801) {
>>
>> Regards
>>
>> David Binderman
>>
>>
>>
>>
