From: Graeme Smecher <gsmecher@threespeedlogic.com>
Subject: Re: [PATCH 1/3] gpio: pca953x: Add devices to Kconfig help
Date: Wed, 12 Feb 2014 09:06:29 -0800
Message-ID: <52FBAA15.80709@threespeedlogic.com>
References: <972232456.119003.1391812066467.JavaMail.zimbra@xes-inc.com> <1550736903.119527.1391812548072.JavaMail.zimbra@xes-inc.com> <CACRpkdYbeeDi_xRudyyCmi2WLie_jpvhHLKGz5Jbr0a8T1rYLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from threespeedlogic.com ([75.98.167.93]:50503 "EHLO
	threespeedlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492AbaBLRaJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2014 12:30:09 -0500
In-Reply-To: <CACRpkdYbeeDi_xRudyyCmi2WLie_jpvhHLKGz5Jbr0a8T1rYLg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aaron Sierra <asierra@xes-inc.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi all,

On 12/02/14 07:21 AM, Linus Walleij wrote:
> On Fri, Feb 7, 2014 at 11:35 PM, Aaron Sierra <asierra@xes-inc.com> wrote:
>
>> The pca953x driver supports tca6424 (24-bit) and pca9505 (40-bit)
>> devices. They were the only supported devices not mentioned in the
>> Kconfig help.
>>
>> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> Can I get some help from the previous pca953x contributors
> to have a look at these new patches? An ACK or similar
> would be nice.

I've had a quick glance at the relevant datasheets and don't see any 
problems. The XRA1202 (added by patch) is explicitly compatible with the 
PCA9538 (already supported), and the datasheets for the PCA9698 (added 
by patch) and the PCA9505 (already supported) can be read side-by-side.

Acked-by: Graeme Smecher <gsmecher@threespeedlogic.com>

cheers,
Graeme
