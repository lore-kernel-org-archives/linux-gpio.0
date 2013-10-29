From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: question: pin mux & gpio
Date: Tue, 29 Oct 2013 11:00:46 -0700
Message-ID: <526FF7CE.6080401@linux.intel.com>
References: <526877B0.1090602@linux.intel.com> <CACRpkdbTdBHg=62NnpNFWKqquOz4f2EBknjhQRXAP6-aBOwj1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:38805 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758549Ab3J2R4a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 29 Oct 2013 13:56:30 -0400
In-Reply-To: <CACRpkdbTdBHg=62NnpNFWKqquOz4f2EBknjhQRXAP6-aBOwj1A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On 10/29/2013 10:03 AM, Linus Walleij wrote:
> On Wed, Oct 23, 2013 at 6:28 PM, David Cohen
> <david.a.cohen@linux.intel.com> wrote:
>
>> I've got a question WRT pin muxing.
>> gpio-intel-mid registers are responsible to set alternative functions
>> to some pins. Despite pin mux is not directly related to gpio in
>> general, in this case it is.
>
> I know this use case.
>
>> Is there any other gpio driver doing this same task? Or maybe
>> suggestion about how to handle it?
>
> First read Documentation/pinctrl.txt :-)
>
> Move the driver to drivers/pinctrl/pinctrl-intel-mid.c in the next
> merge window, and add pin control interfaces in the style of the
> other combined pin control+GPIO drivers there. Keeping one state
> struct but exposing interfaces to both subsystems is perfectly
> acceptable. Use GPIO ranges to cross-reference GPIO lines
> to pins.

Thanks. I'll work on that change.

Br, David Cohen
