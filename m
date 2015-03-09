From: =?UTF-8?Q?Andreas_Bofj=C3=A4ll?= <andreas@gazonk.org>
Subject: Re: [PATCH 0/3] Add Fintek F71869 and F71869A gpio support
Date: Mon, 9 Mar 2015 11:26:43 +0100 (CET)
Message-ID: <alpine.LNX.2.20.1503091124001.13894@gazonk.org>
References: <1422206179-11464-1-git-send-email-andreas@gazonk.org> <CAAVeFuLgnLquniryQYV3VJfyV5JMOQimhzLsJjV4DcWNhUaDoQ@mail.gmail.com> <CACRpkdY0g0fitUN6RXtUg7RQwWL1M+QLwqT5oADXGLoBDv4RkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foo.gazonk.org ([212.247.24.42]:38372 "HELO gazonk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753146AbbCIK0q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 06:26:46 -0400
In-Reply-To: <CACRpkdY0g0fitUN6RXtUg7RQwWL1M+QLwqT5oADXGLoBDv4RkQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, 9 Mar 2015, Linus Walleij wrote:

> On Thu, Feb 26, 2015 at 10:36 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
>> On Mon, Jan 26, 2015 at 2:16 AM, Andreas Bofjall <andreas@gazonk.org> wrote:
>>> Hi,
>>>
>>> this series adds support for the gpio pins on the Fintek F71869 and F71869A
>>> SuperI/O chips to the gpio-f7188x driver. The chips are used on for example
>>> Jetway motherboards.
>>>
>>> The driver has been tested on two different boards: a JNF99-525 with F71869A,
>>> and by Les Schaffer on a Jetway NF96u-525 with F71869.
>>
>> The series,
>>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> Apologies for taking so long to check it out!
>
> I can't see patches 1/3, 2/3 and 3/3 from this patch series.
> Was it even sent To: me and the linux-gpio@vger mailing list?

They were all sent To: linux-gpio@vger.kernel.org using git-send-email, 
but not specifically to you. I see them in the mailing list archive:

http://thread.gmane.org/gmane.linux.kernel.gpio/5887/focus=5888

> Something is wrong anyway, so please resend the whole patch set
> add Alexandre's ACK and I will look at it.

Ok, I'll do so and add both the list and you as recipients.

/Andreas
