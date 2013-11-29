From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] gpiolib: use platform GPIO mappings as fallback
Date: Fri, 29 Nov 2013 18:35:04 +0900
Message-ID: <52985FC8.70008@nvidia.com>
References: <1385202890-9511-1-git-send-email-acourbot@nvidia.com> <CACRpkdbun289Y1fu-=sB77ESg6E15hRCcd+NYmwk57MoxkoTMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:8078 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753203Ab3K2JfH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 04:35:07 -0500
In-Reply-To: <CACRpkdbun289Y1fu-=sB77ESg6E15hRCcd+NYmwk57MoxkoTMQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 11/29/2013 06:29 PM, Linus Walleij wrote:
> On Sat, Nov 23, 2013 at 11:34 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
>> For platforms that use device tree or ACPI as the standard way to look
>> GPIOs up, allow the platform-defined GPIO mappings to be used as a
>> fallback. This may be useful for platforms that need extra GPIOs mappings
>> not defined by the firmware.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Applied for fixes. I was considering applying it for the next
> kernel but it depends on the former patches and we should
> expect a bit of extra fuzz now with the new API.

Thanks - I'd rather have all the problems coming in a row than 
incrementally as we introduce potentially incompatible changes.

Alex.

