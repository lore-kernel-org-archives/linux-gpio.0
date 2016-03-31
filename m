From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd:Add device HID for future AMD GPIO controller
Date: Thu, 31 Mar 2016 10:19:26 +0200
Message-ID: <CACRpkdZtL2vcsR8ruGmp=hFzoHgguk1RsQgtJvvtTKeFE9Vp+g@mail.gmail.com>
References: <1457665122-16365-1-git-send-email-annie.wang@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:36143 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751999AbcCaIT1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 04:19:27 -0400
Received: by mail-ob0-f171.google.com with SMTP id m7so21671258obh.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 01:19:27 -0700 (PDT)
In-Reply-To: <1457665122-16365-1-git-send-email-annie.wang@amd.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wang Hongcheng <annie.wang@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SPG_Linux_Kernel <SPG_Linux_Kernel@amd.com>

On Fri, Mar 11, 2016 at 3:58 AM, Wang Hongcheng <annie.wang@amd.com> wrote:

> Add device HID AMDI0030 to match the AMD ACPI Vendor ID (AMDI) as
> registered in http://www.uefi.org/acpi_id_list, and the GPIO controller
> on future AMD paltform will use the HID instead of AMD0030.
>
> Signed-off-by: Wang Hongcheng <annie.wang@amd.com>

Patch applied with Ken's ACK.

Yours,
Linus Walleij
