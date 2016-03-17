From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd:Add device HID for future AMD GPIO controller
Date: Thu, 17 Mar 2016 14:31:45 +0100
Message-ID: <CACRpkdZ-QKzH7igmMfwcb2-unykKVKwW5gf+cHySavvyDPKuzA@mail.gmail.com>
References: <1457665122-16365-1-git-send-email-annie.wang@amd.com>
	<DM2PR12MB0201D5583811701257DF34DBFB8A0@DM2PR12MB0201.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36512 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936047AbcCQNbr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2016 09:31:47 -0400
Received: by mail-oi0-f41.google.com with SMTP id r187so63374231oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2016 06:31:46 -0700 (PDT)
In-Reply-To: <DM2PR12MB0201D5583811701257DF34DBFB8A0@DM2PR12MB0201.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Xue, Ken" <Ken.Xue@amd.com>
Cc: "Wang, Annie" <Annie.Wang@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SPG_Linux_Kernel <SPG_Linux_Kernel@amd.com>

On Wed, Mar 16, 2016 at 6:10 AM, Xue, Ken <Ken.Xue@amd.com> wrote:
>> From: Wang Hongcheng [mailto:annie.wang@amd.com]
>> Sent: Friday, March 11, 2016 10:59 AM
>> To: Linus Walleij; linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org;
>> SPG_Linux_Kernel
>> Cc: Wang, Annie
>> Subject: [PATCH] pinctrl: amd:Add device HID for future AMD GPIO controller
>>
>> Add device HID AMDI0030 to match the AMD ACPI Vendor ID (AMDI) as
>> registered in http://www.uefi.org/acpi_id_list, and the GPIO controller on
>> future AMD paltform will use the HID instead of AMD0030.
>>
>> Signed-off-by: Wang Hongcheng <annie.wang@amd.com>
>> ---
>
> Acked-by: Ken Xue <ken.Xue@amd.com>
>
> Hi Linus,
> Can you please help apply and queue this patch into V4.6?

No way, we are in the middle of the merge window.
This will be queued for v4.7 once -rc1 is released.

Yours,
Linus Walleij
