From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] powerpc: ppc4xx: drop unused variable
Date: Fri, 1 Apr 2016 10:07:23 +0200
Message-ID: <CACRpkdZOOQ5pP8GtN1WP-y-Es+5mKuBOhRtFyUNO1Qesyb+Z8g@mail.gmail.com>
References: <1459408452-3483-1-git-send-email-linus.walleij@linaro.org>
	<1459418980.24848.1.camel@ellerman.id.au>
	<CACRpkdbbUfbe6LWVDFsgvne7oOEp7ZzOKr9tX7y-P=J8g7c5=A@mail.gmail.com>
	<1459477889.10334.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36251 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752830AbcDAIHZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 04:07:25 -0400
Received: by mail-oi0-f52.google.com with SMTP id r187so95415755oih.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2016 01:07:24 -0700 (PDT)
In-Reply-To: <1459477889.10334.1.camel@ellerman.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>

On Fri, Apr 1, 2016 at 4:31 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Thu, 2016-03-31 at 14:57 +0200, Linus Walleij wrote:
>> On Thu, Mar 31, 2016 at 12:09 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> > If you feel like cross building powerpc in future it should be as simple as:
>> >
>> >  $ dnf install gcc-powerpc64-linux-gnu || apt-get install gcc-powerpc-linux-gnu
>> >  $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- ...
>>
>> Ah hm yeah I guess everyone "should", it's just that these days I
>> mainly rely on Fenguang's kautobuild to do this job for me and
>> get back with the result from a plethora of arches.
>
> Sure. That makes sense for all the silly little architectures.
>
> But for powerpc you should really cross compile.

I think kautobuild cross compiles?

The only thing that happens IIUC is I let somebody else do the
job at the Intel server farm.

Yours,
Linus Walleij
