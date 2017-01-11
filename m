From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools: gpio add .gitignore for generated files
Date: Wed, 11 Jan 2017 16:19:08 +0100
Message-ID: <CACRpkda=FdZ+G2rxMAk+WntHSdmm4=L9m=-0goTdAVJ2NnqHpg@mail.gmail.com>
References: <20170105213236.15562-1-shuahkh@osg.samsung.com>
 <20170105213236.15562-5-shuahkh@osg.samsung.com> <CACRpkdbeT8PgxW+VCGwrznOTQV=2Dw8CcJUqZAcKdB2a96tJXA@mail.gmail.com>
 <56151fe1-67f6-37f7-08c7-db61c664adb3@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:35600 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753395AbdAKPTJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 10:19:09 -0500
Received: by mail-qt0-f182.google.com with SMTP id x49so131877976qtc.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 07:19:09 -0800 (PST)
In-Reply-To: <56151fe1-67f6-37f7-08c7-db61c664adb3@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 10, 2017 at 3:07 PM, Shuah Khan <shuahkh@osg.samsung.com> wrote:
> On 01/10/2017 02:29 AM, Linus Walleij wrote:
>> On Thu, Jan 5, 2017 at 10:32 PM, Shuah Khan <shuahkh@osg.samsung.com> wrote:
>>
>>> Add .gitignore for generated files.
>>>
>>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>>> ---
>>>  tools/gpio/.gitignore | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>  create mode 100644 tools/gpio/.gitignore
>>>
>>> diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
>>> new file mode 100644
>>> index 0000000..767ad24
>>> --- /dev/null
>>> +++ b/tools/gpio/.gitignore
>>> @@ -0,0 +1,4 @@
>>> +gpio-event-mon
>>> +gpio-hammer
>>> +lsgpio
>>> +include
>>
>> I understand the first three.
>>
>> But "include"?
>> How did you produce that?
>>
>> Yours,
>> Linus Walleij
>>
>
> I saw this after building selftests. gpio selftests Makefile installs
> headres. "make kselftest" should reproduce the problem. This following
> does an header install from tools/testing/selftests/gpio/Makefile
>
> ../../../../usr/include/linux/gpio.h:
>         make -C ../../../.. headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../usr/

That seems like a bug.

I applied the patch removing the ignore line for include,
I think we should see this until we figured out what we do wrong.

Yours,
Linus Walleij
