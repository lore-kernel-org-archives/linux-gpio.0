From: =?UTF-8?Q?Andreas_Bofj=C3=A4ll?= <andreas@gazonk.org>
Subject: Re: [PATCH 0/3] Add Fintek F71869 and F71869A gpio support
Date: Fri, 27 Feb 2015 23:33:29 +0100 (CET)
Message-ID: <alpine.LNX.2.20.1502272332400.22486@gazonk.org>
References: <1422206179-11464-1-git-send-email-andreas@gazonk.org> <CAAVeFuLgnLquniryQYV3VJfyV5JMOQimhzLsJjV4DcWNhUaDoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foo.gazonk.org ([212.247.24.42]:58072 "HELO gazonk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S932494AbbB0WkN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 27 Feb 2015 17:40:13 -0500
In-Reply-To: <CAAVeFuLgnLquniryQYV3VJfyV5JMOQimhzLsJjV4DcWNhUaDoQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, 26 Feb 2015, Alexandre Courbot wrote:
> On Mon, Jan 26, 2015 at 2:16 AM, Andreas Bofjall <andreas@gazonk.org> wrote:
>> this series adds support for the gpio pins on the Fintek F71869 and F71869A
>> SuperI/O chips to the gpio-f7188x driver. The chips are used on for example
>> Jetway motherboards.
>>
>> The driver has been tested on two different boards: a JNF99-525 with F71869A,
>> and by Les Schaffer on a Jetway NF96u-525 with F71869.
>
> The series,
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Apologies for taking so long to check it out!

Hi and thanks!

How do you normally handle this, would you like me to re-spin the patchset 
with the Reviewed-by set?

/Andreas
