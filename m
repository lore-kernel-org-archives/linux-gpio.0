From: YD Tseng <ltyu101@gmail.com>
Subject: Re: [PATCH RFT] gpio: amdpt: Convert to use gpio-generic
Date: Wed, 16 Mar 2016 15:34:16 +0800
Message-ID: <1458113656-4459-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36844 "EHLO
	mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932370AbcCPHgK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 03:36:10 -0400
Received: by mail-pf0-f195.google.com with SMTP id q129so5787360pfb.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 00:36:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, axel.lin@ingics.com, varkab@cdac.in, pramod.gurav@smartplayin.com, dbaryshkov@gmail.com, Ken.Xue@amd.com
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw

From: YD Tseng <Yd_Tseng@asmedia.com.tw>

Sorry for reply late, please add the following emails in this thread.
yd_tseng@asmedia.com.tw
tungyu_lu@asmedia.com.tw

We will confirm the new patch. And we also need to add a new ACPI HID, AMDIF030, in the pt_gpio_acpi_match.
Which code base should we submit for the new ID?   

Thanks,
YD Tseng

>On Mon, Feb 29, 2016 at 3:00 PM, Axel Lin <axel.lin@ingics.com> wrote:
>
>> Use gpio-generic to simplify this driver.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>> Hi YD,
>> I don't have this h/w for test.
>> I'd appreciate if you can help to review and test this patch.
>
>Adding some random people working with AMD hardware to the
>To: line.
>
>If noone provides a test tag I will anyway merge this patch, they can find out any problems the hard way if they are not reading their mails.
>
>Yours,
>Linus Walleij

