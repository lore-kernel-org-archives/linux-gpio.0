From: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: on enable on x86 arches and COMPILE_TEST
Date: Mon, 28 Dec 2015 12:13:32 +0000
Message-ID: <CALeDE9MtO0BiuHUORQo0rO02hBvdL7o47B86ycbYUyjqq2xspw@mail.gmail.com>
References: <1451218972-22156-1-git-send-email-pbrobinson@gmail.com>
	<1451218972-22156-2-git-send-email-pbrobinson@gmail.com>
	<20151228120010.GU1758@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f193.google.com ([209.85.213.193]:33130 "EHLO
	mail-ig0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915AbbL1MNd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2015 07:13:33 -0500
Received: by mail-ig0-f193.google.com with SMTP id y8so14323650igw.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2015 04:13:33 -0800 (PST)
In-Reply-To: <20151228120010.GU1758@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Mon, Dec 28, 2015 at 12:00 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Sun, Dec 27, 2015 at 12:22:51PM +0000, Peter Robinson wrote:
>> If you select CONFIG_PINCTR for another unrelated architecture
>> you need to set all the Intel pinctrl options even though they're not
>> required. Mask them if not required.
>>
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> ---
>>  drivers/pinctrl/intel/Kconfig | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
>> index 4d2efad..68fa13a 100644
>> --- a/drivers/pinctrl/intel/Kconfig
>> +++ b/drivers/pinctrl/intel/Kconfig
>> @@ -2,6 +2,8 @@
>>  # Intel pin control drivers
>>  #
>>
>> +if X86_GENERIC || COMPILE_TEST
>> +
>>  config PINCTRL_BAYTRAIL
>>       bool "Intel Baytrail GPIO pin control"
>>       depends on GPIOLIB && ACPI
>
> All of them already depend on CONFIG_ACPI so if your unrelated
> architecture does not provide that then you should not see any of these.

ACPI is available on arm64 and there's patches around for ARM, none of
which would support the intel hardware, hence the patch.

Peter
